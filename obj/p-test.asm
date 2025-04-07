
obj/p-test.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <process_main>:
extern uint8_t end[];

// program that checks if a kernel address is accessible to user
// (except CONSOLE_ADDR)

void process_main(void) {
  100000:	f3 0f 1e fa          	endbr64 
  100004:	55                   	push   %rbp
  100005:	48 89 e5             	mov    %rsp,%rbp
  100008:	48 83 ec 20          	sub    $0x20,%rsp

// sys_getpid
//    Return current process ID.
static inline pid_t sys_getpid(void) {
    pid_t result;
    asm volatile ("int %1" : "=a" (result)
  10000c:	cd 31                	int    $0x31
  10000e:	89 c7                	mov    %eax,%edi
    pid_t p = sys_getpid();
    srand(p);
  100010:	e8 37 05 00 00       	call   10054c <srand>
// looks up the virtual memory mapping for addr for the current process 
// and stores it inside map. [map, sizeof(vampping)) address should be 
// allocated, writable addresses to the process, otherwise syscall will 
// not write anything to the variable
static inline void sys_mapping(uintptr_t addr, void * map){
    asm volatile ("int %0" : /* no result */
  100015:	48 8d 7d e8          	lea    -0x18(%rbp),%rdi
  100019:	be 00 00 01 00       	mov    $0x10000,%esi
  10001e:	cd 36                	int    $0x36

    vamapping kmap;
    sys_mapping(KERNEL_ADDR, &kmap);

    if(kmap.perm &(PTE_U))
  100020:	f6 45 f8 04          	testb  $0x4,-0x8(%rbp)
  100024:	75 56                	jne    10007c <process_main+0x7c>
  100026:	8b 0d d0 8f fb ff    	mov    -0x47030(%rip),%ecx        # b8ffc <cursorpos>
  10002c:	8d 41 01             	lea    0x1(%rcx),%eax
  10002f:	48 98                	cltq   
        panic("Kernel accessible by process!");

    const char* message = "Test passed!\n";
    int i = 0;
    while (message[i] != '\0') {
  100031:	ba 54 00 00 00       	mov    $0x54,%edx
        *((char*) CONSOLE_ADDR + cursorpos * 2) = message[i];
  100036:	4c 8d 05 c1 7f fb ff 	lea    -0x4803f(%rip),%r8        # b7ffe <console-0x2>
        *((char*) CONSOLE_ADDR + cursorpos * 2 + 1) = 0x0F; // White on black color
  10003d:	49 8d 78 01          	lea    0x1(%r8),%rdi
    while (message[i] != '\0') {
  100041:	48 63 f1             	movslq %ecx,%rsi
  100044:	48 8d 0d 13 13 00 00 	lea    0x1313(%rip),%rcx        # 10135e <console_clear+0x72>
  10004b:	48 29 f1             	sub    %rsi,%rcx
        *((char*) CONSOLE_ADDR + cursorpos * 2) = message[i];
  10004e:	41 88 14 40          	mov    %dl,(%r8,%rax,2)
        *((char*) CONSOLE_ADDR + cursorpos * 2 + 1) = 0x0F; // White on black color
  100052:	c6 04 47 0f          	movb   $0xf,(%rdi,%rax,2)
        ++cursorpos;
  100056:	89 c6                	mov    %eax,%esi
    while (message[i] != '\0') {
  100058:	48 83 c0 01          	add    $0x1,%rax
  10005c:	0f b6 54 01 ff       	movzbl -0x1(%rcx,%rax,1),%edx
  100061:	84 d2                	test   %dl,%dl
  100063:	75 e9                	jne    10004e <process_main+0x4e>
  100065:	89 35 91 8f fb ff    	mov    %esi,-0x4706f(%rip)        # b8ffc <cursorpos>
        ++i;
    }
    TEST_PASS();
  10006b:	48 8d 3d fa 12 00 00 	lea    0x12fa(%rip),%rdi        # 10136c <console_clear+0x80>
  100072:	b8 00 00 00 00       	mov    $0x0,%eax
  100077:	e8 a9 00 00 00       	call   100125 <panic>
        panic("Kernel accessible by process!");
  10007c:	48 8d 3d bd 12 00 00 	lea    0x12bd(%rip),%rdi        # 101340 <console_clear+0x54>
  100083:	b8 00 00 00 00       	mov    $0x0,%eax
  100088:	e8 98 00 00 00       	call   100125 <panic>

000000000010008d <app_printf>:
#include "process.h"

// app_printf
//     A version of console_printf that picks a sensible color by process ID.

void app_printf(int colorid, const char* format, ...) {
  10008d:	f3 0f 1e fa          	endbr64 
  100091:	55                   	push   %rbp
  100092:	48 89 e5             	mov    %rsp,%rbp
  100095:	48 83 ec 50          	sub    $0x50,%rsp
  100099:	49 89 f2             	mov    %rsi,%r10
  10009c:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  1000a0:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  1000a4:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  1000a8:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    int color;
    if (colorid < 0) {
        color = 0x0700;
  1000ac:	be 00 07 00 00       	mov    $0x700,%esi
    if (colorid < 0) {
  1000b1:	85 ff                	test   %edi,%edi
  1000b3:	78 32                	js     1000e7 <app_printf+0x5a>
    } else {
        static const uint8_t col[] = { 0x0E, 0x0F, 0x0C, 0x0A, 0x09 };
        color = col[colorid % sizeof(col)] << 8;
  1000b5:	48 63 ff             	movslq %edi,%rdi
  1000b8:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
  1000bf:	cc cc cc 
  1000c2:	48 89 f8             	mov    %rdi,%rax
  1000c5:	48 f7 e2             	mul    %rdx
  1000c8:	48 89 d0             	mov    %rdx,%rax
  1000cb:	48 c1 e8 02          	shr    $0x2,%rax
  1000cf:	48 83 e2 fc          	and    $0xfffffffffffffffc,%rdx
  1000d3:	48 01 c2             	add    %rax,%rdx
  1000d6:	48 29 d7             	sub    %rdx,%rdi
  1000d9:	48 8d 05 dd 12 00 00 	lea    0x12dd(%rip),%rax        # 1013bd <col.0>
  1000e0:	0f b6 34 38          	movzbl (%rax,%rdi,1),%esi
  1000e4:	c1 e6 08             	shl    $0x8,%esi
    }

    va_list val;
    va_start(val, format);
  1000e7:	c7 45 b8 10 00 00 00 	movl   $0x10,-0x48(%rbp)
  1000ee:	48 8d 45 10          	lea    0x10(%rbp),%rax
  1000f2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  1000f6:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  1000fa:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cursorpos = console_vprintf(cursorpos, color, format, val);
  1000fe:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100102:	4c 89 d2             	mov    %r10,%rdx
  100105:	8b 3d f1 8e fb ff    	mov    -0x4710f(%rip),%edi        # b8ffc <cursorpos>
  10010b:	e8 ea 0f 00 00       	call   1010fa <console_vprintf>
    va_end(val);

    if (CROW(cursorpos) >= 23) {
        cursorpos = CPOS(0, 0);
  100110:	3d 30 07 00 00       	cmp    $0x730,%eax
  100115:	ba 00 00 00 00       	mov    $0x0,%edx
  10011a:	0f 4d c2             	cmovge %edx,%eax
  10011d:	89 05 d9 8e fb ff    	mov    %eax,-0x47127(%rip)        # b8ffc <cursorpos>
    }
}
  100123:	c9                   	leave  
  100124:	c3                   	ret    

0000000000100125 <panic>:


// panic, assert_fail
//     Call the INT_SYS_PANIC system call so the kernel loops until Control-C.

void panic(const char* format, ...) {
  100125:	f3 0f 1e fa          	endbr64 
  100129:	55                   	push   %rbp
  10012a:	48 89 e5             	mov    %rsp,%rbp
  10012d:	53                   	push   %rbx
  10012e:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  100135:	48 89 fb             	mov    %rdi,%rbx
  100138:	48 89 75 c8          	mov    %rsi,-0x38(%rbp)
  10013c:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  100140:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
  100144:	4c 89 45 e0          	mov    %r8,-0x20(%rbp)
  100148:	4c 89 4d e8          	mov    %r9,-0x18(%rbp)
    va_list val;
    va_start(val, format);
  10014c:	c7 45 a8 08 00 00 00 	movl   $0x8,-0x58(%rbp)
  100153:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100157:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  10015b:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  10015f:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    char buf[160];
    memcpy(buf, "PANIC: ", 7);
  100163:	48 8d bd 08 ff ff ff 	lea    -0xf8(%rbp),%rdi
  10016a:	ba 07 00 00 00       	mov    $0x7,%edx
  10016f:	48 8d 35 11 12 00 00 	lea    0x1211(%rip),%rsi        # 101387 <console_clear+0x9b>
  100176:	e8 b6 00 00 00       	call   100231 <memcpy>
    int len = vsnprintf(&buf[7], sizeof(buf) - 7, format, val) + 7;
  10017b:	48 8d 4d a8          	lea    -0x58(%rbp),%rcx
  10017f:	48 8d bd 0f ff ff ff 	lea    -0xf1(%rbp),%rdi
  100186:	48 89 da             	mov    %rbx,%rdx
  100189:	be 99 00 00 00       	mov    $0x99,%esi
  10018e:	e8 8b 10 00 00       	call   10121e <vsnprintf>
  100193:	8d 50 07             	lea    0x7(%rax),%edx
    va_end(val);
    if (len > 0 && buf[len - 1] != '\n') {
  100196:	85 d2                	test   %edx,%edx
  100198:	7e 0f                	jle    1001a9 <panic+0x84>
  10019a:	83 c0 06             	add    $0x6,%eax
  10019d:	48 98                	cltq   
  10019f:	80 bc 05 08 ff ff ff 	cmpb   $0xa,-0xf8(%rbp,%rax,1)
  1001a6:	0a 
  1001a7:	75 2b                	jne    1001d4 <panic+0xaf>
        strcpy(buf + len - (len == (int) sizeof(buf) - 1), "\n");
    }
    (void) console_printf(CPOS(23, 0), 0xC000, "%s", buf);
  1001a9:	48 8d 8d 08 ff ff ff 	lea    -0xf8(%rbp),%rcx
  1001b0:	48 8d 15 d8 11 00 00 	lea    0x11d8(%rip),%rdx        # 10138f <console_clear+0xa3>
  1001b7:	be 00 c0 00 00       	mov    $0xc000,%esi
  1001bc:	bf 30 07 00 00       	mov    $0x730,%edi
  1001c1:	b8 00 00 00 00       	mov    $0x0,%eax
  1001c6:	e8 ab 0f 00 00       	call   101176 <console_printf>
    asm volatile ("int %0" : /* no result */
  1001cb:	bf 00 00 00 00       	mov    $0x0,%edi
  1001d0:	cd 30                	int    $0x30
 loop: goto loop;
  1001d2:	eb fe                	jmp    1001d2 <panic+0xad>
        strcpy(buf + len - (len == (int) sizeof(buf) - 1), "\n");
  1001d4:	48 63 c2             	movslq %edx,%rax
  1001d7:	81 fa 9f 00 00 00    	cmp    $0x9f,%edx
  1001dd:	0f 94 c2             	sete   %dl
  1001e0:	0f b6 d2             	movzbl %dl,%edx
  1001e3:	48 29 d0             	sub    %rdx,%rax
  1001e6:	48 8d bc 05 08 ff ff 	lea    -0xf8(%rbp,%rax,1),%rdi
  1001ed:	ff 
  1001ee:	48 8d 35 75 11 00 00 	lea    0x1175(%rip),%rsi        # 10136a <console_clear+0x7e>
  1001f5:	e8 f8 01 00 00       	call   1003f2 <strcpy>
  1001fa:	eb ad                	jmp    1001a9 <panic+0x84>

00000000001001fc <assert_fail>:
    sys_panic(NULL);
 spinloop: goto spinloop;       // should never get here
}

void assert_fail(const char* file, int line, const char* msg) {
  1001fc:	f3 0f 1e fa          	endbr64 
  100200:	55                   	push   %rbp
  100201:	48 89 e5             	mov    %rsp,%rbp
  100204:	48 89 f9             	mov    %rdi,%rcx
  100207:	41 89 f0             	mov    %esi,%r8d
  10020a:	49 89 d1             	mov    %rdx,%r9
    (void) console_printf(CPOS(23, 0), 0xC000,
  10020d:	48 8d 15 84 11 00 00 	lea    0x1184(%rip),%rdx        # 101398 <console_clear+0xac>
  100214:	be 00 c0 00 00       	mov    $0xc000,%esi
  100219:	bf 30 07 00 00       	mov    $0x730,%edi
  10021e:	b8 00 00 00 00       	mov    $0x0,%eax
  100223:	e8 4e 0f 00 00       	call   101176 <console_printf>
    asm volatile ("int %0" : /* no result */
  100228:	bf 00 00 00 00       	mov    $0x0,%edi
  10022d:	cd 30                	int    $0x30
 loop: goto loop;
  10022f:	eb fe                	jmp    10022f <assert_fail+0x33>

0000000000100231 <memcpy>:


// memcpy, memmove, memset, strcmp, strlen, strnlen
//    We must provide our own implementations.

void* memcpy(void* dst, const void* src, size_t n) {
  100231:	f3 0f 1e fa          	endbr64 
  100235:	55                   	push   %rbp
  100236:	48 89 e5             	mov    %rsp,%rbp
  100239:	48 83 ec 28          	sub    $0x28,%rsp
  10023d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  100241:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  100245:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    const char* s = (const char*) src;
  100249:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  10024d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
  100251:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100255:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  100259:	eb 1c                	jmp    100277 <memcpy+0x46>
        *d = *s;
  10025b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  10025f:	0f b6 10             	movzbl (%rax),%edx
  100262:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  100266:	88 10                	mov    %dl,(%rax)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
  100268:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  10026d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  100272:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  100277:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  10027c:	75 dd                	jne    10025b <memcpy+0x2a>
    }
    return dst;
  10027e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
  100282:	c9                   	leave  
  100283:	c3                   	ret    

0000000000100284 <memmove>:

void* memmove(void* dst, const void* src, size_t n) {
  100284:	f3 0f 1e fa          	endbr64 
  100288:	55                   	push   %rbp
  100289:	48 89 e5             	mov    %rsp,%rbp
  10028c:	48 83 ec 28          	sub    $0x28,%rsp
  100290:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  100294:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  100298:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    const char* s = (const char*) src;
  10029c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  1002a0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    char* d = (char*) dst;
  1002a4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  1002a8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (s < d && s + n > d) {
  1002ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1002b0:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  1002b4:	73 6a                	jae    100320 <memmove+0x9c>
  1002b6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  1002ba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  1002be:	48 01 d0             	add    %rdx,%rax
  1002c1:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
  1002c5:	73 59                	jae    100320 <memmove+0x9c>
        s += n, d += n;
  1002c7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  1002cb:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  1002cf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  1002d3:	48 01 45 f0          	add    %rax,-0x10(%rbp)
        while (n-- > 0) {
  1002d7:	eb 17                	jmp    1002f0 <memmove+0x6c>
            *--d = *--s;
  1002d9:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
  1002de:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
  1002e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1002e7:	0f b6 10             	movzbl (%rax),%edx
  1002ea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  1002ee:	88 10                	mov    %dl,(%rax)
        while (n-- > 0) {
  1002f0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  1002f4:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  1002f8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  1002fc:	48 85 c0             	test   %rax,%rax
  1002ff:	75 d8                	jne    1002d9 <memmove+0x55>
    if (s < d && s + n > d) {
  100301:	eb 2e                	jmp    100331 <memmove+0xad>
        }
    } else {
        while (n-- > 0) {
            *d++ = *s++;
  100303:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  100307:	48 8d 42 01          	lea    0x1(%rdx),%rax
  10030b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  10030f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  100313:	48 8d 48 01          	lea    0x1(%rax),%rcx
  100317:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
  10031b:	0f b6 12             	movzbl (%rdx),%edx
  10031e:	88 10                	mov    %dl,(%rax)
        while (n-- > 0) {
  100320:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  100324:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  100328:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  10032c:	48 85 c0             	test   %rax,%rax
  10032f:	75 d2                	jne    100303 <memmove+0x7f>
        }
    }
    return dst;
  100331:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
  100335:	c9                   	leave  
  100336:	c3                   	ret    

0000000000100337 <memset>:

void* memset(void* v, int c, size_t n) {
  100337:	f3 0f 1e fa          	endbr64 
  10033b:	55                   	push   %rbp
  10033c:	48 89 e5             	mov    %rsp,%rbp
  10033f:	48 83 ec 28          	sub    $0x28,%rsp
  100343:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  100347:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  10034a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    for (char* p = (char*) v; n > 0; ++p, --n) {
  10034e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100352:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  100356:	eb 15                	jmp    10036d <memset+0x36>
        *p = c;
  100358:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  10035b:	89 c2                	mov    %eax,%edx
  10035d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  100361:	88 10                	mov    %dl,(%rax)
    for (char* p = (char*) v; n > 0; ++p, --n) {
  100363:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  100368:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  10036d:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  100372:	75 e4                	jne    100358 <memset+0x21>
    }
    return v;
  100374:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
  100378:	c9                   	leave  
  100379:	c3                   	ret    

000000000010037a <strlen>:

size_t strlen(const char* s) {
  10037a:	f3 0f 1e fa          	endbr64 
  10037e:	55                   	push   %rbp
  10037f:	48 89 e5             	mov    %rsp,%rbp
  100382:	48 83 ec 18          	sub    $0x18,%rsp
  100386:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
  10038a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  100391:	00 
  100392:	eb 0a                	jmp    10039e <strlen+0x24>
        ++n;
  100394:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    for (n = 0; *s != '\0'; ++s) {
  100399:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  10039e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  1003a2:	0f b6 00             	movzbl (%rax),%eax
  1003a5:	84 c0                	test   %al,%al
  1003a7:	75 eb                	jne    100394 <strlen+0x1a>
    }
    return n;
  1003a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
  1003ad:	c9                   	leave  
  1003ae:	c3                   	ret    

00000000001003af <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
  1003af:	f3 0f 1e fa          	endbr64 
  1003b3:	55                   	push   %rbp
  1003b4:	48 89 e5             	mov    %rsp,%rbp
  1003b7:	48 83 ec 20          	sub    $0x20,%rsp
  1003bb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  1003bf:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1003c3:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  1003ca:	00 
  1003cb:	eb 0a                	jmp    1003d7 <strnlen+0x28>
        ++n;
  1003cd:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1003d2:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  1003d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1003db:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
  1003df:	74 0b                	je     1003ec <strnlen+0x3d>
  1003e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  1003e5:	0f b6 00             	movzbl (%rax),%eax
  1003e8:	84 c0                	test   %al,%al
  1003ea:	75 e1                	jne    1003cd <strnlen+0x1e>
    }
    return n;
  1003ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
  1003f0:	c9                   	leave  
  1003f1:	c3                   	ret    

00000000001003f2 <strcpy>:

char* strcpy(char* dst, const char* src) {
  1003f2:	f3 0f 1e fa          	endbr64 
  1003f6:	55                   	push   %rbp
  1003f7:	48 89 e5             	mov    %rsp,%rbp
  1003fa:	48 83 ec 20          	sub    $0x20,%rsp
  1003fe:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  100402:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    char* d = dst;
  100406:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  10040a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    do {
        *d++ = *src++;
  10040e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  100412:	48 8d 42 01          	lea    0x1(%rdx),%rax
  100416:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  10041a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  10041e:	48 8d 48 01          	lea    0x1(%rax),%rcx
  100422:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
  100426:	0f b6 12             	movzbl (%rdx),%edx
  100429:	88 10                	mov    %dl,(%rax)
    } while (d[-1]);
  10042b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  10042f:	48 83 e8 01          	sub    $0x1,%rax
  100433:	0f b6 00             	movzbl (%rax),%eax
  100436:	84 c0                	test   %al,%al
  100438:	75 d4                	jne    10040e <strcpy+0x1c>
    return dst;
  10043a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
  10043e:	c9                   	leave  
  10043f:	c3                   	ret    

0000000000100440 <strcmp>:

int strcmp(const char* a, const char* b) {
  100440:	f3 0f 1e fa          	endbr64 
  100444:	55                   	push   %rbp
  100445:	48 89 e5             	mov    %rsp,%rbp
  100448:	48 83 ec 10          	sub    $0x10,%rsp
  10044c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  100450:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    while (*a && *b && *a == *b) {
  100454:	eb 0a                	jmp    100460 <strcmp+0x20>
        ++a, ++b;
  100456:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  10045b:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    while (*a && *b && *a == *b) {
  100460:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  100464:	0f b6 00             	movzbl (%rax),%eax
  100467:	84 c0                	test   %al,%al
  100469:	74 1d                	je     100488 <strcmp+0x48>
  10046b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  10046f:	0f b6 00             	movzbl (%rax),%eax
  100472:	84 c0                	test   %al,%al
  100474:	74 12                	je     100488 <strcmp+0x48>
  100476:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  10047a:	0f b6 10             	movzbl (%rax),%edx
  10047d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  100481:	0f b6 00             	movzbl (%rax),%eax
  100484:	38 c2                	cmp    %al,%dl
  100486:	74 ce                	je     100456 <strcmp+0x16>
    }
    return ((unsigned char) *a > (unsigned char) *b)
  100488:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  10048c:	0f b6 00             	movzbl (%rax),%eax
  10048f:	89 c2                	mov    %eax,%edx
  100491:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  100495:	0f b6 00             	movzbl (%rax),%eax
  100498:	38 c2                	cmp    %al,%dl
  10049a:	0f 97 c0             	seta   %al
  10049d:	0f b6 d0             	movzbl %al,%edx
        - ((unsigned char) *a < (unsigned char) *b);
  1004a0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1004a4:	0f b6 00             	movzbl (%rax),%eax
  1004a7:	89 c1                	mov    %eax,%ecx
  1004a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  1004ad:	0f b6 00             	movzbl (%rax),%eax
  1004b0:	38 c1                	cmp    %al,%cl
  1004b2:	0f 92 c0             	setb   %al
  1004b5:	0f b6 c8             	movzbl %al,%ecx
  1004b8:	89 d0                	mov    %edx,%eax
  1004ba:	29 c8                	sub    %ecx,%eax
}
  1004bc:	c9                   	leave  
  1004bd:	c3                   	ret    

00000000001004be <strchr>:

char* strchr(const char* s, int c) {
  1004be:	f3 0f 1e fa          	endbr64 
  1004c2:	55                   	push   %rbp
  1004c3:	48 89 e5             	mov    %rsp,%rbp
  1004c6:	48 83 ec 10          	sub    $0x10,%rsp
  1004ca:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  1004ce:	89 75 f4             	mov    %esi,-0xc(%rbp)
    while (*s && *s != (char) c) {
  1004d1:	eb 05                	jmp    1004d8 <strchr+0x1a>
        ++s;
  1004d3:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    while (*s && *s != (char) c) {
  1004d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1004dc:	0f b6 00             	movzbl (%rax),%eax
  1004df:	84 c0                	test   %al,%al
  1004e1:	74 0e                	je     1004f1 <strchr+0x33>
  1004e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1004e7:	0f b6 00             	movzbl (%rax),%eax
  1004ea:	8b 55 f4             	mov    -0xc(%rbp),%edx
  1004ed:	38 d0                	cmp    %dl,%al
  1004ef:	75 e2                	jne    1004d3 <strchr+0x15>
    }
    if (*s == (char) c) {
  1004f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1004f5:	0f b6 00             	movzbl (%rax),%eax
  1004f8:	8b 55 f4             	mov    -0xc(%rbp),%edx
  1004fb:	38 d0                	cmp    %dl,%al
  1004fd:	75 06                	jne    100505 <strchr+0x47>
        return (char*) s;
  1004ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  100503:	eb 05                	jmp    10050a <strchr+0x4c>
    } else {
        return NULL;
  100505:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
  10050a:	c9                   	leave  
  10050b:	c3                   	ret    

000000000010050c <rand>:
// rand, srand

static int rand_seed_set;
static unsigned rand_seed;

int rand(void) {
  10050c:	f3 0f 1e fa          	endbr64 
  100510:	55                   	push   %rbp
  100511:	48 89 e5             	mov    %rsp,%rbp
    if (!rand_seed_set) {
  100514:	8b 05 e6 1a 00 00    	mov    0x1ae6(%rip),%eax        # 102000 <rand_seed_set>
  10051a:	85 c0                	test   %eax,%eax
  10051c:	75 0a                	jne    100528 <rand+0x1c>
        srand(819234718U);
  10051e:	bf 9e 87 d4 30       	mov    $0x30d4879e,%edi
  100523:	e8 24 00 00 00       	call   10054c <srand>
    }
    rand_seed = rand_seed * 1664525U + 1013904223U;
  100528:	8b 05 d6 1a 00 00    	mov    0x1ad6(%rip),%eax        # 102004 <rand_seed>
  10052e:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
  100534:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
  100539:	89 05 c5 1a 00 00    	mov    %eax,0x1ac5(%rip)        # 102004 <rand_seed>
    return rand_seed & RAND_MAX;
  10053f:	8b 05 bf 1a 00 00    	mov    0x1abf(%rip),%eax        # 102004 <rand_seed>
  100545:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  10054a:	5d                   	pop    %rbp
  10054b:	c3                   	ret    

000000000010054c <srand>:

void srand(unsigned seed) {
  10054c:	f3 0f 1e fa          	endbr64 
  100550:	55                   	push   %rbp
  100551:	48 89 e5             	mov    %rsp,%rbp
  100554:	48 83 ec 08          	sub    $0x8,%rsp
  100558:	89 7d fc             	mov    %edi,-0x4(%rbp)
    rand_seed = seed;
  10055b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  10055e:	89 05 a0 1a 00 00    	mov    %eax,0x1aa0(%rip)        # 102004 <rand_seed>
    rand_seed_set = 1;
  100564:	c7 05 92 1a 00 00 01 	movl   $0x1,0x1a92(%rip)        # 102000 <rand_seed_set>
  10056b:	00 00 00 
}
  10056e:	90                   	nop
  10056f:	c9                   	leave  
  100570:	c3                   	ret    

0000000000100571 <fill_numbuf>:
//    Print a message onto the console, starting at the given cursor position.

// snprintf, vsnprintf
//    Format a string into a buffer.

static char* fill_numbuf(char* numbuf_end, unsigned long val, int base) {
  100571:	f3 0f 1e fa          	endbr64 
  100575:	55                   	push   %rbp
  100576:	48 89 e5             	mov    %rsp,%rbp
  100579:	48 83 ec 28          	sub    $0x28,%rsp
  10057d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  100581:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  100585:	89 55 dc             	mov    %edx,-0x24(%rbp)
    static const char upper_digits[] = "0123456789ABCDEF";
    static const char lower_digits[] = "0123456789abcdef";

    const char* digits = upper_digits;
  100588:	48 8d 05 41 0f 00 00 	lea    0xf41(%rip),%rax        # 1014d0 <upper_digits.1>
  10058f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (base < 0) {
  100593:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  100597:	79 0e                	jns    1005a7 <fill_numbuf+0x36>
        digits = lower_digits;
  100599:	48 8d 05 50 0f 00 00 	lea    0xf50(%rip),%rax        # 1014f0 <lower_digits.0>
  1005a0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        base = -base;
  1005a4:	f7 5d dc             	negl   -0x24(%rbp)
    }

    *--numbuf_end = '\0';
  1005a7:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  1005ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  1005b0:	c6 00 00             	movb   $0x0,(%rax)
    do {
        *--numbuf_end = digits[val % base];
  1005b3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  1005b6:	48 63 c8             	movslq %eax,%rcx
  1005b9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  1005bd:	ba 00 00 00 00       	mov    $0x0,%edx
  1005c2:	48 f7 f1             	div    %rcx
  1005c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1005c9:	48 01 d0             	add    %rdx,%rax
  1005cc:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  1005d1:	0f b6 10             	movzbl (%rax),%edx
  1005d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  1005d8:	88 10                	mov    %dl,(%rax)
        val /= base;
  1005da:	8b 45 dc             	mov    -0x24(%rbp),%eax
  1005dd:	48 63 f0             	movslq %eax,%rsi
  1005e0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  1005e4:	ba 00 00 00 00       	mov    $0x0,%edx
  1005e9:	48 f7 f6             	div    %rsi
  1005ec:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    } while (val != 0);
  1005f0:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  1005f5:	75 bc                	jne    1005b3 <fill_numbuf+0x42>
    return numbuf_end;
  1005f7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
  1005fb:	c9                   	leave  
  1005fc:	c3                   	ret    

00000000001005fd <printer_vprintf>:
#define FLAG_NUMERIC            (1<<5)
#define FLAG_SIGNED             (1<<6)
#define FLAG_NEGATIVE           (1<<7)
#define FLAG_ALT2               (1<<8)

void printer_vprintf(printer* p, int color, const char* format, va_list val) {
  1005fd:	f3 0f 1e fa          	endbr64 
  100601:	55                   	push   %rbp
  100602:	48 89 e5             	mov    %rsp,%rbp
  100605:	53                   	push   %rbx
  100606:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
  10060d:	48 89 bd 78 ff ff ff 	mov    %rdi,-0x88(%rbp)
  100614:	89 b5 74 ff ff ff    	mov    %esi,-0x8c(%rbp)
  10061a:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
  100621:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
#define NUMBUFSIZ 24
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
  100628:	e9 bd 09 00 00       	jmp    100fea <printer_vprintf+0x9ed>
        if (*format != '%') {
  10062d:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  100634:	0f b6 00             	movzbl (%rax),%eax
  100637:	3c 25                	cmp    $0x25,%al
  100639:	74 31                	je     10066c <printer_vprintf+0x6f>
            p->putc(p, *format, color);
  10063b:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  100642:	4c 8b 00             	mov    (%rax),%r8
  100645:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  10064c:	0f b6 00             	movzbl (%rax),%eax
  10064f:	0f b6 c8             	movzbl %al,%ecx
  100652:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  100658:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  10065f:	89 ce                	mov    %ecx,%esi
  100661:	48 89 c7             	mov    %rax,%rdi
  100664:	41 ff d0             	call   *%r8
            continue;
  100667:	e9 76 09 00 00       	jmp    100fe2 <printer_vprintf+0x9e5>
        }

        // process flags
        int flags = 0;
  10066c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
        for (++format; *format; ++format) {
  100673:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
  10067a:	01 
  10067b:	eb 4d                	jmp    1006ca <printer_vprintf+0xcd>
            const char* flagc = strchr(flag_chars, *format);
  10067d:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  100684:	0f b6 00             	movzbl (%rax),%eax
  100687:	0f be c0             	movsbl %al,%eax
  10068a:	89 c6                	mov    %eax,%esi
  10068c:	48 8d 05 3d 0d 00 00 	lea    0xd3d(%rip),%rax        # 1013d0 <flag_chars>
  100693:	48 89 c7             	mov    %rax,%rdi
  100696:	e8 23 fe ff ff       	call   1004be <strchr>
  10069b:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
            if (flagc) {
  10069f:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
  1006a4:	74 34                	je     1006da <printer_vprintf+0xdd>
                flags |= 1 << (flagc - flag_chars);
  1006a6:	48 8d 15 23 0d 00 00 	lea    0xd23(%rip),%rdx        # 1013d0 <flag_chars>
  1006ad:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  1006b1:	48 29 d0             	sub    %rdx,%rax
  1006b4:	ba 01 00 00 00       	mov    $0x1,%edx
  1006b9:	89 c1                	mov    %eax,%ecx
  1006bb:	d3 e2                	shl    %cl,%edx
  1006bd:	89 d0                	mov    %edx,%eax
  1006bf:	09 45 ec             	or     %eax,-0x14(%rbp)
        for (++format; *format; ++format) {
  1006c2:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
  1006c9:	01 
  1006ca:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  1006d1:	0f b6 00             	movzbl (%rax),%eax
  1006d4:	84 c0                	test   %al,%al
  1006d6:	75 a5                	jne    10067d <printer_vprintf+0x80>
  1006d8:	eb 01                	jmp    1006db <printer_vprintf+0xde>
            } else {
                break;
  1006da:	90                   	nop
            }
        }

        // process width
        int width = -1;
  1006db:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%rbp)
        if (*format >= '1' && *format <= '9') {
  1006e2:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  1006e9:	0f b6 00             	movzbl (%rax),%eax
  1006ec:	3c 30                	cmp    $0x30,%al
  1006ee:	7e 67                	jle    100757 <printer_vprintf+0x15a>
  1006f0:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  1006f7:	0f b6 00             	movzbl (%rax),%eax
  1006fa:	3c 39                	cmp    $0x39,%al
  1006fc:	7f 59                	jg     100757 <printer_vprintf+0x15a>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1006fe:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
  100705:	eb 2e                	jmp    100735 <printer_vprintf+0x138>
                width = 10 * width + *format++ - '0';
  100707:	8b 55 e8             	mov    -0x18(%rbp),%edx
  10070a:	89 d0                	mov    %edx,%eax
  10070c:	c1 e0 02             	shl    $0x2,%eax
  10070f:	01 d0                	add    %edx,%eax
  100711:	01 c0                	add    %eax,%eax
  100713:	89 c1                	mov    %eax,%ecx
  100715:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  10071c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  100720:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
  100727:	0f b6 00             	movzbl (%rax),%eax
  10072a:	0f be c0             	movsbl %al,%eax
  10072d:	01 c8                	add    %ecx,%eax
  10072f:	83 e8 30             	sub    $0x30,%eax
  100732:	89 45 e8             	mov    %eax,-0x18(%rbp)
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100735:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  10073c:	0f b6 00             	movzbl (%rax),%eax
  10073f:	3c 2f                	cmp    $0x2f,%al
  100741:	0f 8e 85 00 00 00    	jle    1007cc <printer_vprintf+0x1cf>
  100747:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  10074e:	0f b6 00             	movzbl (%rax),%eax
  100751:	3c 39                	cmp    $0x39,%al
  100753:	7e b2                	jle    100707 <printer_vprintf+0x10a>
        if (*format >= '1' && *format <= '9') {
  100755:	eb 75                	jmp    1007cc <printer_vprintf+0x1cf>
            }
        } else if (*format == '*') {
  100757:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  10075e:	0f b6 00             	movzbl (%rax),%eax
  100761:	3c 2a                	cmp    $0x2a,%al
  100763:	75 68                	jne    1007cd <printer_vprintf+0x1d0>
            width = va_arg(val, int);
  100765:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  10076c:	8b 00                	mov    (%rax),%eax
  10076e:	83 f8 2f             	cmp    $0x2f,%eax
  100771:	77 30                	ja     1007a3 <printer_vprintf+0x1a6>
  100773:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  10077a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  10077e:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100785:	8b 00                	mov    (%rax),%eax
  100787:	89 c0                	mov    %eax,%eax
  100789:	48 01 d0             	add    %rdx,%rax
  10078c:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100793:	8b 12                	mov    (%rdx),%edx
  100795:	8d 4a 08             	lea    0x8(%rdx),%ecx
  100798:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  10079f:	89 0a                	mov    %ecx,(%rdx)
  1007a1:	eb 1a                	jmp    1007bd <printer_vprintf+0x1c0>
  1007a3:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  1007aa:	48 8b 40 08          	mov    0x8(%rax),%rax
  1007ae:	48 8d 48 08          	lea    0x8(%rax),%rcx
  1007b2:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  1007b9:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  1007bd:	8b 00                	mov    (%rax),%eax
  1007bf:	89 45 e8             	mov    %eax,-0x18(%rbp)
            ++format;
  1007c2:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
  1007c9:	01 
  1007ca:	eb 01                	jmp    1007cd <printer_vprintf+0x1d0>
        if (*format >= '1' && *format <= '9') {
  1007cc:	90                   	nop
        }

        // process precision
        int precision = -1;
  1007cd:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
        if (*format == '.') {
  1007d4:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  1007db:	0f b6 00             	movzbl (%rax),%eax
  1007de:	3c 2e                	cmp    $0x2e,%al
  1007e0:	0f 85 00 01 00 00    	jne    1008e6 <printer_vprintf+0x2e9>
            ++format;
  1007e6:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
  1007ed:	01 
            if (*format >= '0' && *format <= '9') {
  1007ee:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  1007f5:	0f b6 00             	movzbl (%rax),%eax
  1007f8:	3c 2f                	cmp    $0x2f,%al
  1007fa:	7e 67                	jle    100863 <printer_vprintf+0x266>
  1007fc:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  100803:	0f b6 00             	movzbl (%rax),%eax
  100806:	3c 39                	cmp    $0x39,%al
  100808:	7f 59                	jg     100863 <printer_vprintf+0x266>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  10080a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
  100811:	eb 2e                	jmp    100841 <printer_vprintf+0x244>
                    precision = 10 * precision + *format++ - '0';
  100813:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  100816:	89 d0                	mov    %edx,%eax
  100818:	c1 e0 02             	shl    $0x2,%eax
  10081b:	01 d0                	add    %edx,%eax
  10081d:	01 c0                	add    %eax,%eax
  10081f:	89 c1                	mov    %eax,%ecx
  100821:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  100828:	48 8d 50 01          	lea    0x1(%rax),%rdx
  10082c:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
  100833:	0f b6 00             	movzbl (%rax),%eax
  100836:	0f be c0             	movsbl %al,%eax
  100839:	01 c8                	add    %ecx,%eax
  10083b:	83 e8 30             	sub    $0x30,%eax
  10083e:	89 45 e4             	mov    %eax,-0x1c(%rbp)
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  100841:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  100848:	0f b6 00             	movzbl (%rax),%eax
  10084b:	3c 2f                	cmp    $0x2f,%al
  10084d:	0f 8e 85 00 00 00    	jle    1008d8 <printer_vprintf+0x2db>
  100853:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  10085a:	0f b6 00             	movzbl (%rax),%eax
  10085d:	3c 39                	cmp    $0x39,%al
  10085f:	7e b2                	jle    100813 <printer_vprintf+0x216>
            if (*format >= '0' && *format <= '9') {
  100861:	eb 75                	jmp    1008d8 <printer_vprintf+0x2db>
                }
            } else if (*format == '*') {
  100863:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  10086a:	0f b6 00             	movzbl (%rax),%eax
  10086d:	3c 2a                	cmp    $0x2a,%al
  10086f:	75 68                	jne    1008d9 <printer_vprintf+0x2dc>
                precision = va_arg(val, int);
  100871:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100878:	8b 00                	mov    (%rax),%eax
  10087a:	83 f8 2f             	cmp    $0x2f,%eax
  10087d:	77 30                	ja     1008af <printer_vprintf+0x2b2>
  10087f:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100886:	48 8b 50 10          	mov    0x10(%rax),%rdx
  10088a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100891:	8b 00                	mov    (%rax),%eax
  100893:	89 c0                	mov    %eax,%eax
  100895:	48 01 d0             	add    %rdx,%rax
  100898:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  10089f:	8b 12                	mov    (%rdx),%edx
  1008a1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  1008a4:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  1008ab:	89 0a                	mov    %ecx,(%rdx)
  1008ad:	eb 1a                	jmp    1008c9 <printer_vprintf+0x2cc>
  1008af:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  1008b6:	48 8b 40 08          	mov    0x8(%rax),%rax
  1008ba:	48 8d 48 08          	lea    0x8(%rax),%rcx
  1008be:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  1008c5:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  1008c9:	8b 00                	mov    (%rax),%eax
  1008cb:	89 45 e4             	mov    %eax,-0x1c(%rbp)
                ++format;
  1008ce:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
  1008d5:	01 
  1008d6:	eb 01                	jmp    1008d9 <printer_vprintf+0x2dc>
            if (*format >= '0' && *format <= '9') {
  1008d8:	90                   	nop
            }
            if (precision < 0) {
  1008d9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  1008dd:	79 07                	jns    1008e6 <printer_vprintf+0x2e9>
                precision = 0;
  1008df:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
            }
        }

        // process main conversion character
        int base = 10;
  1008e6:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%rbp)
        unsigned long num = 0;
  1008ed:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
  1008f4:	00 
        int length = 0;
  1008f5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
        char* data = "";
  1008fc:	48 8d 05 d3 0a 00 00 	lea    0xad3(%rip),%rax        # 1013d6 <flag_chars+0x6>
  100903:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    again:
        switch (*format) {
  100907:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  10090e:	0f b6 00             	movzbl (%rax),%eax
  100911:	0f be c0             	movsbl %al,%eax
  100914:	83 e8 43             	sub    $0x43,%eax
  100917:	83 f8 37             	cmp    $0x37,%eax
  10091a:	0f 87 b6 03 00 00    	ja     100cd6 <printer_vprintf+0x6d9>
  100920:	89 c0                	mov    %eax,%eax
  100922:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  100929:	00 
  10092a:	48 8d 05 b3 0a 00 00 	lea    0xab3(%rip),%rax        # 1013e4 <flag_chars+0x14>
  100931:	8b 04 02             	mov    (%rdx,%rax,1),%eax
  100934:	48 98                	cltq   
  100936:	48 8d 15 a7 0a 00 00 	lea    0xaa7(%rip),%rdx        # 1013e4 <flag_chars+0x14>
  10093d:	48 01 d0             	add    %rdx,%rax
  100940:	3e ff e0             	notrack jmp *%rax
        case 'l':
        case 'z':
            length = 1;
  100943:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
            ++format;
  10094a:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
  100951:	01 
            goto again;
  100952:	eb b3                	jmp    100907 <printer_vprintf+0x30a>
        case 'd':
        case 'i': {
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100954:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  100958:	74 5d                	je     1009b7 <printer_vprintf+0x3ba>
  10095a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100961:	8b 00                	mov    (%rax),%eax
  100963:	83 f8 2f             	cmp    $0x2f,%eax
  100966:	77 30                	ja     100998 <printer_vprintf+0x39b>
  100968:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  10096f:	48 8b 50 10          	mov    0x10(%rax),%rdx
  100973:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  10097a:	8b 00                	mov    (%rax),%eax
  10097c:	89 c0                	mov    %eax,%eax
  10097e:	48 01 d0             	add    %rdx,%rax
  100981:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100988:	8b 12                	mov    (%rdx),%edx
  10098a:	8d 4a 08             	lea    0x8(%rdx),%ecx
  10098d:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100994:	89 0a                	mov    %ecx,(%rdx)
  100996:	eb 1a                	jmp    1009b2 <printer_vprintf+0x3b5>
  100998:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  10099f:	48 8b 40 08          	mov    0x8(%rax),%rax
  1009a3:	48 8d 48 08          	lea    0x8(%rax),%rcx
  1009a7:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  1009ae:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  1009b2:	48 8b 00             	mov    (%rax),%rax
  1009b5:	eb 5c                	jmp    100a13 <printer_vprintf+0x416>
  1009b7:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  1009be:	8b 00                	mov    (%rax),%eax
  1009c0:	83 f8 2f             	cmp    $0x2f,%eax
  1009c3:	77 30                	ja     1009f5 <printer_vprintf+0x3f8>
  1009c5:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  1009cc:	48 8b 50 10          	mov    0x10(%rax),%rdx
  1009d0:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  1009d7:	8b 00                	mov    (%rax),%eax
  1009d9:	89 c0                	mov    %eax,%eax
  1009db:	48 01 d0             	add    %rdx,%rax
  1009de:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  1009e5:	8b 12                	mov    (%rdx),%edx
  1009e7:	8d 4a 08             	lea    0x8(%rdx),%ecx
  1009ea:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  1009f1:	89 0a                	mov    %ecx,(%rdx)
  1009f3:	eb 1a                	jmp    100a0f <printer_vprintf+0x412>
  1009f5:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  1009fc:	48 8b 40 08          	mov    0x8(%rax),%rax
  100a00:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100a04:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100a0b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  100a0f:	8b 00                	mov    (%rax),%eax
  100a11:	48 98                	cltq   
  100a13:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  100a17:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  100a1b:	48 c1 f8 38          	sar    $0x38,%rax
  100a1f:	25 80 00 00 00       	and    $0x80,%eax
  100a24:	89 45 a4             	mov    %eax,-0x5c(%rbp)
            num = negative ? -x : x;
  100a27:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
  100a2b:	74 09                	je     100a36 <printer_vprintf+0x439>
  100a2d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  100a31:	48 f7 d8             	neg    %rax
  100a34:	eb 04                	jmp    100a3a <printer_vprintf+0x43d>
  100a36:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  100a3a:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  100a3e:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  100a41:	83 c8 60             	or     $0x60,%eax
  100a44:	09 45 ec             	or     %eax,-0x14(%rbp)
            break;
  100a47:	e9 cf 02 00 00       	jmp    100d1b <printer_vprintf+0x71e>
        }
        case 'u':
        format_unsigned:
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  100a4c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  100a50:	74 5d                	je     100aaf <printer_vprintf+0x4b2>
  100a52:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100a59:	8b 00                	mov    (%rax),%eax
  100a5b:	83 f8 2f             	cmp    $0x2f,%eax
  100a5e:	77 30                	ja     100a90 <printer_vprintf+0x493>
  100a60:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100a67:	48 8b 50 10          	mov    0x10(%rax),%rdx
  100a6b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100a72:	8b 00                	mov    (%rax),%eax
  100a74:	89 c0                	mov    %eax,%eax
  100a76:	48 01 d0             	add    %rdx,%rax
  100a79:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100a80:	8b 12                	mov    (%rdx),%edx
  100a82:	8d 4a 08             	lea    0x8(%rdx),%ecx
  100a85:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100a8c:	89 0a                	mov    %ecx,(%rdx)
  100a8e:	eb 1a                	jmp    100aaa <printer_vprintf+0x4ad>
  100a90:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100a97:	48 8b 40 08          	mov    0x8(%rax),%rax
  100a9b:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100a9f:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100aa6:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  100aaa:	48 8b 00             	mov    (%rax),%rax
  100aad:	eb 5c                	jmp    100b0b <printer_vprintf+0x50e>
  100aaf:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100ab6:	8b 00                	mov    (%rax),%eax
  100ab8:	83 f8 2f             	cmp    $0x2f,%eax
  100abb:	77 30                	ja     100aed <printer_vprintf+0x4f0>
  100abd:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100ac4:	48 8b 50 10          	mov    0x10(%rax),%rdx
  100ac8:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100acf:	8b 00                	mov    (%rax),%eax
  100ad1:	89 c0                	mov    %eax,%eax
  100ad3:	48 01 d0             	add    %rdx,%rax
  100ad6:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100add:	8b 12                	mov    (%rdx),%edx
  100adf:	8d 4a 08             	lea    0x8(%rdx),%ecx
  100ae2:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100ae9:	89 0a                	mov    %ecx,(%rdx)
  100aeb:	eb 1a                	jmp    100b07 <printer_vprintf+0x50a>
  100aed:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100af4:	48 8b 40 08          	mov    0x8(%rax),%rax
  100af8:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100afc:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100b03:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  100b07:	8b 00                	mov    (%rax),%eax
  100b09:	89 c0                	mov    %eax,%eax
  100b0b:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            flags |= FLAG_NUMERIC;
  100b0f:	83 4d ec 20          	orl    $0x20,-0x14(%rbp)
            break;
  100b13:	e9 03 02 00 00       	jmp    100d1b <printer_vprintf+0x71e>
        case 'x':
            base = -16;
  100b18:	c7 45 e0 f0 ff ff ff 	movl   $0xfffffff0,-0x20(%rbp)
            goto format_unsigned;
  100b1f:	e9 28 ff ff ff       	jmp    100a4c <printer_vprintf+0x44f>
        case 'X':
            base = 16;
  100b24:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%rbp)
            goto format_unsigned;
  100b2b:	e9 1c ff ff ff       	jmp    100a4c <printer_vprintf+0x44f>
        case 'p':
            num = (uintptr_t) va_arg(val, void*);
  100b30:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100b37:	8b 00                	mov    (%rax),%eax
  100b39:	83 f8 2f             	cmp    $0x2f,%eax
  100b3c:	77 30                	ja     100b6e <printer_vprintf+0x571>
  100b3e:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100b45:	48 8b 50 10          	mov    0x10(%rax),%rdx
  100b49:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100b50:	8b 00                	mov    (%rax),%eax
  100b52:	89 c0                	mov    %eax,%eax
  100b54:	48 01 d0             	add    %rdx,%rax
  100b57:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100b5e:	8b 12                	mov    (%rdx),%edx
  100b60:	8d 4a 08             	lea    0x8(%rdx),%ecx
  100b63:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100b6a:	89 0a                	mov    %ecx,(%rdx)
  100b6c:	eb 1a                	jmp    100b88 <printer_vprintf+0x58b>
  100b6e:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100b75:	48 8b 40 08          	mov    0x8(%rax),%rax
  100b79:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100b7d:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100b84:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  100b88:	48 8b 00             	mov    (%rax),%rax
  100b8b:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            base = -16;
  100b8f:	c7 45 e0 f0 ff ff ff 	movl   $0xfffffff0,-0x20(%rbp)
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  100b96:	81 4d ec 21 01 00 00 	orl    $0x121,-0x14(%rbp)
            break;
  100b9d:	e9 79 01 00 00       	jmp    100d1b <printer_vprintf+0x71e>
        case 's':
            data = va_arg(val, char*);
  100ba2:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100ba9:	8b 00                	mov    (%rax),%eax
  100bab:	83 f8 2f             	cmp    $0x2f,%eax
  100bae:	77 30                	ja     100be0 <printer_vprintf+0x5e3>
  100bb0:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100bb7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  100bbb:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100bc2:	8b 00                	mov    (%rax),%eax
  100bc4:	89 c0                	mov    %eax,%eax
  100bc6:	48 01 d0             	add    %rdx,%rax
  100bc9:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100bd0:	8b 12                	mov    (%rdx),%edx
  100bd2:	8d 4a 08             	lea    0x8(%rdx),%ecx
  100bd5:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100bdc:	89 0a                	mov    %ecx,(%rdx)
  100bde:	eb 1a                	jmp    100bfa <printer_vprintf+0x5fd>
  100be0:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100be7:	48 8b 40 08          	mov    0x8(%rax),%rax
  100beb:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100bef:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100bf6:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  100bfa:	48 8b 00             	mov    (%rax),%rax
  100bfd:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            break;
  100c01:	e9 15 01 00 00       	jmp    100d1b <printer_vprintf+0x71e>
        case 'C':
            color = va_arg(val, int);
  100c06:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100c0d:	8b 00                	mov    (%rax),%eax
  100c0f:	83 f8 2f             	cmp    $0x2f,%eax
  100c12:	77 30                	ja     100c44 <printer_vprintf+0x647>
  100c14:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100c1b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  100c1f:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100c26:	8b 00                	mov    (%rax),%eax
  100c28:	89 c0                	mov    %eax,%eax
  100c2a:	48 01 d0             	add    %rdx,%rax
  100c2d:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100c34:	8b 12                	mov    (%rdx),%edx
  100c36:	8d 4a 08             	lea    0x8(%rdx),%ecx
  100c39:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100c40:	89 0a                	mov    %ecx,(%rdx)
  100c42:	eb 1a                	jmp    100c5e <printer_vprintf+0x661>
  100c44:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100c4b:	48 8b 40 08          	mov    0x8(%rax),%rax
  100c4f:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100c53:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100c5a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  100c5e:	8b 00                	mov    (%rax),%eax
  100c60:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
            goto done;
  100c66:	e9 77 03 00 00       	jmp    100fe2 <printer_vprintf+0x9e5>
        case 'c':
            data = numbuf;
  100c6b:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
  100c6f:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            numbuf[0] = va_arg(val, int);
  100c73:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100c7a:	8b 00                	mov    (%rax),%eax
  100c7c:	83 f8 2f             	cmp    $0x2f,%eax
  100c7f:	77 30                	ja     100cb1 <printer_vprintf+0x6b4>
  100c81:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100c88:	48 8b 50 10          	mov    0x10(%rax),%rdx
  100c8c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100c93:	8b 00                	mov    (%rax),%eax
  100c95:	89 c0                	mov    %eax,%eax
  100c97:	48 01 d0             	add    %rdx,%rax
  100c9a:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100ca1:	8b 12                	mov    (%rdx),%edx
  100ca3:	8d 4a 08             	lea    0x8(%rdx),%ecx
  100ca6:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100cad:	89 0a                	mov    %ecx,(%rdx)
  100caf:	eb 1a                	jmp    100ccb <printer_vprintf+0x6ce>
  100cb1:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100cb8:	48 8b 40 08          	mov    0x8(%rax),%rax
  100cbc:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100cc0:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100cc7:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  100ccb:	8b 00                	mov    (%rax),%eax
  100ccd:	88 45 8c             	mov    %al,-0x74(%rbp)
            numbuf[1] = '\0';
  100cd0:	c6 45 8d 00          	movb   $0x0,-0x73(%rbp)
            break;
  100cd4:	eb 45                	jmp    100d1b <printer_vprintf+0x71e>
        default:
            data = numbuf;
  100cd6:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
  100cda:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            numbuf[0] = (*format ? *format : '%');
  100cde:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  100ce5:	0f b6 00             	movzbl (%rax),%eax
  100ce8:	84 c0                	test   %al,%al
  100cea:	74 0c                	je     100cf8 <printer_vprintf+0x6fb>
  100cec:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  100cf3:	0f b6 00             	movzbl (%rax),%eax
  100cf6:	eb 05                	jmp    100cfd <printer_vprintf+0x700>
  100cf8:	b8 25 00 00 00       	mov    $0x25,%eax
  100cfd:	88 45 8c             	mov    %al,-0x74(%rbp)
            numbuf[1] = '\0';
  100d00:	c6 45 8d 00          	movb   $0x0,-0x73(%rbp)
            if (!*format) {
  100d04:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  100d0b:	0f b6 00             	movzbl (%rax),%eax
  100d0e:	84 c0                	test   %al,%al
  100d10:	75 08                	jne    100d1a <printer_vprintf+0x71d>
                format--;
  100d12:	48 83 ad 68 ff ff ff 	subq   $0x1,-0x98(%rbp)
  100d19:	01 
            }
            break;
  100d1a:	90                   	nop
        }

        if (flags & FLAG_NUMERIC) {
  100d1b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100d1e:	83 e0 20             	and    $0x20,%eax
  100d21:	85 c0                	test   %eax,%eax
  100d23:	74 1e                	je     100d43 <printer_vprintf+0x746>
            data = fill_numbuf(numbuf + NUMBUFSIZ, num, base);
  100d25:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
  100d29:	48 83 c0 18          	add    $0x18,%rax
  100d2d:	8b 55 e0             	mov    -0x20(%rbp),%edx
  100d30:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  100d34:	48 89 ce             	mov    %rcx,%rsi
  100d37:	48 89 c7             	mov    %rax,%rdi
  100d3a:	e8 32 f8 ff ff       	call   100571 <fill_numbuf>
  100d3f:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
        }

        const char* prefix = "";
  100d43:	48 8d 05 8c 06 00 00 	lea    0x68c(%rip),%rax        # 1013d6 <flag_chars+0x6>
  100d4a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  100d4e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100d51:	83 e0 20             	and    $0x20,%eax
  100d54:	85 c0                	test   %eax,%eax
  100d56:	74 51                	je     100da9 <printer_vprintf+0x7ac>
  100d58:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100d5b:	83 e0 40             	and    $0x40,%eax
  100d5e:	85 c0                	test   %eax,%eax
  100d60:	74 47                	je     100da9 <printer_vprintf+0x7ac>
            if (flags & FLAG_NEGATIVE) {
  100d62:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100d65:	25 80 00 00 00       	and    $0x80,%eax
  100d6a:	85 c0                	test   %eax,%eax
  100d6c:	74 0d                	je     100d7b <printer_vprintf+0x77e>
                prefix = "-";
  100d6e:	48 8d 05 62 06 00 00 	lea    0x662(%rip),%rax        # 1013d7 <flag_chars+0x7>
  100d75:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
  100d79:	eb 7d                	jmp    100df8 <printer_vprintf+0x7fb>
            } else if (flags & FLAG_PLUSPOSITIVE) {
  100d7b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100d7e:	83 e0 10             	and    $0x10,%eax
  100d81:	85 c0                	test   %eax,%eax
  100d83:	74 0d                	je     100d92 <printer_vprintf+0x795>
                prefix = "+";
  100d85:	48 8d 05 4d 06 00 00 	lea    0x64d(%rip),%rax        # 1013d9 <flag_chars+0x9>
  100d8c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
  100d90:	eb 66                	jmp    100df8 <printer_vprintf+0x7fb>
            } else if (flags & FLAG_SPACEPOSITIVE) {
  100d92:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100d95:	83 e0 08             	and    $0x8,%eax
  100d98:	85 c0                	test   %eax,%eax
  100d9a:	74 5c                	je     100df8 <printer_vprintf+0x7fb>
                prefix = " ";
  100d9c:	48 8d 05 38 06 00 00 	lea    0x638(%rip),%rax        # 1013db <flag_chars+0xb>
  100da3:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
  100da7:	eb 4f                	jmp    100df8 <printer_vprintf+0x7fb>
            }
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100da9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100dac:	83 e0 20             	and    $0x20,%eax
  100daf:	85 c0                	test   %eax,%eax
  100db1:	74 46                	je     100df9 <printer_vprintf+0x7fc>
  100db3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100db6:	83 e0 01             	and    $0x1,%eax
  100db9:	85 c0                	test   %eax,%eax
  100dbb:	74 3c                	je     100df9 <printer_vprintf+0x7fc>
                   && (base == 16 || base == -16)
  100dbd:	83 7d e0 10          	cmpl   $0x10,-0x20(%rbp)
  100dc1:	74 06                	je     100dc9 <printer_vprintf+0x7cc>
  100dc3:	83 7d e0 f0          	cmpl   $0xfffffff0,-0x20(%rbp)
  100dc7:	75 30                	jne    100df9 <printer_vprintf+0x7fc>
                   && (num || (flags & FLAG_ALT2))) {
  100dc9:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  100dce:	75 0c                	jne    100ddc <printer_vprintf+0x7df>
  100dd0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100dd3:	25 00 01 00 00       	and    $0x100,%eax
  100dd8:	85 c0                	test   %eax,%eax
  100dda:	74 1d                	je     100df9 <printer_vprintf+0x7fc>
            prefix = (base == -16 ? "0x" : "0X");
  100ddc:	83 7d e0 f0          	cmpl   $0xfffffff0,-0x20(%rbp)
  100de0:	75 09                	jne    100deb <printer_vprintf+0x7ee>
  100de2:	48 8d 05 f4 05 00 00 	lea    0x5f4(%rip),%rax        # 1013dd <flag_chars+0xd>
  100de9:	eb 07                	jmp    100df2 <printer_vprintf+0x7f5>
  100deb:	48 8d 05 ee 05 00 00 	lea    0x5ee(%rip),%rax        # 1013e0 <flag_chars+0x10>
  100df2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100df6:	eb 01                	jmp    100df9 <printer_vprintf+0x7fc>
            if (flags & FLAG_NEGATIVE) {
  100df8:	90                   	nop
        }

        int len;
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  100df9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  100dfd:	78 24                	js     100e23 <printer_vprintf+0x826>
  100dff:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100e02:	83 e0 20             	and    $0x20,%eax
  100e05:	85 c0                	test   %eax,%eax
  100e07:	75 1a                	jne    100e23 <printer_vprintf+0x826>
            len = strnlen(data, precision);
  100e09:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  100e0c:	48 63 d0             	movslq %eax,%rdx
  100e0f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  100e13:	48 89 d6             	mov    %rdx,%rsi
  100e16:	48 89 c7             	mov    %rax,%rdi
  100e19:	e8 91 f5 ff ff       	call   1003af <strnlen>
  100e1e:	89 45 bc             	mov    %eax,-0x44(%rbp)
  100e21:	eb 0f                	jmp    100e32 <printer_vprintf+0x835>
        } else {
            len = strlen(data);
  100e23:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  100e27:	48 89 c7             	mov    %rax,%rdi
  100e2a:	e8 4b f5 ff ff       	call   10037a <strlen>
  100e2f:	89 45 bc             	mov    %eax,-0x44(%rbp)
        }
        int zeros;
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
  100e32:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100e35:	83 e0 20             	and    $0x20,%eax
  100e38:	85 c0                	test   %eax,%eax
  100e3a:	74 20                	je     100e5c <printer_vprintf+0x85f>
  100e3c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  100e40:	78 1a                	js     100e5c <printer_vprintf+0x85f>
            zeros = precision > len ? precision - len : 0;
  100e42:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  100e45:	3b 45 bc             	cmp    -0x44(%rbp),%eax
  100e48:	7e 08                	jle    100e52 <printer_vprintf+0x855>
  100e4a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  100e4d:	2b 45 bc             	sub    -0x44(%rbp),%eax
  100e50:	eb 05                	jmp    100e57 <printer_vprintf+0x85a>
  100e52:	b8 00 00 00 00       	mov    $0x0,%eax
  100e57:	89 45 b8             	mov    %eax,-0x48(%rbp)
  100e5a:	eb 5c                	jmp    100eb8 <printer_vprintf+0x8bb>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
  100e5c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100e5f:	83 e0 20             	and    $0x20,%eax
  100e62:	85 c0                	test   %eax,%eax
  100e64:	74 4b                	je     100eb1 <printer_vprintf+0x8b4>
  100e66:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100e69:	83 e0 02             	and    $0x2,%eax
  100e6c:	85 c0                	test   %eax,%eax
  100e6e:	74 41                	je     100eb1 <printer_vprintf+0x8b4>
                   && !(flags & FLAG_LEFTJUSTIFY)
  100e70:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100e73:	83 e0 04             	and    $0x4,%eax
  100e76:	85 c0                	test   %eax,%eax
  100e78:	75 37                	jne    100eb1 <printer_vprintf+0x8b4>
                   && len + (int) strlen(prefix) < width) {
  100e7a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  100e7e:	48 89 c7             	mov    %rax,%rdi
  100e81:	e8 f4 f4 ff ff       	call   10037a <strlen>
  100e86:	89 c2                	mov    %eax,%edx
  100e88:	8b 45 bc             	mov    -0x44(%rbp),%eax
  100e8b:	01 d0                	add    %edx,%eax
  100e8d:	39 45 e8             	cmp    %eax,-0x18(%rbp)
  100e90:	7e 1f                	jle    100eb1 <printer_vprintf+0x8b4>
            zeros = width - len - strlen(prefix);
  100e92:	8b 45 e8             	mov    -0x18(%rbp),%eax
  100e95:	2b 45 bc             	sub    -0x44(%rbp),%eax
  100e98:	89 c3                	mov    %eax,%ebx
  100e9a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  100e9e:	48 89 c7             	mov    %rax,%rdi
  100ea1:	e8 d4 f4 ff ff       	call   10037a <strlen>
  100ea6:	89 c2                	mov    %eax,%edx
  100ea8:	89 d8                	mov    %ebx,%eax
  100eaa:	29 d0                	sub    %edx,%eax
  100eac:	89 45 b8             	mov    %eax,-0x48(%rbp)
  100eaf:	eb 07                	jmp    100eb8 <printer_vprintf+0x8bb>
        } else {
            zeros = 0;
  100eb1:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%rbp)
        }
        width -= len + zeros + strlen(prefix);
  100eb8:	8b 55 bc             	mov    -0x44(%rbp),%edx
  100ebb:	8b 45 b8             	mov    -0x48(%rbp),%eax
  100ebe:	01 d0                	add    %edx,%eax
  100ec0:	48 63 d8             	movslq %eax,%rbx
  100ec3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  100ec7:	48 89 c7             	mov    %rax,%rdi
  100eca:	e8 ab f4 ff ff       	call   10037a <strlen>
  100ecf:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
  100ed3:	8b 45 e8             	mov    -0x18(%rbp),%eax
  100ed6:	29 d0                	sub    %edx,%eax
  100ed8:	89 45 e8             	mov    %eax,-0x18(%rbp)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100edb:	eb 25                	jmp    100f02 <printer_vprintf+0x905>
            p->putc(p, ' ', color);
  100edd:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  100ee4:	48 8b 08             	mov    (%rax),%rcx
  100ee7:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  100eed:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  100ef4:	be 20 00 00 00       	mov    $0x20,%esi
  100ef9:	48 89 c7             	mov    %rax,%rdi
  100efc:	ff d1                	call   *%rcx
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100efe:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
  100f02:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100f05:	83 e0 04             	and    $0x4,%eax
  100f08:	85 c0                	test   %eax,%eax
  100f0a:	75 36                	jne    100f42 <printer_vprintf+0x945>
  100f0c:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  100f10:	7f cb                	jg     100edd <printer_vprintf+0x8e0>
        }
        for (; *prefix; ++prefix) {
  100f12:	eb 2e                	jmp    100f42 <printer_vprintf+0x945>
            p->putc(p, *prefix, color);
  100f14:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  100f1b:	4c 8b 00             	mov    (%rax),%r8
  100f1e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  100f22:	0f b6 00             	movzbl (%rax),%eax
  100f25:	0f b6 c8             	movzbl %al,%ecx
  100f28:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  100f2e:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  100f35:	89 ce                	mov    %ecx,%esi
  100f37:	48 89 c7             	mov    %rax,%rdi
  100f3a:	41 ff d0             	call   *%r8
        for (; *prefix; ++prefix) {
  100f3d:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
  100f42:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  100f46:	0f b6 00             	movzbl (%rax),%eax
  100f49:	84 c0                	test   %al,%al
  100f4b:	75 c7                	jne    100f14 <printer_vprintf+0x917>
        }
        for (; zeros > 0; --zeros) {
  100f4d:	eb 25                	jmp    100f74 <printer_vprintf+0x977>
            p->putc(p, '0', color);
  100f4f:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  100f56:	48 8b 08             	mov    (%rax),%rcx
  100f59:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  100f5f:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  100f66:	be 30 00 00 00       	mov    $0x30,%esi
  100f6b:	48 89 c7             	mov    %rax,%rdi
  100f6e:	ff d1                	call   *%rcx
        for (; zeros > 0; --zeros) {
  100f70:	83 6d b8 01          	subl   $0x1,-0x48(%rbp)
  100f74:	83 7d b8 00          	cmpl   $0x0,-0x48(%rbp)
  100f78:	7f d5                	jg     100f4f <printer_vprintf+0x952>
        }
        for (; len > 0; ++data, --len) {
  100f7a:	eb 32                	jmp    100fae <printer_vprintf+0x9b1>
            p->putc(p, *data, color);
  100f7c:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  100f83:	4c 8b 00             	mov    (%rax),%r8
  100f86:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  100f8a:	0f b6 00             	movzbl (%rax),%eax
  100f8d:	0f b6 c8             	movzbl %al,%ecx
  100f90:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  100f96:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  100f9d:	89 ce                	mov    %ecx,%esi
  100f9f:	48 89 c7             	mov    %rax,%rdi
  100fa2:	41 ff d0             	call   *%r8
        for (; len > 0; ++data, --len) {
  100fa5:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  100faa:	83 6d bc 01          	subl   $0x1,-0x44(%rbp)
  100fae:	83 7d bc 00          	cmpl   $0x0,-0x44(%rbp)
  100fb2:	7f c8                	jg     100f7c <printer_vprintf+0x97f>
        }
        for (; width > 0; --width) {
  100fb4:	eb 25                	jmp    100fdb <printer_vprintf+0x9de>
            p->putc(p, ' ', color);
  100fb6:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  100fbd:	48 8b 08             	mov    (%rax),%rcx
  100fc0:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  100fc6:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  100fcd:	be 20 00 00 00       	mov    $0x20,%esi
  100fd2:	48 89 c7             	mov    %rax,%rdi
  100fd5:	ff d1                	call   *%rcx
        for (; width > 0; --width) {
  100fd7:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
  100fdb:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  100fdf:	7f d5                	jg     100fb6 <printer_vprintf+0x9b9>
        }
    done: ;
  100fe1:	90                   	nop
    for (; *format; ++format) {
  100fe2:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
  100fe9:	01 
  100fea:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  100ff1:	0f b6 00             	movzbl (%rax),%eax
  100ff4:	84 c0                	test   %al,%al
  100ff6:	0f 85 31 f6 ff ff    	jne    10062d <printer_vprintf+0x30>
    }
}
  100ffc:	90                   	nop
  100ffd:	90                   	nop
  100ffe:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  101002:	c9                   	leave  
  101003:	c3                   	ret    

0000000000101004 <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
  101004:	f3 0f 1e fa          	endbr64 
  101008:	55                   	push   %rbp
  101009:	48 89 e5             	mov    %rsp,%rbp
  10100c:	48 83 ec 20          	sub    $0x20,%rsp
  101010:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  101014:	89 f0                	mov    %esi,%eax
  101016:	89 55 e0             	mov    %edx,-0x20(%rbp)
  101019:	88 45 e4             	mov    %al,-0x1c(%rbp)
    console_printer* cp = (console_printer*) p;
  10101c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  101020:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  101024:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  101028:	48 8b 40 08          	mov    0x8(%rax),%rax
  10102c:	48 8d 15 6d 7f fb ff 	lea    -0x48093(%rip),%rdx        # b8fa0 <console+0xfa0>
  101033:	48 39 d0             	cmp    %rdx,%rax
  101036:	72 0f                	jb     101047 <console_putc+0x43>
        cp->cursor = console;
  101038:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  10103c:	48 8d 15 bd 6f fb ff 	lea    -0x49043(%rip),%rdx        # b8000 <console>
  101043:	48 89 50 08          	mov    %rdx,0x8(%rax)
    }
    if (c == '\n') {
  101047:	80 7d e4 0a          	cmpb   $0xa,-0x1c(%rbp)
  10104b:	0f 85 82 00 00 00    	jne    1010d3 <console_putc+0xcf>
        int pos = (cp->cursor - console) % 80;
  101051:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  101055:	48 8b 40 08          	mov    0x8(%rax),%rax
  101059:	48 8d 15 a0 6f fb ff 	lea    -0x49060(%rip),%rdx        # b8000 <console>
  101060:	48 29 d0             	sub    %rdx,%rax
  101063:	48 d1 f8             	sar    %rax
  101066:	48 89 c1             	mov    %rax,%rcx
  101069:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
  101070:	66 66 66 
  101073:	48 89 c8             	mov    %rcx,%rax
  101076:	48 f7 ea             	imul   %rdx
  101079:	48 89 d0             	mov    %rdx,%rax
  10107c:	48 c1 f8 05          	sar    $0x5,%rax
  101080:	48 89 ce             	mov    %rcx,%rsi
  101083:	48 c1 fe 3f          	sar    $0x3f,%rsi
  101087:	48 29 f0             	sub    %rsi,%rax
  10108a:	48 89 c2             	mov    %rax,%rdx
  10108d:	48 89 d0             	mov    %rdx,%rax
  101090:	48 c1 e0 02          	shl    $0x2,%rax
  101094:	48 01 d0             	add    %rdx,%rax
  101097:	48 c1 e0 04          	shl    $0x4,%rax
  10109b:	48 29 c1             	sub    %rax,%rcx
  10109e:	48 89 ca             	mov    %rcx,%rdx
  1010a1:	89 55 fc             	mov    %edx,-0x4(%rbp)
        for (; pos != 80; pos++) {
  1010a4:	eb 25                	jmp    1010cb <console_putc+0xc7>
            *cp->cursor++ = ' ' | color;
  1010a6:	8b 45 e0             	mov    -0x20(%rbp),%eax
  1010a9:	83 c8 20             	or     $0x20,%eax
  1010ac:	89 c6                	mov    %eax,%esi
  1010ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  1010b2:	48 8b 40 08          	mov    0x8(%rax),%rax
  1010b6:	48 8d 48 02          	lea    0x2(%rax),%rcx
  1010ba:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  1010be:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  1010c2:	89 f2                	mov    %esi,%edx
  1010c4:	66 89 10             	mov    %dx,(%rax)
        for (; pos != 80; pos++) {
  1010c7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  1010cb:	83 7d fc 50          	cmpl   $0x50,-0x4(%rbp)
  1010cf:	75 d5                	jne    1010a6 <console_putc+0xa2>
        }
    } else {
        *cp->cursor++ = c | color;
    }
}
  1010d1:	eb 24                	jmp    1010f7 <console_putc+0xf3>
        *cp->cursor++ = c | color;
  1010d3:	0f b6 55 e4          	movzbl -0x1c(%rbp),%edx
  1010d7:	8b 45 e0             	mov    -0x20(%rbp),%eax
  1010da:	89 d6                	mov    %edx,%esi
  1010dc:	09 c6                	or     %eax,%esi
  1010de:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  1010e2:	48 8b 40 08          	mov    0x8(%rax),%rax
  1010e6:	48 8d 48 02          	lea    0x2(%rax),%rcx
  1010ea:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  1010ee:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  1010f2:	89 f2                	mov    %esi,%edx
  1010f4:	66 89 10             	mov    %dx,(%rax)
}
  1010f7:	90                   	nop
  1010f8:	c9                   	leave  
  1010f9:	c3                   	ret    

00000000001010fa <console_vprintf>:

int console_vprintf(int cpos, int color, const char* format, va_list val) {
  1010fa:	f3 0f 1e fa          	endbr64 
  1010fe:	55                   	push   %rbp
  1010ff:	48 89 e5             	mov    %rsp,%rbp
  101102:	48 83 ec 30          	sub    $0x30,%rsp
  101106:	89 7d ec             	mov    %edi,-0x14(%rbp)
  101109:	89 75 e8             	mov    %esi,-0x18(%rbp)
  10110c:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  101110:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    struct console_printer cp;
    cp.p.putc = console_putc;
  101114:	48 8d 05 e9 fe ff ff 	lea    -0x117(%rip),%rax        # 101004 <console_putc>
  10111b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (cpos < 0 || cpos >= CONSOLE_ROWS * CONSOLE_COLUMNS) {
  10111f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  101123:	78 09                	js     10112e <console_vprintf+0x34>
  101125:	81 7d ec cf 07 00 00 	cmpl   $0x7cf,-0x14(%rbp)
  10112c:	7e 07                	jle    101135 <console_vprintf+0x3b>
        cpos = 0;
  10112e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    }
    cp.cursor = console + cpos;
  101135:	8b 45 ec             	mov    -0x14(%rbp),%eax
  101138:	48 98                	cltq   
  10113a:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
  10113e:	48 8d 05 bb 6e fb ff 	lea    -0x49145(%rip),%rax        # b8000 <console>
  101145:	48 01 d0             	add    %rdx,%rax
  101148:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&cp.p, color, format, val);
  10114c:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  101150:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  101154:	8b 75 e8             	mov    -0x18(%rbp),%esi
  101157:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  10115b:	48 89 c7             	mov    %rax,%rdi
  10115e:	e8 9a f4 ff ff       	call   1005fd <printer_vprintf>
    return cp.cursor - console;
  101163:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  101167:	48 8d 15 92 6e fb ff 	lea    -0x4916e(%rip),%rdx        # b8000 <console>
  10116e:	48 29 d0             	sub    %rdx,%rax
  101171:	48 d1 f8             	sar    %rax
}
  101174:	c9                   	leave  
  101175:	c3                   	ret    

0000000000101176 <console_printf>:

int console_printf(int cpos, int color, const char* format, ...) {
  101176:	f3 0f 1e fa          	endbr64 
  10117a:	55                   	push   %rbp
  10117b:	48 89 e5             	mov    %rsp,%rbp
  10117e:	48 83 ec 60          	sub    $0x60,%rsp
  101182:	89 7d ac             	mov    %edi,-0x54(%rbp)
  101185:	89 75 a8             	mov    %esi,-0x58(%rbp)
  101188:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
  10118c:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  101190:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  101194:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  101198:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  10119f:	48 8d 45 10          	lea    0x10(%rbp),%rax
  1011a3:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  1011a7:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  1011ab:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
  1011af:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  1011b3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  1011b7:	8b 75 a8             	mov    -0x58(%rbp),%esi
  1011ba:	8b 45 ac             	mov    -0x54(%rbp),%eax
  1011bd:	89 c7                	mov    %eax,%edi
  1011bf:	e8 36 ff ff ff       	call   1010fa <console_vprintf>
  1011c4:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
  1011c7:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
  1011ca:	c9                   	leave  
  1011cb:	c3                   	ret    

00000000001011cc <string_putc>:
    printer p;
    char* s;
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
  1011cc:	f3 0f 1e fa          	endbr64 
  1011d0:	55                   	push   %rbp
  1011d1:	48 89 e5             	mov    %rsp,%rbp
  1011d4:	48 83 ec 20          	sub    $0x20,%rsp
  1011d8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  1011dc:	89 f0                	mov    %esi,%eax
  1011de:	89 55 e0             	mov    %edx,-0x20(%rbp)
  1011e1:	88 45 e4             	mov    %al,-0x1c(%rbp)
    string_printer* sp = (string_printer*) p;
  1011e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  1011e8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (sp->s < sp->end) {
  1011ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1011f0:	48 8b 50 08          	mov    0x8(%rax),%rdx
  1011f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1011f8:	48 8b 40 10          	mov    0x10(%rax),%rax
  1011fc:	48 39 c2             	cmp    %rax,%rdx
  1011ff:	73 1a                	jae    10121b <string_putc+0x4f>
        *sp->s++ = c;
  101201:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  101205:	48 8b 40 08          	mov    0x8(%rax),%rax
  101209:	48 8d 48 01          	lea    0x1(%rax),%rcx
  10120d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  101211:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  101215:	0f b6 55 e4          	movzbl -0x1c(%rbp),%edx
  101219:	88 10                	mov    %dl,(%rax)
    }
    (void) color;
}
  10121b:	90                   	nop
  10121c:	c9                   	leave  
  10121d:	c3                   	ret    

000000000010121e <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
  10121e:	f3 0f 1e fa          	endbr64 
  101222:	55                   	push   %rbp
  101223:	48 89 e5             	mov    %rsp,%rbp
  101226:	48 83 ec 40          	sub    $0x40,%rsp
  10122a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  10122e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  101232:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  101236:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    string_printer sp;
    sp.p.putc = string_putc;
  10123a:	48 8d 05 8b ff ff ff 	lea    -0x75(%rip),%rax        # 1011cc <string_putc>
  101241:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    sp.s = s;
  101245:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  101249:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (size) {
  10124d:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  101252:	74 33                	je     101287 <vsnprintf+0x69>
        sp.end = s + size - 1;
  101254:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  101258:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  10125c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  101260:	48 01 d0             	add    %rdx,%rax
  101263:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
  101267:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
  10126b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  10126f:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  101273:	be 00 00 00 00       	mov    $0x0,%esi
  101278:	48 89 c7             	mov    %rax,%rdi
  10127b:	e8 7d f3 ff ff       	call   1005fd <printer_vprintf>
        *sp.s = 0;
  101280:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  101284:	c6 00 00             	movb   $0x0,(%rax)
    }
    return sp.s - s;
  101287:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  10128b:	48 2b 45 d8          	sub    -0x28(%rbp),%rax
}
  10128f:	c9                   	leave  
  101290:	c3                   	ret    

0000000000101291 <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
  101291:	f3 0f 1e fa          	endbr64 
  101295:	55                   	push   %rbp
  101296:	48 89 e5             	mov    %rsp,%rbp
  101299:	48 83 ec 70          	sub    $0x70,%rsp
  10129d:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  1012a1:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  1012a5:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  1012a9:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  1012ad:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  1012b1:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  1012b5:	c7 45 b0 18 00 00 00 	movl   $0x18,-0x50(%rbp)
  1012bc:	48 8d 45 10          	lea    0x10(%rbp),%rax
  1012c0:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  1012c4:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  1012c8:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    int n = vsnprintf(s, size, format, val);
  1012cc:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
  1012d0:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
  1012d4:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  1012d8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  1012dc:	48 89 c7             	mov    %rax,%rdi
  1012df:	e8 3a ff ff ff       	call   10121e <vsnprintf>
  1012e4:	89 45 cc             	mov    %eax,-0x34(%rbp)
    va_end(val);
    return n;
  1012e7:	8b 45 cc             	mov    -0x34(%rbp),%eax
}
  1012ea:	c9                   	leave  
  1012eb:	c3                   	ret    

00000000001012ec <console_clear>:


// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
  1012ec:	f3 0f 1e fa          	endbr64 
  1012f0:	55                   	push   %rbp
  1012f1:	48 89 e5             	mov    %rsp,%rbp
  1012f4:	48 83 ec 10          	sub    $0x10,%rsp
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
  1012f8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  1012ff:	eb 1a                	jmp    10131b <console_clear+0x2f>
        console[i] = ' ' | 0x0700;
  101301:	8b 45 fc             	mov    -0x4(%rbp),%eax
  101304:	48 98                	cltq   
  101306:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
  10130a:	48 8d 05 ef 6c fb ff 	lea    -0x49311(%rip),%rax        # b8000 <console>
  101311:	66 c7 04 02 20 07    	movw   $0x720,(%rdx,%rax,1)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
  101317:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  10131b:	81 7d fc cf 07 00 00 	cmpl   $0x7cf,-0x4(%rbp)
  101322:	7e dd                	jle    101301 <console_clear+0x15>
    }
    cursorpos = 0;
  101324:	c7 05 ce 7c fb ff 00 	movl   $0x0,-0x48332(%rip)        # b8ffc <cursorpos>
  10132b:	00 00 00 
}
  10132e:	90                   	nop
  10132f:	c9                   	leave  
  101330:	c3                   	ret    
