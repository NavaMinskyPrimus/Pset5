
obj/p-test.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <process_main>:

// Parent: continuously forks/yields without exiting
// Child: continuously allocates in a row, then exits

void process_main(void)
{
  100000:	f3 0f 1e fa          	endbr64 
  100004:	55                   	push   %rbp
  100005:	48 89 e5             	mov    %rsp,%rbp
  100008:	41 54                	push   %r12
  10000a:	53                   	push   %rbx

// sys_getpid
//    Return current process ID.
static inline pid_t sys_getpid(void) {
    pid_t result;
    asm volatile ("int %1" : "=a" (result)
  10000b:	cd 31                	int    $0x31
  10000d:	41 89 c4             	mov    %eax,%r12d

    pid_t parent = sys_getpid();
    app_printf(parent, "Parent pid is %d\n", parent);
  100010:	89 c2                	mov    %eax,%edx
  100012:	48 8d 35 f7 13 00 00 	lea    0x13f7(%rip),%rsi        # 101410 <console_clear+0x52>
  100019:	89 c7                	mov    %eax,%edi
  10001b:	b8 00 00 00 00       	mov    $0x0,%eax
  100020:	e8 3a 01 00 00       	call   10015f <app_printf>
// sys_fork()
//    Fork the current process. On success, return the child's process ID to
//    the parent, and return 0 to the child. On failure, return -1.
static inline pid_t sys_fork(void) {
    pid_t result;
    asm volatile ("int %1" : "=a" (result)
  100025:	cd 34                	int    $0x34
    pid_t fork = sys_fork();
    assert(fork >= 0);
  100027:	85 c0                	test   %eax,%eax
  100029:	78 46                	js     100071 <process_main+0x71>
  10002b:	89 c3                	mov    %eax,%ebx

    srand(parent);
  10002d:	44 89 e7             	mov    %r12d,%edi
  100030:	e8 e9 05 00 00       	call   10061e <srand>
    if (fork != 0)
  100035:	85 db                	test   %ebx,%ebx
  100037:	75 50                	jne    100089 <process_main+0x89>
    asm volatile ("int %1" : "=a" (result)
  100039:	cd 31                	int    $0x31
  10003b:	89 c3                	mov    %eax,%ebx
    }
    else
    {
    child:;
        pid_t p = sys_getpid();
        srand(p);
  10003d:	89 c7                	mov    %eax,%edi
  10003f:	e8 da 05 00 00       	call   10061e <srand>

        // The heap starts on the page right after the 'end' symbol,
        // whose address is the first address not allocated to process code
        // or data.
        heap_top = ROUNDUP((uint8_t *)end, PAGESIZE);
  100044:	48 8d 05 cc 2f 00 00 	lea    0x2fcc(%rip),%rax        # 103017 <end+0xfff>
  10004b:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  100051:	48 89 05 b0 1f 00 00 	mov    %rax,0x1fb0(%rip)        # 102008 <heap_top>
    return rbp;
}

static inline uintptr_t read_rsp(void) {
    uintptr_t rsp;
    asm volatile("movq %%rsp,%0" : "=r" (rsp));
  100058:	48 89 e0             	mov    %rsp,%rax

        // The bottom of the stack is the first address on the current
        // stack page (this process never needs more than one stack page).
        stack_bottom = ROUNDDOWN((uint8_t *)read_rsp() - 1, PAGESIZE);
  10005b:	48 83 e8 01          	sub    $0x1,%rax
  10005f:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  100065:	48 89 05 94 1f 00 00 	mov    %rax,0x1f94(%rip)        # 102000 <stack_bottom>
  10006c:	e9 98 00 00 00       	jmp    100109 <process_main+0x109>
    assert(fork >= 0);
  100071:	48 8d 15 aa 13 00 00 	lea    0x13aa(%rip),%rdx        # 101422 <console_clear+0x64>
  100078:	be 14 00 00 00       	mov    $0x14,%esi
  10007d:	48 8d 3d a8 13 00 00 	lea    0x13a8(%rip),%rdi        # 10142c <console_clear+0x6e>
  100084:	e8 45 02 00 00       	call   1002ce <assert_fail>
        app_printf(parent, "%dp\n", parent);
  100089:	44 89 e2             	mov    %r12d,%edx
  10008c:	48 8d 35 a9 13 00 00 	lea    0x13a9(%rip),%rsi        # 10143c <console_clear+0x7e>
  100093:	44 89 e7             	mov    %r12d,%edi
  100096:	b8 00 00 00 00       	mov    $0x0,%eax
  10009b:	e8 bf 00 00 00       	call   10015f <app_printf>
  1000a0:	eb 08                	jmp    1000aa <process_main+0xaa>
    asm volatile ("int %1" : "=a" (result)
  1000a2:	cd 34                	int    $0x34
                if (fork_new == 0)
  1000a4:	85 c0                	test   %eax,%eax
  1000a6:	74 91                	je     100039 <process_main+0x39>
    asm volatile ("int %0" : /* no result */
  1000a8:	cd 32                	int    $0x32
            if (rand() % ALLOC_SLOWDOWN == parent)
  1000aa:	e8 2f 05 00 00       	call   1005de <rand>
  1000af:	48 63 d0             	movslq %eax,%rdx
  1000b2:	48 69 d2 1f 85 eb 51 	imul   $0x51eb851f,%rdx,%rdx
  1000b9:	48 c1 fa 25          	sar    $0x25,%rdx
  1000bd:	89 c1                	mov    %eax,%ecx
  1000bf:	c1 f9 1f             	sar    $0x1f,%ecx
  1000c2:	29 ca                	sub    %ecx,%edx
  1000c4:	6b d2 64             	imul   $0x64,%edx,%edx
  1000c7:	29 d0                	sub    %edx,%eax
  1000c9:	44 39 e0             	cmp    %r12d,%eax
  1000cc:	74 d4                	je     1000a2 <process_main+0xa2>
  1000ce:	cd 32                	int    $0x32
}
  1000d0:	eb d8                	jmp    1000aa <process_main+0xaa>
        // or (2) allocation fails (out of physical memory).
        while (1)
        {
            if ((rand() % ALLOC_SLOWDOWN) < p)
            {
                assert(sys_getpid() != parent);
  1000d2:	48 8d 15 68 13 00 00 	lea    0x1368(%rip),%rdx        # 101441 <console_clear+0x83>
  1000d9:	be 41 00 00 00       	mov    $0x41,%esi
  1000de:	48 8d 3d 47 13 00 00 	lea    0x1347(%rip),%rdi        # 10142c <console_clear+0x6e>
  1000e5:	e8 e4 01 00 00       	call   1002ce <assert_fail>
{
  1000ea:	b8 0a 00 00 00       	mov    $0xa,%eax
    asm volatile ("int %0" : /* no result */
  1000ef:	cd 32                	int    $0x32
            sys_yield();
        }

        // After running out of memory, make an exit after 10 yields
        int i = 10;
        while (i--)
  1000f1:	83 e8 01             	sub    $0x1,%eax
  1000f4:	75 f9                	jne    1000ef <process_main+0xef>
        {
            sys_yield();
        }
        TEST_PASS();
  1000f6:	48 8d 3d 5b 13 00 00 	lea    0x135b(%rip),%rdi        # 101458 <console_clear+0x9a>
  1000fd:	b8 00 00 00 00       	mov    $0x0,%eax
  100102:	e8 f0 00 00 00       	call   1001f7 <panic>
  100107:	cd 32                	int    $0x32
            if ((rand() % ALLOC_SLOWDOWN) < p)
  100109:	e8 d0 04 00 00       	call   1005de <rand>
  10010e:	48 63 d0             	movslq %eax,%rdx
  100111:	48 69 d2 1f 85 eb 51 	imul   $0x51eb851f,%rdx,%rdx
  100118:	48 c1 fa 25          	sar    $0x25,%rdx
  10011c:	89 c1                	mov    %eax,%ecx
  10011e:	c1 f9 1f             	sar    $0x1f,%ecx
  100121:	29 ca                	sub    %ecx,%edx
  100123:	6b d2 64             	imul   $0x64,%edx,%edx
  100126:	29 d0                	sub    %edx,%eax
  100128:	39 d8                	cmp    %ebx,%eax
  10012a:	7d db                	jge    100107 <process_main+0x107>
    asm volatile ("int %1" : "=a" (result)
  10012c:	cd 31                	int    $0x31
                assert(sys_getpid() != parent);
  10012e:	41 39 c4             	cmp    %eax,%r12d
  100131:	74 9f                	je     1000d2 <process_main+0xd2>
                if (heap_top == stack_bottom || sys_page_alloc(heap_top) < 0)
  100133:	48 8b 3d ce 1e 00 00 	mov    0x1ece(%rip),%rdi        # 102008 <heap_top>
  10013a:	48 3b 3d bf 1e 00 00 	cmp    0x1ebf(%rip),%rdi        # 102000 <stack_bottom>
  100141:	74 a7                	je     1000ea <process_main+0xea>
    asm volatile ("int %1" : "=a" (result)
  100143:	cd 33                	int    $0x33
  100145:	85 c0                	test   %eax,%eax
  100147:	78 a1                	js     1000ea <process_main+0xea>
                *heap_top = p; /* check we have write access to new page */
  100149:	48 8b 05 b8 1e 00 00 	mov    0x1eb8(%rip),%rax        # 102008 <heap_top>
  100150:	88 18                	mov    %bl,(%rax)
                heap_top += PAGESIZE;
  100152:	48 81 05 ab 1e 00 00 	addq   $0x1000,0x1eab(%rip)        # 102008 <heap_top>
  100159:	00 10 00 00 
  10015d:	eb a8                	jmp    100107 <process_main+0x107>

000000000010015f <app_printf>:
#include "process.h"

// app_printf
//     A version of console_printf that picks a sensible color by process ID.

void app_printf(int colorid, const char* format, ...) {
  10015f:	f3 0f 1e fa          	endbr64 
  100163:	55                   	push   %rbp
  100164:	48 89 e5             	mov    %rsp,%rbp
  100167:	48 83 ec 50          	sub    $0x50,%rsp
  10016b:	49 89 f2             	mov    %rsi,%r10
  10016e:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  100172:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100176:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  10017a:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    int color;
    if (colorid < 0) {
        color = 0x0700;
  10017e:	be 00 07 00 00       	mov    $0x700,%esi
    if (colorid < 0) {
  100183:	85 ff                	test   %edi,%edi
  100185:	78 32                	js     1001b9 <app_printf+0x5a>
    } else {
        static const uint8_t col[] = { 0x0E, 0x0F, 0x0C, 0x0A, 0x09 };
        color = col[colorid % sizeof(col)] << 8;
  100187:	48 63 ff             	movslq %edi,%rdi
  10018a:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
  100191:	cc cc cc 
  100194:	48 89 f8             	mov    %rdi,%rax
  100197:	48 f7 e2             	mul    %rdx
  10019a:	48 89 d0             	mov    %rdx,%rax
  10019d:	48 c1 e8 02          	shr    $0x2,%rax
  1001a1:	48 83 e2 fc          	and    $0xfffffffffffffffc,%rdx
  1001a5:	48 01 c2             	add    %rax,%rdx
  1001a8:	48 29 d7             	sub    %rdx,%rdi
  1001ab:	48 8d 05 f3 12 00 00 	lea    0x12f3(%rip),%rax        # 1014a5 <col.0>
  1001b2:	0f b6 34 38          	movzbl (%rax,%rdi,1),%esi
  1001b6:	c1 e6 08             	shl    $0x8,%esi
    }

    va_list val;
    va_start(val, format);
  1001b9:	c7 45 b8 10 00 00 00 	movl   $0x10,-0x48(%rbp)
  1001c0:	48 8d 45 10          	lea    0x10(%rbp),%rax
  1001c4:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  1001c8:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  1001cc:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cursorpos = console_vprintf(cursorpos, color, format, val);
  1001d0:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  1001d4:	4c 89 d2             	mov    %r10,%rdx
  1001d7:	8b 3d 1f 8e fb ff    	mov    -0x471e1(%rip),%edi        # b8ffc <cursorpos>
  1001dd:	e8 ea 0f 00 00       	call   1011cc <console_vprintf>
    va_end(val);

    if (CROW(cursorpos) >= 23) {
        cursorpos = CPOS(0, 0);
  1001e2:	3d 30 07 00 00       	cmp    $0x730,%eax
  1001e7:	ba 00 00 00 00       	mov    $0x0,%edx
  1001ec:	0f 4d c2             	cmovge %edx,%eax
  1001ef:	89 05 07 8e fb ff    	mov    %eax,-0x471f9(%rip)        # b8ffc <cursorpos>
    }
}
  1001f5:	c9                   	leave  
  1001f6:	c3                   	ret    

00000000001001f7 <panic>:


// panic, assert_fail
//     Call the INT_SYS_PANIC system call so the kernel loops until Control-C.

void panic(const char* format, ...) {
  1001f7:	f3 0f 1e fa          	endbr64 
  1001fb:	55                   	push   %rbp
  1001fc:	48 89 e5             	mov    %rsp,%rbp
  1001ff:	53                   	push   %rbx
  100200:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  100207:	48 89 fb             	mov    %rdi,%rbx
  10020a:	48 89 75 c8          	mov    %rsi,-0x38(%rbp)
  10020e:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  100212:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
  100216:	4c 89 45 e0          	mov    %r8,-0x20(%rbp)
  10021a:	4c 89 4d e8          	mov    %r9,-0x18(%rbp)
    va_list val;
    va_start(val, format);
  10021e:	c7 45 a8 08 00 00 00 	movl   $0x8,-0x58(%rbp)
  100225:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100229:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  10022d:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  100231:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    char buf[160];
    memcpy(buf, "PANIC: ", 7);
  100235:	48 8d bd 08 ff ff ff 	lea    -0xf8(%rbp),%rdi
  10023c:	ba 07 00 00 00       	mov    $0x7,%edx
  100241:	48 8d 35 2b 12 00 00 	lea    0x122b(%rip),%rsi        # 101473 <console_clear+0xb5>
  100248:	e8 b6 00 00 00       	call   100303 <memcpy>
    int len = vsnprintf(&buf[7], sizeof(buf) - 7, format, val) + 7;
  10024d:	48 8d 4d a8          	lea    -0x58(%rbp),%rcx
  100251:	48 8d bd 0f ff ff ff 	lea    -0xf1(%rbp),%rdi
  100258:	48 89 da             	mov    %rbx,%rdx
  10025b:	be 99 00 00 00       	mov    $0x99,%esi
  100260:	e8 8b 10 00 00       	call   1012f0 <vsnprintf>
  100265:	8d 50 07             	lea    0x7(%rax),%edx
    va_end(val);
    if (len > 0 && buf[len - 1] != '\n') {
  100268:	85 d2                	test   %edx,%edx
  10026a:	7e 0f                	jle    10027b <panic+0x84>
  10026c:	83 c0 06             	add    $0x6,%eax
  10026f:	48 98                	cltq   
  100271:	80 bc 05 08 ff ff ff 	cmpb   $0xa,-0xf8(%rbp,%rax,1)
  100278:	0a 
  100279:	75 2b                	jne    1002a6 <panic+0xaf>
        strcpy(buf + len - (len == (int) sizeof(buf) - 1), "\n");
    }
    (void) console_printf(CPOS(23, 0), 0xC000, "%s", buf);
  10027b:	48 8d 8d 08 ff ff ff 	lea    -0xf8(%rbp),%rcx
  100282:	48 8d 15 f2 11 00 00 	lea    0x11f2(%rip),%rdx        # 10147b <console_clear+0xbd>
  100289:	be 00 c0 00 00       	mov    $0xc000,%esi
  10028e:	bf 30 07 00 00       	mov    $0x730,%edi
  100293:	b8 00 00 00 00       	mov    $0x0,%eax
  100298:	e8 ab 0f 00 00       	call   101248 <console_printf>
}

// sys_panic(msg)
//    Panic.
static inline pid_t __attribute__((noreturn)) sys_panic(const char* msg) {
    asm volatile ("int %0" : /* no result */
  10029d:	bf 00 00 00 00       	mov    $0x0,%edi
  1002a2:	cd 30                	int    $0x30
                  : "i" (INT_SYS_PANIC), "D" (msg)
                  : "cc", "memory");
 loop: goto loop;
  1002a4:	eb fe                	jmp    1002a4 <panic+0xad>
        strcpy(buf + len - (len == (int) sizeof(buf) - 1), "\n");
  1002a6:	48 63 c2             	movslq %edx,%rax
  1002a9:	81 fa 9f 00 00 00    	cmp    $0x9f,%edx
  1002af:	0f 94 c2             	sete   %dl
  1002b2:	0f b6 d2             	movzbl %dl,%edx
  1002b5:	48 29 d0             	sub    %rdx,%rax
  1002b8:	48 8d bc 05 08 ff ff 	lea    -0xf8(%rbp,%rax,1),%rdi
  1002bf:	ff 
  1002c0:	48 8d 35 59 11 00 00 	lea    0x1159(%rip),%rsi        # 101420 <console_clear+0x62>
  1002c7:	e8 f8 01 00 00       	call   1004c4 <strcpy>
  1002cc:	eb ad                	jmp    10027b <panic+0x84>

00000000001002ce <assert_fail>:
    sys_panic(NULL);
 spinloop: goto spinloop;       // should never get here
}

void assert_fail(const char* file, int line, const char* msg) {
  1002ce:	f3 0f 1e fa          	endbr64 
  1002d2:	55                   	push   %rbp
  1002d3:	48 89 e5             	mov    %rsp,%rbp
  1002d6:	48 89 f9             	mov    %rdi,%rcx
  1002d9:	41 89 f0             	mov    %esi,%r8d
  1002dc:	49 89 d1             	mov    %rdx,%r9
    (void) console_printf(CPOS(23, 0), 0xC000,
  1002df:	48 8d 15 9a 11 00 00 	lea    0x119a(%rip),%rdx        # 101480 <console_clear+0xc2>
  1002e6:	be 00 c0 00 00       	mov    $0xc000,%esi
  1002eb:	bf 30 07 00 00       	mov    $0x730,%edi
  1002f0:	b8 00 00 00 00       	mov    $0x0,%eax
  1002f5:	e8 4e 0f 00 00       	call   101248 <console_printf>
    asm volatile ("int %0" : /* no result */
  1002fa:	bf 00 00 00 00       	mov    $0x0,%edi
  1002ff:	cd 30                	int    $0x30
 loop: goto loop;
  100301:	eb fe                	jmp    100301 <assert_fail+0x33>

0000000000100303 <memcpy>:


// memcpy, memmove, memset, strcmp, strlen, strnlen
//    We must provide our own implementations.

void* memcpy(void* dst, const void* src, size_t n) {
  100303:	f3 0f 1e fa          	endbr64 
  100307:	55                   	push   %rbp
  100308:	48 89 e5             	mov    %rsp,%rbp
  10030b:	48 83 ec 28          	sub    $0x28,%rsp
  10030f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  100313:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  100317:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    const char* s = (const char*) src;
  10031b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  10031f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
  100323:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100327:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  10032b:	eb 1c                	jmp    100349 <memcpy+0x46>
        *d = *s;
  10032d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  100331:	0f b6 10             	movzbl (%rax),%edx
  100334:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  100338:	88 10                	mov    %dl,(%rax)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
  10033a:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  10033f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  100344:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  100349:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  10034e:	75 dd                	jne    10032d <memcpy+0x2a>
    }
    return dst;
  100350:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
  100354:	c9                   	leave  
  100355:	c3                   	ret    

0000000000100356 <memmove>:

void* memmove(void* dst, const void* src, size_t n) {
  100356:	f3 0f 1e fa          	endbr64 
  10035a:	55                   	push   %rbp
  10035b:	48 89 e5             	mov    %rsp,%rbp
  10035e:	48 83 ec 28          	sub    $0x28,%rsp
  100362:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  100366:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  10036a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    const char* s = (const char*) src;
  10036e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  100372:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    char* d = (char*) dst;
  100376:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  10037a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (s < d && s + n > d) {
  10037e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  100382:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  100386:	73 6a                	jae    1003f2 <memmove+0x9c>
  100388:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  10038c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  100390:	48 01 d0             	add    %rdx,%rax
  100393:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
  100397:	73 59                	jae    1003f2 <memmove+0x9c>
        s += n, d += n;
  100399:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  10039d:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  1003a1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  1003a5:	48 01 45 f0          	add    %rax,-0x10(%rbp)
        while (n-- > 0) {
  1003a9:	eb 17                	jmp    1003c2 <memmove+0x6c>
            *--d = *--s;
  1003ab:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
  1003b0:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
  1003b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1003b9:	0f b6 10             	movzbl (%rax),%edx
  1003bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  1003c0:	88 10                	mov    %dl,(%rax)
        while (n-- > 0) {
  1003c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  1003c6:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  1003ca:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  1003ce:	48 85 c0             	test   %rax,%rax
  1003d1:	75 d8                	jne    1003ab <memmove+0x55>
    if (s < d && s + n > d) {
  1003d3:	eb 2e                	jmp    100403 <memmove+0xad>
        }
    } else {
        while (n-- > 0) {
            *d++ = *s++;
  1003d5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  1003d9:	48 8d 42 01          	lea    0x1(%rdx),%rax
  1003dd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  1003e1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  1003e5:	48 8d 48 01          	lea    0x1(%rax),%rcx
  1003e9:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
  1003ed:	0f b6 12             	movzbl (%rdx),%edx
  1003f0:	88 10                	mov    %dl,(%rax)
        while (n-- > 0) {
  1003f2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  1003f6:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  1003fa:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  1003fe:	48 85 c0             	test   %rax,%rax
  100401:	75 d2                	jne    1003d5 <memmove+0x7f>
        }
    }
    return dst;
  100403:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
  100407:	c9                   	leave  
  100408:	c3                   	ret    

0000000000100409 <memset>:

void* memset(void* v, int c, size_t n) {
  100409:	f3 0f 1e fa          	endbr64 
  10040d:	55                   	push   %rbp
  10040e:	48 89 e5             	mov    %rsp,%rbp
  100411:	48 83 ec 28          	sub    $0x28,%rsp
  100415:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  100419:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  10041c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    for (char* p = (char*) v; n > 0; ++p, --n) {
  100420:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100424:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  100428:	eb 15                	jmp    10043f <memset+0x36>
        *p = c;
  10042a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  10042d:	89 c2                	mov    %eax,%edx
  10042f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  100433:	88 10                	mov    %dl,(%rax)
    for (char* p = (char*) v; n > 0; ++p, --n) {
  100435:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  10043a:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  10043f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  100444:	75 e4                	jne    10042a <memset+0x21>
    }
    return v;
  100446:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
  10044a:	c9                   	leave  
  10044b:	c3                   	ret    

000000000010044c <strlen>:

size_t strlen(const char* s) {
  10044c:	f3 0f 1e fa          	endbr64 
  100450:	55                   	push   %rbp
  100451:	48 89 e5             	mov    %rsp,%rbp
  100454:	48 83 ec 18          	sub    $0x18,%rsp
  100458:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
  10045c:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  100463:	00 
  100464:	eb 0a                	jmp    100470 <strlen+0x24>
        ++n;
  100466:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    for (n = 0; *s != '\0'; ++s) {
  10046b:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  100470:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100474:	0f b6 00             	movzbl (%rax),%eax
  100477:	84 c0                	test   %al,%al
  100479:	75 eb                	jne    100466 <strlen+0x1a>
    }
    return n;
  10047b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
  10047f:	c9                   	leave  
  100480:	c3                   	ret    

0000000000100481 <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
  100481:	f3 0f 1e fa          	endbr64 
  100485:	55                   	push   %rbp
  100486:	48 89 e5             	mov    %rsp,%rbp
  100489:	48 83 ec 20          	sub    $0x20,%rsp
  10048d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  100491:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  100495:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  10049c:	00 
  10049d:	eb 0a                	jmp    1004a9 <strnlen+0x28>
        ++n;
  10049f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1004a4:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  1004a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1004ad:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
  1004b1:	74 0b                	je     1004be <strnlen+0x3d>
  1004b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  1004b7:	0f b6 00             	movzbl (%rax),%eax
  1004ba:	84 c0                	test   %al,%al
  1004bc:	75 e1                	jne    10049f <strnlen+0x1e>
    }
    return n;
  1004be:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
  1004c2:	c9                   	leave  
  1004c3:	c3                   	ret    

00000000001004c4 <strcpy>:

char* strcpy(char* dst, const char* src) {
  1004c4:	f3 0f 1e fa          	endbr64 
  1004c8:	55                   	push   %rbp
  1004c9:	48 89 e5             	mov    %rsp,%rbp
  1004cc:	48 83 ec 20          	sub    $0x20,%rsp
  1004d0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  1004d4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    char* d = dst;
  1004d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  1004dc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    do {
        *d++ = *src++;
  1004e0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  1004e4:	48 8d 42 01          	lea    0x1(%rdx),%rax
  1004e8:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  1004ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1004f0:	48 8d 48 01          	lea    0x1(%rax),%rcx
  1004f4:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
  1004f8:	0f b6 12             	movzbl (%rdx),%edx
  1004fb:	88 10                	mov    %dl,(%rax)
    } while (d[-1]);
  1004fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  100501:	48 83 e8 01          	sub    $0x1,%rax
  100505:	0f b6 00             	movzbl (%rax),%eax
  100508:	84 c0                	test   %al,%al
  10050a:	75 d4                	jne    1004e0 <strcpy+0x1c>
    return dst;
  10050c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
  100510:	c9                   	leave  
  100511:	c3                   	ret    

0000000000100512 <strcmp>:

int strcmp(const char* a, const char* b) {
  100512:	f3 0f 1e fa          	endbr64 
  100516:	55                   	push   %rbp
  100517:	48 89 e5             	mov    %rsp,%rbp
  10051a:	48 83 ec 10          	sub    $0x10,%rsp
  10051e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  100522:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    while (*a && *b && *a == *b) {
  100526:	eb 0a                	jmp    100532 <strcmp+0x20>
        ++a, ++b;
  100528:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  10052d:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    while (*a && *b && *a == *b) {
  100532:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  100536:	0f b6 00             	movzbl (%rax),%eax
  100539:	84 c0                	test   %al,%al
  10053b:	74 1d                	je     10055a <strcmp+0x48>
  10053d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  100541:	0f b6 00             	movzbl (%rax),%eax
  100544:	84 c0                	test   %al,%al
  100546:	74 12                	je     10055a <strcmp+0x48>
  100548:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  10054c:	0f b6 10             	movzbl (%rax),%edx
  10054f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  100553:	0f b6 00             	movzbl (%rax),%eax
  100556:	38 c2                	cmp    %al,%dl
  100558:	74 ce                	je     100528 <strcmp+0x16>
    }
    return ((unsigned char) *a > (unsigned char) *b)
  10055a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  10055e:	0f b6 00             	movzbl (%rax),%eax
  100561:	89 c2                	mov    %eax,%edx
  100563:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  100567:	0f b6 00             	movzbl (%rax),%eax
  10056a:	38 c2                	cmp    %al,%dl
  10056c:	0f 97 c0             	seta   %al
  10056f:	0f b6 d0             	movzbl %al,%edx
        - ((unsigned char) *a < (unsigned char) *b);
  100572:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  100576:	0f b6 00             	movzbl (%rax),%eax
  100579:	89 c1                	mov    %eax,%ecx
  10057b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  10057f:	0f b6 00             	movzbl (%rax),%eax
  100582:	38 c1                	cmp    %al,%cl
  100584:	0f 92 c0             	setb   %al
  100587:	0f b6 c8             	movzbl %al,%ecx
  10058a:	89 d0                	mov    %edx,%eax
  10058c:	29 c8                	sub    %ecx,%eax
}
  10058e:	c9                   	leave  
  10058f:	c3                   	ret    

0000000000100590 <strchr>:

char* strchr(const char* s, int c) {
  100590:	f3 0f 1e fa          	endbr64 
  100594:	55                   	push   %rbp
  100595:	48 89 e5             	mov    %rsp,%rbp
  100598:	48 83 ec 10          	sub    $0x10,%rsp
  10059c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  1005a0:	89 75 f4             	mov    %esi,-0xc(%rbp)
    while (*s && *s != (char) c) {
  1005a3:	eb 05                	jmp    1005aa <strchr+0x1a>
        ++s;
  1005a5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    while (*s && *s != (char) c) {
  1005aa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1005ae:	0f b6 00             	movzbl (%rax),%eax
  1005b1:	84 c0                	test   %al,%al
  1005b3:	74 0e                	je     1005c3 <strchr+0x33>
  1005b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1005b9:	0f b6 00             	movzbl (%rax),%eax
  1005bc:	8b 55 f4             	mov    -0xc(%rbp),%edx
  1005bf:	38 d0                	cmp    %dl,%al
  1005c1:	75 e2                	jne    1005a5 <strchr+0x15>
    }
    if (*s == (char) c) {
  1005c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1005c7:	0f b6 00             	movzbl (%rax),%eax
  1005ca:	8b 55 f4             	mov    -0xc(%rbp),%edx
  1005cd:	38 d0                	cmp    %dl,%al
  1005cf:	75 06                	jne    1005d7 <strchr+0x47>
        return (char*) s;
  1005d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1005d5:	eb 05                	jmp    1005dc <strchr+0x4c>
    } else {
        return NULL;
  1005d7:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
  1005dc:	c9                   	leave  
  1005dd:	c3                   	ret    

00000000001005de <rand>:
// rand, srand

static int rand_seed_set;
static unsigned rand_seed;

int rand(void) {
  1005de:	f3 0f 1e fa          	endbr64 
  1005e2:	55                   	push   %rbp
  1005e3:	48 89 e5             	mov    %rsp,%rbp
    if (!rand_seed_set) {
  1005e6:	8b 05 24 1a 00 00    	mov    0x1a24(%rip),%eax        # 102010 <rand_seed_set>
  1005ec:	85 c0                	test   %eax,%eax
  1005ee:	75 0a                	jne    1005fa <rand+0x1c>
        srand(819234718U);
  1005f0:	bf 9e 87 d4 30       	mov    $0x30d4879e,%edi
  1005f5:	e8 24 00 00 00       	call   10061e <srand>
    }
    rand_seed = rand_seed * 1664525U + 1013904223U;
  1005fa:	8b 05 14 1a 00 00    	mov    0x1a14(%rip),%eax        # 102014 <rand_seed>
  100600:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
  100606:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
  10060b:	89 05 03 1a 00 00    	mov    %eax,0x1a03(%rip)        # 102014 <rand_seed>
    return rand_seed & RAND_MAX;
  100611:	8b 05 fd 19 00 00    	mov    0x19fd(%rip),%eax        # 102014 <rand_seed>
  100617:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  10061c:	5d                   	pop    %rbp
  10061d:	c3                   	ret    

000000000010061e <srand>:

void srand(unsigned seed) {
  10061e:	f3 0f 1e fa          	endbr64 
  100622:	55                   	push   %rbp
  100623:	48 89 e5             	mov    %rsp,%rbp
  100626:	48 83 ec 08          	sub    $0x8,%rsp
  10062a:	89 7d fc             	mov    %edi,-0x4(%rbp)
    rand_seed = seed;
  10062d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  100630:	89 05 de 19 00 00    	mov    %eax,0x19de(%rip)        # 102014 <rand_seed>
    rand_seed_set = 1;
  100636:	c7 05 d0 19 00 00 01 	movl   $0x1,0x19d0(%rip)        # 102010 <rand_seed_set>
  10063d:	00 00 00 
}
  100640:	90                   	nop
  100641:	c9                   	leave  
  100642:	c3                   	ret    

0000000000100643 <fill_numbuf>:
//    Print a message onto the console, starting at the given cursor position.

// snprintf, vsnprintf
//    Format a string into a buffer.

static char* fill_numbuf(char* numbuf_end, unsigned long val, int base) {
  100643:	f3 0f 1e fa          	endbr64 
  100647:	55                   	push   %rbp
  100648:	48 89 e5             	mov    %rsp,%rbp
  10064b:	48 83 ec 28          	sub    $0x28,%rsp
  10064f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  100653:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  100657:	89 55 dc             	mov    %edx,-0x24(%rbp)
    static const char upper_digits[] = "0123456789ABCDEF";
    static const char lower_digits[] = "0123456789abcdef";

    const char* digits = upper_digits;
  10065a:	48 8d 05 4f 0f 00 00 	lea    0xf4f(%rip),%rax        # 1015b0 <upper_digits.1>
  100661:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (base < 0) {
  100665:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  100669:	79 0e                	jns    100679 <fill_numbuf+0x36>
        digits = lower_digits;
  10066b:	48 8d 05 5e 0f 00 00 	lea    0xf5e(%rip),%rax        # 1015d0 <lower_digits.0>
  100672:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        base = -base;
  100676:	f7 5d dc             	negl   -0x24(%rbp)
    }

    *--numbuf_end = '\0';
  100679:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  10067e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100682:	c6 00 00             	movb   $0x0,(%rax)
    do {
        *--numbuf_end = digits[val % base];
  100685:	8b 45 dc             	mov    -0x24(%rbp),%eax
  100688:	48 63 c8             	movslq %eax,%rcx
  10068b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  10068f:	ba 00 00 00 00       	mov    $0x0,%edx
  100694:	48 f7 f1             	div    %rcx
  100697:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  10069b:	48 01 d0             	add    %rdx,%rax
  10069e:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  1006a3:	0f b6 10             	movzbl (%rax),%edx
  1006a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  1006aa:	88 10                	mov    %dl,(%rax)
        val /= base;
  1006ac:	8b 45 dc             	mov    -0x24(%rbp),%eax
  1006af:	48 63 f0             	movslq %eax,%rsi
  1006b2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  1006b6:	ba 00 00 00 00       	mov    $0x0,%edx
  1006bb:	48 f7 f6             	div    %rsi
  1006be:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    } while (val != 0);
  1006c2:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  1006c7:	75 bc                	jne    100685 <fill_numbuf+0x42>
    return numbuf_end;
  1006c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
  1006cd:	c9                   	leave  
  1006ce:	c3                   	ret    

00000000001006cf <printer_vprintf>:
#define FLAG_NUMERIC            (1<<5)
#define FLAG_SIGNED             (1<<6)
#define FLAG_NEGATIVE           (1<<7)
#define FLAG_ALT2               (1<<8)

void printer_vprintf(printer* p, int color, const char* format, va_list val) {
  1006cf:	f3 0f 1e fa          	endbr64 
  1006d3:	55                   	push   %rbp
  1006d4:	48 89 e5             	mov    %rsp,%rbp
  1006d7:	53                   	push   %rbx
  1006d8:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
  1006df:	48 89 bd 78 ff ff ff 	mov    %rdi,-0x88(%rbp)
  1006e6:	89 b5 74 ff ff ff    	mov    %esi,-0x8c(%rbp)
  1006ec:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
  1006f3:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
#define NUMBUFSIZ 24
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
  1006fa:	e9 bd 09 00 00       	jmp    1010bc <printer_vprintf+0x9ed>
        if (*format != '%') {
  1006ff:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  100706:	0f b6 00             	movzbl (%rax),%eax
  100709:	3c 25                	cmp    $0x25,%al
  10070b:	74 31                	je     10073e <printer_vprintf+0x6f>
            p->putc(p, *format, color);
  10070d:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  100714:	4c 8b 00             	mov    (%rax),%r8
  100717:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  10071e:	0f b6 00             	movzbl (%rax),%eax
  100721:	0f b6 c8             	movzbl %al,%ecx
  100724:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  10072a:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  100731:	89 ce                	mov    %ecx,%esi
  100733:	48 89 c7             	mov    %rax,%rdi
  100736:	41 ff d0             	call   *%r8
            continue;
  100739:	e9 76 09 00 00       	jmp    1010b4 <printer_vprintf+0x9e5>
        }

        // process flags
        int flags = 0;
  10073e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
        for (++format; *format; ++format) {
  100745:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
  10074c:	01 
  10074d:	eb 4d                	jmp    10079c <printer_vprintf+0xcd>
            const char* flagc = strchr(flag_chars, *format);
  10074f:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  100756:	0f b6 00             	movzbl (%rax),%eax
  100759:	0f be c0             	movsbl %al,%eax
  10075c:	89 c6                	mov    %eax,%esi
  10075e:	48 8d 05 4b 0d 00 00 	lea    0xd4b(%rip),%rax        # 1014b0 <flag_chars>
  100765:	48 89 c7             	mov    %rax,%rdi
  100768:	e8 23 fe ff ff       	call   100590 <strchr>
  10076d:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
            if (flagc) {
  100771:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
  100776:	74 34                	je     1007ac <printer_vprintf+0xdd>
                flags |= 1 << (flagc - flag_chars);
  100778:	48 8d 15 31 0d 00 00 	lea    0xd31(%rip),%rdx        # 1014b0 <flag_chars>
  10077f:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  100783:	48 29 d0             	sub    %rdx,%rax
  100786:	ba 01 00 00 00       	mov    $0x1,%edx
  10078b:	89 c1                	mov    %eax,%ecx
  10078d:	d3 e2                	shl    %cl,%edx
  10078f:	89 d0                	mov    %edx,%eax
  100791:	09 45 ec             	or     %eax,-0x14(%rbp)
        for (++format; *format; ++format) {
  100794:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
  10079b:	01 
  10079c:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  1007a3:	0f b6 00             	movzbl (%rax),%eax
  1007a6:	84 c0                	test   %al,%al
  1007a8:	75 a5                	jne    10074f <printer_vprintf+0x80>
  1007aa:	eb 01                	jmp    1007ad <printer_vprintf+0xde>
            } else {
                break;
  1007ac:	90                   	nop
            }
        }

        // process width
        int width = -1;
  1007ad:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%rbp)
        if (*format >= '1' && *format <= '9') {
  1007b4:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  1007bb:	0f b6 00             	movzbl (%rax),%eax
  1007be:	3c 30                	cmp    $0x30,%al
  1007c0:	7e 67                	jle    100829 <printer_vprintf+0x15a>
  1007c2:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  1007c9:	0f b6 00             	movzbl (%rax),%eax
  1007cc:	3c 39                	cmp    $0x39,%al
  1007ce:	7f 59                	jg     100829 <printer_vprintf+0x15a>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1007d0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
  1007d7:	eb 2e                	jmp    100807 <printer_vprintf+0x138>
                width = 10 * width + *format++ - '0';
  1007d9:	8b 55 e8             	mov    -0x18(%rbp),%edx
  1007dc:	89 d0                	mov    %edx,%eax
  1007de:	c1 e0 02             	shl    $0x2,%eax
  1007e1:	01 d0                	add    %edx,%eax
  1007e3:	01 c0                	add    %eax,%eax
  1007e5:	89 c1                	mov    %eax,%ecx
  1007e7:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  1007ee:	48 8d 50 01          	lea    0x1(%rax),%rdx
  1007f2:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
  1007f9:	0f b6 00             	movzbl (%rax),%eax
  1007fc:	0f be c0             	movsbl %al,%eax
  1007ff:	01 c8                	add    %ecx,%eax
  100801:	83 e8 30             	sub    $0x30,%eax
  100804:	89 45 e8             	mov    %eax,-0x18(%rbp)
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100807:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  10080e:	0f b6 00             	movzbl (%rax),%eax
  100811:	3c 2f                	cmp    $0x2f,%al
  100813:	0f 8e 85 00 00 00    	jle    10089e <printer_vprintf+0x1cf>
  100819:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  100820:	0f b6 00             	movzbl (%rax),%eax
  100823:	3c 39                	cmp    $0x39,%al
  100825:	7e b2                	jle    1007d9 <printer_vprintf+0x10a>
        if (*format >= '1' && *format <= '9') {
  100827:	eb 75                	jmp    10089e <printer_vprintf+0x1cf>
            }
        } else if (*format == '*') {
  100829:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  100830:	0f b6 00             	movzbl (%rax),%eax
  100833:	3c 2a                	cmp    $0x2a,%al
  100835:	75 68                	jne    10089f <printer_vprintf+0x1d0>
            width = va_arg(val, int);
  100837:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  10083e:	8b 00                	mov    (%rax),%eax
  100840:	83 f8 2f             	cmp    $0x2f,%eax
  100843:	77 30                	ja     100875 <printer_vprintf+0x1a6>
  100845:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  10084c:	48 8b 50 10          	mov    0x10(%rax),%rdx
  100850:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100857:	8b 00                	mov    (%rax),%eax
  100859:	89 c0                	mov    %eax,%eax
  10085b:	48 01 d0             	add    %rdx,%rax
  10085e:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100865:	8b 12                	mov    (%rdx),%edx
  100867:	8d 4a 08             	lea    0x8(%rdx),%ecx
  10086a:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100871:	89 0a                	mov    %ecx,(%rdx)
  100873:	eb 1a                	jmp    10088f <printer_vprintf+0x1c0>
  100875:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  10087c:	48 8b 40 08          	mov    0x8(%rax),%rax
  100880:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100884:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  10088b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  10088f:	8b 00                	mov    (%rax),%eax
  100891:	89 45 e8             	mov    %eax,-0x18(%rbp)
            ++format;
  100894:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
  10089b:	01 
  10089c:	eb 01                	jmp    10089f <printer_vprintf+0x1d0>
        if (*format >= '1' && *format <= '9') {
  10089e:	90                   	nop
        }

        // process precision
        int precision = -1;
  10089f:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
        if (*format == '.') {
  1008a6:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  1008ad:	0f b6 00             	movzbl (%rax),%eax
  1008b0:	3c 2e                	cmp    $0x2e,%al
  1008b2:	0f 85 00 01 00 00    	jne    1009b8 <printer_vprintf+0x2e9>
            ++format;
  1008b8:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
  1008bf:	01 
            if (*format >= '0' && *format <= '9') {
  1008c0:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  1008c7:	0f b6 00             	movzbl (%rax),%eax
  1008ca:	3c 2f                	cmp    $0x2f,%al
  1008cc:	7e 67                	jle    100935 <printer_vprintf+0x266>
  1008ce:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  1008d5:	0f b6 00             	movzbl (%rax),%eax
  1008d8:	3c 39                	cmp    $0x39,%al
  1008da:	7f 59                	jg     100935 <printer_vprintf+0x266>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1008dc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
  1008e3:	eb 2e                	jmp    100913 <printer_vprintf+0x244>
                    precision = 10 * precision + *format++ - '0';
  1008e5:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  1008e8:	89 d0                	mov    %edx,%eax
  1008ea:	c1 e0 02             	shl    $0x2,%eax
  1008ed:	01 d0                	add    %edx,%eax
  1008ef:	01 c0                	add    %eax,%eax
  1008f1:	89 c1                	mov    %eax,%ecx
  1008f3:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  1008fa:	48 8d 50 01          	lea    0x1(%rax),%rdx
  1008fe:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
  100905:	0f b6 00             	movzbl (%rax),%eax
  100908:	0f be c0             	movsbl %al,%eax
  10090b:	01 c8                	add    %ecx,%eax
  10090d:	83 e8 30             	sub    $0x30,%eax
  100910:	89 45 e4             	mov    %eax,-0x1c(%rbp)
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  100913:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  10091a:	0f b6 00             	movzbl (%rax),%eax
  10091d:	3c 2f                	cmp    $0x2f,%al
  10091f:	0f 8e 85 00 00 00    	jle    1009aa <printer_vprintf+0x2db>
  100925:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  10092c:	0f b6 00             	movzbl (%rax),%eax
  10092f:	3c 39                	cmp    $0x39,%al
  100931:	7e b2                	jle    1008e5 <printer_vprintf+0x216>
            if (*format >= '0' && *format <= '9') {
  100933:	eb 75                	jmp    1009aa <printer_vprintf+0x2db>
                }
            } else if (*format == '*') {
  100935:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  10093c:	0f b6 00             	movzbl (%rax),%eax
  10093f:	3c 2a                	cmp    $0x2a,%al
  100941:	75 68                	jne    1009ab <printer_vprintf+0x2dc>
                precision = va_arg(val, int);
  100943:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  10094a:	8b 00                	mov    (%rax),%eax
  10094c:	83 f8 2f             	cmp    $0x2f,%eax
  10094f:	77 30                	ja     100981 <printer_vprintf+0x2b2>
  100951:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100958:	48 8b 50 10          	mov    0x10(%rax),%rdx
  10095c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100963:	8b 00                	mov    (%rax),%eax
  100965:	89 c0                	mov    %eax,%eax
  100967:	48 01 d0             	add    %rdx,%rax
  10096a:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100971:	8b 12                	mov    (%rdx),%edx
  100973:	8d 4a 08             	lea    0x8(%rdx),%ecx
  100976:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  10097d:	89 0a                	mov    %ecx,(%rdx)
  10097f:	eb 1a                	jmp    10099b <printer_vprintf+0x2cc>
  100981:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100988:	48 8b 40 08          	mov    0x8(%rax),%rax
  10098c:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100990:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100997:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  10099b:	8b 00                	mov    (%rax),%eax
  10099d:	89 45 e4             	mov    %eax,-0x1c(%rbp)
                ++format;
  1009a0:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
  1009a7:	01 
  1009a8:	eb 01                	jmp    1009ab <printer_vprintf+0x2dc>
            if (*format >= '0' && *format <= '9') {
  1009aa:	90                   	nop
            }
            if (precision < 0) {
  1009ab:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  1009af:	79 07                	jns    1009b8 <printer_vprintf+0x2e9>
                precision = 0;
  1009b1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
            }
        }

        // process main conversion character
        int base = 10;
  1009b8:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%rbp)
        unsigned long num = 0;
  1009bf:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
  1009c6:	00 
        int length = 0;
  1009c7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
        char* data = "";
  1009ce:	48 8d 05 e1 0a 00 00 	lea    0xae1(%rip),%rax        # 1014b6 <flag_chars+0x6>
  1009d5:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    again:
        switch (*format) {
  1009d9:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  1009e0:	0f b6 00             	movzbl (%rax),%eax
  1009e3:	0f be c0             	movsbl %al,%eax
  1009e6:	83 e8 43             	sub    $0x43,%eax
  1009e9:	83 f8 37             	cmp    $0x37,%eax
  1009ec:	0f 87 b6 03 00 00    	ja     100da8 <printer_vprintf+0x6d9>
  1009f2:	89 c0                	mov    %eax,%eax
  1009f4:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  1009fb:	00 
  1009fc:	48 8d 05 c1 0a 00 00 	lea    0xac1(%rip),%rax        # 1014c4 <flag_chars+0x14>
  100a03:	8b 04 02             	mov    (%rdx,%rax,1),%eax
  100a06:	48 98                	cltq   
  100a08:	48 8d 15 b5 0a 00 00 	lea    0xab5(%rip),%rdx        # 1014c4 <flag_chars+0x14>
  100a0f:	48 01 d0             	add    %rdx,%rax
  100a12:	3e ff e0             	notrack jmp *%rax
        case 'l':
        case 'z':
            length = 1;
  100a15:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
            ++format;
  100a1c:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
  100a23:	01 
            goto again;
  100a24:	eb b3                	jmp    1009d9 <printer_vprintf+0x30a>
        case 'd':
        case 'i': {
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100a26:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  100a2a:	74 5d                	je     100a89 <printer_vprintf+0x3ba>
  100a2c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100a33:	8b 00                	mov    (%rax),%eax
  100a35:	83 f8 2f             	cmp    $0x2f,%eax
  100a38:	77 30                	ja     100a6a <printer_vprintf+0x39b>
  100a3a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100a41:	48 8b 50 10          	mov    0x10(%rax),%rdx
  100a45:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100a4c:	8b 00                	mov    (%rax),%eax
  100a4e:	89 c0                	mov    %eax,%eax
  100a50:	48 01 d0             	add    %rdx,%rax
  100a53:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100a5a:	8b 12                	mov    (%rdx),%edx
  100a5c:	8d 4a 08             	lea    0x8(%rdx),%ecx
  100a5f:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100a66:	89 0a                	mov    %ecx,(%rdx)
  100a68:	eb 1a                	jmp    100a84 <printer_vprintf+0x3b5>
  100a6a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100a71:	48 8b 40 08          	mov    0x8(%rax),%rax
  100a75:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100a79:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100a80:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  100a84:	48 8b 00             	mov    (%rax),%rax
  100a87:	eb 5c                	jmp    100ae5 <printer_vprintf+0x416>
  100a89:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100a90:	8b 00                	mov    (%rax),%eax
  100a92:	83 f8 2f             	cmp    $0x2f,%eax
  100a95:	77 30                	ja     100ac7 <printer_vprintf+0x3f8>
  100a97:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100a9e:	48 8b 50 10          	mov    0x10(%rax),%rdx
  100aa2:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100aa9:	8b 00                	mov    (%rax),%eax
  100aab:	89 c0                	mov    %eax,%eax
  100aad:	48 01 d0             	add    %rdx,%rax
  100ab0:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100ab7:	8b 12                	mov    (%rdx),%edx
  100ab9:	8d 4a 08             	lea    0x8(%rdx),%ecx
  100abc:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100ac3:	89 0a                	mov    %ecx,(%rdx)
  100ac5:	eb 1a                	jmp    100ae1 <printer_vprintf+0x412>
  100ac7:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100ace:	48 8b 40 08          	mov    0x8(%rax),%rax
  100ad2:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100ad6:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100add:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  100ae1:	8b 00                	mov    (%rax),%eax
  100ae3:	48 98                	cltq   
  100ae5:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  100ae9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  100aed:	48 c1 f8 38          	sar    $0x38,%rax
  100af1:	25 80 00 00 00       	and    $0x80,%eax
  100af6:	89 45 a4             	mov    %eax,-0x5c(%rbp)
            num = negative ? -x : x;
  100af9:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
  100afd:	74 09                	je     100b08 <printer_vprintf+0x439>
  100aff:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  100b03:	48 f7 d8             	neg    %rax
  100b06:	eb 04                	jmp    100b0c <printer_vprintf+0x43d>
  100b08:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  100b0c:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  100b10:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  100b13:	83 c8 60             	or     $0x60,%eax
  100b16:	09 45 ec             	or     %eax,-0x14(%rbp)
            break;
  100b19:	e9 cf 02 00 00       	jmp    100ded <printer_vprintf+0x71e>
        }
        case 'u':
        format_unsigned:
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  100b1e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  100b22:	74 5d                	je     100b81 <printer_vprintf+0x4b2>
  100b24:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100b2b:	8b 00                	mov    (%rax),%eax
  100b2d:	83 f8 2f             	cmp    $0x2f,%eax
  100b30:	77 30                	ja     100b62 <printer_vprintf+0x493>
  100b32:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100b39:	48 8b 50 10          	mov    0x10(%rax),%rdx
  100b3d:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100b44:	8b 00                	mov    (%rax),%eax
  100b46:	89 c0                	mov    %eax,%eax
  100b48:	48 01 d0             	add    %rdx,%rax
  100b4b:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100b52:	8b 12                	mov    (%rdx),%edx
  100b54:	8d 4a 08             	lea    0x8(%rdx),%ecx
  100b57:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100b5e:	89 0a                	mov    %ecx,(%rdx)
  100b60:	eb 1a                	jmp    100b7c <printer_vprintf+0x4ad>
  100b62:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100b69:	48 8b 40 08          	mov    0x8(%rax),%rax
  100b6d:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100b71:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100b78:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  100b7c:	48 8b 00             	mov    (%rax),%rax
  100b7f:	eb 5c                	jmp    100bdd <printer_vprintf+0x50e>
  100b81:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100b88:	8b 00                	mov    (%rax),%eax
  100b8a:	83 f8 2f             	cmp    $0x2f,%eax
  100b8d:	77 30                	ja     100bbf <printer_vprintf+0x4f0>
  100b8f:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100b96:	48 8b 50 10          	mov    0x10(%rax),%rdx
  100b9a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100ba1:	8b 00                	mov    (%rax),%eax
  100ba3:	89 c0                	mov    %eax,%eax
  100ba5:	48 01 d0             	add    %rdx,%rax
  100ba8:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100baf:	8b 12                	mov    (%rdx),%edx
  100bb1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  100bb4:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100bbb:	89 0a                	mov    %ecx,(%rdx)
  100bbd:	eb 1a                	jmp    100bd9 <printer_vprintf+0x50a>
  100bbf:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100bc6:	48 8b 40 08          	mov    0x8(%rax),%rax
  100bca:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100bce:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100bd5:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  100bd9:	8b 00                	mov    (%rax),%eax
  100bdb:	89 c0                	mov    %eax,%eax
  100bdd:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            flags |= FLAG_NUMERIC;
  100be1:	83 4d ec 20          	orl    $0x20,-0x14(%rbp)
            break;
  100be5:	e9 03 02 00 00       	jmp    100ded <printer_vprintf+0x71e>
        case 'x':
            base = -16;
  100bea:	c7 45 e0 f0 ff ff ff 	movl   $0xfffffff0,-0x20(%rbp)
            goto format_unsigned;
  100bf1:	e9 28 ff ff ff       	jmp    100b1e <printer_vprintf+0x44f>
        case 'X':
            base = 16;
  100bf6:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%rbp)
            goto format_unsigned;
  100bfd:	e9 1c ff ff ff       	jmp    100b1e <printer_vprintf+0x44f>
        case 'p':
            num = (uintptr_t) va_arg(val, void*);
  100c02:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100c09:	8b 00                	mov    (%rax),%eax
  100c0b:	83 f8 2f             	cmp    $0x2f,%eax
  100c0e:	77 30                	ja     100c40 <printer_vprintf+0x571>
  100c10:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100c17:	48 8b 50 10          	mov    0x10(%rax),%rdx
  100c1b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100c22:	8b 00                	mov    (%rax),%eax
  100c24:	89 c0                	mov    %eax,%eax
  100c26:	48 01 d0             	add    %rdx,%rax
  100c29:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100c30:	8b 12                	mov    (%rdx),%edx
  100c32:	8d 4a 08             	lea    0x8(%rdx),%ecx
  100c35:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100c3c:	89 0a                	mov    %ecx,(%rdx)
  100c3e:	eb 1a                	jmp    100c5a <printer_vprintf+0x58b>
  100c40:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100c47:	48 8b 40 08          	mov    0x8(%rax),%rax
  100c4b:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100c4f:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100c56:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  100c5a:	48 8b 00             	mov    (%rax),%rax
  100c5d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            base = -16;
  100c61:	c7 45 e0 f0 ff ff ff 	movl   $0xfffffff0,-0x20(%rbp)
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  100c68:	81 4d ec 21 01 00 00 	orl    $0x121,-0x14(%rbp)
            break;
  100c6f:	e9 79 01 00 00       	jmp    100ded <printer_vprintf+0x71e>
        case 's':
            data = va_arg(val, char*);
  100c74:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100c7b:	8b 00                	mov    (%rax),%eax
  100c7d:	83 f8 2f             	cmp    $0x2f,%eax
  100c80:	77 30                	ja     100cb2 <printer_vprintf+0x5e3>
  100c82:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100c89:	48 8b 50 10          	mov    0x10(%rax),%rdx
  100c8d:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100c94:	8b 00                	mov    (%rax),%eax
  100c96:	89 c0                	mov    %eax,%eax
  100c98:	48 01 d0             	add    %rdx,%rax
  100c9b:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100ca2:	8b 12                	mov    (%rdx),%edx
  100ca4:	8d 4a 08             	lea    0x8(%rdx),%ecx
  100ca7:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100cae:	89 0a                	mov    %ecx,(%rdx)
  100cb0:	eb 1a                	jmp    100ccc <printer_vprintf+0x5fd>
  100cb2:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100cb9:	48 8b 40 08          	mov    0x8(%rax),%rax
  100cbd:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100cc1:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100cc8:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  100ccc:	48 8b 00             	mov    (%rax),%rax
  100ccf:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            break;
  100cd3:	e9 15 01 00 00       	jmp    100ded <printer_vprintf+0x71e>
        case 'C':
            color = va_arg(val, int);
  100cd8:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100cdf:	8b 00                	mov    (%rax),%eax
  100ce1:	83 f8 2f             	cmp    $0x2f,%eax
  100ce4:	77 30                	ja     100d16 <printer_vprintf+0x647>
  100ce6:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100ced:	48 8b 50 10          	mov    0x10(%rax),%rdx
  100cf1:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100cf8:	8b 00                	mov    (%rax),%eax
  100cfa:	89 c0                	mov    %eax,%eax
  100cfc:	48 01 d0             	add    %rdx,%rax
  100cff:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100d06:	8b 12                	mov    (%rdx),%edx
  100d08:	8d 4a 08             	lea    0x8(%rdx),%ecx
  100d0b:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100d12:	89 0a                	mov    %ecx,(%rdx)
  100d14:	eb 1a                	jmp    100d30 <printer_vprintf+0x661>
  100d16:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100d1d:	48 8b 40 08          	mov    0x8(%rax),%rax
  100d21:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100d25:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100d2c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  100d30:	8b 00                	mov    (%rax),%eax
  100d32:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
            goto done;
  100d38:	e9 77 03 00 00       	jmp    1010b4 <printer_vprintf+0x9e5>
        case 'c':
            data = numbuf;
  100d3d:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
  100d41:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            numbuf[0] = va_arg(val, int);
  100d45:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100d4c:	8b 00                	mov    (%rax),%eax
  100d4e:	83 f8 2f             	cmp    $0x2f,%eax
  100d51:	77 30                	ja     100d83 <printer_vprintf+0x6b4>
  100d53:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100d5a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  100d5e:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100d65:	8b 00                	mov    (%rax),%eax
  100d67:	89 c0                	mov    %eax,%eax
  100d69:	48 01 d0             	add    %rdx,%rax
  100d6c:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100d73:	8b 12                	mov    (%rdx),%edx
  100d75:	8d 4a 08             	lea    0x8(%rdx),%ecx
  100d78:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100d7f:	89 0a                	mov    %ecx,(%rdx)
  100d81:	eb 1a                	jmp    100d9d <printer_vprintf+0x6ce>
  100d83:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  100d8a:	48 8b 40 08          	mov    0x8(%rax),%rax
  100d8e:	48 8d 48 08          	lea    0x8(%rax),%rcx
  100d92:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  100d99:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  100d9d:	8b 00                	mov    (%rax),%eax
  100d9f:	88 45 8c             	mov    %al,-0x74(%rbp)
            numbuf[1] = '\0';
  100da2:	c6 45 8d 00          	movb   $0x0,-0x73(%rbp)
            break;
  100da6:	eb 45                	jmp    100ded <printer_vprintf+0x71e>
        default:
            data = numbuf;
  100da8:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
  100dac:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            numbuf[0] = (*format ? *format : '%');
  100db0:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  100db7:	0f b6 00             	movzbl (%rax),%eax
  100dba:	84 c0                	test   %al,%al
  100dbc:	74 0c                	je     100dca <printer_vprintf+0x6fb>
  100dbe:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  100dc5:	0f b6 00             	movzbl (%rax),%eax
  100dc8:	eb 05                	jmp    100dcf <printer_vprintf+0x700>
  100dca:	b8 25 00 00 00       	mov    $0x25,%eax
  100dcf:	88 45 8c             	mov    %al,-0x74(%rbp)
            numbuf[1] = '\0';
  100dd2:	c6 45 8d 00          	movb   $0x0,-0x73(%rbp)
            if (!*format) {
  100dd6:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  100ddd:	0f b6 00             	movzbl (%rax),%eax
  100de0:	84 c0                	test   %al,%al
  100de2:	75 08                	jne    100dec <printer_vprintf+0x71d>
                format--;
  100de4:	48 83 ad 68 ff ff ff 	subq   $0x1,-0x98(%rbp)
  100deb:	01 
            }
            break;
  100dec:	90                   	nop
        }

        if (flags & FLAG_NUMERIC) {
  100ded:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100df0:	83 e0 20             	and    $0x20,%eax
  100df3:	85 c0                	test   %eax,%eax
  100df5:	74 1e                	je     100e15 <printer_vprintf+0x746>
            data = fill_numbuf(numbuf + NUMBUFSIZ, num, base);
  100df7:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
  100dfb:	48 83 c0 18          	add    $0x18,%rax
  100dff:	8b 55 e0             	mov    -0x20(%rbp),%edx
  100e02:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  100e06:	48 89 ce             	mov    %rcx,%rsi
  100e09:	48 89 c7             	mov    %rax,%rdi
  100e0c:	e8 32 f8 ff ff       	call   100643 <fill_numbuf>
  100e11:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
        }

        const char* prefix = "";
  100e15:	48 8d 05 9a 06 00 00 	lea    0x69a(%rip),%rax        # 1014b6 <flag_chars+0x6>
  100e1c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  100e20:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100e23:	83 e0 20             	and    $0x20,%eax
  100e26:	85 c0                	test   %eax,%eax
  100e28:	74 51                	je     100e7b <printer_vprintf+0x7ac>
  100e2a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100e2d:	83 e0 40             	and    $0x40,%eax
  100e30:	85 c0                	test   %eax,%eax
  100e32:	74 47                	je     100e7b <printer_vprintf+0x7ac>
            if (flags & FLAG_NEGATIVE) {
  100e34:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100e37:	25 80 00 00 00       	and    $0x80,%eax
  100e3c:	85 c0                	test   %eax,%eax
  100e3e:	74 0d                	je     100e4d <printer_vprintf+0x77e>
                prefix = "-";
  100e40:	48 8d 05 70 06 00 00 	lea    0x670(%rip),%rax        # 1014b7 <flag_chars+0x7>
  100e47:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
  100e4b:	eb 7d                	jmp    100eca <printer_vprintf+0x7fb>
            } else if (flags & FLAG_PLUSPOSITIVE) {
  100e4d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100e50:	83 e0 10             	and    $0x10,%eax
  100e53:	85 c0                	test   %eax,%eax
  100e55:	74 0d                	je     100e64 <printer_vprintf+0x795>
                prefix = "+";
  100e57:	48 8d 05 5b 06 00 00 	lea    0x65b(%rip),%rax        # 1014b9 <flag_chars+0x9>
  100e5e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
  100e62:	eb 66                	jmp    100eca <printer_vprintf+0x7fb>
            } else if (flags & FLAG_SPACEPOSITIVE) {
  100e64:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100e67:	83 e0 08             	and    $0x8,%eax
  100e6a:	85 c0                	test   %eax,%eax
  100e6c:	74 5c                	je     100eca <printer_vprintf+0x7fb>
                prefix = " ";
  100e6e:	48 8d 05 46 06 00 00 	lea    0x646(%rip),%rax        # 1014bb <flag_chars+0xb>
  100e75:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
  100e79:	eb 4f                	jmp    100eca <printer_vprintf+0x7fb>
            }
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100e7b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100e7e:	83 e0 20             	and    $0x20,%eax
  100e81:	85 c0                	test   %eax,%eax
  100e83:	74 46                	je     100ecb <printer_vprintf+0x7fc>
  100e85:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100e88:	83 e0 01             	and    $0x1,%eax
  100e8b:	85 c0                	test   %eax,%eax
  100e8d:	74 3c                	je     100ecb <printer_vprintf+0x7fc>
                   && (base == 16 || base == -16)
  100e8f:	83 7d e0 10          	cmpl   $0x10,-0x20(%rbp)
  100e93:	74 06                	je     100e9b <printer_vprintf+0x7cc>
  100e95:	83 7d e0 f0          	cmpl   $0xfffffff0,-0x20(%rbp)
  100e99:	75 30                	jne    100ecb <printer_vprintf+0x7fc>
                   && (num || (flags & FLAG_ALT2))) {
  100e9b:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  100ea0:	75 0c                	jne    100eae <printer_vprintf+0x7df>
  100ea2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100ea5:	25 00 01 00 00       	and    $0x100,%eax
  100eaa:	85 c0                	test   %eax,%eax
  100eac:	74 1d                	je     100ecb <printer_vprintf+0x7fc>
            prefix = (base == -16 ? "0x" : "0X");
  100eae:	83 7d e0 f0          	cmpl   $0xfffffff0,-0x20(%rbp)
  100eb2:	75 09                	jne    100ebd <printer_vprintf+0x7ee>
  100eb4:	48 8d 05 02 06 00 00 	lea    0x602(%rip),%rax        # 1014bd <flag_chars+0xd>
  100ebb:	eb 07                	jmp    100ec4 <printer_vprintf+0x7f5>
  100ebd:	48 8d 05 fc 05 00 00 	lea    0x5fc(%rip),%rax        # 1014c0 <flag_chars+0x10>
  100ec4:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100ec8:	eb 01                	jmp    100ecb <printer_vprintf+0x7fc>
            if (flags & FLAG_NEGATIVE) {
  100eca:	90                   	nop
        }

        int len;
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  100ecb:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  100ecf:	78 24                	js     100ef5 <printer_vprintf+0x826>
  100ed1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100ed4:	83 e0 20             	and    $0x20,%eax
  100ed7:	85 c0                	test   %eax,%eax
  100ed9:	75 1a                	jne    100ef5 <printer_vprintf+0x826>
            len = strnlen(data, precision);
  100edb:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  100ede:	48 63 d0             	movslq %eax,%rdx
  100ee1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  100ee5:	48 89 d6             	mov    %rdx,%rsi
  100ee8:	48 89 c7             	mov    %rax,%rdi
  100eeb:	e8 91 f5 ff ff       	call   100481 <strnlen>
  100ef0:	89 45 bc             	mov    %eax,-0x44(%rbp)
  100ef3:	eb 0f                	jmp    100f04 <printer_vprintf+0x835>
        } else {
            len = strlen(data);
  100ef5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  100ef9:	48 89 c7             	mov    %rax,%rdi
  100efc:	e8 4b f5 ff ff       	call   10044c <strlen>
  100f01:	89 45 bc             	mov    %eax,-0x44(%rbp)
        }
        int zeros;
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
  100f04:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100f07:	83 e0 20             	and    $0x20,%eax
  100f0a:	85 c0                	test   %eax,%eax
  100f0c:	74 20                	je     100f2e <printer_vprintf+0x85f>
  100f0e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  100f12:	78 1a                	js     100f2e <printer_vprintf+0x85f>
            zeros = precision > len ? precision - len : 0;
  100f14:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  100f17:	3b 45 bc             	cmp    -0x44(%rbp),%eax
  100f1a:	7e 08                	jle    100f24 <printer_vprintf+0x855>
  100f1c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  100f1f:	2b 45 bc             	sub    -0x44(%rbp),%eax
  100f22:	eb 05                	jmp    100f29 <printer_vprintf+0x85a>
  100f24:	b8 00 00 00 00       	mov    $0x0,%eax
  100f29:	89 45 b8             	mov    %eax,-0x48(%rbp)
  100f2c:	eb 5c                	jmp    100f8a <printer_vprintf+0x8bb>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
  100f2e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100f31:	83 e0 20             	and    $0x20,%eax
  100f34:	85 c0                	test   %eax,%eax
  100f36:	74 4b                	je     100f83 <printer_vprintf+0x8b4>
  100f38:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100f3b:	83 e0 02             	and    $0x2,%eax
  100f3e:	85 c0                	test   %eax,%eax
  100f40:	74 41                	je     100f83 <printer_vprintf+0x8b4>
                   && !(flags & FLAG_LEFTJUSTIFY)
  100f42:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100f45:	83 e0 04             	and    $0x4,%eax
  100f48:	85 c0                	test   %eax,%eax
  100f4a:	75 37                	jne    100f83 <printer_vprintf+0x8b4>
                   && len + (int) strlen(prefix) < width) {
  100f4c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  100f50:	48 89 c7             	mov    %rax,%rdi
  100f53:	e8 f4 f4 ff ff       	call   10044c <strlen>
  100f58:	89 c2                	mov    %eax,%edx
  100f5a:	8b 45 bc             	mov    -0x44(%rbp),%eax
  100f5d:	01 d0                	add    %edx,%eax
  100f5f:	39 45 e8             	cmp    %eax,-0x18(%rbp)
  100f62:	7e 1f                	jle    100f83 <printer_vprintf+0x8b4>
            zeros = width - len - strlen(prefix);
  100f64:	8b 45 e8             	mov    -0x18(%rbp),%eax
  100f67:	2b 45 bc             	sub    -0x44(%rbp),%eax
  100f6a:	89 c3                	mov    %eax,%ebx
  100f6c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  100f70:	48 89 c7             	mov    %rax,%rdi
  100f73:	e8 d4 f4 ff ff       	call   10044c <strlen>
  100f78:	89 c2                	mov    %eax,%edx
  100f7a:	89 d8                	mov    %ebx,%eax
  100f7c:	29 d0                	sub    %edx,%eax
  100f7e:	89 45 b8             	mov    %eax,-0x48(%rbp)
  100f81:	eb 07                	jmp    100f8a <printer_vprintf+0x8bb>
        } else {
            zeros = 0;
  100f83:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%rbp)
        }
        width -= len + zeros + strlen(prefix);
  100f8a:	8b 55 bc             	mov    -0x44(%rbp),%edx
  100f8d:	8b 45 b8             	mov    -0x48(%rbp),%eax
  100f90:	01 d0                	add    %edx,%eax
  100f92:	48 63 d8             	movslq %eax,%rbx
  100f95:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  100f99:	48 89 c7             	mov    %rax,%rdi
  100f9c:	e8 ab f4 ff ff       	call   10044c <strlen>
  100fa1:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
  100fa5:	8b 45 e8             	mov    -0x18(%rbp),%eax
  100fa8:	29 d0                	sub    %edx,%eax
  100faa:	89 45 e8             	mov    %eax,-0x18(%rbp)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100fad:	eb 25                	jmp    100fd4 <printer_vprintf+0x905>
            p->putc(p, ' ', color);
  100faf:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  100fb6:	48 8b 08             	mov    (%rax),%rcx
  100fb9:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  100fbf:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  100fc6:	be 20 00 00 00       	mov    $0x20,%esi
  100fcb:	48 89 c7             	mov    %rax,%rdi
  100fce:	ff d1                	call   *%rcx
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100fd0:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
  100fd4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  100fd7:	83 e0 04             	and    $0x4,%eax
  100fda:	85 c0                	test   %eax,%eax
  100fdc:	75 36                	jne    101014 <printer_vprintf+0x945>
  100fde:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  100fe2:	7f cb                	jg     100faf <printer_vprintf+0x8e0>
        }
        for (; *prefix; ++prefix) {
  100fe4:	eb 2e                	jmp    101014 <printer_vprintf+0x945>
            p->putc(p, *prefix, color);
  100fe6:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  100fed:	4c 8b 00             	mov    (%rax),%r8
  100ff0:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  100ff4:	0f b6 00             	movzbl (%rax),%eax
  100ff7:	0f b6 c8             	movzbl %al,%ecx
  100ffa:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  101000:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  101007:	89 ce                	mov    %ecx,%esi
  101009:	48 89 c7             	mov    %rax,%rdi
  10100c:	41 ff d0             	call   *%r8
        for (; *prefix; ++prefix) {
  10100f:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
  101014:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  101018:	0f b6 00             	movzbl (%rax),%eax
  10101b:	84 c0                	test   %al,%al
  10101d:	75 c7                	jne    100fe6 <printer_vprintf+0x917>
        }
        for (; zeros > 0; --zeros) {
  10101f:	eb 25                	jmp    101046 <printer_vprintf+0x977>
            p->putc(p, '0', color);
  101021:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  101028:	48 8b 08             	mov    (%rax),%rcx
  10102b:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  101031:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  101038:	be 30 00 00 00       	mov    $0x30,%esi
  10103d:	48 89 c7             	mov    %rax,%rdi
  101040:	ff d1                	call   *%rcx
        for (; zeros > 0; --zeros) {
  101042:	83 6d b8 01          	subl   $0x1,-0x48(%rbp)
  101046:	83 7d b8 00          	cmpl   $0x0,-0x48(%rbp)
  10104a:	7f d5                	jg     101021 <printer_vprintf+0x952>
        }
        for (; len > 0; ++data, --len) {
  10104c:	eb 32                	jmp    101080 <printer_vprintf+0x9b1>
            p->putc(p, *data, color);
  10104e:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  101055:	4c 8b 00             	mov    (%rax),%r8
  101058:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  10105c:	0f b6 00             	movzbl (%rax),%eax
  10105f:	0f b6 c8             	movzbl %al,%ecx
  101062:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  101068:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  10106f:	89 ce                	mov    %ecx,%esi
  101071:	48 89 c7             	mov    %rax,%rdi
  101074:	41 ff d0             	call   *%r8
        for (; len > 0; ++data, --len) {
  101077:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  10107c:	83 6d bc 01          	subl   $0x1,-0x44(%rbp)
  101080:	83 7d bc 00          	cmpl   $0x0,-0x44(%rbp)
  101084:	7f c8                	jg     10104e <printer_vprintf+0x97f>
        }
        for (; width > 0; --width) {
  101086:	eb 25                	jmp    1010ad <printer_vprintf+0x9de>
            p->putc(p, ' ', color);
  101088:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  10108f:	48 8b 08             	mov    (%rax),%rcx
  101092:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  101098:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
  10109f:	be 20 00 00 00       	mov    $0x20,%esi
  1010a4:	48 89 c7             	mov    %rax,%rdi
  1010a7:	ff d1                	call   *%rcx
        for (; width > 0; --width) {
  1010a9:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
  1010ad:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  1010b1:	7f d5                	jg     101088 <printer_vprintf+0x9b9>
        }
    done: ;
  1010b3:	90                   	nop
    for (; *format; ++format) {
  1010b4:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
  1010bb:	01 
  1010bc:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  1010c3:	0f b6 00             	movzbl (%rax),%eax
  1010c6:	84 c0                	test   %al,%al
  1010c8:	0f 85 31 f6 ff ff    	jne    1006ff <printer_vprintf+0x30>
    }
}
  1010ce:	90                   	nop
  1010cf:	90                   	nop
  1010d0:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  1010d4:	c9                   	leave  
  1010d5:	c3                   	ret    

00000000001010d6 <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
  1010d6:	f3 0f 1e fa          	endbr64 
  1010da:	55                   	push   %rbp
  1010db:	48 89 e5             	mov    %rsp,%rbp
  1010de:	48 83 ec 20          	sub    $0x20,%rsp
  1010e2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  1010e6:	89 f0                	mov    %esi,%eax
  1010e8:	89 55 e0             	mov    %edx,-0x20(%rbp)
  1010eb:	88 45 e4             	mov    %al,-0x1c(%rbp)
    console_printer* cp = (console_printer*) p;
  1010ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  1010f2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  1010f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  1010fa:	48 8b 40 08          	mov    0x8(%rax),%rax
  1010fe:	48 8d 15 9b 7e fb ff 	lea    -0x48165(%rip),%rdx        # b8fa0 <console+0xfa0>
  101105:	48 39 d0             	cmp    %rdx,%rax
  101108:	72 0f                	jb     101119 <console_putc+0x43>
        cp->cursor = console;
  10110a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  10110e:	48 8d 15 eb 6e fb ff 	lea    -0x49115(%rip),%rdx        # b8000 <console>
  101115:	48 89 50 08          	mov    %rdx,0x8(%rax)
    }
    if (c == '\n') {
  101119:	80 7d e4 0a          	cmpb   $0xa,-0x1c(%rbp)
  10111d:	0f 85 82 00 00 00    	jne    1011a5 <console_putc+0xcf>
        int pos = (cp->cursor - console) % 80;
  101123:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  101127:	48 8b 40 08          	mov    0x8(%rax),%rax
  10112b:	48 8d 15 ce 6e fb ff 	lea    -0x49132(%rip),%rdx        # b8000 <console>
  101132:	48 29 d0             	sub    %rdx,%rax
  101135:	48 d1 f8             	sar    %rax
  101138:	48 89 c1             	mov    %rax,%rcx
  10113b:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
  101142:	66 66 66 
  101145:	48 89 c8             	mov    %rcx,%rax
  101148:	48 f7 ea             	imul   %rdx
  10114b:	48 89 d0             	mov    %rdx,%rax
  10114e:	48 c1 f8 05          	sar    $0x5,%rax
  101152:	48 89 ce             	mov    %rcx,%rsi
  101155:	48 c1 fe 3f          	sar    $0x3f,%rsi
  101159:	48 29 f0             	sub    %rsi,%rax
  10115c:	48 89 c2             	mov    %rax,%rdx
  10115f:	48 89 d0             	mov    %rdx,%rax
  101162:	48 c1 e0 02          	shl    $0x2,%rax
  101166:	48 01 d0             	add    %rdx,%rax
  101169:	48 c1 e0 04          	shl    $0x4,%rax
  10116d:	48 29 c1             	sub    %rax,%rcx
  101170:	48 89 ca             	mov    %rcx,%rdx
  101173:	89 55 fc             	mov    %edx,-0x4(%rbp)
        for (; pos != 80; pos++) {
  101176:	eb 25                	jmp    10119d <console_putc+0xc7>
            *cp->cursor++ = ' ' | color;
  101178:	8b 45 e0             	mov    -0x20(%rbp),%eax
  10117b:	83 c8 20             	or     $0x20,%eax
  10117e:	89 c6                	mov    %eax,%esi
  101180:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  101184:	48 8b 40 08          	mov    0x8(%rax),%rax
  101188:	48 8d 48 02          	lea    0x2(%rax),%rcx
  10118c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  101190:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  101194:	89 f2                	mov    %esi,%edx
  101196:	66 89 10             	mov    %dx,(%rax)
        for (; pos != 80; pos++) {
  101199:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  10119d:	83 7d fc 50          	cmpl   $0x50,-0x4(%rbp)
  1011a1:	75 d5                	jne    101178 <console_putc+0xa2>
        }
    } else {
        *cp->cursor++ = c | color;
    }
}
  1011a3:	eb 24                	jmp    1011c9 <console_putc+0xf3>
        *cp->cursor++ = c | color;
  1011a5:	0f b6 55 e4          	movzbl -0x1c(%rbp),%edx
  1011a9:	8b 45 e0             	mov    -0x20(%rbp),%eax
  1011ac:	89 d6                	mov    %edx,%esi
  1011ae:	09 c6                	or     %eax,%esi
  1011b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  1011b4:	48 8b 40 08          	mov    0x8(%rax),%rax
  1011b8:	48 8d 48 02          	lea    0x2(%rax),%rcx
  1011bc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  1011c0:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  1011c4:	89 f2                	mov    %esi,%edx
  1011c6:	66 89 10             	mov    %dx,(%rax)
}
  1011c9:	90                   	nop
  1011ca:	c9                   	leave  
  1011cb:	c3                   	ret    

00000000001011cc <console_vprintf>:

int console_vprintf(int cpos, int color, const char* format, va_list val) {
  1011cc:	f3 0f 1e fa          	endbr64 
  1011d0:	55                   	push   %rbp
  1011d1:	48 89 e5             	mov    %rsp,%rbp
  1011d4:	48 83 ec 30          	sub    $0x30,%rsp
  1011d8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  1011db:	89 75 e8             	mov    %esi,-0x18(%rbp)
  1011de:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  1011e2:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    struct console_printer cp;
    cp.p.putc = console_putc;
  1011e6:	48 8d 05 e9 fe ff ff 	lea    -0x117(%rip),%rax        # 1010d6 <console_putc>
  1011ed:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (cpos < 0 || cpos >= CONSOLE_ROWS * CONSOLE_COLUMNS) {
  1011f1:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  1011f5:	78 09                	js     101200 <console_vprintf+0x34>
  1011f7:	81 7d ec cf 07 00 00 	cmpl   $0x7cf,-0x14(%rbp)
  1011fe:	7e 07                	jle    101207 <console_vprintf+0x3b>
        cpos = 0;
  101200:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    }
    cp.cursor = console + cpos;
  101207:	8b 45 ec             	mov    -0x14(%rbp),%eax
  10120a:	48 98                	cltq   
  10120c:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
  101210:	48 8d 05 e9 6d fb ff 	lea    -0x49217(%rip),%rax        # b8000 <console>
  101217:	48 01 d0             	add    %rdx,%rax
  10121a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&cp.p, color, format, val);
  10121e:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  101222:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  101226:	8b 75 e8             	mov    -0x18(%rbp),%esi
  101229:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  10122d:	48 89 c7             	mov    %rax,%rdi
  101230:	e8 9a f4 ff ff       	call   1006cf <printer_vprintf>
    return cp.cursor - console;
  101235:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  101239:	48 8d 15 c0 6d fb ff 	lea    -0x49240(%rip),%rdx        # b8000 <console>
  101240:	48 29 d0             	sub    %rdx,%rax
  101243:	48 d1 f8             	sar    %rax
}
  101246:	c9                   	leave  
  101247:	c3                   	ret    

0000000000101248 <console_printf>:

int console_printf(int cpos, int color, const char* format, ...) {
  101248:	f3 0f 1e fa          	endbr64 
  10124c:	55                   	push   %rbp
  10124d:	48 89 e5             	mov    %rsp,%rbp
  101250:	48 83 ec 60          	sub    $0x60,%rsp
  101254:	89 7d ac             	mov    %edi,-0x54(%rbp)
  101257:	89 75 a8             	mov    %esi,-0x58(%rbp)
  10125a:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
  10125e:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  101262:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  101266:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  10126a:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  101271:	48 8d 45 10          	lea    0x10(%rbp),%rax
  101275:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  101279:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  10127d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
  101281:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  101285:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  101289:	8b 75 a8             	mov    -0x58(%rbp),%esi
  10128c:	8b 45 ac             	mov    -0x54(%rbp),%eax
  10128f:	89 c7                	mov    %eax,%edi
  101291:	e8 36 ff ff ff       	call   1011cc <console_vprintf>
  101296:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
  101299:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
  10129c:	c9                   	leave  
  10129d:	c3                   	ret    

000000000010129e <string_putc>:
    printer p;
    char* s;
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
  10129e:	f3 0f 1e fa          	endbr64 
  1012a2:	55                   	push   %rbp
  1012a3:	48 89 e5             	mov    %rsp,%rbp
  1012a6:	48 83 ec 20          	sub    $0x20,%rsp
  1012aa:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  1012ae:	89 f0                	mov    %esi,%eax
  1012b0:	89 55 e0             	mov    %edx,-0x20(%rbp)
  1012b3:	88 45 e4             	mov    %al,-0x1c(%rbp)
    string_printer* sp = (string_printer*) p;
  1012b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  1012ba:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (sp->s < sp->end) {
  1012be:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1012c2:	48 8b 50 08          	mov    0x8(%rax),%rdx
  1012c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1012ca:	48 8b 40 10          	mov    0x10(%rax),%rax
  1012ce:	48 39 c2             	cmp    %rax,%rdx
  1012d1:	73 1a                	jae    1012ed <string_putc+0x4f>
        *sp->s++ = c;
  1012d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  1012d7:	48 8b 40 08          	mov    0x8(%rax),%rax
  1012db:	48 8d 48 01          	lea    0x1(%rax),%rcx
  1012df:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  1012e3:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  1012e7:	0f b6 55 e4          	movzbl -0x1c(%rbp),%edx
  1012eb:	88 10                	mov    %dl,(%rax)
    }
    (void) color;
}
  1012ed:	90                   	nop
  1012ee:	c9                   	leave  
  1012ef:	c3                   	ret    

00000000001012f0 <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
  1012f0:	f3 0f 1e fa          	endbr64 
  1012f4:	55                   	push   %rbp
  1012f5:	48 89 e5             	mov    %rsp,%rbp
  1012f8:	48 83 ec 40          	sub    $0x40,%rsp
  1012fc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  101300:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  101304:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  101308:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    string_printer sp;
    sp.p.putc = string_putc;
  10130c:	48 8d 05 8b ff ff ff 	lea    -0x75(%rip),%rax        # 10129e <string_putc>
  101313:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    sp.s = s;
  101317:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  10131b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (size) {
  10131f:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  101324:	74 33                	je     101359 <vsnprintf+0x69>
        sp.end = s + size - 1;
  101326:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  10132a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  10132e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  101332:	48 01 d0             	add    %rdx,%rax
  101335:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
  101339:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
  10133d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  101341:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  101345:	be 00 00 00 00       	mov    $0x0,%esi
  10134a:	48 89 c7             	mov    %rax,%rdi
  10134d:	e8 7d f3 ff ff       	call   1006cf <printer_vprintf>
        *sp.s = 0;
  101352:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  101356:	c6 00 00             	movb   $0x0,(%rax)
    }
    return sp.s - s;
  101359:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  10135d:	48 2b 45 d8          	sub    -0x28(%rbp),%rax
}
  101361:	c9                   	leave  
  101362:	c3                   	ret    

0000000000101363 <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
  101363:	f3 0f 1e fa          	endbr64 
  101367:	55                   	push   %rbp
  101368:	48 89 e5             	mov    %rsp,%rbp
  10136b:	48 83 ec 70          	sub    $0x70,%rsp
  10136f:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  101373:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  101377:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  10137b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  10137f:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  101383:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  101387:	c7 45 b0 18 00 00 00 	movl   $0x18,-0x50(%rbp)
  10138e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  101392:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  101396:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  10139a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    int n = vsnprintf(s, size, format, val);
  10139e:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
  1013a2:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
  1013a6:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  1013aa:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  1013ae:	48 89 c7             	mov    %rax,%rdi
  1013b1:	e8 3a ff ff ff       	call   1012f0 <vsnprintf>
  1013b6:	89 45 cc             	mov    %eax,-0x34(%rbp)
    va_end(val);
    return n;
  1013b9:	8b 45 cc             	mov    -0x34(%rbp),%eax
}
  1013bc:	c9                   	leave  
  1013bd:	c3                   	ret    

00000000001013be <console_clear>:


// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
  1013be:	f3 0f 1e fa          	endbr64 
  1013c2:	55                   	push   %rbp
  1013c3:	48 89 e5             	mov    %rsp,%rbp
  1013c6:	48 83 ec 10          	sub    $0x10,%rsp
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
  1013ca:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  1013d1:	eb 1a                	jmp    1013ed <console_clear+0x2f>
        console[i] = ' ' | 0x0700;
  1013d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  1013d6:	48 98                	cltq   
  1013d8:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
  1013dc:	48 8d 05 1d 6c fb ff 	lea    -0x493e3(%rip),%rax        # b8000 <console>
  1013e3:	66 c7 04 02 20 07    	movw   $0x720,(%rdx,%rax,1)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
  1013e9:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  1013ed:	81 7d fc cf 07 00 00 	cmpl   $0x7cf,-0x4(%rbp)
  1013f4:	7e dd                	jle    1013d3 <console_clear+0x15>
    }
    cursorpos = 0;
  1013f6:	c7 05 fc 7b fb ff 00 	movl   $0x0,-0x48404(%rip)        # b8ffc <cursorpos>
  1013fd:	00 00 00 
}
  101400:	90                   	nop
  101401:	c9                   	leave  
  101402:	c3                   	ret    
