
obj/kernel.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000040000 <entry_from_boot>:
# The entry_from_boot routine sets the stack pointer to the top of the
# OS kernel stack, then jumps to the `kernel` routine.

.globl entry_from_boot
entry_from_boot:
        movq $0x80000, %rsp
   40000:	48 c7 c4 00 00 08 00 	mov    $0x80000,%rsp
        movq %rsp, %rbp
   40007:	48 89 e5             	mov    %rsp,%rbp
        pushq $0
   4000a:	6a 00                	push   $0x0
        popfq
   4000c:	9d                   	popf   
        // Check for multiboot command line; if found pass it along.
        cmpl $0x2BADB002, %eax
   4000d:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
        jne 1f
   40012:	75 0d                	jne    40021 <entry_from_boot+0x21>
        testl $4, (%rbx)
   40014:	f7 03 04 00 00 00    	testl  $0x4,(%rbx)
        je 1f
   4001a:	74 05                	je     40021 <entry_from_boot+0x21>
        movl 16(%rbx), %edi
   4001c:	8b 7b 10             	mov    0x10(%rbx),%edi
        jmp 2f
   4001f:	eb 07                	jmp    40028 <entry_from_boot+0x28>
1:      movq $0, %rdi
   40021:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
2:      jmp kernel
   40028:	e9 3a 01 00 00       	jmp    40167 <kernel>
   4002d:	90                   	nop

000000000004002e <gpf_int_handler>:
# Interrupt handlers
.align 2

        .globl gpf_int_handler
gpf_int_handler:
        pushq $13               // trap number
   4002e:	6a 0d                	push   $0xd
        jmp generic_exception_handler
   40030:	eb 6e                	jmp    400a0 <generic_exception_handler>

0000000000040032 <pagefault_int_handler>:

        .globl pagefault_int_handler
pagefault_int_handler:
        pushq $14
   40032:	6a 0e                	push   $0xe
        jmp generic_exception_handler
   40034:	eb 6a                	jmp    400a0 <generic_exception_handler>

0000000000040036 <timer_int_handler>:

        .globl timer_int_handler
timer_int_handler:
        pushq $0                // error code
   40036:	6a 00                	push   $0x0
        pushq $32
   40038:	6a 20                	push   $0x20
        jmp generic_exception_handler
   4003a:	eb 64                	jmp    400a0 <generic_exception_handler>

000000000004003c <sys48_int_handler>:

sys48_int_handler:
        pushq $0
   4003c:	6a 00                	push   $0x0
        pushq $48
   4003e:	6a 30                	push   $0x30
        jmp generic_exception_handler
   40040:	eb 5e                	jmp    400a0 <generic_exception_handler>

0000000000040042 <sys49_int_handler>:

sys49_int_handler:
        pushq $0
   40042:	6a 00                	push   $0x0
        pushq $49
   40044:	6a 31                	push   $0x31
        jmp generic_exception_handler
   40046:	eb 58                	jmp    400a0 <generic_exception_handler>

0000000000040048 <sys50_int_handler>:

sys50_int_handler:
        pushq $0
   40048:	6a 00                	push   $0x0
        pushq $50
   4004a:	6a 32                	push   $0x32
        jmp generic_exception_handler
   4004c:	eb 52                	jmp    400a0 <generic_exception_handler>

000000000004004e <sys51_int_handler>:

sys51_int_handler:
        pushq $0
   4004e:	6a 00                	push   $0x0
        pushq $51
   40050:	6a 33                	push   $0x33
        jmp generic_exception_handler
   40052:	eb 4c                	jmp    400a0 <generic_exception_handler>

0000000000040054 <sys52_int_handler>:

sys52_int_handler:
        pushq $0
   40054:	6a 00                	push   $0x0
        pushq $52
   40056:	6a 34                	push   $0x34
        jmp generic_exception_handler
   40058:	eb 46                	jmp    400a0 <generic_exception_handler>

000000000004005a <sys53_int_handler>:

sys53_int_handler:
        pushq $0
   4005a:	6a 00                	push   $0x0
        pushq $53
   4005c:	6a 35                	push   $0x35
        jmp generic_exception_handler
   4005e:	eb 40                	jmp    400a0 <generic_exception_handler>

0000000000040060 <sys54_int_handler>:

sys54_int_handler:
        pushq $0
   40060:	6a 00                	push   $0x0
        pushq $54
   40062:	6a 36                	push   $0x36
        jmp generic_exception_handler
   40064:	eb 3a                	jmp    400a0 <generic_exception_handler>

0000000000040066 <sys55_int_handler>:

sys55_int_handler:
        pushq $0
   40066:	6a 00                	push   $0x0
        pushq $55
   40068:	6a 37                	push   $0x37
        jmp generic_exception_handler
   4006a:	eb 34                	jmp    400a0 <generic_exception_handler>

000000000004006c <sys56_int_handler>:

sys56_int_handler:
        pushq $0
   4006c:	6a 00                	push   $0x0
        pushq $56
   4006e:	6a 38                	push   $0x38
        jmp generic_exception_handler
   40070:	eb 2e                	jmp    400a0 <generic_exception_handler>

0000000000040072 <sys57_int_handler>:

sys57_int_handler:
        pushq $0
   40072:	6a 00                	push   $0x0
        pushq $57
   40074:	6a 39                	push   $0x39
        jmp generic_exception_handler
   40076:	eb 28                	jmp    400a0 <generic_exception_handler>

0000000000040078 <sys58_int_handler>:

sys58_int_handler:
        pushq $0
   40078:	6a 00                	push   $0x0
        pushq $58
   4007a:	6a 3a                	push   $0x3a
        jmp generic_exception_handler
   4007c:	eb 22                	jmp    400a0 <generic_exception_handler>

000000000004007e <sys59_int_handler>:

sys59_int_handler:
        pushq $0
   4007e:	6a 00                	push   $0x0
        pushq $59
   40080:	6a 3b                	push   $0x3b
        jmp generic_exception_handler
   40082:	eb 1c                	jmp    400a0 <generic_exception_handler>

0000000000040084 <sys60_int_handler>:

sys60_int_handler:
        pushq $0
   40084:	6a 00                	push   $0x0
        pushq $60
   40086:	6a 3c                	push   $0x3c
        jmp generic_exception_handler
   40088:	eb 16                	jmp    400a0 <generic_exception_handler>

000000000004008a <sys61_int_handler>:

sys61_int_handler:
        pushq $0
   4008a:	6a 00                	push   $0x0
        pushq $61
   4008c:	6a 3d                	push   $0x3d
        jmp generic_exception_handler
   4008e:	eb 10                	jmp    400a0 <generic_exception_handler>

0000000000040090 <sys62_int_handler>:

sys62_int_handler:
        pushq $0
   40090:	6a 00                	push   $0x0
        pushq $62
   40092:	6a 3e                	push   $0x3e
        jmp generic_exception_handler
   40094:	eb 0a                	jmp    400a0 <generic_exception_handler>

0000000000040096 <sys63_int_handler>:

sys63_int_handler:
        pushq $0
   40096:	6a 00                	push   $0x0
        pushq $63
   40098:	6a 3f                	push   $0x3f
        jmp generic_exception_handler
   4009a:	eb 04                	jmp    400a0 <generic_exception_handler>

000000000004009c <default_int_handler>:

        .globl default_int_handler
default_int_handler:
        pushq $0
   4009c:	6a 00                	push   $0x0
        jmp generic_exception_handler
   4009e:	eb 00                	jmp    400a0 <generic_exception_handler>

00000000000400a0 <generic_exception_handler>:


generic_exception_handler:
        pushq %gs
   400a0:	0f a8                	push   %gs
        pushq %fs
   400a2:	0f a0                	push   %fs
        pushq %r15
   400a4:	41 57                	push   %r15
        pushq %r14
   400a6:	41 56                	push   %r14
        pushq %r13
   400a8:	41 55                	push   %r13
        pushq %r12
   400aa:	41 54                	push   %r12
        pushq %r11
   400ac:	41 53                	push   %r11
        pushq %r10
   400ae:	41 52                	push   %r10
        pushq %r9
   400b0:	41 51                	push   %r9
        pushq %r8
   400b2:	41 50                	push   %r8
        pushq %rdi
   400b4:	57                   	push   %rdi
        pushq %rsi
   400b5:	56                   	push   %rsi
        pushq %rbp
   400b6:	55                   	push   %rbp
        pushq %rbx
   400b7:	53                   	push   %rbx
        pushq %rdx
   400b8:	52                   	push   %rdx
        pushq %rcx
   400b9:	51                   	push   %rcx
        pushq %rax
   400ba:	50                   	push   %rax
        movq %rsp, %rdi
   400bb:	48 89 e7             	mov    %rsp,%rdi
        call exception
   400be:	e8 2d 06 00 00       	call   406f0 <exception>

00000000000400c3 <exception_return>:
        # `exception` should never return.


        .globl exception_return
exception_return:
        movq %rdi, %rsp
   400c3:	48 89 fc             	mov    %rdi,%rsp
        popq %rax
   400c6:	58                   	pop    %rax
        popq %rcx
   400c7:	59                   	pop    %rcx
        popq %rdx
   400c8:	5a                   	pop    %rdx
        popq %rbx
   400c9:	5b                   	pop    %rbx
        popq %rbp
   400ca:	5d                   	pop    %rbp
        popq %rsi
   400cb:	5e                   	pop    %rsi
        popq %rdi
   400cc:	5f                   	pop    %rdi
        popq %r8
   400cd:	41 58                	pop    %r8
        popq %r9
   400cf:	41 59                	pop    %r9
        popq %r10
   400d1:	41 5a                	pop    %r10
        popq %r11
   400d3:	41 5b                	pop    %r11
        popq %r12
   400d5:	41 5c                	pop    %r12
        popq %r13
   400d7:	41 5d                	pop    %r13
        popq %r14
   400d9:	41 5e                	pop    %r14
        popq %r15
   400db:	41 5f                	pop    %r15
        popq %fs
   400dd:	0f a1                	pop    %fs
        popq %gs
   400df:	0f a9                	pop    %gs
        addq $16, %rsp
   400e1:	48 83 c4 10          	add    $0x10,%rsp
        iretq
   400e5:	48 cf                	iretq  

00000000000400e7 <sys_int_handlers>:
   400e7:	3c 00                	cmp    $0x0,%al
   400e9:	04 00                	add    $0x0,%al
   400eb:	00 00                	add    %al,(%rax)
   400ed:	00 00                	add    %al,(%rax)
   400ef:	42 00 04 00          	add    %al,(%rax,%r8,1)
   400f3:	00 00                	add    %al,(%rax)
   400f5:	00 00                	add    %al,(%rax)
   400f7:	48 00 04 00          	rex.W add %al,(%rax,%rax,1)
   400fb:	00 00                	add    %al,(%rax)
   400fd:	00 00                	add    %al,(%rax)
   400ff:	4e 00 04 00          	rex.WRX add %r8b,(%rax,%r8,1)
   40103:	00 00                	add    %al,(%rax)
   40105:	00 00                	add    %al,(%rax)
   40107:	54                   	push   %rsp
   40108:	00 04 00             	add    %al,(%rax,%rax,1)
   4010b:	00 00                	add    %al,(%rax)
   4010d:	00 00                	add    %al,(%rax)
   4010f:	5a                   	pop    %rdx
   40110:	00 04 00             	add    %al,(%rax,%rax,1)
   40113:	00 00                	add    %al,(%rax)
   40115:	00 00                	add    %al,(%rax)
   40117:	60                   	(bad)  
   40118:	00 04 00             	add    %al,(%rax,%rax,1)
   4011b:	00 00                	add    %al,(%rax)
   4011d:	00 00                	add    %al,(%rax)
   4011f:	66 00 04 00          	data16 add %al,(%rax,%rax,1)
   40123:	00 00                	add    %al,(%rax)
   40125:	00 00                	add    %al,(%rax)
   40127:	6c                   	insb   (%dx),%es:(%rdi)
   40128:	00 04 00             	add    %al,(%rax,%rax,1)
   4012b:	00 00                	add    %al,(%rax)
   4012d:	00 00                	add    %al,(%rax)
   4012f:	72 00                	jb     40131 <sys_int_handlers+0x4a>
   40131:	04 00                	add    $0x0,%al
   40133:	00 00                	add    %al,(%rax)
   40135:	00 00                	add    %al,(%rax)
   40137:	78 00                	js     40139 <sys_int_handlers+0x52>
   40139:	04 00                	add    $0x0,%al
   4013b:	00 00                	add    %al,(%rax)
   4013d:	00 00                	add    %al,(%rax)
   4013f:	7e 00                	jle    40141 <sys_int_handlers+0x5a>
   40141:	04 00                	add    $0x0,%al
   40143:	00 00                	add    %al,(%rax)
   40145:	00 00                	add    %al,(%rax)
   40147:	84 00                	test   %al,(%rax)
   40149:	04 00                	add    $0x0,%al
   4014b:	00 00                	add    %al,(%rax)
   4014d:	00 00                	add    %al,(%rax)
   4014f:	8a 00                	mov    (%rax),%al
   40151:	04 00                	add    $0x0,%al
   40153:	00 00                	add    %al,(%rax)
   40155:	00 00                	add    %al,(%rax)
   40157:	90                   	nop
   40158:	00 04 00             	add    %al,(%rax,%rax,1)
   4015b:	00 00                	add    %al,(%rax)
   4015d:	00 00                	add    %al,(%rax)
   4015f:	96                   	xchg   %eax,%esi
   40160:	00 04 00             	add    %al,(%rax,%rax,1)
   40163:	00 00                	add    %al,(%rax)
	...

0000000000040167 <kernel>:
//    string is an optional string passed from the boot loader.

static void process_setup(pid_t pid, int program_number);

void kernel(const char *command)
{
   40167:	f3 0f 1e fa          	endbr64 
   4016b:	55                   	push   %rbp
   4016c:	48 89 e5             	mov    %rsp,%rbp
   4016f:	48 83 ec 20          	sub    $0x20,%rsp
   40173:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    hardware_init();
   40177:	e8 85 15 00 00       	call   41701 <hardware_init>
    pageinfo_init();
   4017c:	e8 85 0a 00 00       	call   40c06 <pageinfo_init>
    console_clear();
   40181:	e8 10 42 00 00       	call   44396 <console_clear>
    timer_init(HZ);
   40186:	bf 64 00 00 00       	mov    $0x64,%edi
   4018b:	e8 d9 1a 00 00       	call   41c69 <timer_init>

    // Set up process descriptors
    memset(processes, 0, sizeof(processes));
   40190:	ba 00 0e 00 00       	mov    $0xe00,%edx
   40195:	be 00 00 00 00       	mov    $0x0,%esi
   4019a:	48 8d 05 7f 0e 01 00 	lea    0x10e7f(%rip),%rax        # 51020 <processes>
   401a1:	48 89 c7             	mov    %rax,%rdi
   401a4:	e8 38 32 00 00       	call   433e1 <memset>
    for (pid_t i = 0; i < NPROC; i++)
   401a9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   401b0:	eb 4d                	jmp    401ff <kernel+0x98>
    {
        processes[i].p_pid = i;
   401b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
   401b5:	48 63 d0             	movslq %eax,%rdx
   401b8:	48 89 d0             	mov    %rdx,%rax
   401bb:	48 c1 e0 03          	shl    $0x3,%rax
   401bf:	48 29 d0             	sub    %rdx,%rax
   401c2:	48 c1 e0 05          	shl    $0x5,%rax
   401c6:	48 89 c1             	mov    %rax,%rcx
   401c9:	48 8d 15 50 0e 01 00 	lea    0x10e50(%rip),%rdx        # 51020 <processes>
   401d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
   401d3:	89 04 11             	mov    %eax,(%rcx,%rdx,1)
        processes[i].p_state = P_FREE;
   401d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
   401d9:	48 63 d0             	movslq %eax,%rdx
   401dc:	48 89 d0             	mov    %rdx,%rax
   401df:	48 c1 e0 03          	shl    $0x3,%rax
   401e3:	48 29 d0             	sub    %rdx,%rax
   401e6:	48 c1 e0 05          	shl    $0x5,%rax
   401ea:	48 89 c2             	mov    %rax,%rdx
   401ed:	48 8d 05 f4 0e 01 00 	lea    0x10ef4(%rip),%rax        # 510e8 <processes+0xc8>
   401f4:	c7 04 02 00 00 00 00 	movl   $0x0,(%rdx,%rax,1)
    for (pid_t i = 0; i < NPROC; i++)
   401fb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   401ff:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   40203:	7e ad                	jle    401b2 <kernel+0x4b>
    }
    // Not sure if the second thing is right, the physical address.
    virtual_memory_map(kernel_pagetable, (uintptr_t)0, (uintptr_t)0, PROC_START_ADDR, PTE_P | PTE_W);
   40205:	48 8b 05 f4 3d 01 00 	mov    0x13df4(%rip),%rax        # 54000 <kernel_pagetable>
   4020c:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   40212:	b9 00 00 10 00       	mov    $0x100000,%ecx
   40217:	ba 00 00 00 00       	mov    $0x0,%edx
   4021c:	be 00 00 00 00       	mov    $0x0,%esi
   40221:	48 89 c7             	mov    %rax,%rdi
   40224:	e8 ad 28 00 00       	call   42ad6 <virtual_memory_map>
    virtual_memory_map(kernel_pagetable, (uintptr_t)CONSOLE_ADDR, (uintptr_t)CONSOLE_ADDR, PAGESIZE, PTE_P | PTE_W | PTE_U);
   40229:	48 8d 15 d0 7d 07 00 	lea    0x77dd0(%rip),%rdx        # b8000 <console>
   40230:	48 8d 35 c9 7d 07 00 	lea    0x77dc9(%rip),%rsi        # b8000 <console>
   40237:	48 8b 05 c2 3d 01 00 	mov    0x13dc2(%rip),%rax        # 54000 <kernel_pagetable>
   4023e:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40244:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40249:	48 89 c7             	mov    %rax,%rdi
   4024c:	e8 85 28 00 00       	call   42ad6 <virtual_memory_map>
    if (command && strcmp(command, "fork") == 0)
   40251:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40256:	74 2e                	je     40286 <kernel+0x11f>
   40258:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4025c:	48 8d 15 7d 41 00 00 	lea    0x417d(%rip),%rdx        # 443e0 <console_clear+0x4a>
   40263:	48 89 d6             	mov    %rdx,%rsi
   40266:	48 89 c7             	mov    %rax,%rdi
   40269:	e8 7c 32 00 00       	call   434ea <strcmp>
   4026e:	85 c0                	test   %eax,%eax
   40270:	75 14                	jne    40286 <kernel+0x11f>
    {
        process_setup(1, 4);
   40272:	be 04 00 00 00       	mov    $0x4,%esi
   40277:	bf 01 00 00 00       	mov    $0x1,%edi
   4027c:	e8 e5 00 00 00       	call   40366 <process_setup>
   40281:	e9 d1 00 00 00       	jmp    40357 <kernel+0x1f0>
    }
    else if (command && strcmp(command, "forkexit") == 0)
   40286:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   4028b:	74 2e                	je     402bb <kernel+0x154>
   4028d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40291:	48 8d 15 4d 41 00 00 	lea    0x414d(%rip),%rdx        # 443e5 <console_clear+0x4f>
   40298:	48 89 d6             	mov    %rdx,%rsi
   4029b:	48 89 c7             	mov    %rax,%rdi
   4029e:	e8 47 32 00 00       	call   434ea <strcmp>
   402a3:	85 c0                	test   %eax,%eax
   402a5:	75 14                	jne    402bb <kernel+0x154>
    {
        process_setup(1, 5);
   402a7:	be 05 00 00 00       	mov    $0x5,%esi
   402ac:	bf 01 00 00 00       	mov    $0x1,%edi
   402b1:	e8 b0 00 00 00       	call   40366 <process_setup>
   402b6:	e9 9c 00 00 00       	jmp    40357 <kernel+0x1f0>
    }
    else if (command && strcmp(command, "test") == 0)
   402bb:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402c0:	74 2b                	je     402ed <kernel+0x186>
   402c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402c6:	48 8d 15 21 41 00 00 	lea    0x4121(%rip),%rdx        # 443ee <console_clear+0x58>
   402cd:	48 89 d6             	mov    %rdx,%rsi
   402d0:	48 89 c7             	mov    %rax,%rdi
   402d3:	e8 12 32 00 00       	call   434ea <strcmp>
   402d8:	85 c0                	test   %eax,%eax
   402da:	75 11                	jne    402ed <kernel+0x186>
    {
        process_setup(1, 6);
   402dc:	be 06 00 00 00       	mov    $0x6,%esi
   402e1:	bf 01 00 00 00       	mov    $0x1,%edi
   402e6:	e8 7b 00 00 00       	call   40366 <process_setup>
   402eb:	eb 6a                	jmp    40357 <kernel+0x1f0>
    }
    else if (command && strcmp(command, "test2") == 0)
   402ed:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402f2:	74 3e                	je     40332 <kernel+0x1cb>
   402f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402f8:	48 8d 15 f4 40 00 00 	lea    0x40f4(%rip),%rdx        # 443f3 <console_clear+0x5d>
   402ff:	48 89 d6             	mov    %rdx,%rsi
   40302:	48 89 c7             	mov    %rax,%rdi
   40305:	e8 e0 31 00 00       	call   434ea <strcmp>
   4030a:	85 c0                	test   %eax,%eax
   4030c:	75 24                	jne    40332 <kernel+0x1cb>
    {
        for (pid_t i = 1; i <= 2; ++i)
   4030e:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
   40315:	eb 13                	jmp    4032a <kernel+0x1c3>
        {
            process_setup(i, 6);
   40317:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4031a:	be 06 00 00 00       	mov    $0x6,%esi
   4031f:	89 c7                	mov    %eax,%edi
   40321:	e8 40 00 00 00       	call   40366 <process_setup>
        for (pid_t i = 1; i <= 2; ++i)
   40326:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   4032a:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
   4032e:	7e e7                	jle    40317 <kernel+0x1b0>
   40330:	eb 25                	jmp    40357 <kernel+0x1f0>
        }
    }
    else
    {
        for (pid_t i = 1; i <= 4; ++i)
   40332:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%rbp)
   40339:	eb 16                	jmp    40351 <kernel+0x1ea>
        {
            process_setup(i, i - 1);
   4033b:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4033e:	8d 50 ff             	lea    -0x1(%rax),%edx
   40341:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40344:	89 d6                	mov    %edx,%esi
   40346:	89 c7                	mov    %eax,%edi
   40348:	e8 19 00 00 00       	call   40366 <process_setup>
        for (pid_t i = 1; i <= 4; ++i)
   4034d:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   40351:	83 7d f4 04          	cmpl   $0x4,-0xc(%rbp)
   40355:	7e e4                	jle    4033b <kernel+0x1d4>
        }
    }

    // Switch to the first process using run()
    run(&processes[1]);
   40357:	48 8d 05 a2 0d 01 00 	lea    0x10da2(%rip),%rax        # 51100 <processes+0xe0>
   4035e:	48 89 c7             	mov    %rax,%rdi
   40361:	e8 35 08 00 00       	call   40b9b <run>

0000000000040366 <process_setup>:
//    Load application program `program_number` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

void process_setup(pid_t pid, int program_number)
{
   40366:	f3 0f 1e fa          	endbr64 
   4036a:	55                   	push   %rbp
   4036b:	48 89 e5             	mov    %rsp,%rbp
   4036e:	48 83 ec 20          	sub    $0x20,%rsp
   40372:	89 7d ec             	mov    %edi,-0x14(%rbp)
   40375:	89 75 e8             	mov    %esi,-0x18(%rbp)
    process_init(&processes[pid], 0);
   40378:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4037b:	48 63 d0             	movslq %eax,%rdx
   4037e:	48 89 d0             	mov    %rdx,%rax
   40381:	48 c1 e0 03          	shl    $0x3,%rax
   40385:	48 29 d0             	sub    %rdx,%rax
   40388:	48 c1 e0 05          	shl    $0x5,%rax
   4038c:	48 8d 15 8d 0c 01 00 	lea    0x10c8d(%rip),%rdx        # 51020 <processes>
   40393:	48 01 d0             	add    %rdx,%rax
   40396:	be 00 00 00 00       	mov    $0x0,%esi
   4039b:	48 89 c7             	mov    %rax,%rdi
   4039e:	e8 79 1b 00 00       	call   41f1c <process_init>
    processes[pid].p_pagetable = kernel_pagetable;
   403a3:	48 8b 15 56 3c 01 00 	mov    0x13c56(%rip),%rdx        # 54000 <kernel_pagetable>
   403aa:	8b 45 ec             	mov    -0x14(%rbp),%eax
   403ad:	48 63 c8             	movslq %eax,%rcx
   403b0:	48 89 c8             	mov    %rcx,%rax
   403b3:	48 c1 e0 03          	shl    $0x3,%rax
   403b7:	48 29 c8             	sub    %rcx,%rax
   403ba:	48 c1 e0 05          	shl    $0x5,%rax
   403be:	48 89 c1             	mov    %rax,%rcx
   403c1:	48 8d 05 28 0d 01 00 	lea    0x10d28(%rip),%rax        # 510f0 <processes+0xd0>
   403c8:	48 89 14 01          	mov    %rdx,(%rcx,%rax,1)
    ++pageinfo[PAGENUMBER(kernel_pagetable)].refcount; // increase refcount since kernel_pagetable was used
   403cc:	48 8b 05 2d 3c 01 00 	mov    0x13c2d(%rip),%rax        # 54000 <kernel_pagetable>
   403d3:	48 c1 e8 0c          	shr    $0xc,%rax
   403d7:	48 63 d0             	movslq %eax,%rdx
   403da:	48 8d 0c 12          	lea    (%rdx,%rdx,1),%rcx
   403de:	48 8d 15 5c 1a 01 00 	lea    0x11a5c(%rip),%rdx        # 51e41 <pageinfo+0x1>
   403e5:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   403e9:	83 c2 01             	add    $0x1,%edx
   403ec:	89 d1                	mov    %edx,%ecx
   403ee:	48 98                	cltq   
   403f0:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   403f4:	48 8d 05 46 1a 01 00 	lea    0x11a46(%rip),%rax        # 51e41 <pageinfo+0x1>
   403fb:	88 0c 02             	mov    %cl,(%rdx,%rax,1)

    int r = program_load(&processes[pid], program_number, NULL);
   403fe:	8b 45 ec             	mov    -0x14(%rbp),%eax
   40401:	48 63 d0             	movslq %eax,%rdx
   40404:	48 89 d0             	mov    %rdx,%rax
   40407:	48 c1 e0 03          	shl    $0x3,%rax
   4040b:	48 29 d0             	sub    %rdx,%rax
   4040e:	48 c1 e0 05          	shl    $0x5,%rax
   40412:	48 8d 15 07 0c 01 00 	lea    0x10c07(%rip),%rdx        # 51020 <processes>
   40419:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
   4041d:	8b 45 e8             	mov    -0x18(%rbp),%eax
   40420:	ba 00 00 00 00       	mov    $0x0,%edx
   40425:	89 c6                	mov    %eax,%esi
   40427:	48 89 cf             	mov    %rcx,%rdi
   4042a:	e8 e6 2b 00 00       	call   43015 <program_load>
   4042f:	89 45 fc             	mov    %eax,-0x4(%rbp)
    assert(r >= 0);
   40432:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40436:	79 1e                	jns    40456 <process_setup+0xf0>
   40438:	48 8d 05 ba 3f 00 00 	lea    0x3fba(%rip),%rax        # 443f9 <console_clear+0x63>
   4043f:	48 89 c2             	mov    %rax,%rdx
   40442:	be 8f 00 00 00       	mov    $0x8f,%esi
   40447:	48 8d 05 b2 3f 00 00 	lea    0x3fb2(%rip),%rax        # 44400 <console_clear+0x6a>
   4044e:	48 89 c7             	mov    %rax,%rdi
   40451:	e8 fc 22 00 00       	call   42752 <assert_fail>

    processes[pid].p_registers.reg_rsp = PROC_START_ADDR + PROC_SIZE * pid;
   40456:	8b 45 ec             	mov    -0x14(%rbp),%eax
   40459:	83 c0 04             	add    $0x4,%eax
   4045c:	c1 e0 12             	shl    $0x12,%eax
   4045f:	48 63 d0             	movslq %eax,%rdx
   40462:	8b 45 ec             	mov    -0x14(%rbp),%eax
   40465:	48 63 c8             	movslq %eax,%rcx
   40468:	48 89 c8             	mov    %rcx,%rax
   4046b:	48 c1 e0 03          	shl    $0x3,%rax
   4046f:	48 29 c8             	sub    %rcx,%rax
   40472:	48 c1 e0 05          	shl    $0x5,%rax
   40476:	48 89 c1             	mov    %rax,%rcx
   40479:	48 8d 05 58 0c 01 00 	lea    0x10c58(%rip),%rax        # 510d8 <processes+0xb8>
   40480:	48 89 14 01          	mov    %rdx,(%rcx,%rax,1)
    uintptr_t stack_page = processes[pid].p_registers.reg_rsp - PAGESIZE;
   40484:	8b 45 ec             	mov    -0x14(%rbp),%eax
   40487:	48 63 d0             	movslq %eax,%rdx
   4048a:	48 89 d0             	mov    %rdx,%rax
   4048d:	48 c1 e0 03          	shl    $0x3,%rax
   40491:	48 29 d0             	sub    %rdx,%rax
   40494:	48 c1 e0 05          	shl    $0x5,%rax
   40498:	48 89 c2             	mov    %rax,%rdx
   4049b:	48 8d 05 36 0c 01 00 	lea    0x10c36(%rip),%rax        # 510d8 <processes+0xb8>
   404a2:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   404a6:	48 2d 00 10 00 00    	sub    $0x1000,%rax
   404ac:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    assign_physical_page(stack_page, pid);
   404b0:	8b 45 ec             	mov    -0x14(%rbp),%eax
   404b3:	0f be d0             	movsbl %al,%edx
   404b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   404ba:	89 d6                	mov    %edx,%esi
   404bc:	48 89 c7             	mov    %rax,%rdi
   404bf:	e8 65 00 00 00       	call   40529 <assign_physical_page>
    virtual_memory_map(processes[pid].p_pagetable, stack_page, stack_page,
   404c4:	8b 45 ec             	mov    -0x14(%rbp),%eax
   404c7:	48 63 d0             	movslq %eax,%rdx
   404ca:	48 89 d0             	mov    %rdx,%rax
   404cd:	48 c1 e0 03          	shl    $0x3,%rax
   404d1:	48 29 d0             	sub    %rdx,%rax
   404d4:	48 c1 e0 05          	shl    $0x5,%rax
   404d8:	48 89 c2             	mov    %rax,%rdx
   404db:	48 8d 05 0e 0c 01 00 	lea    0x10c0e(%rip),%rax        # 510f0 <processes+0xd0>
   404e2:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   404e6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   404ea:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   404ee:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   404f4:	b9 00 10 00 00       	mov    $0x1000,%ecx
   404f9:	48 89 c7             	mov    %rax,%rdi
   404fc:	e8 d5 25 00 00       	call   42ad6 <virtual_memory_map>
                       PAGESIZE, PTE_P | PTE_W | PTE_U);
    processes[pid].p_state = P_RUNNABLE;
   40501:	8b 45 ec             	mov    -0x14(%rbp),%eax
   40504:	48 63 d0             	movslq %eax,%rdx
   40507:	48 89 d0             	mov    %rdx,%rax
   4050a:	48 c1 e0 03          	shl    $0x3,%rax
   4050e:	48 29 d0             	sub    %rdx,%rax
   40511:	48 c1 e0 05          	shl    $0x5,%rax
   40515:	48 89 c2             	mov    %rax,%rdx
   40518:	48 8d 05 c9 0b 01 00 	lea    0x10bc9(%rip),%rax        # 510e8 <processes+0xc8>
   4051f:	c7 04 02 01 00 00 00 	movl   $0x1,(%rdx,%rax,1)
}
   40526:	90                   	nop
   40527:	c9                   	leave  
   40528:	c3                   	ret    

0000000000040529 <assign_physical_page>:
//    Allocates the page with physical address `addr` to the given owner.
//    Fails if physical page `addr` was already allocated. Returns 0 on
//    success and -1 on failure. Used by the program loader.

int assign_physical_page(uintptr_t addr, int8_t owner)
{
   40529:	f3 0f 1e fa          	endbr64 
   4052d:	55                   	push   %rbp
   4052e:	48 89 e5             	mov    %rsp,%rbp
   40531:	48 83 ec 10          	sub    $0x10,%rsp
   40535:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   40539:	89 f0                	mov    %esi,%eax
   4053b:	88 45 f4             	mov    %al,-0xc(%rbp)
    if ((addr & 0xFFF) != 0 || addr >= MEMSIZE_PHYSICAL || pageinfo[PAGENUMBER(addr)].refcount != 0)
   4053e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40542:	25 ff 0f 00 00       	and    $0xfff,%eax
   40547:	48 85 c0             	test   %rax,%rax
   4054a:	75 27                	jne    40573 <assign_physical_page+0x4a>
   4054c:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   40553:	00 
   40554:	77 1d                	ja     40573 <assign_physical_page+0x4a>
   40556:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4055a:	48 c1 e8 0c          	shr    $0xc,%rax
   4055e:	48 98                	cltq   
   40560:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40564:	48 8d 05 d6 18 01 00 	lea    0x118d6(%rip),%rax        # 51e41 <pageinfo+0x1>
   4056b:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4056f:	84 c0                	test   %al,%al
   40571:	74 07                	je     4057a <assign_physical_page+0x51>
    {
        return -1;
   40573:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   40578:	eb 3a                	jmp    405b4 <assign_physical_page+0x8b>
    }
    else
    {
        pageinfo[PAGENUMBER(addr)].refcount = 1;
   4057a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4057e:	48 c1 e8 0c          	shr    $0xc,%rax
   40582:	48 98                	cltq   
   40584:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40588:	48 8d 05 b2 18 01 00 	lea    0x118b2(%rip),%rax        # 51e41 <pageinfo+0x1>
   4058f:	c6 04 02 01          	movb   $0x1,(%rdx,%rax,1)
        pageinfo[PAGENUMBER(addr)].owner = owner;
   40593:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40597:	48 c1 e8 0c          	shr    $0xc,%rax
   4059b:	48 98                	cltq   
   4059d:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   405a1:	48 8d 15 98 18 01 00 	lea    0x11898(%rip),%rdx        # 51e40 <pageinfo>
   405a8:	0f b6 45 f4          	movzbl -0xc(%rbp),%eax
   405ac:	88 04 11             	mov    %al,(%rcx,%rdx,1)
        return 0;
   405af:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   405b4:	c9                   	leave  
   405b5:	c3                   	ret    

00000000000405b6 <syscall_mapping>:

void syscall_mapping(proc *p)
{
   405b6:	f3 0f 1e fa          	endbr64 
   405ba:	55                   	push   %rbp
   405bb:	48 89 e5             	mov    %rsp,%rbp
   405be:	48 83 ec 70          	sub    $0x70,%rsp
   405c2:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)

    uintptr_t mapping_ptr = p->p_registers.reg_rdi;
   405c6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   405ca:	48 8b 40 38          	mov    0x38(%rax),%rax
   405ce:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    uintptr_t ptr = p->p_registers.reg_rsi;
   405d2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   405d6:	48 8b 40 30          	mov    0x30(%rax),%rax
   405da:	48 89 45 f0          	mov    %rax,-0x10(%rbp)

    // convert to physical address so kernel can write to it
    vamapping map = virtual_memory_lookup(p->p_pagetable, mapping_ptr);
   405de:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   405e2:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   405e9:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   405ed:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   405f1:	48 89 ce             	mov    %rcx,%rsi
   405f4:	48 89 c7             	mov    %rax,%rdi
   405f7:	e8 1e 29 00 00       	call   42f1a <virtual_memory_lookup>

    // check for write access
    if ((map.perm & (PTE_W | PTE_U)) != (PTE_W | PTE_U))
   405fc:	8b 45 e0             	mov    -0x20(%rbp),%eax
   405ff:	48 98                	cltq   
   40601:	83 e0 06             	and    $0x6,%eax
   40604:	48 83 f8 06          	cmp    $0x6,%rax
   40608:	75 73                	jne    4067d <syscall_mapping+0xc7>
        return;
    uintptr_t endaddr = mapping_ptr + sizeof(vamapping) - 1;
   4060a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4060e:	48 83 c0 17          	add    $0x17,%rax
   40612:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    // check for write access for end address
    vamapping end_map = virtual_memory_lookup(p->p_pagetable, endaddr);
   40616:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4061a:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40621:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
   40625:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   40629:	48 89 ce             	mov    %rcx,%rsi
   4062c:	48 89 c7             	mov    %rax,%rdi
   4062f:	e8 e6 28 00 00       	call   42f1a <virtual_memory_lookup>
    if ((end_map.perm & (PTE_W | PTE_P)) != (PTE_W | PTE_P))
   40634:	8b 45 c8             	mov    -0x38(%rbp),%eax
   40637:	48 98                	cltq   
   40639:	83 e0 03             	and    $0x3,%eax
   4063c:	48 83 f8 03          	cmp    $0x3,%rax
   40640:	75 3e                	jne    40680 <syscall_mapping+0xca>
        return;
    // find the actual mapping now
    vamapping ptr_lookup = virtual_memory_lookup(p->p_pagetable, ptr);
   40642:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40646:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   4064d:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40651:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40655:	48 89 ce             	mov    %rcx,%rsi
   40658:	48 89 c7             	mov    %rax,%rdi
   4065b:	e8 ba 28 00 00       	call   42f1a <virtual_memory_lookup>
    memcpy((void *)map.pa, &ptr_lookup, sizeof(vamapping));
   40660:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40664:	48 89 c1             	mov    %rax,%rcx
   40667:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   4066b:	ba 18 00 00 00       	mov    $0x18,%edx
   40670:	48 89 c6             	mov    %rax,%rsi
   40673:	48 89 cf             	mov    %rcx,%rdi
   40676:	e8 60 2c 00 00       	call   432db <memcpy>
   4067b:	eb 04                	jmp    40681 <syscall_mapping+0xcb>
        return;
   4067d:	90                   	nop
   4067e:	eb 01                	jmp    40681 <syscall_mapping+0xcb>
        return;
   40680:	90                   	nop
}
   40681:	c9                   	leave  
   40682:	c3                   	ret    

0000000000040683 <syscall_mem_tog>:

void syscall_mem_tog(proc *process)
{
   40683:	f3 0f 1e fa          	endbr64 
   40687:	55                   	push   %rbp
   40688:	48 89 e5             	mov    %rsp,%rbp
   4068b:	48 83 ec 18          	sub    $0x18,%rsp
   4068f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)

    pid_t p = process->p_registers.reg_rdi;
   40693:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40697:	48 8b 40 38          	mov    0x38(%rax),%rax
   4069b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (p == 0)
   4069e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   406a2:	75 14                	jne    406b8 <syscall_mem_tog+0x35>
    {
        disp_global = !disp_global;
   406a4:	0f b6 05 55 49 00 00 	movzbl 0x4955(%rip),%eax        # 45000 <disp_global>
   406ab:	84 c0                	test   %al,%al
   406ad:	0f 94 c0             	sete   %al
   406b0:	88 05 4a 49 00 00    	mov    %al,0x494a(%rip)        # 45000 <disp_global>
   406b6:	eb 36                	jmp    406ee <syscall_mem_tog+0x6b>
    }
    else
    {
        if (p < 0 || p > NPROC || p != process->p_pid)
   406b8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   406bc:	78 2f                	js     406ed <syscall_mem_tog+0x6a>
   406be:	83 7d fc 10          	cmpl   $0x10,-0x4(%rbp)
   406c2:	7f 29                	jg     406ed <syscall_mem_tog+0x6a>
   406c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   406c8:	8b 00                	mov    (%rax),%eax
   406ca:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   406cd:	75 1e                	jne    406ed <syscall_mem_tog+0x6a>
            return;
        process->display_status = !(process->display_status);
   406cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   406d3:	0f b6 80 d8 00 00 00 	movzbl 0xd8(%rax),%eax
   406da:	84 c0                	test   %al,%al
   406dc:	0f 94 c0             	sete   %al
   406df:	89 c2                	mov    %eax,%edx
   406e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   406e5:	88 90 d8 00 00 00    	mov    %dl,0xd8(%rax)
   406eb:	eb 01                	jmp    406ee <syscall_mem_tog+0x6b>
            return;
   406ed:	90                   	nop
    }
}
   406ee:	c9                   	leave  
   406ef:	c3                   	ret    

00000000000406f0 <exception>:
//    then calls exception().
//
//    Note that hardware interrupts are disabled whenever the kernel is running.

void exception(x86_64_registers *reg)
{
   406f0:	f3 0f 1e fa          	endbr64 
   406f4:	55                   	push   %rbp
   406f5:	48 89 e5             	mov    %rsp,%rbp
   406f8:	48 81 ec 20 01 00 00 	sub    $0x120,%rsp
   406ff:	48 89 bd e8 fe ff ff 	mov    %rdi,-0x118(%rbp)
    // Copy the saved registers into the `current` process descriptor
    // and always use the kernel's page table.
    current->p_registers = *reg;
   40706:	48 8b 05 f3 08 01 00 	mov    0x108f3(%rip),%rax        # 51000 <current>
   4070d:	48 8b 95 e8 fe ff ff 	mov    -0x118(%rbp),%rdx
   40714:	48 83 c0 08          	add    $0x8,%rax
   40718:	48 89 d6             	mov    %rdx,%rsi
   4071b:	ba 18 00 00 00       	mov    $0x18,%edx
   40720:	48 89 c7             	mov    %rax,%rdi
   40723:	48 89 d1             	mov    %rdx,%rcx
   40726:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    set_pagetable(kernel_pagetable);
   40729:	48 8b 05 d0 38 01 00 	mov    0x138d0(%rip),%rax        # 54000 <kernel_pagetable>
   40730:	48 89 c7             	mov    %rax,%rdi
   40733:	e8 2c 22 00 00       	call   42964 <set_pagetable>
    // Events logged this way are stored in the host's `log.txt` file.
    /*log_printf("proc %d: exception %d\n", current->p_pid, reg->reg_intno);*/

    // Show the current cursor location and memory state
    // (unless this is a kernel fault).
    console_show_cursor(cursorpos);
   40738:	8b 05 be 88 07 00    	mov    0x788be(%rip),%eax        # b8ffc <cursorpos>
   4073e:	89 c7                	mov    %eax,%edi
   40740:	e8 a5 18 00 00       	call   41fea <console_show_cursor>
    if ((reg->reg_intno != INT_PAGEFAULT && reg->reg_intno != INT_GPF) // no error due to pagefault or general fault
   40745:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   4074c:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40753:	48 83 f8 0e          	cmp    $0xe,%rax
   40757:	74 14                	je     4076d <exception+0x7d>
   40759:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   40760:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40767:	48 83 f8 0d          	cmp    $0xd,%rax
   4076b:	75 16                	jne    40783 <exception+0x93>
        || (reg->reg_err & PFERR_USER))                                // pagefault error in user mode
   4076d:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   40774:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   4077b:	83 e0 04             	and    $0x4,%eax
   4077e:	48 85 c0             	test   %rax,%rax
   40781:	74 1a                	je     4079d <exception+0xad>
    {
        check_virtual_memory();
   40783:	e8 a8 08 00 00       	call   41030 <check_virtual_memory>
        if (disp_global)
   40788:	0f b6 05 71 48 00 00 	movzbl 0x4871(%rip),%eax        # 45000 <disp_global>
   4078f:	84 c0                	test   %al,%al
   40791:	74 0a                	je     4079d <exception+0xad>
        {
            memshow_physical();
   40793:	e8 61 0a 00 00       	call   411f9 <memshow_physical>
            memshow_virtual_animate();
   40798:	e8 fe 0d 00 00       	call   4159b <memshow_virtual_animate>
        }
    }

    // If Control-C was typed, exit the virtual machine.
    check_keyboard();
   4079d:	e8 5e 1d 00 00       	call   42500 <check_keyboard>

    // Actually handle the exception.
    switch (reg->reg_intno)
   407a2:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   407a9:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   407b0:	48 83 e8 0e          	sub    $0xe,%rax
   407b4:	48 83 f8 2a          	cmp    $0x2a,%rax
   407b8:	0f 87 25 03 00 00    	ja     40ae3 <exception+0x3f3>
   407be:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
   407c5:	00 
   407c6:	48 8d 05 d3 3c 00 00 	lea    0x3cd3(%rip),%rax        # 444a0 <console_clear+0x10a>
   407cd:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   407d0:	48 98                	cltq   
   407d2:	48 8d 15 c7 3c 00 00 	lea    0x3cc7(%rip),%rdx        # 444a0 <console_clear+0x10a>
   407d9:	48 01 d0             	add    %rdx,%rax
   407dc:	3e ff e0             	notrack jmp *%rax

    case INT_SYS_PANIC:
        // rdi stores pointer for msg string
        {
            char msg[160];
            uintptr_t addr = current->p_registers.reg_rdi;
   407df:	48 8b 05 1a 08 01 00 	mov    0x1081a(%rip),%rax        # 51000 <current>
   407e6:	48 8b 40 38          	mov    0x38(%rax),%rax
   407ea:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
            if ((void *)addr == NULL)
   407ee:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   407f3:	75 0f                	jne    40804 <exception+0x114>
                panic(NULL);
   407f5:	bf 00 00 00 00       	mov    $0x0,%edi
   407fa:	b8 00 00 00 00       	mov    $0x0,%eax
   407ff:	e8 5e 1e 00 00       	call   42662 <panic>
            vamapping map = virtual_memory_lookup(current->p_pagetable, addr);
   40804:	48 8b 05 f5 07 01 00 	mov    0x107f5(%rip),%rax        # 51000 <current>
   4080b:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40812:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
   40816:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   4081a:	48 89 ce             	mov    %rcx,%rsi
   4081d:	48 89 c7             	mov    %rax,%rdi
   40820:	e8 f5 26 00 00       	call   42f1a <virtual_memory_lookup>
            memcpy(msg, (void *)map.pa, 160);
   40825:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40829:	48 89 c1             	mov    %rax,%rcx
   4082c:	48 8d 85 f8 fe ff ff 	lea    -0x108(%rbp),%rax
   40833:	ba a0 00 00 00       	mov    $0xa0,%edx
   40838:	48 89 ce             	mov    %rcx,%rsi
   4083b:	48 89 c7             	mov    %rax,%rdi
   4083e:	e8 98 2a 00 00       	call   432db <memcpy>
            panic(msg);
   40843:	48 8d 85 f8 fe ff ff 	lea    -0x108(%rbp),%rax
   4084a:	48 89 c7             	mov    %rax,%rdi
   4084d:	b8 00 00 00 00       	mov    $0x0,%eax
   40852:	e8 0b 1e 00 00       	call   42662 <panic>
        }
        panic(NULL);
        break; // will not be reached

    case INT_SYS_GETPID:
        current->p_registers.reg_rax = current->p_pid;
   40857:	48 8b 05 a2 07 01 00 	mov    0x107a2(%rip),%rax        # 51000 <current>
   4085e:	8b 10                	mov    (%rax),%edx
   40860:	48 8b 05 99 07 01 00 	mov    0x10799(%rip),%rax        # 51000 <current>
   40867:	48 63 d2             	movslq %edx,%rdx
   4086a:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   4086e:	e9 80 02 00 00       	jmp    40af3 <exception+0x403>

    case INT_SYS_YIELD:
        schedule();
   40873:	e8 a4 02 00 00       	call   40b1c <schedule>
        break; /* will not be reached */
   40878:	e9 76 02 00 00       	jmp    40af3 <exception+0x403>

    case INT_SYS_PAGE_ALLOC:
    {
        uintptr_t addr = current->p_registers.reg_rdi;
   4087d:	48 8b 05 7c 07 01 00 	mov    0x1077c(%rip),%rax        # 51000 <current>
   40884:	48 8b 40 38          	mov    0x38(%rax),%rax
   40888:	48 89 45 f8          	mov    %rax,-0x8(%rbp)

        if ((addr & 0xFFF) != 0)
   4088c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40890:	25 ff 0f 00 00       	and    $0xfff,%eax
   40895:	48 85 c0             	test   %rax,%rax
   40898:	74 14                	je     408ae <exception+0x1be>
        { // Check if page-aligned
            current->p_registers.reg_rax = -1;
   4089a:	48 8b 05 5f 07 01 00 	mov    0x1075f(%rip),%rax        # 51000 <current>
   408a1:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   408a8:	ff 
            break;
   408a9:	e9 45 02 00 00       	jmp    40af3 <exception+0x403>
        }
        if (addr < PROC_START_ADDR && addr != CONSOLE_ADDR)
   408ae:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   408b5:	00 
   408b6:	77 21                	ja     408d9 <exception+0x1e9>
   408b8:	48 8d 05 41 77 07 00 	lea    0x77741(%rip),%rax        # b8000 <console>
   408bf:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   408c3:	74 14                	je     408d9 <exception+0x1e9>
        {
            current->p_registers.reg_rax = -1;
   408c5:	48 8b 05 34 07 01 00 	mov    0x10734(%rip),%rax        # 51000 <current>
   408cc:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   408d3:	ff 
            break;
   408d4:	e9 1a 02 00 00       	jmp    40af3 <exception+0x403>
        }
        // Check if address is below max virtual memory size
        if (addr >= MEMSIZE_VIRTUAL)
   408d9:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   408e0:	00 
   408e1:	76 14                	jbe    408f7 <exception+0x207>
        {
            current->p_registers.reg_rax = -1;
   408e3:	48 8b 05 16 07 01 00 	mov    0x10716(%rip),%rax        # 51000 <current>
   408ea:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   408f1:	ff 
            break;
   408f2:	e9 fc 01 00 00       	jmp    40af3 <exception+0x403>
        }
        // if the page already exists
        vamapping vam = virtual_memory_lookup(current->p_pagetable, addr);
   408f7:	48 8b 05 02 07 01 00 	mov    0x10702(%rip),%rax        # 51000 <current>
   408fe:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40905:	48 8d 45 98          	lea    -0x68(%rbp),%rax
   40909:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4090d:	48 89 ce             	mov    %rcx,%rsi
   40910:	48 89 c7             	mov    %rax,%rdi
   40913:	e8 02 26 00 00       	call   42f1a <virtual_memory_lookup>
        if (vam.pn < 0)
   40918:	8b 45 98             	mov    -0x68(%rbp),%eax
   4091b:	85 c0                	test   %eax,%eax
   4091d:	79 14                	jns    40933 <exception+0x243>
        {
            current->p_registers.reg_rax = -1;
   4091f:	48 8b 05 da 06 01 00 	mov    0x106da(%rip),%rax        # 51000 <current>
   40926:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   4092d:	ff 
            break;
   4092e:	e9 c0 01 00 00       	jmp    40af3 <exception+0x403>
        }

        int r = assign_physical_page(addr, current->p_pid);
   40933:	48 8b 05 c6 06 01 00 	mov    0x106c6(%rip),%rax        # 51000 <current>
   4093a:	8b 00                	mov    (%rax),%eax
   4093c:	0f be d0             	movsbl %al,%edx
   4093f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40943:	89 d6                	mov    %edx,%esi
   40945:	48 89 c7             	mov    %rax,%rdi
   40948:	e8 dc fb ff ff       	call   40529 <assign_physical_page>
   4094d:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (r >= 0)
   40950:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   40954:	78 29                	js     4097f <exception+0x28f>
        {
            virtual_memory_map(current->p_pagetable, addr, addr,
   40956:	48 8b 05 a3 06 01 00 	mov    0x106a3(%rip),%rax        # 51000 <current>
   4095d:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   40964:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40968:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   4096c:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40972:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40977:	48 89 c7             	mov    %rax,%rdi
   4097a:	e8 57 21 00 00       	call   42ad6 <virtual_memory_map>
                               PAGESIZE, PTE_P | PTE_W | PTE_U);
        }
        current->p_registers.reg_rax = r;
   4097f:	48 8b 05 7a 06 01 00 	mov    0x1067a(%rip),%rax        # 51000 <current>
   40986:	8b 55 f4             	mov    -0xc(%rbp),%edx
   40989:	48 63 d2             	movslq %edx,%rdx
   4098c:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   40990:	e9 5e 01 00 00       	jmp    40af3 <exception+0x403>
    }

    case INT_SYS_MAPPING:
    {
        syscall_mapping(current);
   40995:	48 8b 05 64 06 01 00 	mov    0x10664(%rip),%rax        # 51000 <current>
   4099c:	48 89 c7             	mov    %rax,%rdi
   4099f:	e8 12 fc ff ff       	call   405b6 <syscall_mapping>
        break;
   409a4:	e9 4a 01 00 00       	jmp    40af3 <exception+0x403>
    }

    case INT_SYS_MEM_TOG:
    {
        syscall_mem_tog(current);
   409a9:	48 8b 05 50 06 01 00 	mov    0x10650(%rip),%rax        # 51000 <current>
   409b0:	48 89 c7             	mov    %rax,%rdi
   409b3:	e8 cb fc ff ff       	call   40683 <syscall_mem_tog>
        break;
   409b8:	e9 36 01 00 00       	jmp    40af3 <exception+0x403>
    }

    case INT_TIMER:
        ++ticks;
   409bd:	8b 05 5d 14 01 00    	mov    0x1145d(%rip),%eax        # 51e20 <ticks>
   409c3:	83 c0 01             	add    $0x1,%eax
   409c6:	89 05 54 14 01 00    	mov    %eax,0x11454(%rip)        # 51e20 <ticks>
        schedule();
   409cc:	e8 4b 01 00 00       	call   40b1c <schedule>
        break; /* will not be reached */
   409d1:	e9 1d 01 00 00       	jmp    40af3 <exception+0x403>
    return val;
}

static inline uintptr_t rcr2(void) {
    uintptr_t val;
    asm volatile("movq %%cr2,%0" : "=r" (val));
   409d6:	0f 20 d0             	mov    %cr2,%rax
   409d9:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    return val;
   409dd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax

    case INT_PAGEFAULT:
    {
        // Analyze faulting address and access type.
        uintptr_t addr = rcr2();
   409e1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        const char *operation = reg->reg_err & PFERR_WRITE
   409e5:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   409ec:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   409f3:	83 e0 02             	and    $0x2,%eax
                                    ? "write"
                                    : "read";
   409f6:	48 85 c0             	test   %rax,%rax
   409f9:	74 09                	je     40a04 <exception+0x314>
   409fb:	48 8d 05 0e 3a 00 00 	lea    0x3a0e(%rip),%rax        # 44410 <console_clear+0x7a>
   40a02:	eb 07                	jmp    40a0b <exception+0x31b>
   40a04:	48 8d 05 0b 3a 00 00 	lea    0x3a0b(%rip),%rax        # 44416 <console_clear+0x80>
        const char *operation = reg->reg_err & PFERR_WRITE
   40a0b:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        const char *problem = reg->reg_err & PFERR_PRESENT
   40a0f:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   40a16:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40a1d:	83 e0 01             	and    $0x1,%eax
                                  ? "protection problem"
                                  : "missing page";
   40a20:	48 85 c0             	test   %rax,%rax
   40a23:	74 09                	je     40a2e <exception+0x33e>
   40a25:	48 8d 05 ef 39 00 00 	lea    0x39ef(%rip),%rax        # 4441b <console_clear+0x85>
   40a2c:	eb 07                	jmp    40a35 <exception+0x345>
   40a2e:	48 8d 05 f9 39 00 00 	lea    0x39f9(%rip),%rax        # 4442e <console_clear+0x98>
        const char *problem = reg->reg_err & PFERR_PRESENT
   40a35:	48 89 45 d0          	mov    %rax,-0x30(%rbp)

        if (!(reg->reg_err & PFERR_USER))
   40a39:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   40a40:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40a47:	83 e0 04             	and    $0x4,%eax
   40a4a:	48 85 c0             	test   %rax,%rax
   40a4d:	75 34                	jne    40a83 <exception+0x393>
        {
            panic("Kernel page fault for %p (%s %s, rip=%p)!\n",
   40a4f:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   40a56:	48 8b b0 98 00 00 00 	mov    0x98(%rax),%rsi
   40a5d:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
   40a61:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   40a65:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40a69:	49 89 f0             	mov    %rsi,%r8
   40a6c:	48 89 c6             	mov    %rax,%rsi
   40a6f:	48 8d 05 ca 39 00 00 	lea    0x39ca(%rip),%rax        # 44440 <console_clear+0xaa>
   40a76:	48 89 c7             	mov    %rax,%rdi
   40a79:	b8 00 00 00 00       	mov    $0x0,%eax
   40a7e:	e8 df 1b 00 00       	call   42662 <panic>
                  addr, operation, problem, reg->reg_rip);
        }
        console_printf(CPOS(24, 0), 0x0C00,
   40a83:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
   40a8a:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
                       "Process %d page fault for %p (%s %s, rip=%p)!\n",
                       current->p_pid, addr, operation, problem, reg->reg_rip);
   40a91:	48 8b 05 68 05 01 00 	mov    0x10568(%rip),%rax        # 51000 <current>
        console_printf(CPOS(24, 0), 0x0C00,
   40a98:	8b 00                	mov    (%rax),%eax
   40a9a:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
   40a9e:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
   40aa2:	52                   	push   %rdx
   40aa3:	ff 75 d0             	push   -0x30(%rbp)
   40aa6:	49 89 f1             	mov    %rsi,%r9
   40aa9:	49 89 c8             	mov    %rcx,%r8
   40aac:	89 c1                	mov    %eax,%ecx
   40aae:	48 8d 05 bb 39 00 00 	lea    0x39bb(%rip),%rax        # 44470 <console_clear+0xda>
   40ab5:	48 89 c2             	mov    %rax,%rdx
   40ab8:	be 00 0c 00 00       	mov    $0xc00,%esi
   40abd:	bf 80 07 00 00       	mov    $0x780,%edi
   40ac2:	b8 00 00 00 00       	mov    $0x0,%eax
   40ac7:	e8 54 37 00 00       	call   44220 <console_printf>
   40acc:	48 83 c4 10          	add    $0x10,%rsp
        current->p_state = P_BROKEN;
   40ad0:	48 8b 05 29 05 01 00 	mov    0x10529(%rip),%rax        # 51000 <current>
   40ad7:	c7 80 c8 00 00 00 03 	movl   $0x3,0xc8(%rax)
   40ade:	00 00 00 
        break;
   40ae1:	eb 10                	jmp    40af3 <exception+0x403>
    }

    default:
        default_exception(current);
   40ae3:	48 8b 05 16 05 01 00 	mov    0x10516(%rip),%rax        # 51000 <current>
   40aea:	48 89 c7             	mov    %rax,%rdi
   40aed:	e8 99 1c 00 00       	call   4278b <default_exception>
        break; /* will not be reached */
   40af2:	90                   	nop
    }

    // Return to the current process (or run something else).
    if (current->p_state == P_RUNNABLE)
   40af3:	48 8b 05 06 05 01 00 	mov    0x10506(%rip),%rax        # 51000 <current>
   40afa:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   40b00:	83 f8 01             	cmp    $0x1,%eax
   40b03:	75 0f                	jne    40b14 <exception+0x424>
    {
        run(current);
   40b05:	48 8b 05 f4 04 01 00 	mov    0x104f4(%rip),%rax        # 51000 <current>
   40b0c:	48 89 c7             	mov    %rax,%rdi
   40b0f:	e8 87 00 00 00       	call   40b9b <run>
    }
    else
    {
        schedule();
   40b14:	e8 03 00 00 00       	call   40b1c <schedule>
    }
}
   40b19:	90                   	nop
   40b1a:	c9                   	leave  
   40b1b:	c3                   	ret    

0000000000040b1c <schedule>:
// schedule
//    Pick the next process to run and then run it.
//    If there are no runnable processes, spins forever.

void schedule(void)
{
   40b1c:	f3 0f 1e fa          	endbr64 
   40b20:	55                   	push   %rbp
   40b21:	48 89 e5             	mov    %rsp,%rbp
   40b24:	48 83 ec 10          	sub    $0x10,%rsp
    pid_t pid = current->p_pid;
   40b28:	48 8b 05 d1 04 01 00 	mov    0x104d1(%rip),%rax        # 51000 <current>
   40b2f:	8b 00                	mov    (%rax),%eax
   40b31:	89 45 fc             	mov    %eax,-0x4(%rbp)
    while (1)
    {
        pid = (pid + 1) % NPROC;
   40b34:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40b37:	83 c0 01             	add    $0x1,%eax
   40b3a:	99                   	cltd   
   40b3b:	c1 ea 1c             	shr    $0x1c,%edx
   40b3e:	01 d0                	add    %edx,%eax
   40b40:	83 e0 0f             	and    $0xf,%eax
   40b43:	29 d0                	sub    %edx,%eax
   40b45:	89 45 fc             	mov    %eax,-0x4(%rbp)
        if (processes[pid].p_state == P_RUNNABLE)
   40b48:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40b4b:	48 63 d0             	movslq %eax,%rdx
   40b4e:	48 89 d0             	mov    %rdx,%rax
   40b51:	48 c1 e0 03          	shl    $0x3,%rax
   40b55:	48 29 d0             	sub    %rdx,%rax
   40b58:	48 c1 e0 05          	shl    $0x5,%rax
   40b5c:	48 89 c2             	mov    %rax,%rdx
   40b5f:	48 8d 05 82 05 01 00 	lea    0x10582(%rip),%rax        # 510e8 <processes+0xc8>
   40b66:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   40b69:	83 f8 01             	cmp    $0x1,%eax
   40b6c:	75 26                	jne    40b94 <schedule+0x78>
        {
            run(&processes[pid]);
   40b6e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40b71:	48 63 d0             	movslq %eax,%rdx
   40b74:	48 89 d0             	mov    %rdx,%rax
   40b77:	48 c1 e0 03          	shl    $0x3,%rax
   40b7b:	48 29 d0             	sub    %rdx,%rax
   40b7e:	48 c1 e0 05          	shl    $0x5,%rax
   40b82:	48 8d 15 97 04 01 00 	lea    0x10497(%rip),%rdx        # 51020 <processes>
   40b89:	48 01 d0             	add    %rdx,%rax
   40b8c:	48 89 c7             	mov    %rax,%rdi
   40b8f:	e8 07 00 00 00       	call   40b9b <run>
        }
        // If Control-C was typed, exit the virtual machine.
        check_keyboard();
   40b94:	e8 67 19 00 00       	call   42500 <check_keyboard>
        pid = (pid + 1) % NPROC;
   40b99:	eb 99                	jmp    40b34 <schedule+0x18>

0000000000040b9b <run>:
//    `p->p_registers` using the `popal`, `popl`, and `iret` instructions.
//
//    As a side effect, sets `current = p`.

void run(proc *p)
{
   40b9b:	f3 0f 1e fa          	endbr64 
   40b9f:	55                   	push   %rbp
   40ba0:	48 89 e5             	mov    %rsp,%rbp
   40ba3:	48 83 ec 10          	sub    $0x10,%rsp
   40ba7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    assert(p->p_state == P_RUNNABLE);
   40bab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40baf:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   40bb5:	83 f8 01             	cmp    $0x1,%eax
   40bb8:	74 1e                	je     40bd8 <run+0x3d>
   40bba:	48 8d 05 8b 39 00 00 	lea    0x398b(%rip),%rax        # 4454c <console_clear+0x1b6>
   40bc1:	48 89 c2             	mov    %rax,%rdx
   40bc4:	be 8c 01 00 00       	mov    $0x18c,%esi
   40bc9:	48 8d 05 30 38 00 00 	lea    0x3830(%rip),%rax        # 44400 <console_clear+0x6a>
   40bd0:	48 89 c7             	mov    %rax,%rdi
   40bd3:	e8 7a 1b 00 00       	call   42752 <assert_fail>
    current = p;
   40bd8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40bdc:	48 89 05 1d 04 01 00 	mov    %rax,0x1041d(%rip)        # 51000 <current>

    // Load the process's current pagetable.
    set_pagetable(p->p_pagetable);
   40be3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40be7:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   40bee:	48 89 c7             	mov    %rax,%rdi
   40bf1:	e8 6e 1d 00 00       	call   42964 <set_pagetable>

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(&p->p_registers);
   40bf6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40bfa:	48 83 c0 08          	add    $0x8,%rax
   40bfe:	48 89 c7             	mov    %rax,%rdi
   40c01:	e8 bd f4 ff ff       	call   400c3 <exception_return>

0000000000040c06 <pageinfo_init>:

// pageinfo_init
//    Initialize the `pageinfo[]` array.

void pageinfo_init(void)
{
   40c06:	f3 0f 1e fa          	endbr64 
   40c0a:	55                   	push   %rbp
   40c0b:	48 89 e5             	mov    %rsp,%rbp
   40c0e:	48 83 ec 10          	sub    $0x10,%rsp
    extern char end[];

    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE)
   40c12:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   40c19:	00 
   40c1a:	e9 93 00 00 00       	jmp    40cb2 <pageinfo_init+0xac>
    {
        int owner;
        if (physical_memory_isreserved(addr))
   40c1f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40c23:	48 89 c7             	mov    %rax,%rdi
   40c26:	e8 0f 11 00 00       	call   41d3a <physical_memory_isreserved>
   40c2b:	85 c0                	test   %eax,%eax
   40c2d:	74 09                	je     40c38 <pageinfo_init+0x32>
        {
            owner = PO_RESERVED;
   40c2f:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%rbp)
   40c36:	eb 31                	jmp    40c69 <pageinfo_init+0x63>
        }
        else if ((addr >= KERNEL_START_ADDR && addr < (uintptr_t)end) || addr == KERNEL_STACK_TOP - PAGESIZE)
   40c38:	48 81 7d f8 ff ff 03 	cmpq   $0x3ffff,-0x8(%rbp)
   40c3f:	00 
   40c40:	76 0d                	jbe    40c4f <pageinfo_init+0x49>
   40c42:	48 8d 05 bf 93 01 00 	lea    0x193bf(%rip),%rax        # 5a008 <end>
   40c49:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40c4d:	72 0a                	jb     40c59 <pageinfo_init+0x53>
   40c4f:	48 81 7d f8 00 f0 07 	cmpq   $0x7f000,-0x8(%rbp)
   40c56:	00 
   40c57:	75 09                	jne    40c62 <pageinfo_init+0x5c>
        {
            owner = PO_KERNEL;
   40c59:	c7 45 f4 fe ff ff ff 	movl   $0xfffffffe,-0xc(%rbp)
   40c60:	eb 07                	jmp    40c69 <pageinfo_init+0x63>
        }
        else
        {
            owner = PO_FREE;
   40c62:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
        }
        pageinfo[PAGENUMBER(addr)].owner = owner;
   40c69:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40c6d:	48 c1 e8 0c          	shr    $0xc,%rax
   40c71:	89 c2                	mov    %eax,%edx
   40c73:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40c76:	89 c1                	mov    %eax,%ecx
   40c78:	48 63 c2             	movslq %edx,%rax
   40c7b:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40c7f:	48 8d 05 ba 11 01 00 	lea    0x111ba(%rip),%rax        # 51e40 <pageinfo>
   40c86:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
        pageinfo[PAGENUMBER(addr)].refcount = (owner != PO_FREE);
   40c89:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   40c8d:	0f 95 c2             	setne  %dl
   40c90:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40c94:	48 c1 e8 0c          	shr    $0xc,%rax
   40c98:	89 d1                	mov    %edx,%ecx
   40c9a:	48 98                	cltq   
   40c9c:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40ca0:	48 8d 05 9a 11 01 00 	lea    0x1119a(%rip),%rax        # 51e41 <pageinfo+0x1>
   40ca7:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE)
   40caa:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40cb1:	00 
   40cb2:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   40cb9:	00 
   40cba:	0f 86 5f ff ff ff    	jbe    40c1f <pageinfo_init+0x19>
    }
}
   40cc0:	90                   	nop
   40cc1:	90                   	nop
   40cc2:	c9                   	leave  
   40cc3:	c3                   	ret    

0000000000040cc4 <check_page_table_mappings>:
// check_page_table_mappings
//    Check operating system invariants about kernel mappings for page
//    table `pt`. Panic if any of the invariants are false.

void check_page_table_mappings(x86_64_pagetable *pt)
{
   40cc4:	f3 0f 1e fa          	endbr64 
   40cc8:	55                   	push   %rbp
   40cc9:	48 89 e5             	mov    %rsp,%rbp
   40ccc:	48 83 ec 50          	sub    $0x50,%rsp
   40cd0:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    extern char start_data[], end[];
    assert(PTE_ADDR(pt) == (uintptr_t)pt);
   40cd4:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40cd8:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   40cde:	48 89 c2             	mov    %rax,%rdx
   40ce1:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40ce5:	48 39 c2             	cmp    %rax,%rdx
   40ce8:	74 1e                	je     40d08 <check_page_table_mappings+0x44>
   40cea:	48 8d 05 74 38 00 00 	lea    0x3874(%rip),%rax        # 44565 <console_clear+0x1cf>
   40cf1:	48 89 c2             	mov    %rax,%rdx
   40cf4:	be bc 01 00 00       	mov    $0x1bc,%esi
   40cf9:	48 8d 05 00 37 00 00 	lea    0x3700(%rip),%rax        # 44400 <console_clear+0x6a>
   40d00:	48 89 c7             	mov    %rax,%rdi
   40d03:	e8 4a 1a 00 00       	call   42752 <assert_fail>

    // kernel memory is identity mapped; data is writable
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t)end;
   40d08:	48 c7 45 f8 00 00 04 	movq   $0x40000,-0x8(%rbp)
   40d0f:	00 
   40d10:	e9 b5 00 00 00       	jmp    40dca <check_page_table_mappings+0x106>
         va += PAGESIZE)
    {
        vamapping vam = virtual_memory_lookup(pt, va);
   40d15:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   40d19:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40d1d:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   40d21:	48 89 ce             	mov    %rcx,%rsi
   40d24:	48 89 c7             	mov    %rax,%rdi
   40d27:	e8 ee 21 00 00       	call   42f1a <virtual_memory_lookup>
        if (vam.pa != va)
   40d2c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40d30:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40d34:	74 2c                	je     40d62 <check_page_table_mappings+0x9e>
        {
            console_printf(CPOS(22, 0), 0xC000, "%p vs %p\n", va, vam.pa);
   40d36:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   40d3a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40d3e:	49 89 d0             	mov    %rdx,%r8
   40d41:	48 89 c1             	mov    %rax,%rcx
   40d44:	48 8d 05 38 38 00 00 	lea    0x3838(%rip),%rax        # 44583 <console_clear+0x1ed>
   40d4b:	48 89 c2             	mov    %rax,%rdx
   40d4e:	be 00 c0 00 00       	mov    $0xc000,%esi
   40d53:	bf e0 06 00 00       	mov    $0x6e0,%edi
   40d58:	b8 00 00 00 00       	mov    $0x0,%eax
   40d5d:	e8 be 34 00 00       	call   44220 <console_printf>
        }
        assert(vam.pa == va);
   40d62:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40d66:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40d6a:	74 1e                	je     40d8a <check_page_table_mappings+0xc6>
   40d6c:	48 8d 05 1a 38 00 00 	lea    0x381a(%rip),%rax        # 4458d <console_clear+0x1f7>
   40d73:	48 89 c2             	mov    %rax,%rdx
   40d76:	be c7 01 00 00       	mov    $0x1c7,%esi
   40d7b:	48 8d 05 7e 36 00 00 	lea    0x367e(%rip),%rax        # 44400 <console_clear+0x6a>
   40d82:	48 89 c7             	mov    %rax,%rdi
   40d85:	e8 c8 19 00 00       	call   42752 <assert_fail>
        if (va >= (uintptr_t)start_data)
   40d8a:	48 8d 05 6f 42 00 00 	lea    0x426f(%rip),%rax        # 45000 <disp_global>
   40d91:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40d95:	72 2b                	jb     40dc2 <check_page_table_mappings+0xfe>
        {
            assert(vam.perm & PTE_W);
   40d97:	8b 45 d0             	mov    -0x30(%rbp),%eax
   40d9a:	48 98                	cltq   
   40d9c:	83 e0 02             	and    $0x2,%eax
   40d9f:	48 85 c0             	test   %rax,%rax
   40da2:	75 1e                	jne    40dc2 <check_page_table_mappings+0xfe>
   40da4:	48 8d 05 ef 37 00 00 	lea    0x37ef(%rip),%rax        # 4459a <console_clear+0x204>
   40dab:	48 89 c2             	mov    %rax,%rdx
   40dae:	be ca 01 00 00       	mov    $0x1ca,%esi
   40db3:	48 8d 05 46 36 00 00 	lea    0x3646(%rip),%rax        # 44400 <console_clear+0x6a>
   40dba:	48 89 c7             	mov    %rax,%rdi
   40dbd:	e8 90 19 00 00       	call   42752 <assert_fail>
         va += PAGESIZE)
   40dc2:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40dc9:	00 
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t)end;
   40dca:	48 8d 05 37 92 01 00 	lea    0x19237(%rip),%rax        # 5a008 <end>
   40dd1:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40dd5:	0f 82 3a ff ff ff    	jb     40d15 <check_page_table_mappings+0x51>
        }
    }

    // kernel stack is identity mapped and writable
    uintptr_t kstack = KERNEL_STACK_TOP - PAGESIZE;
   40ddb:	48 c7 45 f0 00 f0 07 	movq   $0x7f000,-0x10(%rbp)
   40de2:	00 
    vamapping vam = virtual_memory_lookup(pt, kstack);
   40de3:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
   40de7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40deb:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   40def:	48 89 ce             	mov    %rcx,%rsi
   40df2:	48 89 c7             	mov    %rax,%rdi
   40df5:	e8 20 21 00 00       	call   42f1a <virtual_memory_lookup>
    assert(vam.pa == kstack);
   40dfa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40dfe:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   40e02:	74 1e                	je     40e22 <check_page_table_mappings+0x15e>
   40e04:	48 8d 05 a0 37 00 00 	lea    0x37a0(%rip),%rax        # 445ab <console_clear+0x215>
   40e0b:	48 89 c2             	mov    %rax,%rdx
   40e0e:	be d1 01 00 00       	mov    $0x1d1,%esi
   40e13:	48 8d 05 e6 35 00 00 	lea    0x35e6(%rip),%rax        # 44400 <console_clear+0x6a>
   40e1a:	48 89 c7             	mov    %rax,%rdi
   40e1d:	e8 30 19 00 00       	call   42752 <assert_fail>
    assert(vam.perm & PTE_W);
   40e22:	8b 45 e8             	mov    -0x18(%rbp),%eax
   40e25:	48 98                	cltq   
   40e27:	83 e0 02             	and    $0x2,%eax
   40e2a:	48 85 c0             	test   %rax,%rax
   40e2d:	75 1e                	jne    40e4d <check_page_table_mappings+0x189>
   40e2f:	48 8d 05 64 37 00 00 	lea    0x3764(%rip),%rax        # 4459a <console_clear+0x204>
   40e36:	48 89 c2             	mov    %rax,%rdx
   40e39:	be d2 01 00 00       	mov    $0x1d2,%esi
   40e3e:	48 8d 05 bb 35 00 00 	lea    0x35bb(%rip),%rax        # 44400 <console_clear+0x6a>
   40e45:	48 89 c7             	mov    %rax,%rdi
   40e48:	e8 05 19 00 00       	call   42752 <assert_fail>
}
   40e4d:	90                   	nop
   40e4e:	c9                   	leave  
   40e4f:	c3                   	ret    

0000000000040e50 <check_page_table_ownership>:

static void check_page_table_ownership_level(x86_64_pagetable *pt, int level,
                                             int owner, int refcount);

void check_page_table_ownership(x86_64_pagetable *pt, pid_t pid)
{
   40e50:	f3 0f 1e fa          	endbr64 
   40e54:	55                   	push   %rbp
   40e55:	48 89 e5             	mov    %rsp,%rbp
   40e58:	48 83 ec 20          	sub    $0x20,%rsp
   40e5c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   40e60:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    // calculate expected reference count for page tables
    int owner = pid;
   40e63:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40e66:	89 45 fc             	mov    %eax,-0x4(%rbp)
    int expected_refcount = 1;
   40e69:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
    if (pt == kernel_pagetable)
   40e70:	48 8b 05 89 31 01 00 	mov    0x13189(%rip),%rax        # 54000 <kernel_pagetable>
   40e77:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
   40e7b:	75 71                	jne    40eee <check_page_table_ownership+0x9e>
    {
        owner = PO_KERNEL;
   40e7d:	c7 45 fc fe ff ff ff 	movl   $0xfffffffe,-0x4(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid)
   40e84:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   40e8b:	eb 5b                	jmp    40ee8 <check_page_table_ownership+0x98>
        {
            if (processes[xpid].p_state != P_FREE && processes[xpid].p_pagetable == kernel_pagetable)
   40e8d:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40e90:	48 63 d0             	movslq %eax,%rdx
   40e93:	48 89 d0             	mov    %rdx,%rax
   40e96:	48 c1 e0 03          	shl    $0x3,%rax
   40e9a:	48 29 d0             	sub    %rdx,%rax
   40e9d:	48 c1 e0 05          	shl    $0x5,%rax
   40ea1:	48 89 c2             	mov    %rax,%rdx
   40ea4:	48 8d 05 3d 02 01 00 	lea    0x1023d(%rip),%rax        # 510e8 <processes+0xc8>
   40eab:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   40eae:	85 c0                	test   %eax,%eax
   40eb0:	74 32                	je     40ee4 <check_page_table_ownership+0x94>
   40eb2:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40eb5:	48 63 d0             	movslq %eax,%rdx
   40eb8:	48 89 d0             	mov    %rdx,%rax
   40ebb:	48 c1 e0 03          	shl    $0x3,%rax
   40ebf:	48 29 d0             	sub    %rdx,%rax
   40ec2:	48 c1 e0 05          	shl    $0x5,%rax
   40ec6:	48 89 c2             	mov    %rax,%rdx
   40ec9:	48 8d 05 20 02 01 00 	lea    0x10220(%rip),%rax        # 510f0 <processes+0xd0>
   40ed0:	48 8b 14 02          	mov    (%rdx,%rax,1),%rdx
   40ed4:	48 8b 05 25 31 01 00 	mov    0x13125(%rip),%rax        # 54000 <kernel_pagetable>
   40edb:	48 39 c2             	cmp    %rax,%rdx
   40ede:	75 04                	jne    40ee4 <check_page_table_ownership+0x94>
            {
                ++expected_refcount;
   40ee0:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid)
   40ee4:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   40ee8:	83 7d f4 0f          	cmpl   $0xf,-0xc(%rbp)
   40eec:	7e 9f                	jle    40e8d <check_page_table_ownership+0x3d>
            }
        }
    }
    check_page_table_ownership_level(pt, 0, owner, expected_refcount);
   40eee:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   40ef1:	8b 55 fc             	mov    -0x4(%rbp),%edx
   40ef4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40ef8:	be 00 00 00 00       	mov    $0x0,%esi
   40efd:	48 89 c7             	mov    %rax,%rdi
   40f00:	e8 03 00 00 00       	call   40f08 <check_page_table_ownership_level>
}
   40f05:	90                   	nop
   40f06:	c9                   	leave  
   40f07:	c3                   	ret    

0000000000040f08 <check_page_table_ownership_level>:

static void check_page_table_ownership_level(x86_64_pagetable *pt, int level,
                                             int owner, int refcount)
{
   40f08:	f3 0f 1e fa          	endbr64 
   40f0c:	55                   	push   %rbp
   40f0d:	48 89 e5             	mov    %rsp,%rbp
   40f10:	48 83 ec 30          	sub    $0x30,%rsp
   40f14:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   40f18:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   40f1b:	89 55 e0             	mov    %edx,-0x20(%rbp)
   40f1e:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    assert(PAGENUMBER(pt) < NPAGES);
   40f21:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40f25:	48 c1 e8 0c          	shr    $0xc,%rax
   40f29:	3d ff 01 00 00       	cmp    $0x1ff,%eax
   40f2e:	7e 1e                	jle    40f4e <check_page_table_ownership_level+0x46>
   40f30:	48 8d 05 85 36 00 00 	lea    0x3685(%rip),%rax        # 445bc <console_clear+0x226>
   40f37:	48 89 c2             	mov    %rax,%rdx
   40f3a:	be f2 01 00 00       	mov    $0x1f2,%esi
   40f3f:	48 8d 05 ba 34 00 00 	lea    0x34ba(%rip),%rax        # 44400 <console_clear+0x6a>
   40f46:	48 89 c7             	mov    %rax,%rdi
   40f49:	e8 04 18 00 00       	call   42752 <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].owner == owner);
   40f4e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40f52:	48 c1 e8 0c          	shr    $0xc,%rax
   40f56:	48 98                	cltq   
   40f58:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40f5c:	48 8d 05 dd 0e 01 00 	lea    0x10edd(%rip),%rax        # 51e40 <pageinfo>
   40f63:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   40f67:	0f be c0             	movsbl %al,%eax
   40f6a:	39 45 e0             	cmp    %eax,-0x20(%rbp)
   40f6d:	74 1e                	je     40f8d <check_page_table_ownership_level+0x85>
   40f6f:	48 8d 05 62 36 00 00 	lea    0x3662(%rip),%rax        # 445d8 <console_clear+0x242>
   40f76:	48 89 c2             	mov    %rax,%rdx
   40f79:	be f3 01 00 00       	mov    $0x1f3,%esi
   40f7e:	48 8d 05 7b 34 00 00 	lea    0x347b(%rip),%rax        # 44400 <console_clear+0x6a>
   40f85:	48 89 c7             	mov    %rax,%rdi
   40f88:	e8 c5 17 00 00       	call   42752 <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].refcount == refcount);
   40f8d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40f91:	48 c1 e8 0c          	shr    $0xc,%rax
   40f95:	48 98                	cltq   
   40f97:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40f9b:	48 8d 05 9f 0e 01 00 	lea    0x10e9f(%rip),%rax        # 51e41 <pageinfo+0x1>
   40fa2:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   40fa6:	0f be c0             	movsbl %al,%eax
   40fa9:	39 45 dc             	cmp    %eax,-0x24(%rbp)
   40fac:	74 1e                	je     40fcc <check_page_table_ownership_level+0xc4>
   40fae:	48 8d 05 4b 36 00 00 	lea    0x364b(%rip),%rax        # 44600 <console_clear+0x26a>
   40fb5:	48 89 c2             	mov    %rax,%rdx
   40fb8:	be f4 01 00 00       	mov    $0x1f4,%esi
   40fbd:	48 8d 05 3c 34 00 00 	lea    0x343c(%rip),%rax        # 44400 <console_clear+0x6a>
   40fc4:	48 89 c7             	mov    %rax,%rdi
   40fc7:	e8 86 17 00 00       	call   42752 <assert_fail>
    if (level < 3)
   40fcc:	83 7d e4 02          	cmpl   $0x2,-0x1c(%rbp)
   40fd0:	7f 5b                	jg     4102d <check_page_table_ownership_level+0x125>
    {
        for (int index = 0; index < NPAGETABLEENTRIES; ++index)
   40fd2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   40fd9:	eb 49                	jmp    41024 <check_page_table_ownership_level+0x11c>
        {
            if (pt->entry[index])
   40fdb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40fdf:	8b 55 fc             	mov    -0x4(%rbp),%edx
   40fe2:	48 63 d2             	movslq %edx,%rdx
   40fe5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   40fe9:	48 85 c0             	test   %rax,%rax
   40fec:	74 32                	je     41020 <check_page_table_ownership_level+0x118>
            {
                x86_64_pagetable *nextpt =
                    (x86_64_pagetable *)PTE_ADDR(pt->entry[index]);
   40fee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40ff2:	8b 55 fc             	mov    -0x4(%rbp),%edx
   40ff5:	48 63 d2             	movslq %edx,%rdx
   40ff8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   40ffc:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
                x86_64_pagetable *nextpt =
   41002:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
                check_page_table_ownership_level(nextpt, level + 1, owner, 1);
   41006:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41009:	8d 70 01             	lea    0x1(%rax),%esi
   4100c:	8b 55 e0             	mov    -0x20(%rbp),%edx
   4100f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   41013:	b9 01 00 00 00       	mov    $0x1,%ecx
   41018:	48 89 c7             	mov    %rax,%rdi
   4101b:	e8 e8 fe ff ff       	call   40f08 <check_page_table_ownership_level>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index)
   41020:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41024:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   4102b:	7e ae                	jle    40fdb <check_page_table_ownership_level+0xd3>
            }
        }
    }
}
   4102d:	90                   	nop
   4102e:	c9                   	leave  
   4102f:	c3                   	ret    

0000000000041030 <check_virtual_memory>:
// check_virtual_memory
//    Check operating system invariants about virtual memory. Panic if any
//    of the invariants are false.

void check_virtual_memory(void)
{
   41030:	f3 0f 1e fa          	endbr64 
   41034:	55                   	push   %rbp
   41035:	48 89 e5             	mov    %rsp,%rbp
   41038:	48 83 ec 10          	sub    $0x10,%rsp
    // Process 0 must never be used.
    assert(processes[0].p_state == P_FREE);
   4103c:	8b 05 a6 00 01 00    	mov    0x100a6(%rip),%eax        # 510e8 <processes+0xc8>
   41042:	85 c0                	test   %eax,%eax
   41044:	74 1e                	je     41064 <check_virtual_memory+0x34>
   41046:	48 8d 05 e3 35 00 00 	lea    0x35e3(%rip),%rax        # 44630 <console_clear+0x29a>
   4104d:	48 89 c2             	mov    %rax,%rdx
   41050:	be 0a 02 00 00       	mov    $0x20a,%esi
   41055:	48 8d 05 a4 33 00 00 	lea    0x33a4(%rip),%rax        # 44400 <console_clear+0x6a>
   4105c:	48 89 c7             	mov    %rax,%rdi
   4105f:	e8 ee 16 00 00       	call   42752 <assert_fail>
    // that don't have their own page tables.
    // Active processes have their own page tables. A process page table
    // should be owned by that process and have reference count 1.
    // All level-2-4 page tables must have reference count 1.

    check_page_table_mappings(kernel_pagetable);
   41064:	48 8b 05 95 2f 01 00 	mov    0x12f95(%rip),%rax        # 54000 <kernel_pagetable>
   4106b:	48 89 c7             	mov    %rax,%rdi
   4106e:	e8 51 fc ff ff       	call   40cc4 <check_page_table_mappings>
    check_page_table_ownership(kernel_pagetable, -1);
   41073:	48 8b 05 86 2f 01 00 	mov    0x12f86(%rip),%rax        # 54000 <kernel_pagetable>
   4107a:	be ff ff ff ff       	mov    $0xffffffff,%esi
   4107f:	48 89 c7             	mov    %rax,%rdi
   41082:	e8 c9 fd ff ff       	call   40e50 <check_page_table_ownership>

    for (int pid = 0; pid < NPROC; ++pid)
   41087:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4108e:	e9 b4 00 00 00       	jmp    41147 <check_virtual_memory+0x117>
    {
        if (processes[pid].p_state != P_FREE && processes[pid].p_pagetable != kernel_pagetable)
   41093:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41096:	48 63 d0             	movslq %eax,%rdx
   41099:	48 89 d0             	mov    %rdx,%rax
   4109c:	48 c1 e0 03          	shl    $0x3,%rax
   410a0:	48 29 d0             	sub    %rdx,%rax
   410a3:	48 c1 e0 05          	shl    $0x5,%rax
   410a7:	48 89 c2             	mov    %rax,%rdx
   410aa:	48 8d 05 37 00 01 00 	lea    0x10037(%rip),%rax        # 510e8 <processes+0xc8>
   410b1:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   410b4:	85 c0                	test   %eax,%eax
   410b6:	0f 84 87 00 00 00    	je     41143 <check_virtual_memory+0x113>
   410bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
   410bf:	48 63 d0             	movslq %eax,%rdx
   410c2:	48 89 d0             	mov    %rdx,%rax
   410c5:	48 c1 e0 03          	shl    $0x3,%rax
   410c9:	48 29 d0             	sub    %rdx,%rax
   410cc:	48 c1 e0 05          	shl    $0x5,%rax
   410d0:	48 89 c2             	mov    %rax,%rdx
   410d3:	48 8d 05 16 00 01 00 	lea    0x10016(%rip),%rax        # 510f0 <processes+0xd0>
   410da:	48 8b 14 02          	mov    (%rdx,%rax,1),%rdx
   410de:	48 8b 05 1b 2f 01 00 	mov    0x12f1b(%rip),%rax        # 54000 <kernel_pagetable>
   410e5:	48 39 c2             	cmp    %rax,%rdx
   410e8:	74 59                	je     41143 <check_virtual_memory+0x113>
        {
            check_page_table_mappings(processes[pid].p_pagetable);
   410ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
   410ed:	48 63 d0             	movslq %eax,%rdx
   410f0:	48 89 d0             	mov    %rdx,%rax
   410f3:	48 c1 e0 03          	shl    $0x3,%rax
   410f7:	48 29 d0             	sub    %rdx,%rax
   410fa:	48 c1 e0 05          	shl    $0x5,%rax
   410fe:	48 89 c2             	mov    %rax,%rdx
   41101:	48 8d 05 e8 ff 00 00 	lea    0xffe8(%rip),%rax        # 510f0 <processes+0xd0>
   41108:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   4110c:	48 89 c7             	mov    %rax,%rdi
   4110f:	e8 b0 fb ff ff       	call   40cc4 <check_page_table_mappings>
            check_page_table_ownership(processes[pid].p_pagetable, pid);
   41114:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41117:	48 63 d0             	movslq %eax,%rdx
   4111a:	48 89 d0             	mov    %rdx,%rax
   4111d:	48 c1 e0 03          	shl    $0x3,%rax
   41121:	48 29 d0             	sub    %rdx,%rax
   41124:	48 c1 e0 05          	shl    $0x5,%rax
   41128:	48 89 c2             	mov    %rax,%rdx
   4112b:	48 8d 05 be ff 00 00 	lea    0xffbe(%rip),%rax        # 510f0 <processes+0xd0>
   41132:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   41136:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41139:	89 d6                	mov    %edx,%esi
   4113b:	48 89 c7             	mov    %rax,%rdi
   4113e:	e8 0d fd ff ff       	call   40e50 <check_page_table_ownership>
    for (int pid = 0; pid < NPROC; ++pid)
   41143:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41147:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   4114b:	0f 8e 42 ff ff ff    	jle    41093 <check_virtual_memory+0x63>
        }
    }

    // Check that all referenced pages refer to active processes
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn)
   41151:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   41158:	e9 8b 00 00 00       	jmp    411e8 <check_virtual_memory+0x1b8>
    {
        if (pageinfo[pn].refcount > 0 && pageinfo[pn].owner >= 0)
   4115d:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41160:	48 98                	cltq   
   41162:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41166:	48 8d 05 d4 0c 01 00 	lea    0x10cd4(%rip),%rax        # 51e41 <pageinfo+0x1>
   4116d:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41171:	84 c0                	test   %al,%al
   41173:	7e 6f                	jle    411e4 <check_virtual_memory+0x1b4>
   41175:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41178:	48 98                	cltq   
   4117a:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4117e:	48 8d 05 bb 0c 01 00 	lea    0x10cbb(%rip),%rax        # 51e40 <pageinfo>
   41185:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41189:	84 c0                	test   %al,%al
   4118b:	78 57                	js     411e4 <check_virtual_memory+0x1b4>
        {
            assert(processes[pageinfo[pn].owner].p_state != P_FREE);
   4118d:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41190:	48 98                	cltq   
   41192:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41196:	48 8d 05 a3 0c 01 00 	lea    0x10ca3(%rip),%rax        # 51e40 <pageinfo>
   4119d:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   411a1:	0f be c0             	movsbl %al,%eax
   411a4:	48 63 d0             	movslq %eax,%rdx
   411a7:	48 89 d0             	mov    %rdx,%rax
   411aa:	48 c1 e0 03          	shl    $0x3,%rax
   411ae:	48 29 d0             	sub    %rdx,%rax
   411b1:	48 c1 e0 05          	shl    $0x5,%rax
   411b5:	48 89 c2             	mov    %rax,%rdx
   411b8:	48 8d 05 29 ff 00 00 	lea    0xff29(%rip),%rax        # 510e8 <processes+0xc8>
   411bf:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   411c2:	85 c0                	test   %eax,%eax
   411c4:	75 1e                	jne    411e4 <check_virtual_memory+0x1b4>
   411c6:	48 8d 05 83 34 00 00 	lea    0x3483(%rip),%rax        # 44650 <console_clear+0x2ba>
   411cd:	48 89 c2             	mov    %rax,%rdx
   411d0:	be 24 02 00 00       	mov    $0x224,%esi
   411d5:	48 8d 05 24 32 00 00 	lea    0x3224(%rip),%rax        # 44400 <console_clear+0x6a>
   411dc:	48 89 c7             	mov    %rax,%rdi
   411df:	e8 6e 15 00 00       	call   42752 <assert_fail>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn)
   411e4:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   411e8:	81 7d f8 ff 01 00 00 	cmpl   $0x1ff,-0x8(%rbp)
   411ef:	0f 8e 68 ff ff ff    	jle    4115d <check_virtual_memory+0x12d>
        }
    }
}
   411f5:	90                   	nop
   411f6:	90                   	nop
   411f7:	c9                   	leave  
   411f8:	c3                   	ret    

00000000000411f9 <memshow_physical>:
    'E' | 0x0E00, 'F' | 0x0F00, 'S'};
#define SHARED_COLOR memstate_colors[18]
#define SHARED

void memshow_physical(void)
{
   411f9:	f3 0f 1e fa          	endbr64 
   411fd:	55                   	push   %rbp
   411fe:	48 89 e5             	mov    %rsp,%rbp
   41201:	48 83 ec 10          	sub    $0x10,%rsp
    console_printf(CPOS(0, 32), 0x0F00, "PHYSICAL MEMORY");
   41205:	48 8d 05 9a 34 00 00 	lea    0x349a(%rip),%rax        # 446a6 <memstate_colors+0x26>
   4120c:	48 89 c2             	mov    %rax,%rdx
   4120f:	be 00 0f 00 00       	mov    $0xf00,%esi
   41214:	bf 20 00 00 00       	mov    $0x20,%edi
   41219:	b8 00 00 00 00       	mov    $0x0,%eax
   4121e:	e8 fd 2f 00 00       	call   44220 <console_printf>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn)
   41223:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4122a:	e9 1b 01 00 00       	jmp    4134a <memshow_physical+0x151>
    {
        if (pn % 64 == 0)
   4122f:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41232:	83 e0 3f             	and    $0x3f,%eax
   41235:	85 c0                	test   %eax,%eax
   41237:	75 40                	jne    41279 <memshow_physical+0x80>
        {
            console_printf(CPOS(1 + pn / 64, 3), 0x0F00, "0x%06X ", pn << 12);
   41239:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4123c:	c1 e0 0c             	shl    $0xc,%eax
   4123f:	89 c2                	mov    %eax,%edx
   41241:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41244:	8d 48 3f             	lea    0x3f(%rax),%ecx
   41247:	85 c0                	test   %eax,%eax
   41249:	0f 48 c1             	cmovs  %ecx,%eax
   4124c:	c1 f8 06             	sar    $0x6,%eax
   4124f:	8d 48 01             	lea    0x1(%rax),%ecx
   41252:	89 c8                	mov    %ecx,%eax
   41254:	c1 e0 02             	shl    $0x2,%eax
   41257:	01 c8                	add    %ecx,%eax
   41259:	c1 e0 04             	shl    $0x4,%eax
   4125c:	83 c0 03             	add    $0x3,%eax
   4125f:	89 d1                	mov    %edx,%ecx
   41261:	48 8d 15 4e 34 00 00 	lea    0x344e(%rip),%rdx        # 446b6 <memstate_colors+0x36>
   41268:	be 00 0f 00 00       	mov    $0xf00,%esi
   4126d:	89 c7                	mov    %eax,%edi
   4126f:	b8 00 00 00 00       	mov    $0x0,%eax
   41274:	e8 a7 2f 00 00       	call   44220 <console_printf>
        }

        int owner = pageinfo[pn].owner;
   41279:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4127c:	48 98                	cltq   
   4127e:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41282:	48 8d 05 b7 0b 01 00 	lea    0x10bb7(%rip),%rax        # 51e40 <pageinfo>
   41289:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4128d:	0f be c0             	movsbl %al,%eax
   41290:	89 45 f8             	mov    %eax,-0x8(%rbp)
        if (pageinfo[pn].refcount == 0)
   41293:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41296:	48 98                	cltq   
   41298:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4129c:	48 8d 05 9e 0b 01 00 	lea    0x10b9e(%rip),%rax        # 51e41 <pageinfo+0x1>
   412a3:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   412a7:	84 c0                	test   %al,%al
   412a9:	75 07                	jne    412b2 <memshow_physical+0xb9>
        {
            owner = PO_FREE;
   412ab:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
        }
        uint16_t color = memstate_colors[owner - PO_KERNEL];
   412b2:	8b 45 f8             	mov    -0x8(%rbp),%eax
   412b5:	83 c0 02             	add    $0x2,%eax
   412b8:	48 98                	cltq   
   412ba:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   412be:	48 8d 05 bb 33 00 00 	lea    0x33bb(%rip),%rax        # 44680 <memstate_colors>
   412c5:	0f b7 04 02          	movzwl (%rdx,%rax,1),%eax
   412c9:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
        // darker color for shared pages
        if (pageinfo[pn].refcount > 1 && pn != PAGENUMBER(CONSOLE_ADDR))
   412cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
   412d0:	48 98                	cltq   
   412d2:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   412d6:	48 8d 05 64 0b 01 00 	lea    0x10b64(%rip),%rax        # 51e41 <pageinfo+0x1>
   412dd:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   412e1:	3c 01                	cmp    $0x1,%al
   412e3:	7e 1c                	jle    41301 <memshow_physical+0x108>
   412e5:	48 8d 05 14 6d 07 00 	lea    0x76d14(%rip),%rax        # b8000 <console>
   412ec:	48 c1 e8 0c          	shr    $0xc,%rax
   412f0:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   412f3:	74 0c                	je     41301 <memshow_physical+0x108>
        {
#ifdef SHARED
            color = SHARED_COLOR | 0x0F00;
   412f5:	b8 53 00 00 00       	mov    $0x53,%eax
   412fa:	80 cc 0f             	or     $0xf,%ah
   412fd:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
#else
            color &= 0x77FF;
#endif
        }

        console[CPOS(1 + pn / 64, 12 + pn % 64)] = color;
   41301:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41304:	8d 50 3f             	lea    0x3f(%rax),%edx
   41307:	85 c0                	test   %eax,%eax
   41309:	0f 48 c2             	cmovs  %edx,%eax
   4130c:	c1 f8 06             	sar    $0x6,%eax
   4130f:	8d 50 01             	lea    0x1(%rax),%edx
   41312:	89 d0                	mov    %edx,%eax
   41314:	c1 e0 02             	shl    $0x2,%eax
   41317:	01 d0                	add    %edx,%eax
   41319:	c1 e0 04             	shl    $0x4,%eax
   4131c:	89 c1                	mov    %eax,%ecx
   4131e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41321:	99                   	cltd   
   41322:	c1 ea 1a             	shr    $0x1a,%edx
   41325:	01 d0                	add    %edx,%eax
   41327:	83 e0 3f             	and    $0x3f,%eax
   4132a:	29 d0                	sub    %edx,%eax
   4132c:	83 c0 0c             	add    $0xc,%eax
   4132f:	01 c8                	add    %ecx,%eax
   41331:	48 98                	cltq   
   41333:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   41337:	48 8d 15 c2 6c 07 00 	lea    0x76cc2(%rip),%rdx        # b8000 <console>
   4133e:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41342:	66 89 04 11          	mov    %ax,(%rcx,%rdx,1)
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn)
   41346:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4134a:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   41351:	0f 8e d8 fe ff ff    	jle    4122f <memshow_physical+0x36>
    }
}
   41357:	90                   	nop
   41358:	90                   	nop
   41359:	c9                   	leave  
   4135a:	c3                   	ret    

000000000004135b <memshow_virtual>:
// memshow_virtual(pagetable, name)
//    Draw a picture of the virtual memory map `pagetable` (named `name`) on
//    the CGA console.

void memshow_virtual(x86_64_pagetable *pagetable, const char *name)
{
   4135b:	f3 0f 1e fa          	endbr64 
   4135f:	55                   	push   %rbp
   41360:	48 89 e5             	mov    %rsp,%rbp
   41363:	48 83 ec 40          	sub    $0x40,%rsp
   41367:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   4136b:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    assert((uintptr_t)pagetable == PTE_ADDR(pagetable));
   4136f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41373:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   41379:	48 89 c2             	mov    %rax,%rdx
   4137c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41380:	48 39 c2             	cmp    %rax,%rdx
   41383:	74 1e                	je     413a3 <memshow_virtual+0x48>
   41385:	48 8d 05 34 33 00 00 	lea    0x3334(%rip),%rax        # 446c0 <memstate_colors+0x40>
   4138c:	48 89 c2             	mov    %rax,%rdx
   4138f:	be 59 02 00 00       	mov    $0x259,%esi
   41394:	48 8d 05 65 30 00 00 	lea    0x3065(%rip),%rax        # 44400 <console_clear+0x6a>
   4139b:	48 89 c7             	mov    %rax,%rdi
   4139e:	e8 af 13 00 00       	call   42752 <assert_fail>

    console_printf(CPOS(10, 26), 0x0F00, "VIRTUAL ADDRESS SPACE FOR %s", name);
   413a3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   413a7:	48 89 c1             	mov    %rax,%rcx
   413aa:	48 8d 05 3b 33 00 00 	lea    0x333b(%rip),%rax        # 446ec <memstate_colors+0x6c>
   413b1:	48 89 c2             	mov    %rax,%rdx
   413b4:	be 00 0f 00 00       	mov    $0xf00,%esi
   413b9:	bf 3a 03 00 00       	mov    $0x33a,%edi
   413be:	b8 00 00 00 00       	mov    $0x0,%eax
   413c3:	e8 58 2e 00 00       	call   44220 <console_printf>
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE)
   413c8:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   413cf:	00 
   413d0:	e9 b4 01 00 00       	jmp    41589 <memshow_virtual+0x22e>
    {
        vamapping vam = virtual_memory_lookup(pagetable, va);
   413d5:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   413d9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   413dd:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   413e1:	48 89 ce             	mov    %rcx,%rsi
   413e4:	48 89 c7             	mov    %rax,%rdi
   413e7:	e8 2e 1b 00 00       	call   42f1a <virtual_memory_lookup>
        uint16_t color;
        if (vam.pn < 0)
   413ec:	8b 45 d0             	mov    -0x30(%rbp),%eax
   413ef:	85 c0                	test   %eax,%eax
   413f1:	79 0b                	jns    413fe <memshow_virtual+0xa3>
        {
            color = ' ';
   413f3:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%rbp)
   413f9:	e9 ff 00 00 00       	jmp    414fd <memshow_virtual+0x1a2>
        }
        else
        {
            assert(vam.pa < MEMSIZE_PHYSICAL);
   413fe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41402:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   41408:	76 1e                	jbe    41428 <memshow_virtual+0xcd>
   4140a:	48 8d 05 f8 32 00 00 	lea    0x32f8(%rip),%rax        # 44709 <memstate_colors+0x89>
   41411:	48 89 c2             	mov    %rax,%rdx
   41414:	be 66 02 00 00       	mov    $0x266,%esi
   41419:	48 8d 05 e0 2f 00 00 	lea    0x2fe0(%rip),%rax        # 44400 <console_clear+0x6a>
   41420:	48 89 c7             	mov    %rax,%rdi
   41423:	e8 2a 13 00 00       	call   42752 <assert_fail>
            int owner = pageinfo[vam.pn].owner;
   41428:	8b 45 d0             	mov    -0x30(%rbp),%eax
   4142b:	48 98                	cltq   
   4142d:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41431:	48 8d 05 08 0a 01 00 	lea    0x10a08(%rip),%rax        # 51e40 <pageinfo>
   41438:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4143c:	0f be c0             	movsbl %al,%eax
   4143f:	89 45 f0             	mov    %eax,-0x10(%rbp)
            if (pageinfo[vam.pn].refcount == 0)
   41442:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41445:	48 98                	cltq   
   41447:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4144b:	48 8d 05 ef 09 01 00 	lea    0x109ef(%rip),%rax        # 51e41 <pageinfo+0x1>
   41452:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41456:	84 c0                	test   %al,%al
   41458:	75 07                	jne    41461 <memshow_virtual+0x106>
            {
                owner = PO_FREE;
   4145a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
            }
            color = memstate_colors[owner - PO_KERNEL];
   41461:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41464:	83 c0 02             	add    $0x2,%eax
   41467:	48 98                	cltq   
   41469:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4146d:	48 8d 05 0c 32 00 00 	lea    0x320c(%rip),%rax        # 44680 <memstate_colors>
   41474:	0f b7 04 02          	movzwl (%rdx,%rax,1),%eax
   41478:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            // reverse video for user-accessible pages
            if (vam.perm & PTE_U)
   4147c:	8b 45 e0             	mov    -0x20(%rbp),%eax
   4147f:	48 98                	cltq   
   41481:	83 e0 04             	and    $0x4,%eax
   41484:	48 85 c0             	test   %rax,%rax
   41487:	74 27                	je     414b0 <memshow_virtual+0x155>
            {
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4) | (color & 0x00FF);
   41489:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   4148d:	c1 e0 04             	shl    $0x4,%eax
   41490:	66 25 00 f0          	and    $0xf000,%ax
   41494:	89 c2                	mov    %eax,%edx
   41496:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   4149a:	c1 f8 04             	sar    $0x4,%eax
   4149d:	66 25 00 0f          	and    $0xf00,%ax
   414a1:	09 c2                	or     %eax,%edx
   414a3:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   414a7:	0f b6 c0             	movzbl %al,%eax
   414aa:	09 d0                	or     %edx,%eax
   414ac:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            }
            // darker color for shared pages
            if (pageinfo[vam.pn].refcount > 1 && va != CONSOLE_ADDR)
   414b0:	8b 45 d0             	mov    -0x30(%rbp),%eax
   414b3:	48 98                	cltq   
   414b5:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   414b9:	48 8d 05 81 09 01 00 	lea    0x10981(%rip),%rax        # 51e41 <pageinfo+0x1>
   414c0:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   414c4:	3c 01                	cmp    $0x1,%al
   414c6:	7e 35                	jle    414fd <memshow_virtual+0x1a2>
   414c8:	48 8d 05 31 6b 07 00 	lea    0x76b31(%rip),%rax        # b8000 <console>
   414cf:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   414d3:	74 28                	je     414fd <memshow_virtual+0x1a2>
            {
#ifdef SHARED
                color = (SHARED_COLOR | (color & 0xF000));
   414d5:	b8 53 00 00 00       	mov    $0x53,%eax
   414da:	89 c2                	mov    %eax,%edx
   414dc:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   414e0:	66 25 00 f0          	and    $0xf000,%ax
   414e4:	09 d0                	or     %edx,%eax
   414e6:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
                if (!(vam.perm & PTE_U))
   414ea:	8b 45 e0             	mov    -0x20(%rbp),%eax
   414ed:	48 98                	cltq   
   414ef:	83 e0 04             	and    $0x4,%eax
   414f2:	48 85 c0             	test   %rax,%rax
   414f5:	75 06                	jne    414fd <memshow_virtual+0x1a2>
                    color = color | 0x0F00;
   414f7:	66 81 4d f6 00 0f    	orw    $0xf00,-0xa(%rbp)
#else
                color &= 0x77FF;
#endif
            }
        }
        uint32_t pn = PAGENUMBER(va);
   414fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41501:	48 c1 e8 0c          	shr    $0xc,%rax
   41505:	89 45 ec             	mov    %eax,-0x14(%rbp)
        if (pn % 64 == 0)
   41508:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4150b:	83 e0 3f             	and    $0x3f,%eax
   4150e:	85 c0                	test   %eax,%eax
   41510:	75 39                	jne    4154b <memshow_virtual+0x1f0>
        {
            console_printf(CPOS(11 + pn / 64, 3), 0x0F00, "0x%06X ", va);
   41512:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41515:	c1 e8 06             	shr    $0x6,%eax
   41518:	89 c2                	mov    %eax,%edx
   4151a:	89 d0                	mov    %edx,%eax
   4151c:	c1 e0 02             	shl    $0x2,%eax
   4151f:	01 d0                	add    %edx,%eax
   41521:	c1 e0 04             	shl    $0x4,%eax
   41524:	05 73 03 00 00       	add    $0x373,%eax
   41529:	89 c7                	mov    %eax,%edi
   4152b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4152f:	48 89 c1             	mov    %rax,%rcx
   41532:	48 8d 05 7d 31 00 00 	lea    0x317d(%rip),%rax        # 446b6 <memstate_colors+0x36>
   41539:	48 89 c2             	mov    %rax,%rdx
   4153c:	be 00 0f 00 00       	mov    $0xf00,%esi
   41541:	b8 00 00 00 00       	mov    $0x0,%eax
   41546:	e8 d5 2c 00 00       	call   44220 <console_printf>
        }
        console[CPOS(11 + pn / 64, 12 + pn % 64)] = color;
   4154b:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4154e:	c1 e8 06             	shr    $0x6,%eax
   41551:	89 c2                	mov    %eax,%edx
   41553:	89 d0                	mov    %edx,%eax
   41555:	c1 e0 02             	shl    $0x2,%eax
   41558:	01 d0                	add    %edx,%eax
   4155a:	c1 e0 04             	shl    $0x4,%eax
   4155d:	89 c2                	mov    %eax,%edx
   4155f:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41562:	83 e0 3f             	and    $0x3f,%eax
   41565:	01 d0                	add    %edx,%eax
   41567:	05 7c 03 00 00       	add    $0x37c,%eax
   4156c:	89 c0                	mov    %eax,%eax
   4156e:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   41572:	48 8d 15 87 6a 07 00 	lea    0x76a87(%rip),%rdx        # b8000 <console>
   41579:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   4157d:	66 89 04 11          	mov    %ax,(%rcx,%rdx,1)
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE)
   41581:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41588:	00 
   41589:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   41590:	00 
   41591:	0f 86 3e fe ff ff    	jbe    413d5 <memshow_virtual+0x7a>
    }
}
   41597:	90                   	nop
   41598:	90                   	nop
   41599:	c9                   	leave  
   4159a:	c3                   	ret    

000000000004159b <memshow_virtual_animate>:
// memshow_virtual_animate
//    Draw a picture of process virtual memory maps on the CGA console.
//    Starts with process 1, then switches to a new process every 0.25 sec.

void memshow_virtual_animate(void)
{
   4159b:	f3 0f 1e fa          	endbr64 
   4159f:	55                   	push   %rbp
   415a0:	48 89 e5             	mov    %rsp,%rbp
   415a3:	48 83 ec 10          	sub    $0x10,%rsp
    static unsigned last_ticks = 0;
    static int showing = 1;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2)
   415a7:	8b 05 93 0c 01 00    	mov    0x10c93(%rip),%eax        # 52240 <last_ticks.1>
   415ad:	85 c0                	test   %eax,%eax
   415af:	74 13                	je     415c4 <memshow_virtual_animate+0x29>
   415b1:	8b 05 69 08 01 00    	mov    0x10869(%rip),%eax        # 51e20 <ticks>
   415b7:	8b 15 83 0c 01 00    	mov    0x10c83(%rip),%edx        # 52240 <last_ticks.1>
   415bd:	29 d0                	sub    %edx,%eax
   415bf:	83 f8 31             	cmp    $0x31,%eax
   415c2:	76 2c                	jbe    415f0 <memshow_virtual_animate+0x55>
    {
        last_ticks = ticks;
   415c4:	8b 05 56 08 01 00    	mov    0x10856(%rip),%eax        # 51e20 <ticks>
   415ca:	89 05 70 0c 01 00    	mov    %eax,0x10c70(%rip)        # 52240 <last_ticks.1>
        ++showing;
   415d0:	8b 05 2e 3a 00 00    	mov    0x3a2e(%rip),%eax        # 45004 <showing.0>
   415d6:	83 c0 01             	add    $0x1,%eax
   415d9:	89 05 25 3a 00 00    	mov    %eax,0x3a25(%rip)        # 45004 <showing.0>
    }

    // the current process may have died -- don't display it if so
    while (showing <= 2 * NPROC && (processes[showing % NPROC].p_state == P_FREE || processes[showing % NPROC].display_status == 0))
   415df:	eb 0f                	jmp    415f0 <memshow_virtual_animate+0x55>
    {
        ++showing;
   415e1:	8b 05 1d 3a 00 00    	mov    0x3a1d(%rip),%eax        # 45004 <showing.0>
   415e7:	83 c0 01             	add    $0x1,%eax
   415ea:	89 05 14 3a 00 00    	mov    %eax,0x3a14(%rip)        # 45004 <showing.0>
    while (showing <= 2 * NPROC && (processes[showing % NPROC].p_state == P_FREE || processes[showing % NPROC].display_status == 0))
   415f0:	8b 05 0e 3a 00 00    	mov    0x3a0e(%rip),%eax        # 45004 <showing.0>
   415f6:	83 f8 20             	cmp    $0x20,%eax
   415f9:	7f 6b                	jg     41666 <memshow_virtual_animate+0xcb>
   415fb:	8b 05 03 3a 00 00    	mov    0x3a03(%rip),%eax        # 45004 <showing.0>
   41601:	99                   	cltd   
   41602:	c1 ea 1c             	shr    $0x1c,%edx
   41605:	01 d0                	add    %edx,%eax
   41607:	83 e0 0f             	and    $0xf,%eax
   4160a:	29 d0                	sub    %edx,%eax
   4160c:	48 63 d0             	movslq %eax,%rdx
   4160f:	48 89 d0             	mov    %rdx,%rax
   41612:	48 c1 e0 03          	shl    $0x3,%rax
   41616:	48 29 d0             	sub    %rdx,%rax
   41619:	48 c1 e0 05          	shl    $0x5,%rax
   4161d:	48 89 c2             	mov    %rax,%rdx
   41620:	48 8d 05 c1 fa 00 00 	lea    0xfac1(%rip),%rax        # 510e8 <processes+0xc8>
   41627:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   4162a:	85 c0                	test   %eax,%eax
   4162c:	74 b3                	je     415e1 <memshow_virtual_animate+0x46>
   4162e:	8b 05 d0 39 00 00    	mov    0x39d0(%rip),%eax        # 45004 <showing.0>
   41634:	99                   	cltd   
   41635:	c1 ea 1c             	shr    $0x1c,%edx
   41638:	01 d0                	add    %edx,%eax
   4163a:	83 e0 0f             	and    $0xf,%eax
   4163d:	29 d0                	sub    %edx,%eax
   4163f:	48 63 d0             	movslq %eax,%rdx
   41642:	48 89 d0             	mov    %rdx,%rax
   41645:	48 c1 e0 03          	shl    $0x3,%rax
   41649:	48 29 d0             	sub    %rdx,%rax
   4164c:	48 c1 e0 05          	shl    $0x5,%rax
   41650:	48 89 c2             	mov    %rax,%rdx
   41653:	48 8d 05 9e fa 00 00 	lea    0xfa9e(%rip),%rax        # 510f8 <processes+0xd8>
   4165a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4165e:	84 c0                	test   %al,%al
   41660:	0f 84 7b ff ff ff    	je     415e1 <memshow_virtual_animate+0x46>
    }
    showing = showing % NPROC;
   41666:	8b 05 98 39 00 00    	mov    0x3998(%rip),%eax        # 45004 <showing.0>
   4166c:	99                   	cltd   
   4166d:	c1 ea 1c             	shr    $0x1c,%edx
   41670:	01 d0                	add    %edx,%eax
   41672:	83 e0 0f             	and    $0xf,%eax
   41675:	29 d0                	sub    %edx,%eax
   41677:	89 05 87 39 00 00    	mov    %eax,0x3987(%rip)        # 45004 <showing.0>

    if (processes[showing].p_state != P_FREE)
   4167d:	8b 05 81 39 00 00    	mov    0x3981(%rip),%eax        # 45004 <showing.0>
   41683:	48 63 d0             	movslq %eax,%rdx
   41686:	48 89 d0             	mov    %rdx,%rax
   41689:	48 c1 e0 03          	shl    $0x3,%rax
   4168d:	48 29 d0             	sub    %rdx,%rax
   41690:	48 c1 e0 05          	shl    $0x5,%rax
   41694:	48 89 c2             	mov    %rax,%rdx
   41697:	48 8d 05 4a fa 00 00 	lea    0xfa4a(%rip),%rax        # 510e8 <processes+0xc8>
   4169e:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   416a1:	85 c0                	test   %eax,%eax
   416a3:	74 59                	je     416fe <memshow_virtual_animate+0x163>
    {
        char s[4];
        snprintf(s, 4, "%d ", showing);
   416a5:	8b 15 59 39 00 00    	mov    0x3959(%rip),%edx        # 45004 <showing.0>
   416ab:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
   416af:	89 d1                	mov    %edx,%ecx
   416b1:	48 8d 15 6b 30 00 00 	lea    0x306b(%rip),%rdx        # 44723 <memstate_colors+0xa3>
   416b8:	be 04 00 00 00       	mov    $0x4,%esi
   416bd:	48 89 c7             	mov    %rax,%rdi
   416c0:	b8 00 00 00 00       	mov    $0x0,%eax
   416c5:	e8 71 2c 00 00       	call   4433b <snprintf>
        memshow_virtual(processes[showing].p_pagetable, s);
   416ca:	8b 05 34 39 00 00    	mov    0x3934(%rip),%eax        # 45004 <showing.0>
   416d0:	48 63 d0             	movslq %eax,%rdx
   416d3:	48 89 d0             	mov    %rdx,%rax
   416d6:	48 c1 e0 03          	shl    $0x3,%rax
   416da:	48 29 d0             	sub    %rdx,%rax
   416dd:	48 c1 e0 05          	shl    $0x5,%rax
   416e1:	48 89 c2             	mov    %rax,%rdx
   416e4:	48 8d 05 05 fa 00 00 	lea    0xfa05(%rip),%rax        # 510f0 <processes+0xd0>
   416eb:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   416ef:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
   416f3:	48 89 d6             	mov    %rdx,%rsi
   416f6:	48 89 c7             	mov    %rax,%rdi
   416f9:	e8 5d fc ff ff       	call   4135b <memshow_virtual>
    }
}
   416fe:	90                   	nop
   416ff:	c9                   	leave  
   41700:	c3                   	ret    

0000000000041701 <hardware_init>:

static void segments_init(void);
static void interrupt_init(void);
extern void virtual_memory_init(void);

void hardware_init(void) {
   41701:	f3 0f 1e fa          	endbr64 
   41705:	55                   	push   %rbp
   41706:	48 89 e5             	mov    %rsp,%rbp
    segments_init();
   41709:	e8 5f 01 00 00       	call   4186d <segments_init>
    interrupt_init();
   4170e:	e8 44 04 00 00       	call   41b57 <interrupt_init>
    virtual_memory_init();
   41713:	e8 11 11 00 00       	call   42829 <virtual_memory_init>
}
   41718:	90                   	nop
   41719:	5d                   	pop    %rbp
   4171a:	c3                   	ret    

000000000004171b <set_app_segment>:
#define SEGSEL_TASKSTATE        0x28            // task state segment

// Segments
static uint64_t segments[7];

static void set_app_segment(uint64_t* segment, uint64_t type, int dpl) {
   4171b:	f3 0f 1e fa          	endbr64 
   4171f:	55                   	push   %rbp
   41720:	48 89 e5             	mov    %rsp,%rbp
   41723:	48 83 ec 18          	sub    $0x18,%rsp
   41727:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   4172b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   4172f:	89 55 ec             	mov    %edx,-0x14(%rbp)
    *segment = type
        | X86SEG_S                    // code/data segment
        | ((uint64_t) dpl << 45)
   41732:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41735:	48 98                	cltq   
   41737:	48 c1 e0 2d          	shl    $0x2d,%rax
   4173b:	48 0b 45 f0          	or     -0x10(%rbp),%rax
        | X86SEG_P;                   // segment present
   4173f:	48 ba 00 00 00 00 00 	movabs $0x900000000000,%rdx
   41746:	90 00 00 
   41749:	48 09 c2             	or     %rax,%rdx
    *segment = type
   4174c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41750:	48 89 10             	mov    %rdx,(%rax)
}
   41753:	90                   	nop
   41754:	c9                   	leave  
   41755:	c3                   	ret    

0000000000041756 <set_sys_segment>:

static void set_sys_segment(uint64_t* segment, uint64_t type, int dpl,
                            uintptr_t addr, size_t size) {
   41756:	f3 0f 1e fa          	endbr64 
   4175a:	55                   	push   %rbp
   4175b:	48 89 e5             	mov    %rsp,%rbp
   4175e:	48 83 ec 28          	sub    $0x28,%rsp
   41762:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41766:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   4176a:	89 55 ec             	mov    %edx,-0x14(%rbp)
   4176d:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
   41771:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   41775:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41779:	48 c1 e0 10          	shl    $0x10,%rax
   4177d:	48 89 c2             	mov    %rax,%rdx
   41780:	48 b8 00 00 ff ff ff 	movabs $0xffffff0000,%rax
   41787:	00 00 00 
   4178a:	48 21 c2             	and    %rax,%rdx
        | ((addr & 0x00000000FF000000UL) << 32)
   4178d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41791:	48 c1 e0 20          	shl    $0x20,%rax
   41795:	48 89 c1             	mov    %rax,%rcx
   41798:	48 b8 00 00 00 00 00 	movabs $0xff00000000000000,%rax
   4179f:	00 00 ff 
   417a2:	48 21 c8             	and    %rcx,%rax
   417a5:	48 09 c2             	or     %rax,%rdx
        | ((size - 1) & 0x0FFFFUL)
   417a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   417ac:	48 83 e8 01          	sub    $0x1,%rax
   417b0:	0f b7 c0             	movzwl %ax,%eax
        | (((size - 1) & 0xF0000UL) << 48)
   417b3:	48 09 d0             	or     %rdx,%rax
        | type
   417b6:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   417ba:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   417bd:	8b 45 ec             	mov    -0x14(%rbp),%eax
   417c0:	48 98                	cltq   
   417c2:	48 c1 e0 2d          	shl    $0x2d,%rax
   417c6:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P;                   // segment present
   417c9:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
   417d0:	80 00 00 
   417d3:	48 09 c2             	or     %rax,%rdx
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   417d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   417da:	48 89 10             	mov    %rdx,(%rax)
    segment[1] = addr >> 32;
   417dd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   417e1:	48 83 c0 08          	add    $0x8,%rax
   417e5:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   417e9:	48 c1 ea 20          	shr    $0x20,%rdx
   417ed:	48 89 10             	mov    %rdx,(%rax)
}
   417f0:	90                   	nop
   417f1:	c9                   	leave  
   417f2:	c3                   	ret    

00000000000417f3 <set_gate>:

// Processor state for taking an interrupt
static x86_64_taskstate kernel_task_descriptor;

static void set_gate(x86_64_gatedescriptor* gate, uint64_t type, int dpl,
                     uintptr_t function) {
   417f3:	f3 0f 1e fa          	endbr64 
   417f7:	55                   	push   %rbp
   417f8:	48 89 e5             	mov    %rsp,%rbp
   417fb:	48 83 ec 20          	sub    $0x20,%rsp
   417ff:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41803:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   41807:	89 55 ec             	mov    %edx,-0x14(%rbp)
   4180a:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    gate->gd_low = (function & 0x000000000000FFFFUL)
   4180e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41812:	0f b7 c0             	movzwl %ax,%eax
        | (SEGSEL_KERN_CODE << 16)
        | type
   41815:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   41819:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   4181c:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4181f:	48 98                	cltq   
   41821:	48 c1 e0 2d          	shl    $0x2d,%rax
   41825:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P
        | ((function & 0x00000000FFFF0000UL) << 32);
   41828:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4182c:	48 c1 e0 20          	shl    $0x20,%rax
   41830:	48 89 c1             	mov    %rax,%rcx
   41833:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   4183a:	00 ff ff 
   4183d:	48 21 c8             	and    %rcx,%rax
   41840:	48 09 c2             	or     %rax,%rdx
   41843:	48 b8 00 00 08 00 00 	movabs $0x800000080000,%rax
   4184a:	80 00 00 
   4184d:	48 09 c2             	or     %rax,%rdx
    gate->gd_low = (function & 0x000000000000FFFFUL)
   41850:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41854:	48 89 10             	mov    %rdx,(%rax)
    gate->gd_high = function >> 32;
   41857:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4185b:	48 c1 e8 20          	shr    $0x20,%rax
   4185f:	48 89 c2             	mov    %rax,%rdx
   41862:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41866:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
   4186a:	90                   	nop
   4186b:	c9                   	leave  
   4186c:	c3                   	ret    

000000000004186d <segments_init>:
extern void default_int_handler(void);
extern void gpf_int_handler(void);
extern void pagefault_int_handler(void);
extern void timer_int_handler(void);

void segments_init(void) {
   4186d:	f3 0f 1e fa          	endbr64 
   41871:	55                   	push   %rbp
   41872:	48 89 e5             	mov    %rsp,%rbp
   41875:	48 83 ec 40          	sub    $0x40,%rsp
    // Segments for kernel & user code & data
    // The privilege level, which can be 0 or 3, differentiates between
    // kernel and user code. (Data segments are unused in WeensyOS.)
    segments[0] = 0;
   41879:	48 c7 05 dc 09 01 00 	movq   $0x0,0x109dc(%rip)        # 52260 <segments>
   41880:	00 00 00 00 
    set_app_segment(&segments[SEGSEL_KERN_CODE >> 3], X86SEG_X | X86SEG_L, 0);
   41884:	ba 00 00 00 00       	mov    $0x0,%edx
   41889:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   41890:	08 20 00 
   41893:	48 89 c6             	mov    %rax,%rsi
   41896:	48 8d 05 cb 09 01 00 	lea    0x109cb(%rip),%rax        # 52268 <segments+0x8>
   4189d:	48 89 c7             	mov    %rax,%rdi
   418a0:	e8 76 fe ff ff       	call   4171b <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_CODE >> 3], X86SEG_X | X86SEG_L, 3);
   418a5:	ba 03 00 00 00       	mov    $0x3,%edx
   418aa:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   418b1:	08 20 00 
   418b4:	48 89 c6             	mov    %rax,%rsi
   418b7:	48 8d 05 b2 09 01 00 	lea    0x109b2(%rip),%rax        # 52270 <segments+0x10>
   418be:	48 89 c7             	mov    %rax,%rdi
   418c1:	e8 55 fe ff ff       	call   4171b <set_app_segment>
    set_app_segment(&segments[SEGSEL_KERN_DATA >> 3], X86SEG_W, 0);
   418c6:	ba 00 00 00 00       	mov    $0x0,%edx
   418cb:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   418d2:	02 00 00 
   418d5:	48 89 c6             	mov    %rax,%rsi
   418d8:	48 8d 05 99 09 01 00 	lea    0x10999(%rip),%rax        # 52278 <segments+0x18>
   418df:	48 89 c7             	mov    %rax,%rdi
   418e2:	e8 34 fe ff ff       	call   4171b <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_DATA >> 3], X86SEG_W, 3);
   418e7:	ba 03 00 00 00       	mov    $0x3,%edx
   418ec:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   418f3:	02 00 00 
   418f6:	48 89 c6             	mov    %rax,%rsi
   418f9:	48 8d 05 80 09 01 00 	lea    0x10980(%rip),%rax        # 52280 <segments+0x20>
   41900:	48 89 c7             	mov    %rax,%rdi
   41903:	e8 13 fe ff ff       	call   4171b <set_app_segment>
    set_sys_segment(&segments[SEGSEL_TASKSTATE >> 3], X86SEG_TSS, 0,
   41908:	48 8d 05 91 19 01 00 	lea    0x11991(%rip),%rax        # 532a0 <kernel_task_descriptor>
   4190f:	41 b8 60 00 00 00    	mov    $0x60,%r8d
   41915:	48 89 c1             	mov    %rax,%rcx
   41918:	ba 00 00 00 00       	mov    $0x0,%edx
   4191d:	48 b8 00 00 00 00 00 	movabs $0x90000000000,%rax
   41924:	09 00 00 
   41927:	48 89 c6             	mov    %rax,%rsi
   4192a:	48 8d 05 57 09 01 00 	lea    0x10957(%rip),%rax        # 52288 <segments+0x28>
   41931:	48 89 c7             	mov    %rax,%rdi
   41934:	e8 1d fe ff ff       	call   41756 <set_sys_segment>
                    (uintptr_t) &kernel_task_descriptor,
                    sizeof(kernel_task_descriptor));

    x86_64_pseudodescriptor gdt;
    gdt.pseudod_limit = sizeof(segments) - 1;
   41939:	66 c7 45 d6 37 00    	movw   $0x37,-0x2a(%rbp)
    gdt.pseudod_base = (uint64_t) segments;
   4193f:	48 8d 05 1a 09 01 00 	lea    0x1091a(%rip),%rax        # 52260 <segments>
   41946:	48 89 45 d8          	mov    %rax,-0x28(%rbp)

    // Kernel task descriptor lets us receive interrupts
    memset(&kernel_task_descriptor, 0, sizeof(kernel_task_descriptor));
   4194a:	ba 60 00 00 00       	mov    $0x60,%edx
   4194f:	be 00 00 00 00       	mov    $0x0,%esi
   41954:	48 8d 05 45 19 01 00 	lea    0x11945(%rip),%rax        # 532a0 <kernel_task_descriptor>
   4195b:	48 89 c7             	mov    %rax,%rdi
   4195e:	e8 7e 1a 00 00       	call   433e1 <memset>
    kernel_task_descriptor.ts_rsp[0] = KERNEL_STACK_TOP;
   41963:	48 c7 05 36 19 01 00 	movq   $0x80000,0x11936(%rip)        # 532a4 <kernel_task_descriptor+0x4>
   4196a:	00 00 08 00 

    // Interrupt handler; most interrupts are effectively ignored
    memset(interrupt_descriptors, 0, sizeof(interrupt_descriptors));
   4196e:	ba 00 10 00 00       	mov    $0x1000,%edx
   41973:	be 00 00 00 00       	mov    $0x0,%esi
   41978:	48 8d 05 21 09 01 00 	lea    0x10921(%rip),%rax        # 522a0 <interrupt_descriptors>
   4197f:	48 89 c7             	mov    %rax,%rdi
   41982:	e8 5a 1a 00 00       	call   433e1 <memset>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   41987:	c7 45 fc 10 00 00 00 	movl   $0x10,-0x4(%rbp)
   4198e:	eb 3c                	jmp    419cc <segments_init+0x15f>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 0,
   41990:	48 c7 c0 9c 00 04 00 	mov    $0x4009c,%rax
   41997:	48 89 c2             	mov    %rax,%rdx
   4199a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4199d:	48 c1 e0 04          	shl    $0x4,%rax
   419a1:	48 89 c1             	mov    %rax,%rcx
   419a4:	48 8d 05 f5 08 01 00 	lea    0x108f5(%rip),%rax        # 522a0 <interrupt_descriptors>
   419ab:	48 01 c8             	add    %rcx,%rax
   419ae:	48 89 d1             	mov    %rdx,%rcx
   419b1:	ba 00 00 00 00       	mov    $0x0,%edx
   419b6:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   419bd:	0e 00 00 
   419c0:	48 89 c7             	mov    %rax,%rdi
   419c3:	e8 2b fe ff ff       	call   417f3 <set_gate>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   419c8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   419cc:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
   419d3:	76 bb                	jbe    41990 <segments_init+0x123>
                 (uint64_t) default_int_handler);
    }

    // Timer interrupt
    set_gate(&interrupt_descriptors[INT_TIMER], X86GATE_INTERRUPT, 0,
   419d5:	48 c7 c0 36 00 04 00 	mov    $0x40036,%rax
   419dc:	48 89 c1             	mov    %rax,%rcx
   419df:	ba 00 00 00 00       	mov    $0x0,%edx
   419e4:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   419eb:	0e 00 00 
   419ee:	48 89 c6             	mov    %rax,%rsi
   419f1:	48 8d 05 a8 0a 01 00 	lea    0x10aa8(%rip),%rax        # 524a0 <interrupt_descriptors+0x200>
   419f8:	48 89 c7             	mov    %rax,%rdi
   419fb:	e8 f3 fd ff ff       	call   417f3 <set_gate>
             (uint64_t) timer_int_handler);

    // GPF and page fault
    set_gate(&interrupt_descriptors[INT_GPF], X86GATE_INTERRUPT, 0,
   41a00:	48 c7 c0 2e 00 04 00 	mov    $0x4002e,%rax
   41a07:	48 89 c1             	mov    %rax,%rcx
   41a0a:	ba 00 00 00 00       	mov    $0x0,%edx
   41a0f:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41a16:	0e 00 00 
   41a19:	48 89 c6             	mov    %rax,%rsi
   41a1c:	48 8d 05 4d 09 01 00 	lea    0x1094d(%rip),%rax        # 52370 <interrupt_descriptors+0xd0>
   41a23:	48 89 c7             	mov    %rax,%rdi
   41a26:	e8 c8 fd ff ff       	call   417f3 <set_gate>
             (uint64_t) gpf_int_handler);
    set_gate(&interrupt_descriptors[INT_PAGEFAULT], X86GATE_INTERRUPT, 0,
   41a2b:	48 c7 c0 32 00 04 00 	mov    $0x40032,%rax
   41a32:	48 89 c1             	mov    %rax,%rcx
   41a35:	ba 00 00 00 00       	mov    $0x0,%edx
   41a3a:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41a41:	0e 00 00 
   41a44:	48 89 c6             	mov    %rax,%rsi
   41a47:	48 8d 05 32 09 01 00 	lea    0x10932(%rip),%rax        # 52380 <interrupt_descriptors+0xe0>
   41a4e:	48 89 c7             	mov    %rax,%rdi
   41a51:	e8 9d fd ff ff       	call   417f3 <set_gate>
             (uint64_t) pagefault_int_handler);

    // System calls get special handling.
    // Note that the last argument is '3'.  This means that unprivileged
    // (level-3) applications may generate these interrupts.
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   41a56:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%rbp)
   41a5d:	eb 50                	jmp    41aaf <segments_init+0x242>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
                 (uint64_t) sys_int_handlers[i - INT_SYS]);
   41a5f:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41a62:	83 e8 30             	sub    $0x30,%eax
   41a65:	89 c0                	mov    %eax,%eax
   41a67:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   41a6e:	00 
   41a6f:	48 8d 05 71 e6 ff ff 	lea    -0x198f(%rip),%rax        # 400e7 <sys_int_handlers>
   41a76:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
   41a7a:	48 89 c2             	mov    %rax,%rdx
   41a7d:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41a80:	48 c1 e0 04          	shl    $0x4,%rax
   41a84:	48 89 c1             	mov    %rax,%rcx
   41a87:	48 8d 05 12 08 01 00 	lea    0x10812(%rip),%rax        # 522a0 <interrupt_descriptors>
   41a8e:	48 01 c8             	add    %rcx,%rax
   41a91:	48 89 d1             	mov    %rdx,%rcx
   41a94:	ba 03 00 00 00       	mov    $0x3,%edx
   41a99:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   41aa0:	0e 00 00 
   41aa3:	48 89 c7             	mov    %rax,%rdi
   41aa6:	e8 48 fd ff ff       	call   417f3 <set_gate>
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   41aab:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   41aaf:	83 7d f8 3f          	cmpl   $0x3f,-0x8(%rbp)
   41ab3:	76 aa                	jbe    41a5f <segments_init+0x1f2>
    }

    x86_64_pseudodescriptor idt;
    idt.pseudod_limit = sizeof(interrupt_descriptors) - 1;
   41ab5:	66 c7 45 cc ff 0f    	movw   $0xfff,-0x34(%rbp)
    idt.pseudod_base = (uint64_t) interrupt_descriptors;
   41abb:	48 8d 05 de 07 01 00 	lea    0x107de(%rip),%rax        # 522a0 <interrupt_descriptors>
   41ac2:	48 89 45 ce          	mov    %rax,-0x32(%rbp)

    // Reload segment pointers
    asm volatile("lgdt %0\n\t"
   41ac6:	b8 28 00 00 00       	mov    $0x28,%eax
   41acb:	0f 01 55 d6          	lgdt   -0x2a(%rbp)
   41acf:	0f 00 d8             	ltr    %ax
   41ad2:	0f 01 5d cc          	lidt   -0x34(%rbp)
    asm volatile("movq %%cr0,%0" : "=r" (val));
   41ad6:	0f 20 c0             	mov    %cr0,%rax
   41ad9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    return val;
   41add:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
                     "r" ((uint16_t) SEGSEL_TASKSTATE),
                     "m" (idt)
                 : "memory");

    // Set up control registers: check alignment
    uint32_t cr0 = rcr0();
   41ae1:	89 45 f4             	mov    %eax,-0xc(%rbp)
    cr0 |= CR0_PE | CR0_PG | CR0_WP | CR0_AM | CR0_MP | CR0_NE;
   41ae4:	81 4d f4 23 00 05 80 	orl    $0x80050023,-0xc(%rbp)
   41aeb:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41aee:	89 45 f0             	mov    %eax,-0x10(%rbp)
    uint64_t xval = val;
   41af1:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41af4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    asm volatile("movq %0,%%cr0" : : "r" (xval));
   41af8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41afc:	0f 22 c0             	mov    %rax,%cr0
}
   41aff:	90                   	nop
    lcr0(cr0);
}
   41b00:	90                   	nop
   41b01:	c9                   	leave  
   41b02:	c3                   	ret    

0000000000041b03 <interrupt_mask>:
#define TIMER_FREQ      1193182
#define TIMER_DIV(x)    ((TIMER_FREQ+(x)/2)/(x))

static uint16_t interrupts_enabled;

static void interrupt_mask(void) {
   41b03:	f3 0f 1e fa          	endbr64 
   41b07:	55                   	push   %rbp
   41b08:	48 89 e5             	mov    %rsp,%rbp
   41b0b:	48 83 ec 20          	sub    $0x20,%rsp
    uint16_t masked = ~interrupts_enabled;
   41b0f:	0f b7 05 ea 17 01 00 	movzwl 0x117ea(%rip),%eax        # 53300 <interrupts_enabled>
   41b16:	f7 d0                	not    %eax
   41b18:	66 89 45 fe          	mov    %ax,-0x2(%rbp)
    outb(IO_PIC1+1, masked & 0xFF);
   41b1c:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   41b20:	0f b6 c0             	movzbl %al,%eax
   41b23:	c7 45 f0 21 00 00 00 	movl   $0x21,-0x10(%rbp)
   41b2a:	88 45 ef             	mov    %al,-0x11(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41b2d:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   41b31:	8b 55 f0             	mov    -0x10(%rbp),%edx
   41b34:	ee                   	out    %al,(%dx)
}
   41b35:	90                   	nop
    outb(IO_PIC2+1, (masked >> 8) & 0xFF);
   41b36:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   41b3a:	66 c1 e8 08          	shr    $0x8,%ax
   41b3e:	0f b6 c0             	movzbl %al,%eax
   41b41:	c7 45 f8 a1 00 00 00 	movl   $0xa1,-0x8(%rbp)
   41b48:	88 45 f7             	mov    %al,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41b4b:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   41b4f:	8b 55 f8             	mov    -0x8(%rbp),%edx
   41b52:	ee                   	out    %al,(%dx)
}
   41b53:	90                   	nop
}
   41b54:	90                   	nop
   41b55:	c9                   	leave  
   41b56:	c3                   	ret    

0000000000041b57 <interrupt_init>:

void interrupt_init(void) {
   41b57:	f3 0f 1e fa          	endbr64 
   41b5b:	55                   	push   %rbp
   41b5c:	48 89 e5             	mov    %rsp,%rbp
   41b5f:	48 83 ec 60          	sub    $0x60,%rsp
    // mask all interrupts
    interrupts_enabled = 0;
   41b63:	66 c7 05 94 17 01 00 	movw   $0x0,0x11794(%rip)        # 53300 <interrupts_enabled>
   41b6a:	00 00 
    interrupt_mask();
   41b6c:	e8 92 ff ff ff       	call   41b03 <interrupt_mask>
   41b71:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%rbp)
   41b78:	c6 45 a3 11          	movb   $0x11,-0x5d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41b7c:	0f b6 45 a3          	movzbl -0x5d(%rbp),%eax
   41b80:	8b 55 a4             	mov    -0x5c(%rbp),%edx
   41b83:	ee                   	out    %al,(%dx)
}
   41b84:	90                   	nop
   41b85:	c7 45 ac 21 00 00 00 	movl   $0x21,-0x54(%rbp)
   41b8c:	c6 45 ab 20          	movb   $0x20,-0x55(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41b90:	0f b6 45 ab          	movzbl -0x55(%rbp),%eax
   41b94:	8b 55 ac             	mov    -0x54(%rbp),%edx
   41b97:	ee                   	out    %al,(%dx)
}
   41b98:	90                   	nop
   41b99:	c7 45 b4 21 00 00 00 	movl   $0x21,-0x4c(%rbp)
   41ba0:	c6 45 b3 04          	movb   $0x4,-0x4d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41ba4:	0f b6 45 b3          	movzbl -0x4d(%rbp),%eax
   41ba8:	8b 55 b4             	mov    -0x4c(%rbp),%edx
   41bab:	ee                   	out    %al,(%dx)
}
   41bac:	90                   	nop
   41bad:	c7 45 bc 21 00 00 00 	movl   $0x21,-0x44(%rbp)
   41bb4:	c6 45 bb 03          	movb   $0x3,-0x45(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41bb8:	0f b6 45 bb          	movzbl -0x45(%rbp),%eax
   41bbc:	8b 55 bc             	mov    -0x44(%rbp),%edx
   41bbf:	ee                   	out    %al,(%dx)
}
   41bc0:	90                   	nop
   41bc1:	c7 45 c4 a0 00 00 00 	movl   $0xa0,-0x3c(%rbp)
   41bc8:	c6 45 c3 11          	movb   $0x11,-0x3d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41bcc:	0f b6 45 c3          	movzbl -0x3d(%rbp),%eax
   41bd0:	8b 55 c4             	mov    -0x3c(%rbp),%edx
   41bd3:	ee                   	out    %al,(%dx)
}
   41bd4:	90                   	nop
   41bd5:	c7 45 cc a1 00 00 00 	movl   $0xa1,-0x34(%rbp)
   41bdc:	c6 45 cb 28          	movb   $0x28,-0x35(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41be0:	0f b6 45 cb          	movzbl -0x35(%rbp),%eax
   41be4:	8b 55 cc             	mov    -0x34(%rbp),%edx
   41be7:	ee                   	out    %al,(%dx)
}
   41be8:	90                   	nop
   41be9:	c7 45 d4 a1 00 00 00 	movl   $0xa1,-0x2c(%rbp)
   41bf0:	c6 45 d3 02          	movb   $0x2,-0x2d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41bf4:	0f b6 45 d3          	movzbl -0x2d(%rbp),%eax
   41bf8:	8b 55 d4             	mov    -0x2c(%rbp),%edx
   41bfb:	ee                   	out    %al,(%dx)
}
   41bfc:	90                   	nop
   41bfd:	c7 45 dc a1 00 00 00 	movl   $0xa1,-0x24(%rbp)
   41c04:	c6 45 db 01          	movb   $0x1,-0x25(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c08:	0f b6 45 db          	movzbl -0x25(%rbp),%eax
   41c0c:	8b 55 dc             	mov    -0x24(%rbp),%edx
   41c0f:	ee                   	out    %al,(%dx)
}
   41c10:	90                   	nop
   41c11:	c7 45 e4 20 00 00 00 	movl   $0x20,-0x1c(%rbp)
   41c18:	c6 45 e3 68          	movb   $0x68,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c1c:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   41c20:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   41c23:	ee                   	out    %al,(%dx)
}
   41c24:	90                   	nop
   41c25:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
   41c2c:	c6 45 eb 0a          	movb   $0xa,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c30:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   41c34:	8b 55 ec             	mov    -0x14(%rbp),%edx
   41c37:	ee                   	out    %al,(%dx)
}
   41c38:	90                   	nop
   41c39:	c7 45 f4 a0 00 00 00 	movl   $0xa0,-0xc(%rbp)
   41c40:	c6 45 f3 68          	movb   $0x68,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c44:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   41c48:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41c4b:	ee                   	out    %al,(%dx)
}
   41c4c:	90                   	nop
   41c4d:	c7 45 fc a0 00 00 00 	movl   $0xa0,-0x4(%rbp)
   41c54:	c6 45 fb 0a          	movb   $0xa,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c58:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   41c5c:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41c5f:	ee                   	out    %al,(%dx)
}
   41c60:	90                   	nop

    outb(IO_PIC2, 0x68);               /* OCW3 */
    outb(IO_PIC2, 0x0a);               /* OCW3 */

    // re-disable interrupts
    interrupt_mask();
   41c61:	e8 9d fe ff ff       	call   41b03 <interrupt_mask>
}
   41c66:	90                   	nop
   41c67:	c9                   	leave  
   41c68:	c3                   	ret    

0000000000041c69 <timer_init>:

// timer_init(rate)
//    Set the timer interrupt to fire `rate` times a second. Disables the
//    timer interrupt if `rate <= 0`.

void timer_init(int rate) {
   41c69:	f3 0f 1e fa          	endbr64 
   41c6d:	55                   	push   %rbp
   41c6e:	48 89 e5             	mov    %rsp,%rbp
   41c71:	48 83 ec 28          	sub    $0x28,%rsp
   41c75:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (rate > 0) {
   41c78:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   41c7c:	0f 8e 9f 00 00 00    	jle    41d21 <timer_init+0xb8>
   41c82:	c7 45 ec 43 00 00 00 	movl   $0x43,-0x14(%rbp)
   41c89:	c6 45 eb 34          	movb   $0x34,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41c8d:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   41c91:	8b 55 ec             	mov    -0x14(%rbp),%edx
   41c94:	ee                   	out    %al,(%dx)
}
   41c95:	90                   	nop
        outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
        outb(IO_TIMER1, TIMER_DIV(rate) % 256);
   41c96:	8b 45 dc             	mov    -0x24(%rbp),%eax
   41c99:	89 c2                	mov    %eax,%edx
   41c9b:	c1 ea 1f             	shr    $0x1f,%edx
   41c9e:	01 d0                	add    %edx,%eax
   41ca0:	d1 f8                	sar    %eax
   41ca2:	05 de 34 12 00       	add    $0x1234de,%eax
   41ca7:	99                   	cltd   
   41ca8:	f7 7d dc             	idivl  -0x24(%rbp)
   41cab:	89 c2                	mov    %eax,%edx
   41cad:	89 d0                	mov    %edx,%eax
   41caf:	c1 f8 1f             	sar    $0x1f,%eax
   41cb2:	c1 e8 18             	shr    $0x18,%eax
   41cb5:	89 c1                	mov    %eax,%ecx
   41cb7:	8d 04 0a             	lea    (%rdx,%rcx,1),%eax
   41cba:	0f b6 c0             	movzbl %al,%eax
   41cbd:	29 c8                	sub    %ecx,%eax
   41cbf:	0f b6 c0             	movzbl %al,%eax
   41cc2:	c7 45 f4 40 00 00 00 	movl   $0x40,-0xc(%rbp)
   41cc9:	88 45 f3             	mov    %al,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41ccc:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   41cd0:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41cd3:	ee                   	out    %al,(%dx)
}
   41cd4:	90                   	nop
        outb(IO_TIMER1, TIMER_DIV(rate) / 256);
   41cd5:	8b 45 dc             	mov    -0x24(%rbp),%eax
   41cd8:	89 c2                	mov    %eax,%edx
   41cda:	c1 ea 1f             	shr    $0x1f,%edx
   41cdd:	01 d0                	add    %edx,%eax
   41cdf:	d1 f8                	sar    %eax
   41ce1:	05 de 34 12 00       	add    $0x1234de,%eax
   41ce6:	99                   	cltd   
   41ce7:	f7 7d dc             	idivl  -0x24(%rbp)
   41cea:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   41cf0:	85 c0                	test   %eax,%eax
   41cf2:	0f 48 c2             	cmovs  %edx,%eax
   41cf5:	c1 f8 08             	sar    $0x8,%eax
   41cf8:	0f b6 c0             	movzbl %al,%eax
   41cfb:	c7 45 fc 40 00 00 00 	movl   $0x40,-0x4(%rbp)
   41d02:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41d05:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   41d09:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41d0c:	ee                   	out    %al,(%dx)
}
   41d0d:	90                   	nop
        interrupts_enabled |= 1 << (INT_TIMER - INT_HARDWARE);
   41d0e:	0f b7 05 eb 15 01 00 	movzwl 0x115eb(%rip),%eax        # 53300 <interrupts_enabled>
   41d15:	83 c8 01             	or     $0x1,%eax
   41d18:	66 89 05 e1 15 01 00 	mov    %ax,0x115e1(%rip)        # 53300 <interrupts_enabled>
   41d1f:	eb 11                	jmp    41d32 <timer_init+0xc9>
    } else {
        interrupts_enabled &= ~(1 << (INT_TIMER - INT_HARDWARE));
   41d21:	0f b7 05 d8 15 01 00 	movzwl 0x115d8(%rip),%eax        # 53300 <interrupts_enabled>
   41d28:	83 e0 fe             	and    $0xfffffffe,%eax
   41d2b:	66 89 05 ce 15 01 00 	mov    %ax,0x115ce(%rip)        # 53300 <interrupts_enabled>
    }
    interrupt_mask();
   41d32:	e8 cc fd ff ff       	call   41b03 <interrupt_mask>
}
   41d37:	90                   	nop
   41d38:	c9                   	leave  
   41d39:	c3                   	ret    

0000000000041d3a <physical_memory_isreserved>:
//    Returns non-zero iff `pa` is a reserved physical address.

#define IOPHYSMEM       0x000A0000
#define EXTPHYSMEM      0x00100000

int physical_memory_isreserved(uintptr_t pa) {
   41d3a:	f3 0f 1e fa          	endbr64 
   41d3e:	55                   	push   %rbp
   41d3f:	48 89 e5             	mov    %rsp,%rbp
   41d42:	48 83 ec 08          	sub    $0x8,%rsp
   41d46:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return pa == 0 || (pa >= IOPHYSMEM && pa < EXTPHYSMEM);
   41d4a:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   41d4f:	74 14                	je     41d65 <physical_memory_isreserved+0x2b>
   41d51:	48 81 7d f8 ff ff 09 	cmpq   $0x9ffff,-0x8(%rbp)
   41d58:	00 
   41d59:	76 11                	jbe    41d6c <physical_memory_isreserved+0x32>
   41d5b:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   41d62:	00 
   41d63:	77 07                	ja     41d6c <physical_memory_isreserved+0x32>
   41d65:	b8 01 00 00 00       	mov    $0x1,%eax
   41d6a:	eb 05                	jmp    41d71 <physical_memory_isreserved+0x37>
   41d6c:	b8 00 00 00 00       	mov    $0x0,%eax
}
   41d71:	c9                   	leave  
   41d72:	c3                   	ret    

0000000000041d73 <pci_make_configaddr>:


// pci_make_configaddr(bus, slot, func)
//    Construct a PCI configuration space address from parts.

static int pci_make_configaddr(int bus, int slot, int func) {
   41d73:	f3 0f 1e fa          	endbr64 
   41d77:	55                   	push   %rbp
   41d78:	48 89 e5             	mov    %rsp,%rbp
   41d7b:	48 83 ec 10          	sub    $0x10,%rsp
   41d7f:	89 7d fc             	mov    %edi,-0x4(%rbp)
   41d82:	89 75 f8             	mov    %esi,-0x8(%rbp)
   41d85:	89 55 f4             	mov    %edx,-0xc(%rbp)
    return (bus << 16) | (slot << 11) | (func << 8);
   41d88:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41d8b:	c1 e0 10             	shl    $0x10,%eax
   41d8e:	89 c2                	mov    %eax,%edx
   41d90:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41d93:	c1 e0 0b             	shl    $0xb,%eax
   41d96:	09 c2                	or     %eax,%edx
   41d98:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41d9b:	c1 e0 08             	shl    $0x8,%eax
   41d9e:	09 d0                	or     %edx,%eax
}
   41da0:	c9                   	leave  
   41da1:	c3                   	ret    

0000000000041da2 <pci_config_readl>:
//    Read a 32-bit word in PCI configuration space.

#define PCI_HOST_BRIDGE_CONFIG_ADDR 0xCF8
#define PCI_HOST_BRIDGE_CONFIG_DATA 0xCFC

static uint32_t pci_config_readl(int configaddr, int offset) {
   41da2:	f3 0f 1e fa          	endbr64 
   41da6:	55                   	push   %rbp
   41da7:	48 89 e5             	mov    %rsp,%rbp
   41daa:	48 83 ec 18          	sub    $0x18,%rsp
   41dae:	89 7d ec             	mov    %edi,-0x14(%rbp)
   41db1:	89 75 e8             	mov    %esi,-0x18(%rbp)
    outl(PCI_HOST_BRIDGE_CONFIG_ADDR, 0x80000000 | configaddr | offset);
   41db4:	8b 55 ec             	mov    -0x14(%rbp),%edx
   41db7:	8b 45 e8             	mov    -0x18(%rbp),%eax
   41dba:	09 d0                	or     %edx,%eax
   41dbc:	0d 00 00 00 80       	or     $0x80000000,%eax
   41dc1:	c7 45 f4 f8 0c 00 00 	movl   $0xcf8,-0xc(%rbp)
   41dc8:	89 45 f0             	mov    %eax,-0x10(%rbp)
    asm volatile("outl %0,%w1" : : "a" (data), "d" (port));
   41dcb:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41dce:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41dd1:	ef                   	out    %eax,(%dx)
}
   41dd2:	90                   	nop
   41dd3:	c7 45 fc fc 0c 00 00 	movl   $0xcfc,-0x4(%rbp)
    asm volatile("inl %w1,%0" : "=a" (data) : "d" (port));
   41dda:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41ddd:	89 c2                	mov    %eax,%edx
   41ddf:	ed                   	in     (%dx),%eax
   41de0:	89 45 f8             	mov    %eax,-0x8(%rbp)
    return data;
   41de3:	8b 45 f8             	mov    -0x8(%rbp),%eax
    return inl(PCI_HOST_BRIDGE_CONFIG_DATA);
}
   41de6:	c9                   	leave  
   41de7:	c3                   	ret    

0000000000041de8 <pci_find_device>:

// pci_find_device
//    Search for a PCI device matching `vendor` and `device`. Return
//    the config base address or -1 if no device was found.

static int pci_find_device(int vendor, int device) {
   41de8:	f3 0f 1e fa          	endbr64 
   41dec:	55                   	push   %rbp
   41ded:	48 89 e5             	mov    %rsp,%rbp
   41df0:	48 83 ec 28          	sub    $0x28,%rsp
   41df4:	89 7d dc             	mov    %edi,-0x24(%rbp)
   41df7:	89 75 d8             	mov    %esi,-0x28(%rbp)
    for (int bus = 0; bus != 256; ++bus) {
   41dfa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41e01:	eb 73                	jmp    41e76 <pci_find_device+0x8e>
        for (int slot = 0; slot != 32; ++slot) {
   41e03:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   41e0a:	eb 60                	jmp    41e6c <pci_find_device+0x84>
            for (int func = 0; func != 8; ++func) {
   41e0c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   41e13:	eb 4a                	jmp    41e5f <pci_find_device+0x77>
                int configaddr = pci_make_configaddr(bus, slot, func);
   41e15:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41e18:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   41e1b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41e1e:	89 ce                	mov    %ecx,%esi
   41e20:	89 c7                	mov    %eax,%edi
   41e22:	e8 4c ff ff ff       	call   41d73 <pci_make_configaddr>
   41e27:	89 45 f0             	mov    %eax,-0x10(%rbp)
                uint32_t vendor_device = pci_config_readl(configaddr, 0);
   41e2a:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41e2d:	be 00 00 00 00       	mov    $0x0,%esi
   41e32:	89 c7                	mov    %eax,%edi
   41e34:	e8 69 ff ff ff       	call   41da2 <pci_config_readl>
   41e39:	89 45 ec             	mov    %eax,-0x14(%rbp)
                if (vendor_device == (uint32_t) (vendor | (device << 16))) {
   41e3c:	8b 45 d8             	mov    -0x28(%rbp),%eax
   41e3f:	c1 e0 10             	shl    $0x10,%eax
   41e42:	0b 45 dc             	or     -0x24(%rbp),%eax
   41e45:	39 45 ec             	cmp    %eax,-0x14(%rbp)
   41e48:	75 05                	jne    41e4f <pci_find_device+0x67>
                    return configaddr;
   41e4a:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41e4d:	eb 35                	jmp    41e84 <pci_find_device+0x9c>
                } else if (vendor_device == (uint32_t) -1 && func == 0) {
   41e4f:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%rbp)
   41e53:	75 06                	jne    41e5b <pci_find_device+0x73>
   41e55:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   41e59:	74 0c                	je     41e67 <pci_find_device+0x7f>
            for (int func = 0; func != 8; ++func) {
   41e5b:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   41e5f:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
   41e63:	75 b0                	jne    41e15 <pci_find_device+0x2d>
   41e65:	eb 01                	jmp    41e68 <pci_find_device+0x80>
                    break;
   41e67:	90                   	nop
        for (int slot = 0; slot != 32; ++slot) {
   41e68:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   41e6c:	83 7d f8 20          	cmpl   $0x20,-0x8(%rbp)
   41e70:	75 9a                	jne    41e0c <pci_find_device+0x24>
    for (int bus = 0; bus != 256; ++bus) {
   41e72:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41e76:	81 7d fc 00 01 00 00 	cmpl   $0x100,-0x4(%rbp)
   41e7d:	75 84                	jne    41e03 <pci_find_device+0x1b>
                }
            }
        }
    }
    return -1;
   41e7f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   41e84:	c9                   	leave  
   41e85:	c3                   	ret    

0000000000041e86 <poweroff>:
//    that speaks ACPI; QEMU emulates a PIIX4 Power Management Controller.

#define PCI_VENDOR_ID_INTEL     0x8086
#define PCI_DEVICE_ID_PIIX4     0x7113

void poweroff(void) {
   41e86:	f3 0f 1e fa          	endbr64 
   41e8a:	55                   	push   %rbp
   41e8b:	48 89 e5             	mov    %rsp,%rbp
   41e8e:	48 83 ec 10          	sub    $0x10,%rsp
    int configaddr = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PIIX4);
   41e92:	be 13 71 00 00       	mov    $0x7113,%esi
   41e97:	bf 86 80 00 00       	mov    $0x8086,%edi
   41e9c:	e8 47 ff ff ff       	call   41de8 <pci_find_device>
   41ea1:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (configaddr >= 0) {
   41ea4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   41ea8:	78 30                	js     41eda <poweroff+0x54>
        // Read I/O base register from controller's PCI configuration space.
        int pm_io_base = pci_config_readl(configaddr, 0x40) & 0xFFC0;
   41eaa:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41ead:	be 40 00 00 00       	mov    $0x40,%esi
   41eb2:	89 c7                	mov    %eax,%edi
   41eb4:	e8 e9 fe ff ff       	call   41da2 <pci_config_readl>
   41eb9:	25 c0 ff 00 00       	and    $0xffc0,%eax
   41ebe:	89 45 f8             	mov    %eax,-0x8(%rbp)
        // Write `suspend enable` to the power management control register.
        outw(pm_io_base + 4, 0x2000);
   41ec1:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41ec4:	83 c0 04             	add    $0x4,%eax
   41ec7:	89 45 f4             	mov    %eax,-0xc(%rbp)
   41eca:	66 c7 45 f2 00 20    	movw   $0x2000,-0xe(%rbp)
    asm volatile("outw %0,%w1" : : "a" (data), "d" (port));
   41ed0:	0f b7 45 f2          	movzwl -0xe(%rbp),%eax
   41ed4:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41ed7:	66 ef                	out    %ax,(%dx)
}
   41ed9:	90                   	nop
    }
    // No PIIX4; spin.
    console_printf(CPOS(24, 0), 0xC000, "Cannot power off!\n");
   41eda:	48 8d 05 5f 28 00 00 	lea    0x285f(%rip),%rax        # 44740 <memstate_colors+0xc0>
   41ee1:	48 89 c2             	mov    %rax,%rdx
   41ee4:	be 00 c0 00 00       	mov    $0xc000,%esi
   41ee9:	bf 80 07 00 00       	mov    $0x780,%edi
   41eee:	b8 00 00 00 00       	mov    $0x0,%eax
   41ef3:	e8 28 23 00 00       	call   44220 <console_printf>
 spinloop: goto spinloop;
   41ef8:	eb fe                	jmp    41ef8 <poweroff+0x72>

0000000000041efa <reboot>:


// reboot
//    Reboot the virtual machine.

void reboot(void) {
   41efa:	f3 0f 1e fa          	endbr64 
   41efe:	55                   	push   %rbp
   41eff:	48 89 e5             	mov    %rsp,%rbp
   41f02:	48 83 ec 10          	sub    $0x10,%rsp
   41f06:	c7 45 fc 92 00 00 00 	movl   $0x92,-0x4(%rbp)
   41f0d:	c6 45 fb 03          	movb   $0x3,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41f11:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   41f15:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41f18:	ee                   	out    %al,(%dx)
}
   41f19:	90                   	nop
    outb(0x92, 3);
 spinloop: goto spinloop;
   41f1a:	eb fe                	jmp    41f1a <reboot+0x20>

0000000000041f1c <process_init>:


// process_init(p, flags)
//    Initialize special-purpose registers for process `p`.

void process_init(proc* p, int flags) {
   41f1c:	f3 0f 1e fa          	endbr64 
   41f20:	55                   	push   %rbp
   41f21:	48 89 e5             	mov    %rsp,%rbp
   41f24:	48 83 ec 10          	sub    $0x10,%rsp
   41f28:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41f2c:	89 75 f4             	mov    %esi,-0xc(%rbp)
    memset(&p->p_registers, 0, sizeof(p->p_registers));
   41f2f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41f33:	48 83 c0 08          	add    $0x8,%rax
   41f37:	ba c0 00 00 00       	mov    $0xc0,%edx
   41f3c:	be 00 00 00 00       	mov    $0x0,%esi
   41f41:	48 89 c7             	mov    %rax,%rdi
   41f44:	e8 98 14 00 00       	call   433e1 <memset>
    p->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
   41f49:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41f4d:	66 c7 80 a8 00 00 00 	movw   $0x13,0xa8(%rax)
   41f54:	13 00 
    p->p_registers.reg_fs = SEGSEL_APP_DATA | 3;
   41f56:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41f5a:	48 c7 80 80 00 00 00 	movq   $0x23,0x80(%rax)
   41f61:	23 00 00 00 
    p->p_registers.reg_gs = SEGSEL_APP_DATA | 3;
   41f65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41f69:	48 c7 80 88 00 00 00 	movq   $0x23,0x88(%rax)
   41f70:	23 00 00 00 
    p->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
   41f74:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41f78:	66 c7 80 c0 00 00 00 	movw   $0x23,0xc0(%rax)
   41f7f:	23 00 
    p->p_registers.reg_rflags = EFLAGS_IF;
   41f81:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41f85:	48 c7 80 b0 00 00 00 	movq   $0x200,0xb0(%rax)
   41f8c:	00 02 00 00 
    p->display_status = 1;
   41f90:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41f94:	c6 80 d8 00 00 00 01 	movb   $0x1,0xd8(%rax)

    if (flags & PROCINIT_ALLOW_PROGRAMMED_IO) {
   41f9b:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41f9e:	83 e0 01             	and    $0x1,%eax
   41fa1:	85 c0                	test   %eax,%eax
   41fa3:	74 1c                	je     41fc1 <process_init+0xa5>
        p->p_registers.reg_rflags |= EFLAGS_IOPL_3;
   41fa5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41fa9:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   41fb0:	80 cc 30             	or     $0x30,%ah
   41fb3:	48 89 c2             	mov    %rax,%rdx
   41fb6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41fba:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
    if (flags & PROCINIT_DISABLE_INTERRUPTS) {
   41fc1:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41fc4:	83 e0 02             	and    $0x2,%eax
   41fc7:	85 c0                	test   %eax,%eax
   41fc9:	74 1c                	je     41fe7 <process_init+0xcb>
        p->p_registers.reg_rflags &= ~EFLAGS_IF;
   41fcb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41fcf:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   41fd6:	80 e4 fd             	and    $0xfd,%ah
   41fd9:	48 89 c2             	mov    %rax,%rdx
   41fdc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41fe0:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
}
   41fe7:	90                   	nop
   41fe8:	c9                   	leave  
   41fe9:	c3                   	ret    

0000000000041fea <console_show_cursor>:

// console_show_cursor(cpos)
//    Move the console cursor to position `cpos`, which should be between 0
//    and 80 * 25.

void console_show_cursor(int cpos) {
   41fea:	f3 0f 1e fa          	endbr64 
   41fee:	55                   	push   %rbp
   41fef:	48 89 e5             	mov    %rsp,%rbp
   41ff2:	48 83 ec 28          	sub    $0x28,%rsp
   41ff6:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (cpos < 0 || cpos > CONSOLE_ROWS * CONSOLE_COLUMNS) {
   41ff9:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   41ffd:	78 09                	js     42008 <console_show_cursor+0x1e>
   41fff:	81 7d dc d0 07 00 00 	cmpl   $0x7d0,-0x24(%rbp)
   42006:	7e 07                	jle    4200f <console_show_cursor+0x25>
        cpos = 0;
   42008:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
   4200f:	c7 45 e4 d4 03 00 00 	movl   $0x3d4,-0x1c(%rbp)
   42016:	c6 45 e3 0e          	movb   $0xe,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4201a:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   4201e:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   42021:	ee                   	out    %al,(%dx)
}
   42022:	90                   	nop
    }
    outb(0x3D4, 14);
    outb(0x3D5, cpos / 256);
   42023:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42026:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   4202c:	85 c0                	test   %eax,%eax
   4202e:	0f 48 c2             	cmovs  %edx,%eax
   42031:	c1 f8 08             	sar    $0x8,%eax
   42034:	0f b6 c0             	movzbl %al,%eax
   42037:	c7 45 ec d5 03 00 00 	movl   $0x3d5,-0x14(%rbp)
   4203e:	88 45 eb             	mov    %al,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42041:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   42045:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42048:	ee                   	out    %al,(%dx)
}
   42049:	90                   	nop
   4204a:	c7 45 f4 d4 03 00 00 	movl   $0x3d4,-0xc(%rbp)
   42051:	c6 45 f3 0f          	movb   $0xf,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42055:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   42059:	8b 55 f4             	mov    -0xc(%rbp),%edx
   4205c:	ee                   	out    %al,(%dx)
}
   4205d:	90                   	nop
    outb(0x3D4, 15);
    outb(0x3D5, cpos % 256);
   4205e:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42061:	99                   	cltd   
   42062:	c1 ea 18             	shr    $0x18,%edx
   42065:	01 d0                	add    %edx,%eax
   42067:	0f b6 c0             	movzbl %al,%eax
   4206a:	29 d0                	sub    %edx,%eax
   4206c:	0f b6 c0             	movzbl %al,%eax
   4206f:	c7 45 fc d5 03 00 00 	movl   $0x3d5,-0x4(%rbp)
   42076:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42079:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   4207d:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42080:	ee                   	out    %al,(%dx)
}
   42081:	90                   	nop
}
   42082:	90                   	nop
   42083:	c9                   	leave  
   42084:	c3                   	ret    

0000000000042085 <keyboard_readc>:
    /*CKEY(16)*/ {{'\'', '"', 0, 0}},  /*CKEY(17)*/ {{'`', '~', 0, 0}},
    /*CKEY(18)*/ {{'\\', '|', 034, 0}},  /*CKEY(19)*/ {{',', '<', 0, 0}},
    /*CKEY(20)*/ {{'.', '>', 0, 0}},  /*CKEY(21)*/ {{'/', '?', 0, 0}}
};

int keyboard_readc(void) {
   42085:	f3 0f 1e fa          	endbr64 
   42089:	55                   	push   %rbp
   4208a:	48 89 e5             	mov    %rsp,%rbp
   4208d:	48 83 ec 20          	sub    $0x20,%rsp
   42091:	c7 45 f0 64 00 00 00 	movl   $0x64,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42098:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4209b:	89 c2                	mov    %eax,%edx
   4209d:	ec                   	in     (%dx),%al
   4209e:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   420a1:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    static uint8_t modifiers;
    static uint8_t last_escape;

    if ((inb(KEYBOARD_STATUSREG) & KEYBOARD_STATUS_READY) == 0) {
   420a5:	0f b6 c0             	movzbl %al,%eax
   420a8:	83 e0 01             	and    $0x1,%eax
   420ab:	85 c0                	test   %eax,%eax
   420ad:	75 0a                	jne    420b9 <keyboard_readc+0x34>
        return -1;
   420af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   420b4:	e9 fd 01 00 00       	jmp    422b6 <keyboard_readc+0x231>
   420b9:	c7 45 e8 60 00 00 00 	movl   $0x60,-0x18(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   420c0:	8b 45 e8             	mov    -0x18(%rbp),%eax
   420c3:	89 c2                	mov    %eax,%edx
   420c5:	ec                   	in     (%dx),%al
   420c6:	88 45 e7             	mov    %al,-0x19(%rbp)
    return data;
   420c9:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
    }

    uint8_t data = inb(KEYBOARD_DATAREG);
   420cd:	88 45 fb             	mov    %al,-0x5(%rbp)
    uint8_t escape = last_escape;
   420d0:	0f b6 05 2b 12 01 00 	movzbl 0x1122b(%rip),%eax        # 53302 <last_escape.2>
   420d7:	88 45 fa             	mov    %al,-0x6(%rbp)
    last_escape = 0;
   420da:	c6 05 21 12 01 00 00 	movb   $0x0,0x11221(%rip)        # 53302 <last_escape.2>

    if (data == 0xE0) {         // mode shift
   420e1:	80 7d fb e0          	cmpb   $0xe0,-0x5(%rbp)
   420e5:	75 11                	jne    420f8 <keyboard_readc+0x73>
        last_escape = 0x80;
   420e7:	c6 05 14 12 01 00 80 	movb   $0x80,0x11214(%rip)        # 53302 <last_escape.2>
        return 0;
   420ee:	b8 00 00 00 00       	mov    $0x0,%eax
   420f3:	e9 be 01 00 00       	jmp    422b6 <keyboard_readc+0x231>
    } else if (data & 0x80) {   // key release: matters only for modifier keys
   420f8:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   420fc:	84 c0                	test   %al,%al
   420fe:	79 64                	jns    42164 <keyboard_readc+0xdf>
        int ch = keymap[(data & 0x7F) | escape];
   42100:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42104:	83 e0 7f             	and    $0x7f,%eax
   42107:	89 c2                	mov    %eax,%edx
   42109:	0f b6 45 fa          	movzbl -0x6(%rbp),%eax
   4210d:	09 d0                	or     %edx,%eax
   4210f:	48 98                	cltq   
   42111:	48 8d 15 48 26 00 00 	lea    0x2648(%rip),%rdx        # 44760 <keymap>
   42118:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
   4211c:	0f b6 c0             	movzbl %al,%eax
   4211f:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   42122:	81 7d f4 f9 00 00 00 	cmpl   $0xf9,-0xc(%rbp)
   42129:	7e 2f                	jle    4215a <keyboard_readc+0xd5>
   4212b:	81 7d f4 fc 00 00 00 	cmpl   $0xfc,-0xc(%rbp)
   42132:	7f 26                	jg     4215a <keyboard_readc+0xd5>
            modifiers &= ~(1 << (ch - KEY_SHIFT));
   42134:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42137:	2d fa 00 00 00       	sub    $0xfa,%eax
   4213c:	ba 01 00 00 00       	mov    $0x1,%edx
   42141:	89 c1                	mov    %eax,%ecx
   42143:	d3 e2                	shl    %cl,%edx
   42145:	89 d0                	mov    %edx,%eax
   42147:	f7 d0                	not    %eax
   42149:	89 c2                	mov    %eax,%edx
   4214b:	0f b6 05 b1 11 01 00 	movzbl 0x111b1(%rip),%eax        # 53303 <modifiers.1>
   42152:	21 d0                	and    %edx,%eax
   42154:	88 05 a9 11 01 00    	mov    %al,0x111a9(%rip)        # 53303 <modifiers.1>
        }
        return 0;
   4215a:	b8 00 00 00 00       	mov    $0x0,%eax
   4215f:	e9 52 01 00 00       	jmp    422b6 <keyboard_readc+0x231>
    }

    int ch = (unsigned char) keymap[data | escape];
   42164:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42168:	0a 45 fa             	or     -0x6(%rbp),%al
   4216b:	0f b6 c0             	movzbl %al,%eax
   4216e:	48 98                	cltq   
   42170:	48 8d 15 e9 25 00 00 	lea    0x25e9(%rip),%rdx        # 44760 <keymap>
   42177:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
   4217b:	0f b6 c0             	movzbl %al,%eax
   4217e:	89 45 fc             	mov    %eax,-0x4(%rbp)

    if (ch >= 'a' && ch <= 'z') {
   42181:	83 7d fc 60          	cmpl   $0x60,-0x4(%rbp)
   42185:	7e 57                	jle    421de <keyboard_readc+0x159>
   42187:	83 7d fc 7a          	cmpl   $0x7a,-0x4(%rbp)
   4218b:	7f 51                	jg     421de <keyboard_readc+0x159>
        if (modifiers & MOD_CONTROL) {
   4218d:	0f b6 05 6f 11 01 00 	movzbl 0x1116f(%rip),%eax        # 53303 <modifiers.1>
   42194:	0f b6 c0             	movzbl %al,%eax
   42197:	83 e0 02             	and    $0x2,%eax
   4219a:	85 c0                	test   %eax,%eax
   4219c:	74 09                	je     421a7 <keyboard_readc+0x122>
            ch -= 0x60;
   4219e:	83 6d fc 60          	subl   $0x60,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   421a2:	e9 0b 01 00 00       	jmp    422b2 <keyboard_readc+0x22d>
        } else if (!(modifiers & MOD_SHIFT) != !(modifiers & MOD_CAPSLOCK)) {
   421a7:	0f b6 05 55 11 01 00 	movzbl 0x11155(%rip),%eax        # 53303 <modifiers.1>
   421ae:	0f b6 c0             	movzbl %al,%eax
   421b1:	83 e0 01             	and    $0x1,%eax
   421b4:	85 c0                	test   %eax,%eax
   421b6:	0f 94 c2             	sete   %dl
   421b9:	0f b6 05 43 11 01 00 	movzbl 0x11143(%rip),%eax        # 53303 <modifiers.1>
   421c0:	0f b6 c0             	movzbl %al,%eax
   421c3:	83 e0 08             	and    $0x8,%eax
   421c6:	85 c0                	test   %eax,%eax
   421c8:	0f 94 c0             	sete   %al
   421cb:	31 d0                	xor    %edx,%eax
   421cd:	84 c0                	test   %al,%al
   421cf:	0f 84 dd 00 00 00    	je     422b2 <keyboard_readc+0x22d>
            ch -= 0x20;
   421d5:	83 6d fc 20          	subl   $0x20,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   421d9:	e9 d4 00 00 00       	jmp    422b2 <keyboard_readc+0x22d>
        }
    } else if (ch >= KEY_CAPSLOCK) {
   421de:	81 7d fc fc 00 00 00 	cmpl   $0xfc,-0x4(%rbp)
   421e5:	7e 30                	jle    42217 <keyboard_readc+0x192>
        modifiers ^= 1 << (ch - KEY_SHIFT);
   421e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
   421ea:	2d fa 00 00 00       	sub    $0xfa,%eax
   421ef:	ba 01 00 00 00       	mov    $0x1,%edx
   421f4:	89 c1                	mov    %eax,%ecx
   421f6:	d3 e2                	shl    %cl,%edx
   421f8:	89 d0                	mov    %edx,%eax
   421fa:	89 c2                	mov    %eax,%edx
   421fc:	0f b6 05 00 11 01 00 	movzbl 0x11100(%rip),%eax        # 53303 <modifiers.1>
   42203:	31 d0                	xor    %edx,%eax
   42205:	88 05 f8 10 01 00    	mov    %al,0x110f8(%rip)        # 53303 <modifiers.1>
        ch = 0;
   4220b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42212:	e9 9c 00 00 00       	jmp    422b3 <keyboard_readc+0x22e>
    } else if (ch >= KEY_SHIFT) {
   42217:	81 7d fc f9 00 00 00 	cmpl   $0xf9,-0x4(%rbp)
   4221e:	7e 2d                	jle    4224d <keyboard_readc+0x1c8>
        modifiers |= 1 << (ch - KEY_SHIFT);
   42220:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42223:	2d fa 00 00 00       	sub    $0xfa,%eax
   42228:	ba 01 00 00 00       	mov    $0x1,%edx
   4222d:	89 c1                	mov    %eax,%ecx
   4222f:	d3 e2                	shl    %cl,%edx
   42231:	89 d0                	mov    %edx,%eax
   42233:	89 c2                	mov    %eax,%edx
   42235:	0f b6 05 c7 10 01 00 	movzbl 0x110c7(%rip),%eax        # 53303 <modifiers.1>
   4223c:	09 d0                	or     %edx,%eax
   4223e:	88 05 bf 10 01 00    	mov    %al,0x110bf(%rip)        # 53303 <modifiers.1>
        ch = 0;
   42244:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4224b:	eb 66                	jmp    422b3 <keyboard_readc+0x22e>
    } else if (ch >= CKEY(0) && ch <= CKEY(21)) {
   4224d:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   42251:	7e 3f                	jle    42292 <keyboard_readc+0x20d>
   42253:	81 7d fc 95 00 00 00 	cmpl   $0x95,-0x4(%rbp)
   4225a:	7f 36                	jg     42292 <keyboard_readc+0x20d>
        ch = complex_keymap[ch - CKEY(0)].map[modifiers & 3];
   4225c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4225f:	8d 50 80             	lea    -0x80(%rax),%edx
   42262:	0f b6 05 9a 10 01 00 	movzbl 0x1109a(%rip),%eax        # 53303 <modifiers.1>
   42269:	0f b6 c0             	movzbl %al,%eax
   4226c:	83 e0 03             	and    $0x3,%eax
   4226f:	48 63 c8             	movslq %eax,%rcx
   42272:	48 63 c2             	movslq %edx,%rax
   42275:	48 c1 e0 02          	shl    $0x2,%rax
   42279:	48 8d 14 08          	lea    (%rax,%rcx,1),%rdx
   4227d:	48 8d 05 dc 25 00 00 	lea    0x25dc(%rip),%rax        # 44860 <complex_keymap>
   42284:	48 01 d0             	add    %rdx,%rax
   42287:	0f b6 00             	movzbl (%rax),%eax
   4228a:	0f b6 c0             	movzbl %al,%eax
   4228d:	89 45 fc             	mov    %eax,-0x4(%rbp)
   42290:	eb 21                	jmp    422b3 <keyboard_readc+0x22e>
    } else if (ch < 0x80 && (modifiers & MOD_CONTROL)) {
   42292:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   42296:	7f 1b                	jg     422b3 <keyboard_readc+0x22e>
   42298:	0f b6 05 64 10 01 00 	movzbl 0x11064(%rip),%eax        # 53303 <modifiers.1>
   4229f:	0f b6 c0             	movzbl %al,%eax
   422a2:	83 e0 02             	and    $0x2,%eax
   422a5:	85 c0                	test   %eax,%eax
   422a7:	74 0a                	je     422b3 <keyboard_readc+0x22e>
        ch = 0;
   422a9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   422b0:	eb 01                	jmp    422b3 <keyboard_readc+0x22e>
        if (modifiers & MOD_CONTROL) {
   422b2:	90                   	nop
    }

    return ch;
   422b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
   422b6:	c9                   	leave  
   422b7:	c3                   	ret    

00000000000422b8 <delay>:
#define IO_PARALLEL1_CONTROL    0x37A
# define IO_PARALLEL_CONTROL_SELECT     0x08
# define IO_PARALLEL_CONTROL_INIT       0x04
# define IO_PARALLEL_CONTROL_STROBE     0x01

static void delay(void) {
   422b8:	f3 0f 1e fa          	endbr64 
   422bc:	55                   	push   %rbp
   422bd:	48 89 e5             	mov    %rsp,%rbp
   422c0:	48 83 ec 20          	sub    $0x20,%rsp
   422c4:	c7 45 e4 84 00 00 00 	movl   $0x84,-0x1c(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   422cb:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   422ce:	89 c2                	mov    %eax,%edx
   422d0:	ec                   	in     (%dx),%al
   422d1:	88 45 e3             	mov    %al,-0x1d(%rbp)
   422d4:	c7 45 ec 84 00 00 00 	movl   $0x84,-0x14(%rbp)
   422db:	8b 45 ec             	mov    -0x14(%rbp),%eax
   422de:	89 c2                	mov    %eax,%edx
   422e0:	ec                   	in     (%dx),%al
   422e1:	88 45 eb             	mov    %al,-0x15(%rbp)
   422e4:	c7 45 f4 84 00 00 00 	movl   $0x84,-0xc(%rbp)
   422eb:	8b 45 f4             	mov    -0xc(%rbp),%eax
   422ee:	89 c2                	mov    %eax,%edx
   422f0:	ec                   	in     (%dx),%al
   422f1:	88 45 f3             	mov    %al,-0xd(%rbp)
   422f4:	c7 45 fc 84 00 00 00 	movl   $0x84,-0x4(%rbp)
   422fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
   422fe:	89 c2                	mov    %eax,%edx
   42300:	ec                   	in     (%dx),%al
   42301:	88 45 fb             	mov    %al,-0x5(%rbp)
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
}
   42304:	90                   	nop
   42305:	c9                   	leave  
   42306:	c3                   	ret    

0000000000042307 <parallel_port_putc>:

static void parallel_port_putc(printer* p, unsigned char c, int color) {
   42307:	f3 0f 1e fa          	endbr64 
   4230b:	55                   	push   %rbp
   4230c:	48 89 e5             	mov    %rsp,%rbp
   4230f:	48 83 ec 40          	sub    $0x40,%rsp
   42313:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   42317:	89 f0                	mov    %esi,%eax
   42319:	89 55 c0             	mov    %edx,-0x40(%rbp)
   4231c:	88 45 c4             	mov    %al,-0x3c(%rbp)
    static int initialized;
    (void) p, (void) color;
    if (!initialized) {
   4231f:	8b 05 df 0f 01 00    	mov    0x10fdf(%rip),%eax        # 53304 <initialized.0>
   42325:	85 c0                	test   %eax,%eax
   42327:	75 1e                	jne    42347 <parallel_port_putc+0x40>
   42329:	c7 45 f8 7a 03 00 00 	movl   $0x37a,-0x8(%rbp)
   42330:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42334:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   42338:	8b 55 f8             	mov    -0x8(%rbp),%edx
   4233b:	ee                   	out    %al,(%dx)
}
   4233c:	90                   	nop
        outb(IO_PARALLEL1_CONTROL, 0);
        initialized = 1;
   4233d:	c7 05 bd 0f 01 00 01 	movl   $0x1,0x10fbd(%rip)        # 53304 <initialized.0>
   42344:	00 00 00 
    }

    for (int i = 0;
   42347:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4234e:	eb 09                	jmp    42359 <parallel_port_putc+0x52>
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
         ++i) {
        delay();
   42350:	e8 63 ff ff ff       	call   422b8 <delay>
         ++i) {
   42355:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
   42359:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%rbp)
   42360:	7f 18                	jg     4237a <parallel_port_putc+0x73>
   42362:	c7 45 f0 79 03 00 00 	movl   $0x379,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42369:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4236c:	89 c2                	mov    %eax,%edx
   4236e:	ec                   	in     (%dx),%al
   4236f:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   42372:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   42376:	84 c0                	test   %al,%al
   42378:	79 d6                	jns    42350 <parallel_port_putc+0x49>
    }
    outb(IO_PARALLEL1_DATA, c);
   4237a:	0f b6 45 c4          	movzbl -0x3c(%rbp),%eax
   4237e:	c7 45 d8 78 03 00 00 	movl   $0x378,-0x28(%rbp)
   42385:	88 45 d7             	mov    %al,-0x29(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42388:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
   4238c:	8b 55 d8             	mov    -0x28(%rbp),%edx
   4238f:	ee                   	out    %al,(%dx)
}
   42390:	90                   	nop
   42391:	c7 45 e0 7a 03 00 00 	movl   $0x37a,-0x20(%rbp)
   42398:	c6 45 df 0d          	movb   $0xd,-0x21(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4239c:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
   423a0:	8b 55 e0             	mov    -0x20(%rbp),%edx
   423a3:	ee                   	out    %al,(%dx)
}
   423a4:	90                   	nop
   423a5:	c7 45 e8 7a 03 00 00 	movl   $0x37a,-0x18(%rbp)
   423ac:	c6 45 e7 0c          	movb   $0xc,-0x19(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   423b0:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
   423b4:	8b 55 e8             	mov    -0x18(%rbp),%edx
   423b7:	ee                   	out    %al,(%dx)
}
   423b8:	90                   	nop
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT | IO_PARALLEL_CONTROL_STROBE);
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT);
}
   423b9:	90                   	nop
   423ba:	c9                   	leave  
   423bb:	c3                   	ret    

00000000000423bc <log_vprintf>:

void log_vprintf(const char* format, va_list val) {
   423bc:	f3 0f 1e fa          	endbr64 
   423c0:	55                   	push   %rbp
   423c1:	48 89 e5             	mov    %rsp,%rbp
   423c4:	48 83 ec 20          	sub    $0x20,%rsp
   423c8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   423cc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    printer p;
    p.putc = parallel_port_putc;
   423d0:	48 8d 05 30 ff ff ff 	lea    -0xd0(%rip),%rax        # 42307 <parallel_port_putc>
   423d7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&p, 0, format, val);
   423db:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
   423df:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   423e3:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
   423e7:	be 00 00 00 00       	mov    $0x0,%esi
   423ec:	48 89 c7             	mov    %rax,%rdi
   423ef:	e8 b3 12 00 00       	call   436a7 <printer_vprintf>
}
   423f4:	90                   	nop
   423f5:	c9                   	leave  
   423f6:	c3                   	ret    

00000000000423f7 <log_printf>:

void log_printf(const char* format, ...) {
   423f7:	f3 0f 1e fa          	endbr64 
   423fb:	55                   	push   %rbp
   423fc:	48 89 e5             	mov    %rsp,%rbp
   423ff:	48 83 ec 60          	sub    $0x60,%rsp
   42403:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   42407:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   4240b:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   4240f:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42413:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42417:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   4241b:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   42422:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42426:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   4242a:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4242e:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    log_vprintf(format, val);
   42432:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
   42436:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   4243a:	48 89 d6             	mov    %rdx,%rsi
   4243d:	48 89 c7             	mov    %rax,%rdi
   42440:	e8 77 ff ff ff       	call   423bc <log_vprintf>
    va_end(val);
}
   42445:	90                   	nop
   42446:	c9                   	leave  
   42447:	c3                   	ret    

0000000000042448 <error_vprintf>:

// error_printf, error_vprintf
//    Print debugging messages to the console and to the host's
//    `log.txt` file via `log_printf`.

int error_vprintf(int cpos, int color, const char* format, va_list val) {
   42448:	f3 0f 1e fa          	endbr64 
   4244c:	55                   	push   %rbp
   4244d:	48 89 e5             	mov    %rsp,%rbp
   42450:	48 83 ec 40          	sub    $0x40,%rsp
   42454:	89 7d dc             	mov    %edi,-0x24(%rbp)
   42457:	89 75 d8             	mov    %esi,-0x28(%rbp)
   4245a:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   4245e:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    va_list val2;
    __builtin_va_copy(val2, val);
   42462:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   42466:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   4246a:	48 8b 0a             	mov    (%rdx),%rcx
   4246d:	48 89 08             	mov    %rcx,(%rax)
   42470:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   42474:	48 89 48 08          	mov    %rcx,0x8(%rax)
   42478:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   4247c:	48 89 50 10          	mov    %rdx,0x10(%rax)
    log_vprintf(format, val2);
   42480:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
   42484:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42488:	48 89 d6             	mov    %rdx,%rsi
   4248b:	48 89 c7             	mov    %rax,%rdi
   4248e:	e8 29 ff ff ff       	call   423bc <log_vprintf>
    va_end(val2);
    return console_vprintf(cpos, color, format, val);
   42493:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   42497:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   4249b:	8b 75 d8             	mov    -0x28(%rbp),%esi
   4249e:	8b 45 dc             	mov    -0x24(%rbp),%eax
   424a1:	89 c7                	mov    %eax,%edi
   424a3:	e8 fc 1c 00 00       	call   441a4 <console_vprintf>
}
   424a8:	c9                   	leave  
   424a9:	c3                   	ret    

00000000000424aa <error_printf>:

int error_printf(int cpos, int color, const char* format, ...) {
   424aa:	f3 0f 1e fa          	endbr64 
   424ae:	55                   	push   %rbp
   424af:	48 89 e5             	mov    %rsp,%rbp
   424b2:	48 83 ec 60          	sub    $0x60,%rsp
   424b6:	89 7d ac             	mov    %edi,-0x54(%rbp)
   424b9:	89 75 a8             	mov    %esi,-0x58(%rbp)
   424bc:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   424c0:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   424c4:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   424c8:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   424cc:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   424d3:	48 8d 45 10          	lea    0x10(%rbp),%rax
   424d7:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   424db:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   424df:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = error_vprintf(cpos, color, format, val);
   424e3:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   424e7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   424eb:	8b 75 a8             	mov    -0x58(%rbp),%esi
   424ee:	8b 45 ac             	mov    -0x54(%rbp),%eax
   424f1:	89 c7                	mov    %eax,%edi
   424f3:	e8 50 ff ff ff       	call   42448 <error_vprintf>
   424f8:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   424fb:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   424fe:	c9                   	leave  
   424ff:	c3                   	ret    

0000000000042500 <check_keyboard>:
//    Check for the user typing a control key. 'a', 'f', and 'e' cause a soft
//    reboot where the kernel runs the allocator programs, "fork", or
//    "forkexit", respectively. Control-C or 'q' exit the virtual machine.
//    Returns key typed or -1 for no key.

int check_keyboard(void) {
   42500:	f3 0f 1e fa          	endbr64 
   42504:	55                   	push   %rbp
   42505:	48 89 e5             	mov    %rsp,%rbp
   42508:	53                   	push   %rbx
   42509:	48 83 ec 48          	sub    $0x48,%rsp
    int c = keyboard_readc();
   4250d:	e8 73 fb ff ff       	call   42085 <keyboard_readc>
   42512:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   42515:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   42519:	74 1c                	je     42537 <check_keyboard+0x37>
   4251b:	83 7d e4 66          	cmpl   $0x66,-0x1c(%rbp)
   4251f:	74 16                	je     42537 <check_keyboard+0x37>
   42521:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   42525:	74 10                	je     42537 <check_keyboard+0x37>
   42527:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   4252b:	74 0a                	je     42537 <check_keyboard+0x37>
   4252d:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   42531:	0f 85 02 01 00 00    	jne    42639 <check_keyboard+0x139>
        // Install a temporary page table to carry us through the
        // process of reinitializing memory. This replicates work the
        // bootloader does.
        x86_64_pagetable* pt = (x86_64_pagetable*) 0x8000;
   42537:	48 c7 45 d8 00 80 00 	movq   $0x8000,-0x28(%rbp)
   4253e:	00 
        memset(pt, 0, PAGESIZE * 3);
   4253f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42543:	ba 00 30 00 00       	mov    $0x3000,%edx
   42548:	be 00 00 00 00       	mov    $0x0,%esi
   4254d:	48 89 c7             	mov    %rax,%rdi
   42550:	e8 8c 0e 00 00       	call   433e1 <memset>
        pt[0].entry[0] = 0x9000 | PTE_P | PTE_W | PTE_U;
   42555:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42559:	48 c7 00 07 90 00 00 	movq   $0x9007,(%rax)
        pt[1].entry[0] = 0xA000 | PTE_P | PTE_W | PTE_U;
   42560:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42564:	48 05 00 10 00 00    	add    $0x1000,%rax
   4256a:	48 c7 00 07 a0 00 00 	movq   $0xa007,(%rax)
        pt[2].entry[0] = PTE_P | PTE_W | PTE_U | PTE_PS;
   42571:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42575:	48 05 00 20 00 00    	add    $0x2000,%rax
   4257b:	48 c7 00 87 00 00 00 	movq   $0x87,(%rax)
        lcr3((uintptr_t) pt);
   42582:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42586:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
}

static inline void lcr3(uintptr_t val) {
    asm volatile("" : : : "memory");
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   4258a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4258e:	0f 22 d8             	mov    %rax,%cr3
}
   42591:	90                   	nop
        // The soft reboot process doesn't modify memory, so it's
        // safe to pass `multiboot_info` on the kernel stack, even
        // though it will get overwritten as the kernel runs.
        uint32_t multiboot_info[5];
        multiboot_info[0] = 4;
   42592:	c7 45 b4 04 00 00 00 	movl   $0x4,-0x4c(%rbp)
        const char* argument = "fork";
   42599:	48 8d 05 18 23 00 00 	lea    0x2318(%rip),%rax        # 448b8 <complex_keymap+0x58>
   425a0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        if (c == 'a') {
   425a4:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   425a8:	75 0d                	jne    425b7 <check_keyboard+0xb7>
            argument = "allocator";
   425aa:	48 8d 05 0c 23 00 00 	lea    0x230c(%rip),%rax        # 448bd <complex_keymap+0x5d>
   425b1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   425b5:	eb 37                	jmp    425ee <check_keyboard+0xee>
        } else if (c == 'e') {
   425b7:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   425bb:	75 0d                	jne    425ca <check_keyboard+0xca>
            argument = "forkexit";
   425bd:	48 8d 05 03 23 00 00 	lea    0x2303(%rip),%rax        # 448c7 <complex_keymap+0x67>
   425c4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   425c8:	eb 24                	jmp    425ee <check_keyboard+0xee>
        }
        else if (c == 't'){
   425ca:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   425ce:	75 0d                	jne    425dd <check_keyboard+0xdd>
            argument = "test";
   425d0:	48 8d 05 f9 22 00 00 	lea    0x22f9(%rip),%rax        # 448d0 <complex_keymap+0x70>
   425d7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   425db:	eb 11                	jmp    425ee <check_keyboard+0xee>
        }
        else if(c == '2'){
   425dd:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   425e1:	75 0b                	jne    425ee <check_keyboard+0xee>
            argument = "test2";
   425e3:	48 8d 05 eb 22 00 00 	lea    0x22eb(%rip),%rax        # 448d5 <complex_keymap+0x75>
   425ea:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        }
        uintptr_t argument_ptr = (uintptr_t) argument;
   425ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   425f2:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        assert(argument_ptr < 0x100000000L);
   425f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   425fb:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
   425ff:	76 1e                	jbe    4261f <check_keyboard+0x11f>
   42601:	48 8d 05 d3 22 00 00 	lea    0x22d3(%rip),%rax        # 448db <complex_keymap+0x7b>
   42608:	48 89 c2             	mov    %rax,%rdx
   4260b:	be 5d 02 00 00       	mov    $0x25d,%esi
   42610:	48 8d 05 e0 22 00 00 	lea    0x22e0(%rip),%rax        # 448f7 <complex_keymap+0x97>
   42617:	48 89 c7             	mov    %rax,%rdi
   4261a:	e8 33 01 00 00       	call   42752 <assert_fail>
        multiboot_info[4] = (uint32_t) argument_ptr;
   4261f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42623:	89 45 c4             	mov    %eax,-0x3c(%rbp)
        asm volatile("movl $0x2BADB002, %%eax; jmp entry_from_boot"
   42626:	48 8d 45 b4          	lea    -0x4c(%rbp),%rax
   4262a:	48 89 c3             	mov    %rax,%rbx
   4262d:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
   42632:	e9 c9 d9 ff ff       	jmp    40000 <entry_from_boot>
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   42637:	eb 11                	jmp    4264a <check_keyboard+0x14a>
                     : : "b" (multiboot_info) : "memory");
    } else if (c == 0x03 || c == 'q') {
   42639:	83 7d e4 03          	cmpl   $0x3,-0x1c(%rbp)
   4263d:	74 06                	je     42645 <check_keyboard+0x145>
   4263f:	83 7d e4 71          	cmpl   $0x71,-0x1c(%rbp)
   42643:	75 05                	jne    4264a <check_keyboard+0x14a>
        poweroff();
   42645:	e8 3c f8 ff ff       	call   41e86 <poweroff>
    }
    return c;
   4264a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
}
   4264d:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42651:	c9                   	leave  
   42652:	c3                   	ret    

0000000000042653 <fail>:

// fail
//    Loop until user presses Control-C, then poweroff.

static void fail(void) __attribute__((noreturn));
static void fail(void) {
   42653:	f3 0f 1e fa          	endbr64 
   42657:	55                   	push   %rbp
   42658:	48 89 e5             	mov    %rsp,%rbp
    while (1) {
        check_keyboard();
   4265b:	e8 a0 fe ff ff       	call   42500 <check_keyboard>
   42660:	eb f9                	jmp    4265b <fail+0x8>

0000000000042662 <panic>:

// panic, assert_fail
//    Use console_printf() to print a failure message and then wait for
//    control-C. Also write the failure message to the log.

void panic(const char* format, ...) {
   42662:	f3 0f 1e fa          	endbr64 
   42666:	55                   	push   %rbp
   42667:	48 89 e5             	mov    %rsp,%rbp
   4266a:	48 83 ec 60          	sub    $0x60,%rsp
   4266e:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   42672:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   42676:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   4267a:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   4267e:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42682:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   42686:	c7 45 b0 08 00 00 00 	movl   $0x8,-0x50(%rbp)
   4268d:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42691:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   42695:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42699:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

    if (format) {
   4269d:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
   426a2:	0f 84 87 00 00 00    	je     4272f <panic+0xcd>
        // Print panic message to both the screen and the log
        int cpos = error_printf(CPOS(23, 0), 0xC000, "PANIC: ");
   426a8:	48 8d 05 5c 22 00 00 	lea    0x225c(%rip),%rax        # 4490b <complex_keymap+0xab>
   426af:	48 89 c2             	mov    %rax,%rdx
   426b2:	be 00 c0 00 00       	mov    $0xc000,%esi
   426b7:	bf 30 07 00 00       	mov    $0x730,%edi
   426bc:	b8 00 00 00 00       	mov    $0x0,%eax
   426c1:	e8 e4 fd ff ff       	call   424aa <error_printf>
   426c6:	89 45 cc             	mov    %eax,-0x34(%rbp)
        cpos = error_vprintf(cpos, 0xC000, format, val);
   426c9:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   426cd:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   426d1:	8b 45 cc             	mov    -0x34(%rbp),%eax
   426d4:	be 00 c0 00 00       	mov    $0xc000,%esi
   426d9:	89 c7                	mov    %eax,%edi
   426db:	e8 68 fd ff ff       	call   42448 <error_vprintf>
   426e0:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (CCOL(cpos)) {
   426e3:	8b 4d cc             	mov    -0x34(%rbp),%ecx
   426e6:	48 63 c1             	movslq %ecx,%rax
   426e9:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   426f0:	48 c1 e8 20          	shr    $0x20,%rax
   426f4:	c1 f8 05             	sar    $0x5,%eax
   426f7:	89 ce                	mov    %ecx,%esi
   426f9:	c1 fe 1f             	sar    $0x1f,%esi
   426fc:	29 f0                	sub    %esi,%eax
   426fe:	89 c2                	mov    %eax,%edx
   42700:	89 d0                	mov    %edx,%eax
   42702:	c1 e0 02             	shl    $0x2,%eax
   42705:	01 d0                	add    %edx,%eax
   42707:	c1 e0 04             	shl    $0x4,%eax
   4270a:	29 c1                	sub    %eax,%ecx
   4270c:	89 ca                	mov    %ecx,%edx
   4270e:	85 d2                	test   %edx,%edx
   42710:	74 3b                	je     4274d <panic+0xeb>
            error_printf(cpos, 0xC000, "\n");
   42712:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42715:	48 8d 15 f7 21 00 00 	lea    0x21f7(%rip),%rdx        # 44913 <complex_keymap+0xb3>
   4271c:	be 00 c0 00 00       	mov    $0xc000,%esi
   42721:	89 c7                	mov    %eax,%edi
   42723:	b8 00 00 00 00       	mov    $0x0,%eax
   42728:	e8 7d fd ff ff       	call   424aa <error_printf>
   4272d:	eb 1e                	jmp    4274d <panic+0xeb>
        }
    } else {
        error_printf(CPOS(23, 0), 0xC000, "PANIC");
   4272f:	48 8d 05 df 21 00 00 	lea    0x21df(%rip),%rax        # 44915 <complex_keymap+0xb5>
   42736:	48 89 c2             	mov    %rax,%rdx
   42739:	be 00 c0 00 00       	mov    $0xc000,%esi
   4273e:	bf 30 07 00 00       	mov    $0x730,%edi
   42743:	b8 00 00 00 00       	mov    $0x0,%eax
   42748:	e8 5d fd ff ff       	call   424aa <error_printf>
    }

    va_end(val);
    fail();
   4274d:	e8 01 ff ff ff       	call   42653 <fail>

0000000000042752 <assert_fail>:
}

void assert_fail(const char* file, int line, const char* msg) {
   42752:	f3 0f 1e fa          	endbr64 
   42756:	55                   	push   %rbp
   42757:	48 89 e5             	mov    %rsp,%rbp
   4275a:	48 83 ec 20          	sub    $0x20,%rsp
   4275e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42762:	89 75 f4             	mov    %esi,-0xc(%rbp)
   42765:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    panic("%s:%d: assertion '%s' failed\n", file, line, msg);
   42769:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
   4276d:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42770:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42774:	48 89 c6             	mov    %rax,%rsi
   42777:	48 8d 05 9d 21 00 00 	lea    0x219d(%rip),%rax        # 4491b <complex_keymap+0xbb>
   4277e:	48 89 c7             	mov    %rax,%rdi
   42781:	b8 00 00 00 00       	mov    $0x0,%eax
   42786:	e8 d7 fe ff ff       	call   42662 <panic>

000000000004278b <default_exception>:
}

void default_exception(proc* p){
   4278b:	f3 0f 1e fa          	endbr64 
   4278f:	55                   	push   %rbp
   42790:	48 89 e5             	mov    %rsp,%rbp
   42793:	48 83 ec 20          	sub    $0x20,%rsp
   42797:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    x86_64_registers * reg = &(p->p_registers);
   4279b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4279f:	48 83 c0 08          	add    $0x8,%rax
   427a3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    panic("Unexpected exception %d!\n", reg->reg_intno);
   427a7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   427ab:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   427b2:	48 89 c6             	mov    %rax,%rsi
   427b5:	48 8d 05 7d 21 00 00 	lea    0x217d(%rip),%rax        # 44939 <complex_keymap+0xd9>
   427bc:	48 89 c7             	mov    %rax,%rdi
   427bf:	b8 00 00 00 00       	mov    $0x0,%eax
   427c4:	e8 99 fe ff ff       	call   42662 <panic>

00000000000427c9 <pageindex>:
static inline int pageindex(uintptr_t addr, int level) {
   427c9:	55                   	push   %rbp
   427ca:	48 89 e5             	mov    %rsp,%rbp
   427cd:	48 83 ec 10          	sub    $0x10,%rsp
   427d1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   427d5:	89 75 f4             	mov    %esi,-0xc(%rbp)
    assert(level >= 0 && level <= 3);
   427d8:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   427dc:	78 06                	js     427e4 <pageindex+0x1b>
   427de:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
   427e2:	7e 1e                	jle    42802 <pageindex+0x39>
   427e4:	48 8d 05 6d 21 00 00 	lea    0x216d(%rip),%rax        # 44958 <complex_keymap+0xf8>
   427eb:	48 89 c2             	mov    %rax,%rdx
   427ee:	be 1e 00 00 00       	mov    $0x1e,%esi
   427f3:	48 8d 05 77 21 00 00 	lea    0x2177(%rip),%rax        # 44971 <complex_keymap+0x111>
   427fa:	48 89 c7             	mov    %rax,%rdi
   427fd:	e8 50 ff ff ff       	call   42752 <assert_fail>
    return (int) (addr >> (PAGEOFFBITS + (3 - level) * PAGEINDEXBITS)) & 0x1FF;
   42802:	b8 03 00 00 00       	mov    $0x3,%eax
   42807:	2b 45 f4             	sub    -0xc(%rbp),%eax
   4280a:	89 c2                	mov    %eax,%edx
   4280c:	89 d0                	mov    %edx,%eax
   4280e:	c1 e0 03             	shl    $0x3,%eax
   42811:	01 d0                	add    %edx,%eax
   42813:	83 c0 0c             	add    $0xc,%eax
   42816:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4281a:	89 c1                	mov    %eax,%ecx
   4281c:	48 d3 ea             	shr    %cl,%rdx
   4281f:	48 89 d0             	mov    %rdx,%rax
   42822:	25 ff 01 00 00       	and    $0x1ff,%eax
}
   42827:	c9                   	leave  
   42828:	c3                   	ret    

0000000000042829 <virtual_memory_init>:

static x86_64_pagetable kernel_pagetables[5];
x86_64_pagetable *kernel_pagetable;

void virtual_memory_init(void)
{
   42829:	f3 0f 1e fa          	endbr64 
   4282d:	55                   	push   %rbp
   4282e:	48 89 e5             	mov    %rsp,%rbp
   42831:	48 83 ec 20          	sub    $0x20,%rsp
    kernel_pagetable = &kernel_pagetables[0];
   42835:	48 8d 05 c4 27 01 00 	lea    0x127c4(%rip),%rax        # 55000 <kernel_pagetables>
   4283c:	48 89 05 bd 17 01 00 	mov    %rax,0x117bd(%rip)        # 54000 <kernel_pagetable>
    memset(kernel_pagetables, 0, sizeof(kernel_pagetables));
   42843:	ba 00 50 00 00       	mov    $0x5000,%edx
   42848:	be 00 00 00 00       	mov    $0x0,%esi
   4284d:	48 8d 05 ac 27 01 00 	lea    0x127ac(%rip),%rax        # 55000 <kernel_pagetables>
   42854:	48 89 c7             	mov    %rax,%rdi
   42857:	e8 85 0b 00 00       	call   433e1 <memset>

    // connect the pagetable pages
    kernel_pagetables[0].entry[0] =
        (x86_64_pageentry_t)&kernel_pagetables[1] | PTE_P | PTE_W | PTE_U;
   4285c:	48 8d 05 9d 37 01 00 	lea    0x1379d(%rip),%rax        # 56000 <kernel_pagetables+0x1000>
   42863:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[0].entry[0] =
   42867:	48 89 05 92 27 01 00 	mov    %rax,0x12792(%rip)        # 55000 <kernel_pagetables>
    kernel_pagetables[1].entry[0] =
        (x86_64_pageentry_t)&kernel_pagetables[2] | PTE_P | PTE_W | PTE_U;
   4286e:	48 8d 05 8b 47 01 00 	lea    0x1478b(%rip),%rax        # 57000 <kernel_pagetables+0x2000>
   42875:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[1].entry[0] =
   42879:	48 89 05 80 37 01 00 	mov    %rax,0x13780(%rip)        # 56000 <kernel_pagetables+0x1000>
    kernel_pagetables[2].entry[0] =
        (x86_64_pageentry_t)&kernel_pagetables[3] | PTE_P | PTE_W | PTE_U;
   42880:	48 8d 05 79 57 01 00 	lea    0x15779(%rip),%rax        # 58000 <kernel_pagetables+0x3000>
   42887:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[0] =
   4288b:	48 89 05 6e 47 01 00 	mov    %rax,0x1476e(%rip)        # 57000 <kernel_pagetables+0x2000>
    kernel_pagetables[2].entry[1] =
        (x86_64_pageentry_t)&kernel_pagetables[4] | PTE_P | PTE_W | PTE_U;
   42892:	48 8d 05 67 67 01 00 	lea    0x16767(%rip),%rax        # 59000 <kernel_pagetables+0x4000>
   42899:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[1] =
   4289d:	48 89 05 64 47 01 00 	mov    %rax,0x14764(%rip)        # 57008 <kernel_pagetables+0x2008>

    // identity map the page table
    virtual_memory_map(kernel_pagetable, (uintptr_t)0, (uintptr_t)0,
   428a4:	48 8b 05 55 17 01 00 	mov    0x11755(%rip),%rax        # 54000 <kernel_pagetable>
   428ab:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   428b1:	b9 00 00 20 00       	mov    $0x200000,%ecx
   428b6:	ba 00 00 00 00       	mov    $0x0,%edx
   428bb:	be 00 00 00 00       	mov    $0x0,%esi
   428c0:	48 89 c7             	mov    %rax,%rdi
   428c3:	e8 0e 02 00 00       	call   42ad6 <virtual_memory_map>
                       MEMSIZE_PHYSICAL, PTE_P | PTE_W | PTE_U);

    // check if kernel is identity mapped
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE)
   428c8:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   428cf:	00 
   428d0:	eb 76                	jmp    42948 <virtual_memory_init+0x11f>
    {
        vamapping vmap = virtual_memory_lookup(kernel_pagetable, addr);
   428d2:	48 8b 0d 27 17 01 00 	mov    0x11727(%rip),%rcx        # 54000 <kernel_pagetable>
   428d9:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   428dd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   428e1:	48 89 ce             	mov    %rcx,%rsi
   428e4:	48 89 c7             	mov    %rax,%rdi
   428e7:	e8 2e 06 00 00       	call   42f1a <virtual_memory_lookup>
        // this assert will probably fail initially!
        // have you implemented virtual_memory_map and lookup_l1pagetable ?
        assert(vmap.pa == addr);
   428ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   428f0:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   428f4:	74 1e                	je     42914 <virtual_memory_init+0xeb>
   428f6:	48 8d 05 88 20 00 00 	lea    0x2088(%rip),%rax        # 44985 <complex_keymap+0x125>
   428fd:	48 89 c2             	mov    %rax,%rdx
   42900:	be 2e 00 00 00       	mov    $0x2e,%esi
   42905:	48 8d 05 89 20 00 00 	lea    0x2089(%rip),%rax        # 44995 <complex_keymap+0x135>
   4290c:	48 89 c7             	mov    %rax,%rdi
   4290f:	e8 3e fe ff ff       	call   42752 <assert_fail>
        assert((vmap.perm & (PTE_P | PTE_W)) == (PTE_P | PTE_W));
   42914:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42917:	48 98                	cltq   
   42919:	83 e0 03             	and    $0x3,%eax
   4291c:	48 83 f8 03          	cmp    $0x3,%rax
   42920:	74 1e                	je     42940 <virtual_memory_init+0x117>
   42922:	48 8d 05 7f 20 00 00 	lea    0x207f(%rip),%rax        # 449a8 <complex_keymap+0x148>
   42929:	48 89 c2             	mov    %rax,%rdx
   4292c:	be 2f 00 00 00       	mov    $0x2f,%esi
   42931:	48 8d 05 5d 20 00 00 	lea    0x205d(%rip),%rax        # 44995 <complex_keymap+0x135>
   42938:	48 89 c7             	mov    %rax,%rdi
   4293b:	e8 12 fe ff ff       	call   42752 <assert_fail>
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE)
   42940:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   42947:	00 
   42948:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   4294f:	00 
   42950:	76 80                	jbe    428d2 <virtual_memory_init+0xa9>
    }

    // set pointer to this pagetable in the CR3 register
    // set_pagetable also does several checks for a valid pagetable
    set_pagetable(kernel_pagetable);
   42952:	48 8b 05 a7 16 01 00 	mov    0x116a7(%rip),%rax        # 54000 <kernel_pagetable>
   42959:	48 89 c7             	mov    %rax,%rdi
   4295c:	e8 03 00 00 00       	call   42964 <set_pagetable>
}
   42961:	90                   	nop
   42962:	c9                   	leave  
   42963:	c3                   	ret    

0000000000042964 <set_pagetable>:
//    Change page directory. lcr3() is the hardware instruction;
//    set_pagetable() additionally checks that important kernel procedures are
//    mappable in `pagetable`, and calls panic() if they aren't.

void set_pagetable(x86_64_pagetable *pagetable)
{
   42964:	f3 0f 1e fa          	endbr64 
   42968:	55                   	push   %rbp
   42969:	48 89 e5             	mov    %rsp,%rbp
   4296c:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   42970:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
    assert(PAGEOFFSET(pagetable) == 0); // must be page aligned
   42974:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42978:	25 ff 0f 00 00       	and    $0xfff,%eax
   4297d:	48 85 c0             	test   %rax,%rax
   42980:	74 1e                	je     429a0 <set_pagetable+0x3c>
   42982:	48 8d 05 50 20 00 00 	lea    0x2050(%rip),%rax        # 449d9 <complex_keymap+0x179>
   42989:	48 89 c2             	mov    %rax,%rdx
   4298c:	be 3e 00 00 00       	mov    $0x3e,%esi
   42991:	48 8d 05 fd 1f 00 00 	lea    0x1ffd(%rip),%rax        # 44995 <complex_keymap+0x135>
   42998:	48 89 c7             	mov    %rax,%rdi
   4299b:	e8 b2 fd ff ff       	call   42752 <assert_fail>
    // check for kernel space being mapped in pagetable
    assert(virtual_memory_lookup(pagetable, (uintptr_t)default_int_handler).pa == (uintptr_t)default_int_handler);
   429a0:	48 c7 c0 9c 00 04 00 	mov    $0x4009c,%rax
   429a7:	48 89 c2             	mov    %rax,%rdx
   429aa:	48 8d 45 98          	lea    -0x68(%rbp),%rax
   429ae:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   429b2:	48 89 ce             	mov    %rcx,%rsi
   429b5:	48 89 c7             	mov    %rax,%rdi
   429b8:	e8 5d 05 00 00       	call   42f1a <virtual_memory_lookup>
   429bd:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   429c1:	48 c7 c2 9c 00 04 00 	mov    $0x4009c,%rdx
   429c8:	48 39 d0             	cmp    %rdx,%rax
   429cb:	74 1e                	je     429eb <set_pagetable+0x87>
   429cd:	48 8d 05 24 20 00 00 	lea    0x2024(%rip),%rax        # 449f8 <complex_keymap+0x198>
   429d4:	48 89 c2             	mov    %rax,%rdx
   429d7:	be 40 00 00 00       	mov    $0x40,%esi
   429dc:	48 8d 05 b2 1f 00 00 	lea    0x1fb2(%rip),%rax        # 44995 <complex_keymap+0x135>
   429e3:	48 89 c7             	mov    %rax,%rdi
   429e6:	e8 67 fd ff ff       	call   42752 <assert_fail>
    assert(virtual_memory_lookup(kernel_pagetable, (uintptr_t)pagetable).pa == (uintptr_t)pagetable);
   429eb:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
   429ef:	48 8b 0d 0a 16 01 00 	mov    0x1160a(%rip),%rcx        # 54000 <kernel_pagetable>
   429f6:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
   429fa:	48 89 ce             	mov    %rcx,%rsi
   429fd:	48 89 c7             	mov    %rax,%rdi
   42a00:	e8 15 05 00 00       	call   42f1a <virtual_memory_lookup>
   42a05:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42a09:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42a0d:	48 39 c2             	cmp    %rax,%rdx
   42a10:	74 1e                	je     42a30 <set_pagetable+0xcc>
   42a12:	48 8d 05 47 20 00 00 	lea    0x2047(%rip),%rax        # 44a60 <complex_keymap+0x200>
   42a19:	48 89 c2             	mov    %rax,%rdx
   42a1c:	be 41 00 00 00       	mov    $0x41,%esi
   42a21:	48 8d 05 6d 1f 00 00 	lea    0x1f6d(%rip),%rax        # 44995 <complex_keymap+0x135>
   42a28:	48 89 c7             	mov    %rax,%rdi
   42a2b:	e8 22 fd ff ff       	call   42752 <assert_fail>
    assert(virtual_memory_lookup(pagetable, (uintptr_t)kernel_pagetable).pa == (uintptr_t)kernel_pagetable);
   42a30:	48 8b 05 c9 15 01 00 	mov    0x115c9(%rip),%rax        # 54000 <kernel_pagetable>
   42a37:	48 89 c2             	mov    %rax,%rdx
   42a3a:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
   42a3e:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42a42:	48 89 ce             	mov    %rcx,%rsi
   42a45:	48 89 c7             	mov    %rax,%rdi
   42a48:	e8 cd 04 00 00       	call   42f1a <virtual_memory_lookup>
   42a4d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42a51:	48 8b 15 a8 15 01 00 	mov    0x115a8(%rip),%rdx        # 54000 <kernel_pagetable>
   42a58:	48 39 d0             	cmp    %rdx,%rax
   42a5b:	74 1e                	je     42a7b <set_pagetable+0x117>
   42a5d:	48 8d 05 5c 20 00 00 	lea    0x205c(%rip),%rax        # 44ac0 <complex_keymap+0x260>
   42a64:	48 89 c2             	mov    %rax,%rdx
   42a67:	be 42 00 00 00       	mov    $0x42,%esi
   42a6c:	48 8d 05 22 1f 00 00 	lea    0x1f22(%rip),%rax        # 44995 <complex_keymap+0x135>
   42a73:	48 89 c7             	mov    %rax,%rdi
   42a76:	e8 d7 fc ff ff       	call   42752 <assert_fail>
    assert(virtual_memory_lookup(pagetable, (uintptr_t)virtual_memory_map).pa == (uintptr_t)virtual_memory_map);
   42a7b:	48 8d 15 54 00 00 00 	lea    0x54(%rip),%rdx        # 42ad6 <virtual_memory_map>
   42a82:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   42a86:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42a8a:	48 89 ce             	mov    %rcx,%rsi
   42a8d:	48 89 c7             	mov    %rax,%rdi
   42a90:	e8 85 04 00 00       	call   42f1a <virtual_memory_lookup>
   42a95:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42a99:	48 8d 15 36 00 00 00 	lea    0x36(%rip),%rdx        # 42ad6 <virtual_memory_map>
   42aa0:	48 39 d0             	cmp    %rdx,%rax
   42aa3:	74 1e                	je     42ac3 <set_pagetable+0x15f>
   42aa5:	48 8d 05 74 20 00 00 	lea    0x2074(%rip),%rax        # 44b20 <complex_keymap+0x2c0>
   42aac:	48 89 c2             	mov    %rax,%rdx
   42aaf:	be 43 00 00 00       	mov    $0x43,%esi
   42ab4:	48 8d 05 da 1e 00 00 	lea    0x1eda(%rip),%rax        # 44995 <complex_keymap+0x135>
   42abb:	48 89 c7             	mov    %rax,%rdi
   42abe:	e8 8f fc ff ff       	call   42752 <assert_fail>
    lcr3((uintptr_t)pagetable);
   42ac3:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42ac7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   42acb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42acf:	0f 22 d8             	mov    %rax,%cr3
}
   42ad2:	90                   	nop
}
   42ad3:	90                   	nop
   42ad4:	c9                   	leave  
   42ad5:	c3                   	ret    

0000000000042ad6 <virtual_memory_map>:
static x86_64_pagetable *lookup_l1pagetable(x86_64_pagetable *pagetable,
                                            uintptr_t va, int perm);

int virtual_memory_map(x86_64_pagetable *pagetable, uintptr_t va,
                       uintptr_t pa, size_t sz, int perm)
{
   42ad6:	f3 0f 1e fa          	endbr64 
   42ada:	55                   	push   %rbp
   42adb:	48 89 e5             	mov    %rsp,%rbp
   42ade:	53                   	push   %rbx
   42adf:	48 83 ec 58          	sub    $0x58,%rsp
   42ae3:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   42ae7:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   42aeb:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
   42aef:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
   42af3:	44 89 45 ac          	mov    %r8d,-0x54(%rbp)

    // sanity checks for virtual address, size, and permisions
    assert(va % PAGESIZE == 0);            // virtual address is page-aligned
   42af7:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42afb:	25 ff 0f 00 00       	and    $0xfff,%eax
   42b00:	48 85 c0             	test   %rax,%rax
   42b03:	74 1e                	je     42b23 <virtual_memory_map+0x4d>
   42b05:	48 8d 05 78 20 00 00 	lea    0x2078(%rip),%rax        # 44b84 <complex_keymap+0x324>
   42b0c:	48 89 c2             	mov    %rax,%rdx
   42b0f:	be 64 00 00 00       	mov    $0x64,%esi
   42b14:	48 8d 05 7a 1e 00 00 	lea    0x1e7a(%rip),%rax        # 44995 <complex_keymap+0x135>
   42b1b:	48 89 c7             	mov    %rax,%rdi
   42b1e:	e8 2f fc ff ff       	call   42752 <assert_fail>
    assert(sz % PAGESIZE == 0);            // size is a multiple of PAGESIZE
   42b23:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42b27:	25 ff 0f 00 00       	and    $0xfff,%eax
   42b2c:	48 85 c0             	test   %rax,%rax
   42b2f:	74 1e                	je     42b4f <virtual_memory_map+0x79>
   42b31:	48 8d 05 5f 20 00 00 	lea    0x205f(%rip),%rax        # 44b97 <complex_keymap+0x337>
   42b38:	48 89 c2             	mov    %rax,%rdx
   42b3b:	be 65 00 00 00       	mov    $0x65,%esi
   42b40:	48 8d 05 4e 1e 00 00 	lea    0x1e4e(%rip),%rax        # 44995 <complex_keymap+0x135>
   42b47:	48 89 c7             	mov    %rax,%rdi
   42b4a:	e8 03 fc ff ff       	call   42752 <assert_fail>
    assert(va + sz >= va || va + sz == 0); // va range does not wrap
   42b4f:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   42b53:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42b57:	48 01 d0             	add    %rdx,%rax
   42b5a:	48 39 45 c0          	cmp    %rax,-0x40(%rbp)
   42b5e:	76 2e                	jbe    42b8e <virtual_memory_map+0xb8>
   42b60:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   42b64:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42b68:	48 01 d0             	add    %rdx,%rax
   42b6b:	48 85 c0             	test   %rax,%rax
   42b6e:	74 1e                	je     42b8e <virtual_memory_map+0xb8>
   42b70:	48 8d 05 33 20 00 00 	lea    0x2033(%rip),%rax        # 44baa <complex_keymap+0x34a>
   42b77:	48 89 c2             	mov    %rax,%rdx
   42b7a:	be 66 00 00 00       	mov    $0x66,%esi
   42b7f:	48 8d 05 0f 1e 00 00 	lea    0x1e0f(%rip),%rax        # 44995 <complex_keymap+0x135>
   42b86:	48 89 c7             	mov    %rax,%rdi
   42b89:	e8 c4 fb ff ff       	call   42752 <assert_fail>
    if (perm & PTE_P)
   42b8e:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42b91:	48 98                	cltq   
   42b93:	83 e0 01             	and    $0x1,%eax
   42b96:	48 85 c0             	test   %rax,%rax
   42b99:	0f 84 8c 00 00 00    	je     42c2b <virtual_memory_map+0x155>
    {
        assert(pa % PAGESIZE == 0);          // physical addr is page-aligned
   42b9f:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42ba3:	25 ff 0f 00 00       	and    $0xfff,%eax
   42ba8:	48 85 c0             	test   %rax,%rax
   42bab:	74 1e                	je     42bcb <virtual_memory_map+0xf5>
   42bad:	48 8d 05 14 20 00 00 	lea    0x2014(%rip),%rax        # 44bc8 <complex_keymap+0x368>
   42bb4:	48 89 c2             	mov    %rax,%rdx
   42bb7:	be 69 00 00 00       	mov    $0x69,%esi
   42bbc:	48 8d 05 d2 1d 00 00 	lea    0x1dd2(%rip),%rax        # 44995 <complex_keymap+0x135>
   42bc3:	48 89 c7             	mov    %rax,%rdi
   42bc6:	e8 87 fb ff ff       	call   42752 <assert_fail>
        assert(pa + sz >= pa);               // physical address range does not wrap
   42bcb:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42bcf:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42bd3:	48 01 d0             	add    %rdx,%rax
   42bd6:	48 39 45 b8          	cmp    %rax,-0x48(%rbp)
   42bda:	76 1e                	jbe    42bfa <virtual_memory_map+0x124>
   42bdc:	48 8d 05 f8 1f 00 00 	lea    0x1ff8(%rip),%rax        # 44bdb <complex_keymap+0x37b>
   42be3:	48 89 c2             	mov    %rax,%rdx
   42be6:	be 6a 00 00 00       	mov    $0x6a,%esi
   42beb:	48 8d 05 a3 1d 00 00 	lea    0x1da3(%rip),%rax        # 44995 <complex_keymap+0x135>
   42bf2:	48 89 c7             	mov    %rax,%rdi
   42bf5:	e8 58 fb ff ff       	call   42752 <assert_fail>
        assert(pa + sz <= MEMSIZE_PHYSICAL); // physical addresses exist
   42bfa:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42bfe:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42c02:	48 01 d0             	add    %rdx,%rax
   42c05:	48 3d 00 00 20 00    	cmp    $0x200000,%rax
   42c0b:	76 1e                	jbe    42c2b <virtual_memory_map+0x155>
   42c0d:	48 8d 05 d5 1f 00 00 	lea    0x1fd5(%rip),%rax        # 44be9 <complex_keymap+0x389>
   42c14:	48 89 c2             	mov    %rax,%rdx
   42c17:	be 6b 00 00 00       	mov    $0x6b,%esi
   42c1c:	48 8d 05 72 1d 00 00 	lea    0x1d72(%rip),%rax        # 44995 <complex_keymap+0x135>
   42c23:	48 89 c7             	mov    %rax,%rdi
   42c26:	e8 27 fb ff ff       	call   42752 <assert_fail>
    }
    assert(perm >= 0 && perm < 0x1000);           // `perm` makes sense (perm can only be 12 bits)
   42c2b:	83 7d ac 00          	cmpl   $0x0,-0x54(%rbp)
   42c2f:	78 09                	js     42c3a <virtual_memory_map+0x164>
   42c31:	81 7d ac ff 0f 00 00 	cmpl   $0xfff,-0x54(%rbp)
   42c38:	7e 1e                	jle    42c58 <virtual_memory_map+0x182>
   42c3a:	48 8d 05 c4 1f 00 00 	lea    0x1fc4(%rip),%rax        # 44c05 <complex_keymap+0x3a5>
   42c41:	48 89 c2             	mov    %rax,%rdx
   42c44:	be 6d 00 00 00       	mov    $0x6d,%esi
   42c49:	48 8d 05 45 1d 00 00 	lea    0x1d45(%rip),%rax        # 44995 <complex_keymap+0x135>
   42c50:	48 89 c7             	mov    %rax,%rdi
   42c53:	e8 fa fa ff ff       	call   42752 <assert_fail>
    assert((uintptr_t)pagetable % PAGESIZE == 0); // `pagetable` page-aligned
   42c58:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42c5c:	25 ff 0f 00 00       	and    $0xfff,%eax
   42c61:	48 85 c0             	test   %rax,%rax
   42c64:	74 1e                	je     42c84 <virtual_memory_map+0x1ae>
   42c66:	48 8d 05 b3 1f 00 00 	lea    0x1fb3(%rip),%rax        # 44c20 <complex_keymap+0x3c0>
   42c6d:	48 89 c2             	mov    %rax,%rdx
   42c70:	be 6e 00 00 00       	mov    $0x6e,%esi
   42c75:	48 8d 05 19 1d 00 00 	lea    0x1d19(%rip),%rax        # 44995 <complex_keymap+0x135>
   42c7c:	48 89 c7             	mov    %rax,%rdi
   42c7f:	e8 ce fa ff ff       	call   42752 <assert_fail>

    int last_index123 = -1;
   42c84:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%rbp)
    x86_64_pagetable *l1pagetable = NULL;
   42c8b:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
   42c92:	00 

    // for each page-aligned address, set the appropriate page entry
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE)
   42c93:	e9 e6 00 00 00       	jmp    42d7e <virtual_memory_map+0x2a8>
    {
        int cur_index123 = (va >> (PAGEOFFBITS + PAGEINDEXBITS));
   42c98:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42c9c:	48 c1 e8 15          	shr    $0x15,%rax
   42ca0:	89 45 dc             	mov    %eax,-0x24(%rbp)
        if (cur_index123 != last_index123)
   42ca3:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42ca6:	3b 45 ec             	cmp    -0x14(%rbp),%eax
   42ca9:	74 20                	je     42ccb <virtual_memory_map+0x1f5>
        {
            // TODO
            // find pointer to last level pagetable for current va
            l1pagetable = lookup_l1pagetable(pagetable, va, perm);
   42cab:	8b 55 ac             	mov    -0x54(%rbp),%edx
   42cae:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   42cb2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42cb6:	48 89 ce             	mov    %rcx,%rsi
   42cb9:	48 89 c7             	mov    %rax,%rdi
   42cbc:	e8 d3 00 00 00       	call   42d94 <lookup_l1pagetable>
   42cc1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            last_index123 = cur_index123;
   42cc5:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42cc8:	89 45 ec             	mov    %eax,-0x14(%rbp)
        }
        if ((perm & PTE_P) && l1pagetable)
   42ccb:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42cce:	48 98                	cltq   
   42cd0:	83 e0 01             	and    $0x1,%eax
   42cd3:	48 85 c0             	test   %rax,%rax
   42cd6:	74 34                	je     42d0c <virtual_memory_map+0x236>
   42cd8:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   42cdd:	74 2d                	je     42d0c <virtual_memory_map+0x236>
        { // if page is marked present
            l1pagetable->entry[PAGEINDEX(va, 3)] = pa | perm;
   42cdf:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42ce2:	48 63 d8             	movslq %eax,%rbx
   42ce5:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42ce9:	be 03 00 00 00       	mov    $0x3,%esi
   42cee:	48 89 c7             	mov    %rax,%rdi
   42cf1:	e8 d3 fa ff ff       	call   427c9 <pageindex>
   42cf6:	89 c2                	mov    %eax,%edx
   42cf8:	48 0b 5d b8          	or     -0x48(%rbp),%rbx
   42cfc:	48 89 d9             	mov    %rbx,%rcx
   42cff:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42d03:	48 63 d2             	movslq %edx,%rdx
   42d06:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   42d0a:	eb 5a                	jmp    42d66 <virtual_memory_map+0x290>
        }
        else if (l1pagetable)
   42d0c:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   42d11:	74 26                	je     42d39 <virtual_memory_map+0x263>
        { // if page is NOT marked present
            // TODO
            l1pagetable->entry[PAGEINDEX(va, 3)] = perm;
   42d13:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42d17:	be 03 00 00 00       	mov    $0x3,%esi
   42d1c:	48 89 c7             	mov    %rax,%rdi
   42d1f:	e8 a5 fa ff ff       	call   427c9 <pageindex>
   42d24:	89 c2                	mov    %eax,%edx
   42d26:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42d29:	48 63 c8             	movslq %eax,%rcx
   42d2c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42d30:	48 63 d2             	movslq %edx,%rdx
   42d33:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   42d37:	eb 2d                	jmp    42d66 <virtual_memory_map+0x290>
        }
        else if (perm & PTE_P)
   42d39:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42d3c:	48 98                	cltq   
   42d3e:	83 e0 01             	and    $0x1,%eax
   42d41:	48 85 c0             	test   %rax,%rax
   42d44:	74 20                	je     42d66 <virtual_memory_map+0x290>
        {
            // error, no allocated l1 page found for va
            log_printf("[Kern Info] failed to find l1pagetable address at " __FILE__ ": %d\n", __LINE__);
   42d46:	be 8a 00 00 00       	mov    $0x8a,%esi
   42d4b:	48 8d 05 f6 1e 00 00 	lea    0x1ef6(%rip),%rax        # 44c48 <complex_keymap+0x3e8>
   42d52:	48 89 c7             	mov    %rax,%rdi
   42d55:	b8 00 00 00 00       	mov    $0x0,%eax
   42d5a:	e8 98 f6 ff ff       	call   423f7 <log_printf>
            return -1;
   42d5f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   42d64:	eb 28                	jmp    42d8e <virtual_memory_map+0x2b8>
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE)
   42d66:	48 81 45 c0 00 10 00 	addq   $0x1000,-0x40(%rbp)
   42d6d:	00 
   42d6e:	48 81 45 b8 00 10 00 	addq   $0x1000,-0x48(%rbp)
   42d75:	00 
   42d76:	48 81 6d b0 00 10 00 	subq   $0x1000,-0x50(%rbp)
   42d7d:	00 
   42d7e:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   42d83:	0f 85 0f ff ff ff    	jne    42c98 <virtual_memory_map+0x1c2>
        }
    }
    return 0;
   42d89:	b8 00 00 00 00       	mov    $0x0,%eax
}
   42d8e:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42d92:	c9                   	leave  
   42d93:	c3                   	ret    

0000000000042d94 <lookup_l1pagetable>:
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable *lookup_l1pagetable(x86_64_pagetable *pagetable,
                                            uintptr_t va, int perm)
{
   42d94:	f3 0f 1e fa          	endbr64 
   42d98:	55                   	push   %rbp
   42d99:	48 89 e5             	mov    %rsp,%rbp
   42d9c:	48 83 ec 40          	sub    $0x40,%rsp
   42da0:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   42da4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   42da8:	89 55 cc             	mov    %edx,-0x34(%rbp)
    x86_64_pagetable *pt = pagetable;
   42dab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42daf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    // 1. Find index to the next pagetable entry using the `va`
    // 2. Check if this entry has the appropriate requested permissions
    // 3. Repeat the steps till you reach the l1 pagetable (i.e thrice)
    // 4. return the pagetable address

    for (int i = 0; i <= 2; ++i)
   42db3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   42dba:	e9 4b 01 00 00       	jmp    42f0a <lookup_l1pagetable+0x176>
    {
        // TODO
        // find page entry by finding `ith` level index of va to index pagetable entries of `pt`
        // you should read x86-64.h to understand relevant structs and macros to make this part easier
        x86_64_pageentry_t pe = pt->entry[PAGEINDEX(va, i)]; // replace this
   42dbf:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42dc2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42dc6:	89 d6                	mov    %edx,%esi
   42dc8:	48 89 c7             	mov    %rax,%rdi
   42dcb:	e8 f9 f9 ff ff       	call   427c9 <pageindex>
   42dd0:	89 c2                	mov    %eax,%edx
   42dd2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42dd6:	48 63 d2             	movslq %edx,%rdx
   42dd9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   42ddd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

        if (!(pe & PTE_P))
   42de1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42de5:	83 e0 01             	and    $0x1,%eax
   42de8:	48 85 c0             	test   %rax,%rax
   42deb:	75 6d                	jne    42e5a <lookup_l1pagetable+0xc6>
        { // address of next level should be present AND PTE_P should be set, error otherwise
            log_printf("[Kern Info] Error looking up l1pagetable: Pagetable address: 0x%x perm: 0x%x."
   42ded:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42df0:	8d 48 02             	lea    0x2(%rax),%ecx
   42df3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42df7:	25 ff 0f 00 00       	and    $0xfff,%eax
   42dfc:	48 89 c2             	mov    %rax,%rdx
   42dff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42e03:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42e09:	48 89 c6             	mov    %rax,%rsi
   42e0c:	48 8d 05 7d 1e 00 00 	lea    0x1e7d(%rip),%rax        # 44c90 <complex_keymap+0x430>
   42e13:	48 89 c7             	mov    %rax,%rdi
   42e16:	b8 00 00 00 00       	mov    $0x0,%eax
   42e1b:	e8 d7 f5 ff ff       	call   423f7 <log_printf>
                       " Failed to get level (%d)\n",
                       PTE_ADDR(pe), PTE_FLAGS(pe), (i + 2));
            if (!(perm & PTE_P))
   42e20:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42e23:	48 98                	cltq   
   42e25:	83 e0 01             	and    $0x1,%eax
   42e28:	48 85 c0             	test   %rax,%rax
   42e2b:	75 0a                	jne    42e37 <lookup_l1pagetable+0xa3>
            {
                return NULL;
   42e2d:	b8 00 00 00 00       	mov    $0x0,%eax
   42e32:	e9 e1 00 00 00       	jmp    42f18 <lookup_l1pagetable+0x184>
            }
            log_printf("[Kern Info] failed to find pagetable address at " __FILE__ ": %d\n", __LINE__);
   42e37:	be b2 00 00 00       	mov    $0xb2,%esi
   42e3c:	48 8d 05 b5 1e 00 00 	lea    0x1eb5(%rip),%rax        # 44cf8 <complex_keymap+0x498>
   42e43:	48 89 c7             	mov    %rax,%rdi
   42e46:	b8 00 00 00 00       	mov    $0x0,%eax
   42e4b:	e8 a7 f5 ff ff       	call   423f7 <log_printf>
            return NULL;
   42e50:	b8 00 00 00 00       	mov    $0x0,%eax
   42e55:	e9 be 00 00 00       	jmp    42f18 <lookup_l1pagetable+0x184>
        }

        // sanity-check page entry and permissions
        assert(PTE_ADDR(pe) < MEMSIZE_PHYSICAL); // at sensible address
   42e5a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42e5e:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42e64:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   42e6a:	76 1e                	jbe    42e8a <lookup_l1pagetable+0xf6>
   42e6c:	48 8d 05 cd 1e 00 00 	lea    0x1ecd(%rip),%rax        # 44d40 <complex_keymap+0x4e0>
   42e73:	48 89 c2             	mov    %rax,%rdx
   42e76:	be b7 00 00 00       	mov    $0xb7,%esi
   42e7b:	48 8d 05 13 1b 00 00 	lea    0x1b13(%rip),%rax        # 44995 <complex_keymap+0x135>
   42e82:	48 89 c7             	mov    %rax,%rdi
   42e85:	e8 c8 f8 ff ff       	call   42752 <assert_fail>
        if (perm & PTE_W)
   42e8a:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42e8d:	48 98                	cltq   
   42e8f:	83 e0 02             	and    $0x2,%eax
   42e92:	48 85 c0             	test   %rax,%rax
   42e95:	74 2a                	je     42ec1 <lookup_l1pagetable+0x12d>
        {                       // if requester wants PTE_W,
            assert(pe & PTE_W); //   entry must allow PTE_W
   42e97:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42e9b:	83 e0 02             	and    $0x2,%eax
   42e9e:	48 85 c0             	test   %rax,%rax
   42ea1:	75 1e                	jne    42ec1 <lookup_l1pagetable+0x12d>
   42ea3:	48 8d 05 b6 1e 00 00 	lea    0x1eb6(%rip),%rax        # 44d60 <complex_keymap+0x500>
   42eaa:	48 89 c2             	mov    %rax,%rdx
   42ead:	be ba 00 00 00       	mov    $0xba,%esi
   42eb2:	48 8d 05 dc 1a 00 00 	lea    0x1adc(%rip),%rax        # 44995 <complex_keymap+0x135>
   42eb9:	48 89 c7             	mov    %rax,%rdi
   42ebc:	e8 91 f8 ff ff       	call   42752 <assert_fail>
        }
        if (perm & PTE_U)
   42ec1:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42ec4:	48 98                	cltq   
   42ec6:	83 e0 04             	and    $0x4,%eax
   42ec9:	48 85 c0             	test   %rax,%rax
   42ecc:	74 2a                	je     42ef8 <lookup_l1pagetable+0x164>
        {                       // if requester wants PTE_U,
            assert(pe & PTE_U); //   entry must allow PTE_U
   42ece:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42ed2:	83 e0 04             	and    $0x4,%eax
   42ed5:	48 85 c0             	test   %rax,%rax
   42ed8:	75 1e                	jne    42ef8 <lookup_l1pagetable+0x164>
   42eda:	48 8d 05 8a 1e 00 00 	lea    0x1e8a(%rip),%rax        # 44d6b <complex_keymap+0x50b>
   42ee1:	48 89 c2             	mov    %rax,%rdx
   42ee4:	be be 00 00 00       	mov    $0xbe,%esi
   42ee9:	48 8d 05 a5 1a 00 00 	lea    0x1aa5(%rip),%rax        # 44995 <complex_keymap+0x135>
   42ef0:	48 89 c7             	mov    %rax,%rdi
   42ef3:	e8 5a f8 ff ff       	call   42752 <assert_fail>
        }

        // TODO
        // set pt to physical address to next pagetable using `pe`
        pt = (x86_64_pagetable *)PTE_ADDR(pe);
   42ef8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42efc:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42f02:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 2; ++i)
   42f06:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   42f0a:	83 7d f4 02          	cmpl   $0x2,-0xc(%rbp)
   42f0e:	0f 8e ab fe ff ff    	jle    42dbf <lookup_l1pagetable+0x2b>
        // replace this
    }
    return pt;
   42f14:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   42f18:	c9                   	leave  
   42f19:	c3                   	ret    

0000000000042f1a <virtual_memory_lookup>:
// virtual_memory_lookup(pagetable, va)
//    Returns information about the mapping of the virtual address `va` in
//    `pagetable`. The information is returned as a `vamapping` object.

vamapping virtual_memory_lookup(x86_64_pagetable *pagetable, uintptr_t va)
{
   42f1a:	f3 0f 1e fa          	endbr64 
   42f1e:	55                   	push   %rbp
   42f1f:	48 89 e5             	mov    %rsp,%rbp
   42f22:	48 83 ec 50          	sub    $0x50,%rsp
   42f26:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   42f2a:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   42f2e:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    x86_64_pagetable *pt = pagetable;
   42f32:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42f36:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    x86_64_pageentry_t pe = PTE_W | PTE_U | PTE_P;
   42f3a:	48 c7 45 f0 07 00 00 	movq   $0x7,-0x10(%rbp)
   42f41:	00 
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i)
   42f42:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
   42f49:	eb 41                	jmp    42f8c <virtual_memory_lookup+0x72>
    {
        pe = pt->entry[PAGEINDEX(va, i)] & ~(pe & (PTE_W | PTE_U));
   42f4b:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42f4e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42f52:	89 d6                	mov    %edx,%esi
   42f54:	48 89 c7             	mov    %rax,%rdi
   42f57:	e8 6d f8 ff ff       	call   427c9 <pageindex>
   42f5c:	89 c2                	mov    %eax,%edx
   42f5e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42f62:	48 63 d2             	movslq %edx,%rdx
   42f65:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
   42f69:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42f6d:	83 e0 06             	and    $0x6,%eax
   42f70:	48 f7 d0             	not    %rax
   42f73:	48 21 d0             	and    %rdx,%rax
   42f76:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        pt = (x86_64_pagetable *)PTE_ADDR(pe);
   42f7a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42f7e:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42f84:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i)
   42f88:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
   42f8c:	83 7d ec 03          	cmpl   $0x3,-0x14(%rbp)
   42f90:	7f 0c                	jg     42f9e <virtual_memory_lookup+0x84>
   42f92:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42f96:	83 e0 01             	and    $0x1,%eax
   42f99:	48 85 c0             	test   %rax,%rax
   42f9c:	75 ad                	jne    42f4b <virtual_memory_lookup+0x31>
    }
    vamapping vam = {-1, (uintptr_t)-1, 0};
   42f9e:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%rbp)
   42fa5:	48 c7 45 d8 ff ff ff 	movq   $0xffffffffffffffff,-0x28(%rbp)
   42fac:	ff 
   42fad:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    if (pe & PTE_P)
   42fb4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42fb8:	83 e0 01             	and    $0x1,%eax
   42fbb:	48 85 c0             	test   %rax,%rax
   42fbe:	74 34                	je     42ff4 <virtual_memory_lookup+0xda>
    {
        vam.pn = PAGENUMBER(pe);
   42fc0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42fc4:	48 c1 e8 0c          	shr    $0xc,%rax
   42fc8:	89 45 d0             	mov    %eax,-0x30(%rbp)
        vam.pa = PTE_ADDR(pe) + PAGEOFFSET(va);
   42fcb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42fcf:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42fd5:	48 89 c2             	mov    %rax,%rdx
   42fd8:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42fdc:	25 ff 0f 00 00       	and    $0xfff,%eax
   42fe1:	48 09 d0             	or     %rdx,%rax
   42fe4:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        vam.perm = PTE_FLAGS(pe);
   42fe8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42fec:	25 ff 0f 00 00       	and    $0xfff,%eax
   42ff1:	89 45 e0             	mov    %eax,-0x20(%rbp)
    }
    return vam;
   42ff4:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42ff8:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   42ffc:	48 89 10             	mov    %rdx,(%rax)
   42fff:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   43003:	48 89 50 08          	mov    %rdx,0x8(%rax)
   43007:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   4300b:	48 89 50 10          	mov    %rdx,0x10(%rax)
}
   4300f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   43013:	c9                   	leave  
   43014:	c3                   	ret    

0000000000043015 <program_load>:
//    `assign_physical_page` to as required. Returns 0 on success and
//    -1 on failure (e.g. out-of-memory). `allocator` is passed to
//    `virtual_memory_map`.

int program_load(proc* p, int programnumber,
                 x86_64_pagetable* (*allocator)(void)) {
   43015:	f3 0f 1e fa          	endbr64 
   43019:	55                   	push   %rbp
   4301a:	48 89 e5             	mov    %rsp,%rbp
   4301d:	48 83 ec 40          	sub    $0x40,%rsp
   43021:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   43025:	89 75 d4             	mov    %esi,-0x2c(%rbp)
   43028:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    // is this a valid program?
    int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);
   4302c:	c7 45 f8 07 00 00 00 	movl   $0x7,-0x8(%rbp)
    assert(programnumber >= 0 && programnumber < nprograms);
   43033:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   43037:	78 08                	js     43041 <program_load+0x2c>
   43039:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   4303c:	3b 45 f8             	cmp    -0x8(%rbp),%eax
   4303f:	7c 1e                	jl     4305f <program_load+0x4a>
   43041:	48 8d 05 30 1d 00 00 	lea    0x1d30(%rip),%rax        # 44d78 <complex_keymap+0x518>
   43048:	48 89 c2             	mov    %rax,%rdx
   4304b:	be 37 00 00 00       	mov    $0x37,%esi
   43050:	48 8d 05 51 1d 00 00 	lea    0x1d51(%rip),%rax        # 44da8 <complex_keymap+0x548>
   43057:	48 89 c7             	mov    %rax,%rdi
   4305a:	e8 f3 f6 ff ff       	call   42752 <assert_fail>
    elf_header* eh = (elf_header*) ramimages[programnumber].begin;
   4305f:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   43062:	48 98                	cltq   
   43064:	48 c1 e0 04          	shl    $0x4,%rax
   43068:	48 89 c2             	mov    %rax,%rdx
   4306b:	48 8d 05 ae 1f 00 00 	lea    0x1fae(%rip),%rax        # 45020 <ramimages>
   43072:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   43076:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    assert(eh->e_magic == ELF_MAGIC);
   4307a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4307e:	8b 00                	mov    (%rax),%eax
   43080:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
   43085:	74 1e                	je     430a5 <program_load+0x90>
   43087:	48 8d 05 2c 1d 00 00 	lea    0x1d2c(%rip),%rax        # 44dba <complex_keymap+0x55a>
   4308e:	48 89 c2             	mov    %rax,%rdx
   43091:	be 39 00 00 00       	mov    $0x39,%esi
   43096:	48 8d 05 0b 1d 00 00 	lea    0x1d0b(%rip),%rax        # 44da8 <complex_keymap+0x548>
   4309d:	48 89 c7             	mov    %rax,%rdi
   430a0:	e8 ad f6 ff ff       	call   42752 <assert_fail>

    // load each loadable program segment into memory
    elf_program* ph = (elf_program*) ((const uint8_t*) eh + eh->e_phoff);
   430a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   430a9:	48 8b 50 20          	mov    0x20(%rax),%rdx
   430ad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   430b1:	48 01 d0             	add    %rdx,%rax
   430b4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    for (int i = 0; i < eh->e_phnum; ++i) {
   430b8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   430bf:	e9 94 00 00 00       	jmp    43158 <program_load+0x143>
        if (ph[i].p_type == ELF_PTYPE_LOAD) {
   430c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
   430c7:	48 63 d0             	movslq %eax,%rdx
   430ca:	48 89 d0             	mov    %rdx,%rax
   430cd:	48 c1 e0 03          	shl    $0x3,%rax
   430d1:	48 29 d0             	sub    %rdx,%rax
   430d4:	48 c1 e0 03          	shl    $0x3,%rax
   430d8:	48 89 c2             	mov    %rax,%rdx
   430db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   430df:	48 01 d0             	add    %rdx,%rax
   430e2:	8b 00                	mov    (%rax),%eax
   430e4:	83 f8 01             	cmp    $0x1,%eax
   430e7:	75 6b                	jne    43154 <program_load+0x13f>
            const uint8_t* pdata = (const uint8_t*) eh + ph[i].p_offset;
   430e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
   430ec:	48 63 d0             	movslq %eax,%rdx
   430ef:	48 89 d0             	mov    %rdx,%rax
   430f2:	48 c1 e0 03          	shl    $0x3,%rax
   430f6:	48 29 d0             	sub    %rdx,%rax
   430f9:	48 c1 e0 03          	shl    $0x3,%rax
   430fd:	48 89 c2             	mov    %rax,%rdx
   43100:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43104:	48 01 d0             	add    %rdx,%rax
   43107:	48 8b 50 08          	mov    0x8(%rax),%rdx
   4310b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4310f:	48 01 d0             	add    %rdx,%rax
   43112:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            if (program_load_segment(p, &ph[i], pdata, allocator) < 0) {
   43116:	8b 45 fc             	mov    -0x4(%rbp),%eax
   43119:	48 63 d0             	movslq %eax,%rdx
   4311c:	48 89 d0             	mov    %rdx,%rax
   4311f:	48 c1 e0 03          	shl    $0x3,%rax
   43123:	48 29 d0             	sub    %rdx,%rax
   43126:	48 c1 e0 03          	shl    $0x3,%rax
   4312a:	48 89 c2             	mov    %rax,%rdx
   4312d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43131:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   43135:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   43139:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   4313d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43141:	48 89 c7             	mov    %rax,%rdi
   43144:	e8 3d 00 00 00       	call   43186 <program_load_segment>
   43149:	85 c0                	test   %eax,%eax
   4314b:	79 07                	jns    43154 <program_load+0x13f>
                return -1;
   4314d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43152:	eb 30                	jmp    43184 <program_load+0x16f>
    for (int i = 0; i < eh->e_phnum; ++i) {
   43154:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   43158:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4315c:	0f b7 40 38          	movzwl 0x38(%rax),%eax
   43160:	0f b7 c0             	movzwl %ax,%eax
   43163:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   43166:	0f 8c 58 ff ff ff    	jl     430c4 <program_load+0xaf>
            }
        }
    }

    // set the entry point from the ELF header
    p->p_registers.reg_rip = eh->e_entry;
   4316c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43170:	48 8b 50 18          	mov    0x18(%rax),%rdx
   43174:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43178:	48 89 90 a0 00 00 00 	mov    %rdx,0xa0(%rax)
    return 0;
   4317f:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43184:	c9                   	leave  
   43185:	c3                   	ret    

0000000000043186 <program_load_segment>:
//    Calls `assign_physical_page` to allocate pages and `virtual_memory_map`
//    to map them in `p->p_pagetable`. Returns 0 on success and -1 on failure.

static int program_load_segment(proc* p, const elf_program* ph,
                                const uint8_t* src,
                                x86_64_pagetable* (*allocator)(void)) {
   43186:	f3 0f 1e fa          	endbr64 
   4318a:	55                   	push   %rbp
   4318b:	48 89 e5             	mov    %rsp,%rbp
   4318e:	48 83 ec 40          	sub    $0x40,%rsp
   43192:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   43196:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   4319a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   4319e:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    uintptr_t va = (uintptr_t) ph->p_va;
   431a2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   431a6:	48 8b 40 10          	mov    0x10(%rax),%rax
   431aa:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    uintptr_t end_file = va + ph->p_filesz, end_mem = va + ph->p_memsz;
   431ae:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   431b2:	48 8b 50 20          	mov    0x20(%rax),%rdx
   431b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   431ba:	48 01 d0             	add    %rdx,%rax
   431bd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   431c1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   431c5:	48 8b 50 28          	mov    0x28(%rax),%rdx
   431c9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   431cd:	48 01 d0             	add    %rdx,%rax
   431d0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    va &= ~(PAGESIZE - 1);                // round to page boundary
   431d4:	48 81 65 f0 00 f0 ff 	andq   $0xfffffffffffff000,-0x10(%rbp)
   431db:	ff 

    // allocate memory
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   431dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   431e0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   431e4:	e9 81 00 00 00       	jmp    4326a <program_load_segment+0xe4>
        if (assign_physical_page(addr, p->p_pid) < 0
   431e9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   431ed:	8b 00                	mov    (%rax),%eax
   431ef:	0f be d0             	movsbl %al,%edx
   431f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   431f6:	89 d6                	mov    %edx,%esi
   431f8:	48 89 c7             	mov    %rax,%rdi
   431fb:	e8 29 d3 ff ff       	call   40529 <assign_physical_page>
   43200:	85 c0                	test   %eax,%eax
   43202:	78 2a                	js     4322e <program_load_segment+0xa8>
            || virtual_memory_map(p->p_pagetable, addr, addr, PAGESIZE,
   43204:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43208:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   4320f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43213:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   43217:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   4321d:	b9 00 10 00 00       	mov    $0x1000,%ecx
   43222:	48 89 c7             	mov    %rax,%rdi
   43225:	e8 ac f8 ff ff       	call   42ad6 <virtual_memory_map>
   4322a:	85 c0                	test   %eax,%eax
   4322c:	79 34                	jns    43262 <program_load_segment+0xdc>
                                  PTE_P | PTE_W | PTE_U) < 0) {
            console_printf(CPOS(22, 0), 0xC000, "program_load_segment(pid %d): can't assign address %p\n", p->p_pid, addr);
   4322e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43232:	8b 00                	mov    (%rax),%eax
   43234:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43238:	49 89 d0             	mov    %rdx,%r8
   4323b:	89 c1                	mov    %eax,%ecx
   4323d:	48 8d 05 94 1b 00 00 	lea    0x1b94(%rip),%rax        # 44dd8 <complex_keymap+0x578>
   43244:	48 89 c2             	mov    %rax,%rdx
   43247:	be 00 c0 00 00       	mov    $0xc000,%esi
   4324c:	bf e0 06 00 00       	mov    $0x6e0,%edi
   43251:	b8 00 00 00 00       	mov    $0x0,%eax
   43256:	e8 c5 0f 00 00       	call   44220 <console_printf>
            return -1;
   4325b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43260:	eb 77                	jmp    432d9 <program_load_segment+0x153>
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43262:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   43269:	00 
   4326a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4326e:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
   43272:	0f 82 71 ff ff ff    	jb     431e9 <program_load_segment+0x63>
        }
    }

    // ensure new memory mappings are active
    set_pagetable(p->p_pagetable);
   43278:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4327c:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43283:	48 89 c7             	mov    %rax,%rdi
   43286:	e8 d9 f6 ff ff       	call   42964 <set_pagetable>

    // copy data from executable image into process memory
    memcpy((uint8_t*) va, src, end_file - va);
   4328b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4328f:	48 2b 45 f0          	sub    -0x10(%rbp),%rax
   43293:	48 89 c2             	mov    %rax,%rdx
   43296:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4329a:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   4329e:	48 89 ce             	mov    %rcx,%rsi
   432a1:	48 89 c7             	mov    %rax,%rdi
   432a4:	e8 32 00 00 00       	call   432db <memcpy>
    memset((uint8_t*) end_file, 0, end_mem - end_file);
   432a9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   432ad:	48 2b 45 e8          	sub    -0x18(%rbp),%rax
   432b1:	48 89 c2             	mov    %rax,%rdx
   432b4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   432b8:	be 00 00 00 00       	mov    $0x0,%esi
   432bd:	48 89 c7             	mov    %rax,%rdi
   432c0:	e8 1c 01 00 00       	call   433e1 <memset>

    // restore kernel pagetable
    set_pagetable(kernel_pagetable);
   432c5:	48 8b 05 34 0d 01 00 	mov    0x10d34(%rip),%rax        # 54000 <kernel_pagetable>
   432cc:	48 89 c7             	mov    %rax,%rdi
   432cf:	e8 90 f6 ff ff       	call   42964 <set_pagetable>
    return 0;
   432d4:	b8 00 00 00 00       	mov    $0x0,%eax
}
   432d9:	c9                   	leave  
   432da:	c3                   	ret    

00000000000432db <memcpy>:


// memcpy, memmove, memset, strcmp, strlen, strnlen
//    We must provide our own implementations.

void* memcpy(void* dst, const void* src, size_t n) {
   432db:	f3 0f 1e fa          	endbr64 
   432df:	55                   	push   %rbp
   432e0:	48 89 e5             	mov    %rsp,%rbp
   432e3:	48 83 ec 28          	sub    $0x28,%rsp
   432e7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   432eb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
   432ef:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    const char* s = (const char*) src;
   432f3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   432f7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   432fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   432ff:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
   43303:	eb 1c                	jmp    43321 <memcpy+0x46>
        *d = *s;
   43305:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43309:	0f b6 10             	movzbl (%rax),%edx
   4330c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43310:	88 10                	mov    %dl,(%rax)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   43312:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
   43317:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   4331c:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
   43321:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   43326:	75 dd                	jne    43305 <memcpy+0x2a>
    }
    return dst;
   43328:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   4332c:	c9                   	leave  
   4332d:	c3                   	ret    

000000000004332e <memmove>:

void* memmove(void* dst, const void* src, size_t n) {
   4332e:	f3 0f 1e fa          	endbr64 
   43332:	55                   	push   %rbp
   43333:	48 89 e5             	mov    %rsp,%rbp
   43336:	48 83 ec 28          	sub    $0x28,%rsp
   4333a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4333e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
   43342:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    const char* s = (const char*) src;
   43346:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4334a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    char* d = (char*) dst;
   4334e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43352:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (s < d && s + n > d) {
   43356:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4335a:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
   4335e:	73 6a                	jae    433ca <memmove+0x9c>
   43360:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43364:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43368:	48 01 d0             	add    %rdx,%rax
   4336b:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   4336f:	73 59                	jae    433ca <memmove+0x9c>
        s += n, d += n;
   43371:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43375:	48 01 45 f8          	add    %rax,-0x8(%rbp)
   43379:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4337d:	48 01 45 f0          	add    %rax,-0x10(%rbp)
        while (n-- > 0) {
   43381:	eb 17                	jmp    4339a <memmove+0x6c>
            *--d = *--s;
   43383:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
   43388:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
   4338d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43391:	0f b6 10             	movzbl (%rax),%edx
   43394:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43398:	88 10                	mov    %dl,(%rax)
        while (n-- > 0) {
   4339a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4339e:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
   433a2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
   433a6:	48 85 c0             	test   %rax,%rax
   433a9:	75 d8                	jne    43383 <memmove+0x55>
    if (s < d && s + n > d) {
   433ab:	eb 2e                	jmp    433db <memmove+0xad>
        }
    } else {
        while (n-- > 0) {
            *d++ = *s++;
   433ad:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   433b1:	48 8d 42 01          	lea    0x1(%rdx),%rax
   433b5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   433b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   433bd:	48 8d 48 01          	lea    0x1(%rax),%rcx
   433c1:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
   433c5:	0f b6 12             	movzbl (%rdx),%edx
   433c8:	88 10                	mov    %dl,(%rax)
        while (n-- > 0) {
   433ca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   433ce:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
   433d2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
   433d6:	48 85 c0             	test   %rax,%rax
   433d9:	75 d2                	jne    433ad <memmove+0x7f>
        }
    }
    return dst;
   433db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   433df:	c9                   	leave  
   433e0:	c3                   	ret    

00000000000433e1 <memset>:

void* memset(void* v, int c, size_t n) {
   433e1:	f3 0f 1e fa          	endbr64 
   433e5:	55                   	push   %rbp
   433e6:	48 89 e5             	mov    %rsp,%rbp
   433e9:	48 83 ec 28          	sub    $0x28,%rsp
   433ed:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   433f1:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   433f4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   433f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   433fc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   43400:	eb 15                	jmp    43417 <memset+0x36>
        *p = c;
   43402:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   43405:	89 c2                	mov    %eax,%edx
   43407:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4340b:	88 10                	mov    %dl,(%rax)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   4340d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   43412:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
   43417:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   4341c:	75 e4                	jne    43402 <memset+0x21>
    }
    return v;
   4341e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   43422:	c9                   	leave  
   43423:	c3                   	ret    

0000000000043424 <strlen>:

size_t strlen(const char* s) {
   43424:	f3 0f 1e fa          	endbr64 
   43428:	55                   	push   %rbp
   43429:	48 89 e5             	mov    %rsp,%rbp
   4342c:	48 83 ec 18          	sub    $0x18,%rsp
   43430:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
   43434:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   4343b:	00 
   4343c:	eb 0a                	jmp    43448 <strlen+0x24>
        ++n;
   4343e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    for (n = 0; *s != '\0'; ++s) {
   43443:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
   43448:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4344c:	0f b6 00             	movzbl (%rax),%eax
   4344f:	84 c0                	test   %al,%al
   43451:	75 eb                	jne    4343e <strlen+0x1a>
    }
    return n;
   43453:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   43457:	c9                   	leave  
   43458:	c3                   	ret    

0000000000043459 <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
   43459:	f3 0f 1e fa          	endbr64 
   4345d:	55                   	push   %rbp
   4345e:	48 89 e5             	mov    %rsp,%rbp
   43461:	48 83 ec 20          	sub    $0x20,%rsp
   43465:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   43469:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   4346d:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   43474:	00 
   43475:	eb 0a                	jmp    43481 <strnlen+0x28>
        ++n;
   43477:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   4347c:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
   43481:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43485:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
   43489:	74 0b                	je     43496 <strnlen+0x3d>
   4348b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4348f:	0f b6 00             	movzbl (%rax),%eax
   43492:	84 c0                	test   %al,%al
   43494:	75 e1                	jne    43477 <strnlen+0x1e>
    }
    return n;
   43496:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   4349a:	c9                   	leave  
   4349b:	c3                   	ret    

000000000004349c <strcpy>:

char* strcpy(char* dst, const char* src) {
   4349c:	f3 0f 1e fa          	endbr64 
   434a0:	55                   	push   %rbp
   434a1:	48 89 e5             	mov    %rsp,%rbp
   434a4:	48 83 ec 20          	sub    $0x20,%rsp
   434a8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   434ac:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    char* d = dst;
   434b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   434b4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    do {
        *d++ = *src++;
   434b8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   434bc:	48 8d 42 01          	lea    0x1(%rdx),%rax
   434c0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
   434c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   434c8:	48 8d 48 01          	lea    0x1(%rax),%rcx
   434cc:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
   434d0:	0f b6 12             	movzbl (%rdx),%edx
   434d3:	88 10                	mov    %dl,(%rax)
    } while (d[-1]);
   434d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   434d9:	48 83 e8 01          	sub    $0x1,%rax
   434dd:	0f b6 00             	movzbl (%rax),%eax
   434e0:	84 c0                	test   %al,%al
   434e2:	75 d4                	jne    434b8 <strcpy+0x1c>
    return dst;
   434e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   434e8:	c9                   	leave  
   434e9:	c3                   	ret    

00000000000434ea <strcmp>:

int strcmp(const char* a, const char* b) {
   434ea:	f3 0f 1e fa          	endbr64 
   434ee:	55                   	push   %rbp
   434ef:	48 89 e5             	mov    %rsp,%rbp
   434f2:	48 83 ec 10          	sub    $0x10,%rsp
   434f6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   434fa:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    while (*a && *b && *a == *b) {
   434fe:	eb 0a                	jmp    4350a <strcmp+0x20>
        ++a, ++b;
   43500:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   43505:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    while (*a && *b && *a == *b) {
   4350a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4350e:	0f b6 00             	movzbl (%rax),%eax
   43511:	84 c0                	test   %al,%al
   43513:	74 1d                	je     43532 <strcmp+0x48>
   43515:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43519:	0f b6 00             	movzbl (%rax),%eax
   4351c:	84 c0                	test   %al,%al
   4351e:	74 12                	je     43532 <strcmp+0x48>
   43520:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43524:	0f b6 10             	movzbl (%rax),%edx
   43527:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4352b:	0f b6 00             	movzbl (%rax),%eax
   4352e:	38 c2                	cmp    %al,%dl
   43530:	74 ce                	je     43500 <strcmp+0x16>
    }
    return ((unsigned char) *a > (unsigned char) *b)
   43532:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43536:	0f b6 00             	movzbl (%rax),%eax
   43539:	89 c2                	mov    %eax,%edx
   4353b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4353f:	0f b6 00             	movzbl (%rax),%eax
   43542:	38 c2                	cmp    %al,%dl
   43544:	0f 97 c0             	seta   %al
   43547:	0f b6 d0             	movzbl %al,%edx
        - ((unsigned char) *a < (unsigned char) *b);
   4354a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4354e:	0f b6 00             	movzbl (%rax),%eax
   43551:	89 c1                	mov    %eax,%ecx
   43553:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43557:	0f b6 00             	movzbl (%rax),%eax
   4355a:	38 c1                	cmp    %al,%cl
   4355c:	0f 92 c0             	setb   %al
   4355f:	0f b6 c8             	movzbl %al,%ecx
   43562:	89 d0                	mov    %edx,%eax
   43564:	29 c8                	sub    %ecx,%eax
}
   43566:	c9                   	leave  
   43567:	c3                   	ret    

0000000000043568 <strchr>:

char* strchr(const char* s, int c) {
   43568:	f3 0f 1e fa          	endbr64 
   4356c:	55                   	push   %rbp
   4356d:	48 89 e5             	mov    %rsp,%rbp
   43570:	48 83 ec 10          	sub    $0x10,%rsp
   43574:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   43578:	89 75 f4             	mov    %esi,-0xc(%rbp)
    while (*s && *s != (char) c) {
   4357b:	eb 05                	jmp    43582 <strchr+0x1a>
        ++s;
   4357d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    while (*s && *s != (char) c) {
   43582:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43586:	0f b6 00             	movzbl (%rax),%eax
   43589:	84 c0                	test   %al,%al
   4358b:	74 0e                	je     4359b <strchr+0x33>
   4358d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43591:	0f b6 00             	movzbl (%rax),%eax
   43594:	8b 55 f4             	mov    -0xc(%rbp),%edx
   43597:	38 d0                	cmp    %dl,%al
   43599:	75 e2                	jne    4357d <strchr+0x15>
    }
    if (*s == (char) c) {
   4359b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4359f:	0f b6 00             	movzbl (%rax),%eax
   435a2:	8b 55 f4             	mov    -0xc(%rbp),%edx
   435a5:	38 d0                	cmp    %dl,%al
   435a7:	75 06                	jne    435af <strchr+0x47>
        return (char*) s;
   435a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   435ad:	eb 05                	jmp    435b4 <strchr+0x4c>
    } else {
        return NULL;
   435af:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   435b4:	c9                   	leave  
   435b5:	c3                   	ret    

00000000000435b6 <rand>:
// rand, srand

static int rand_seed_set;
static unsigned rand_seed;

int rand(void) {
   435b6:	f3 0f 1e fa          	endbr64 
   435ba:	55                   	push   %rbp
   435bb:	48 89 e5             	mov    %rsp,%rbp
    if (!rand_seed_set) {
   435be:	8b 05 3c 6a 01 00    	mov    0x16a3c(%rip),%eax        # 5a000 <rand_seed_set>
   435c4:	85 c0                	test   %eax,%eax
   435c6:	75 0a                	jne    435d2 <rand+0x1c>
        srand(819234718U);
   435c8:	bf 9e 87 d4 30       	mov    $0x30d4879e,%edi
   435cd:	e8 24 00 00 00       	call   435f6 <srand>
    }
    rand_seed = rand_seed * 1664525U + 1013904223U;
   435d2:	8b 05 2c 6a 01 00    	mov    0x16a2c(%rip),%eax        # 5a004 <rand_seed>
   435d8:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
   435de:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
   435e3:	89 05 1b 6a 01 00    	mov    %eax,0x16a1b(%rip)        # 5a004 <rand_seed>
    return rand_seed & RAND_MAX;
   435e9:	8b 05 15 6a 01 00    	mov    0x16a15(%rip),%eax        # 5a004 <rand_seed>
   435ef:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
   435f4:	5d                   	pop    %rbp
   435f5:	c3                   	ret    

00000000000435f6 <srand>:

void srand(unsigned seed) {
   435f6:	f3 0f 1e fa          	endbr64 
   435fa:	55                   	push   %rbp
   435fb:	48 89 e5             	mov    %rsp,%rbp
   435fe:	48 83 ec 08          	sub    $0x8,%rsp
   43602:	89 7d fc             	mov    %edi,-0x4(%rbp)
    rand_seed = seed;
   43605:	8b 45 fc             	mov    -0x4(%rbp),%eax
   43608:	89 05 f6 69 01 00    	mov    %eax,0x169f6(%rip)        # 5a004 <rand_seed>
    rand_seed_set = 1;
   4360e:	c7 05 e8 69 01 00 01 	movl   $0x1,0x169e8(%rip)        # 5a000 <rand_seed_set>
   43615:	00 00 00 
}
   43618:	90                   	nop
   43619:	c9                   	leave  
   4361a:	c3                   	ret    

000000000004361b <fill_numbuf>:
//    Print a message onto the console, starting at the given cursor position.

// snprintf, vsnprintf
//    Format a string into a buffer.

static char* fill_numbuf(char* numbuf_end, unsigned long val, int base) {
   4361b:	f3 0f 1e fa          	endbr64 
   4361f:	55                   	push   %rbp
   43620:	48 89 e5             	mov    %rsp,%rbp
   43623:	48 83 ec 28          	sub    $0x28,%rsp
   43627:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4362b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
   4362f:	89 55 dc             	mov    %edx,-0x24(%rbp)
    static const char upper_digits[] = "0123456789ABCDEF";
    static const char lower_digits[] = "0123456789abcdef";

    const char* digits = upper_digits;
   43632:	48 8d 05 d7 18 00 00 	lea    0x18d7(%rip),%rax        # 44f10 <upper_digits.1>
   43639:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (base < 0) {
   4363d:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   43641:	79 0e                	jns    43651 <fill_numbuf+0x36>
        digits = lower_digits;
   43643:	48 8d 05 e6 18 00 00 	lea    0x18e6(%rip),%rax        # 44f30 <lower_digits.0>
   4364a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        base = -base;
   4364e:	f7 5d dc             	negl   -0x24(%rbp)
    }

    *--numbuf_end = '\0';
   43651:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
   43656:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4365a:	c6 00 00             	movb   $0x0,(%rax)
    do {
        *--numbuf_end = digits[val % base];
   4365d:	8b 45 dc             	mov    -0x24(%rbp),%eax
   43660:	48 63 c8             	movslq %eax,%rcx
   43663:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43667:	ba 00 00 00 00       	mov    $0x0,%edx
   4366c:	48 f7 f1             	div    %rcx
   4366f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43673:	48 01 d0             	add    %rdx,%rax
   43676:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
   4367b:	0f b6 10             	movzbl (%rax),%edx
   4367e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43682:	88 10                	mov    %dl,(%rax)
        val /= base;
   43684:	8b 45 dc             	mov    -0x24(%rbp),%eax
   43687:	48 63 f0             	movslq %eax,%rsi
   4368a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4368e:	ba 00 00 00 00       	mov    $0x0,%edx
   43693:	48 f7 f6             	div    %rsi
   43696:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    } while (val != 0);
   4369a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   4369f:	75 bc                	jne    4365d <fill_numbuf+0x42>
    return numbuf_end;
   436a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   436a5:	c9                   	leave  
   436a6:	c3                   	ret    

00000000000436a7 <printer_vprintf>:
#define FLAG_NUMERIC            (1<<5)
#define FLAG_SIGNED             (1<<6)
#define FLAG_NEGATIVE           (1<<7)
#define FLAG_ALT2               (1<<8)

void printer_vprintf(printer* p, int color, const char* format, va_list val) {
   436a7:	f3 0f 1e fa          	endbr64 
   436ab:	55                   	push   %rbp
   436ac:	48 89 e5             	mov    %rsp,%rbp
   436af:	53                   	push   %rbx
   436b0:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   436b7:	48 89 bd 78 ff ff ff 	mov    %rdi,-0x88(%rbp)
   436be:	89 b5 74 ff ff ff    	mov    %esi,-0x8c(%rbp)
   436c4:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   436cb:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
#define NUMBUFSIZ 24
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
   436d2:	e9 bd 09 00 00       	jmp    44094 <printer_vprintf+0x9ed>
        if (*format != '%') {
   436d7:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   436de:	0f b6 00             	movzbl (%rax),%eax
   436e1:	3c 25                	cmp    $0x25,%al
   436e3:	74 31                	je     43716 <printer_vprintf+0x6f>
            p->putc(p, *format, color);
   436e5:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   436ec:	4c 8b 00             	mov    (%rax),%r8
   436ef:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   436f6:	0f b6 00             	movzbl (%rax),%eax
   436f9:	0f b6 c8             	movzbl %al,%ecx
   436fc:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   43702:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   43709:	89 ce                	mov    %ecx,%esi
   4370b:	48 89 c7             	mov    %rax,%rdi
   4370e:	41 ff d0             	call   *%r8
            continue;
   43711:	e9 76 09 00 00       	jmp    4408c <printer_vprintf+0x9e5>
        }

        // process flags
        int flags = 0;
   43716:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
        for (++format; *format; ++format) {
   4371d:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   43724:	01 
   43725:	eb 4d                	jmp    43774 <printer_vprintf+0xcd>
            const char* flagc = strchr(flag_chars, *format);
   43727:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   4372e:	0f b6 00             	movzbl (%rax),%eax
   43731:	0f be c0             	movsbl %al,%eax
   43734:	89 c6                	mov    %eax,%esi
   43736:	48 8d 05 d3 16 00 00 	lea    0x16d3(%rip),%rax        # 44e10 <flag_chars>
   4373d:	48 89 c7             	mov    %rax,%rdi
   43740:	e8 23 fe ff ff       	call   43568 <strchr>
   43745:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
            if (flagc) {
   43749:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   4374e:	74 34                	je     43784 <printer_vprintf+0xdd>
                flags |= 1 << (flagc - flag_chars);
   43750:	48 8d 15 b9 16 00 00 	lea    0x16b9(%rip),%rdx        # 44e10 <flag_chars>
   43757:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   4375b:	48 29 d0             	sub    %rdx,%rax
   4375e:	ba 01 00 00 00       	mov    $0x1,%edx
   43763:	89 c1                	mov    %eax,%ecx
   43765:	d3 e2                	shl    %cl,%edx
   43767:	89 d0                	mov    %edx,%eax
   43769:	09 45 ec             	or     %eax,-0x14(%rbp)
        for (++format; *format; ++format) {
   4376c:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   43773:	01 
   43774:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   4377b:	0f b6 00             	movzbl (%rax),%eax
   4377e:	84 c0                	test   %al,%al
   43780:	75 a5                	jne    43727 <printer_vprintf+0x80>
   43782:	eb 01                	jmp    43785 <printer_vprintf+0xde>
            } else {
                break;
   43784:	90                   	nop
            }
        }

        // process width
        int width = -1;
   43785:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%rbp)
        if (*format >= '1' && *format <= '9') {
   4378c:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43793:	0f b6 00             	movzbl (%rax),%eax
   43796:	3c 30                	cmp    $0x30,%al
   43798:	7e 67                	jle    43801 <printer_vprintf+0x15a>
   4379a:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   437a1:	0f b6 00             	movzbl (%rax),%eax
   437a4:	3c 39                	cmp    $0x39,%al
   437a6:	7f 59                	jg     43801 <printer_vprintf+0x15a>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   437a8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
   437af:	eb 2e                	jmp    437df <printer_vprintf+0x138>
                width = 10 * width + *format++ - '0';
   437b1:	8b 55 e8             	mov    -0x18(%rbp),%edx
   437b4:	89 d0                	mov    %edx,%eax
   437b6:	c1 e0 02             	shl    $0x2,%eax
   437b9:	01 d0                	add    %edx,%eax
   437bb:	01 c0                	add    %eax,%eax
   437bd:	89 c1                	mov    %eax,%ecx
   437bf:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   437c6:	48 8d 50 01          	lea    0x1(%rax),%rdx
   437ca:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   437d1:	0f b6 00             	movzbl (%rax),%eax
   437d4:	0f be c0             	movsbl %al,%eax
   437d7:	01 c8                	add    %ecx,%eax
   437d9:	83 e8 30             	sub    $0x30,%eax
   437dc:	89 45 e8             	mov    %eax,-0x18(%rbp)
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   437df:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   437e6:	0f b6 00             	movzbl (%rax),%eax
   437e9:	3c 2f                	cmp    $0x2f,%al
   437eb:	0f 8e 85 00 00 00    	jle    43876 <printer_vprintf+0x1cf>
   437f1:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   437f8:	0f b6 00             	movzbl (%rax),%eax
   437fb:	3c 39                	cmp    $0x39,%al
   437fd:	7e b2                	jle    437b1 <printer_vprintf+0x10a>
        if (*format >= '1' && *format <= '9') {
   437ff:	eb 75                	jmp    43876 <printer_vprintf+0x1cf>
            }
        } else if (*format == '*') {
   43801:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43808:	0f b6 00             	movzbl (%rax),%eax
   4380b:	3c 2a                	cmp    $0x2a,%al
   4380d:	75 68                	jne    43877 <printer_vprintf+0x1d0>
            width = va_arg(val, int);
   4380f:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43816:	8b 00                	mov    (%rax),%eax
   43818:	83 f8 2f             	cmp    $0x2f,%eax
   4381b:	77 30                	ja     4384d <printer_vprintf+0x1a6>
   4381d:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43824:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43828:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4382f:	8b 00                	mov    (%rax),%eax
   43831:	89 c0                	mov    %eax,%eax
   43833:	48 01 d0             	add    %rdx,%rax
   43836:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4383d:	8b 12                	mov    (%rdx),%edx
   4383f:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43842:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43849:	89 0a                	mov    %ecx,(%rdx)
   4384b:	eb 1a                	jmp    43867 <printer_vprintf+0x1c0>
   4384d:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43854:	48 8b 40 08          	mov    0x8(%rax),%rax
   43858:	48 8d 48 08          	lea    0x8(%rax),%rcx
   4385c:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43863:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43867:	8b 00                	mov    (%rax),%eax
   43869:	89 45 e8             	mov    %eax,-0x18(%rbp)
            ++format;
   4386c:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   43873:	01 
   43874:	eb 01                	jmp    43877 <printer_vprintf+0x1d0>
        if (*format >= '1' && *format <= '9') {
   43876:	90                   	nop
        }

        // process precision
        int precision = -1;
   43877:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
        if (*format == '.') {
   4387e:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43885:	0f b6 00             	movzbl (%rax),%eax
   43888:	3c 2e                	cmp    $0x2e,%al
   4388a:	0f 85 00 01 00 00    	jne    43990 <printer_vprintf+0x2e9>
            ++format;
   43890:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   43897:	01 
            if (*format >= '0' && *format <= '9') {
   43898:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   4389f:	0f b6 00             	movzbl (%rax),%eax
   438a2:	3c 2f                	cmp    $0x2f,%al
   438a4:	7e 67                	jle    4390d <printer_vprintf+0x266>
   438a6:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   438ad:	0f b6 00             	movzbl (%rax),%eax
   438b0:	3c 39                	cmp    $0x39,%al
   438b2:	7f 59                	jg     4390d <printer_vprintf+0x266>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   438b4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
   438bb:	eb 2e                	jmp    438eb <printer_vprintf+0x244>
                    precision = 10 * precision + *format++ - '0';
   438bd:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   438c0:	89 d0                	mov    %edx,%eax
   438c2:	c1 e0 02             	shl    $0x2,%eax
   438c5:	01 d0                	add    %edx,%eax
   438c7:	01 c0                	add    %eax,%eax
   438c9:	89 c1                	mov    %eax,%ecx
   438cb:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   438d2:	48 8d 50 01          	lea    0x1(%rax),%rdx
   438d6:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   438dd:	0f b6 00             	movzbl (%rax),%eax
   438e0:	0f be c0             	movsbl %al,%eax
   438e3:	01 c8                	add    %ecx,%eax
   438e5:	83 e8 30             	sub    $0x30,%eax
   438e8:	89 45 e4             	mov    %eax,-0x1c(%rbp)
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   438eb:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   438f2:	0f b6 00             	movzbl (%rax),%eax
   438f5:	3c 2f                	cmp    $0x2f,%al
   438f7:	0f 8e 85 00 00 00    	jle    43982 <printer_vprintf+0x2db>
   438fd:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43904:	0f b6 00             	movzbl (%rax),%eax
   43907:	3c 39                	cmp    $0x39,%al
   43909:	7e b2                	jle    438bd <printer_vprintf+0x216>
            if (*format >= '0' && *format <= '9') {
   4390b:	eb 75                	jmp    43982 <printer_vprintf+0x2db>
                }
            } else if (*format == '*') {
   4390d:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43914:	0f b6 00             	movzbl (%rax),%eax
   43917:	3c 2a                	cmp    $0x2a,%al
   43919:	75 68                	jne    43983 <printer_vprintf+0x2dc>
                precision = va_arg(val, int);
   4391b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43922:	8b 00                	mov    (%rax),%eax
   43924:	83 f8 2f             	cmp    $0x2f,%eax
   43927:	77 30                	ja     43959 <printer_vprintf+0x2b2>
   43929:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43930:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43934:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4393b:	8b 00                	mov    (%rax),%eax
   4393d:	89 c0                	mov    %eax,%eax
   4393f:	48 01 d0             	add    %rdx,%rax
   43942:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43949:	8b 12                	mov    (%rdx),%edx
   4394b:	8d 4a 08             	lea    0x8(%rdx),%ecx
   4394e:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43955:	89 0a                	mov    %ecx,(%rdx)
   43957:	eb 1a                	jmp    43973 <printer_vprintf+0x2cc>
   43959:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43960:	48 8b 40 08          	mov    0x8(%rax),%rax
   43964:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43968:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4396f:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43973:	8b 00                	mov    (%rax),%eax
   43975:	89 45 e4             	mov    %eax,-0x1c(%rbp)
                ++format;
   43978:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   4397f:	01 
   43980:	eb 01                	jmp    43983 <printer_vprintf+0x2dc>
            if (*format >= '0' && *format <= '9') {
   43982:	90                   	nop
            }
            if (precision < 0) {
   43983:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
   43987:	79 07                	jns    43990 <printer_vprintf+0x2e9>
                precision = 0;
   43989:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
            }
        }

        // process main conversion character
        int base = 10;
   43990:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%rbp)
        unsigned long num = 0;
   43997:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
   4399e:	00 
        int length = 0;
   4399f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
        char* data = "";
   439a6:	48 8d 05 69 14 00 00 	lea    0x1469(%rip),%rax        # 44e16 <flag_chars+0x6>
   439ad:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    again:
        switch (*format) {
   439b1:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   439b8:	0f b6 00             	movzbl (%rax),%eax
   439bb:	0f be c0             	movsbl %al,%eax
   439be:	83 e8 43             	sub    $0x43,%eax
   439c1:	83 f8 37             	cmp    $0x37,%eax
   439c4:	0f 87 b6 03 00 00    	ja     43d80 <printer_vprintf+0x6d9>
   439ca:	89 c0                	mov    %eax,%eax
   439cc:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
   439d3:	00 
   439d4:	48 8d 05 49 14 00 00 	lea    0x1449(%rip),%rax        # 44e24 <flag_chars+0x14>
   439db:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   439de:	48 98                	cltq   
   439e0:	48 8d 15 3d 14 00 00 	lea    0x143d(%rip),%rdx        # 44e24 <flag_chars+0x14>
   439e7:	48 01 d0             	add    %rdx,%rax
   439ea:	3e ff e0             	notrack jmp *%rax
        case 'l':
        case 'z':
            length = 1;
   439ed:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
            ++format;
   439f4:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   439fb:	01 
            goto again;
   439fc:	eb b3                	jmp    439b1 <printer_vprintf+0x30a>
        case 'd':
        case 'i': {
            long x = length ? va_arg(val, long) : va_arg(val, int);
   439fe:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   43a02:	74 5d                	je     43a61 <printer_vprintf+0x3ba>
   43a04:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43a0b:	8b 00                	mov    (%rax),%eax
   43a0d:	83 f8 2f             	cmp    $0x2f,%eax
   43a10:	77 30                	ja     43a42 <printer_vprintf+0x39b>
   43a12:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43a19:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43a1d:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43a24:	8b 00                	mov    (%rax),%eax
   43a26:	89 c0                	mov    %eax,%eax
   43a28:	48 01 d0             	add    %rdx,%rax
   43a2b:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43a32:	8b 12                	mov    (%rdx),%edx
   43a34:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43a37:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43a3e:	89 0a                	mov    %ecx,(%rdx)
   43a40:	eb 1a                	jmp    43a5c <printer_vprintf+0x3b5>
   43a42:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43a49:	48 8b 40 08          	mov    0x8(%rax),%rax
   43a4d:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43a51:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43a58:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43a5c:	48 8b 00             	mov    (%rax),%rax
   43a5f:	eb 5c                	jmp    43abd <printer_vprintf+0x416>
   43a61:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43a68:	8b 00                	mov    (%rax),%eax
   43a6a:	83 f8 2f             	cmp    $0x2f,%eax
   43a6d:	77 30                	ja     43a9f <printer_vprintf+0x3f8>
   43a6f:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43a76:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43a7a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43a81:	8b 00                	mov    (%rax),%eax
   43a83:	89 c0                	mov    %eax,%eax
   43a85:	48 01 d0             	add    %rdx,%rax
   43a88:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43a8f:	8b 12                	mov    (%rdx),%edx
   43a91:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43a94:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43a9b:	89 0a                	mov    %ecx,(%rdx)
   43a9d:	eb 1a                	jmp    43ab9 <printer_vprintf+0x412>
   43a9f:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43aa6:	48 8b 40 08          	mov    0x8(%rax),%rax
   43aaa:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43aae:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43ab5:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43ab9:	8b 00                	mov    (%rax),%eax
   43abb:	48 98                	cltq   
   43abd:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
   43ac1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   43ac5:	48 c1 f8 38          	sar    $0x38,%rax
   43ac9:	25 80 00 00 00       	and    $0x80,%eax
   43ace:	89 45 a4             	mov    %eax,-0x5c(%rbp)
            num = negative ? -x : x;
   43ad1:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
   43ad5:	74 09                	je     43ae0 <printer_vprintf+0x439>
   43ad7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   43adb:	48 f7 d8             	neg    %rax
   43ade:	eb 04                	jmp    43ae4 <printer_vprintf+0x43d>
   43ae0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   43ae4:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
   43ae8:	8b 45 a4             	mov    -0x5c(%rbp),%eax
   43aeb:	83 c8 60             	or     $0x60,%eax
   43aee:	09 45 ec             	or     %eax,-0x14(%rbp)
            break;
   43af1:	e9 cf 02 00 00       	jmp    43dc5 <printer_vprintf+0x71e>
        }
        case 'u':
        format_unsigned:
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   43af6:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   43afa:	74 5d                	je     43b59 <printer_vprintf+0x4b2>
   43afc:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43b03:	8b 00                	mov    (%rax),%eax
   43b05:	83 f8 2f             	cmp    $0x2f,%eax
   43b08:	77 30                	ja     43b3a <printer_vprintf+0x493>
   43b0a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43b11:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43b15:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43b1c:	8b 00                	mov    (%rax),%eax
   43b1e:	89 c0                	mov    %eax,%eax
   43b20:	48 01 d0             	add    %rdx,%rax
   43b23:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43b2a:	8b 12                	mov    (%rdx),%edx
   43b2c:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43b2f:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43b36:	89 0a                	mov    %ecx,(%rdx)
   43b38:	eb 1a                	jmp    43b54 <printer_vprintf+0x4ad>
   43b3a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43b41:	48 8b 40 08          	mov    0x8(%rax),%rax
   43b45:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43b49:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43b50:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43b54:	48 8b 00             	mov    (%rax),%rax
   43b57:	eb 5c                	jmp    43bb5 <printer_vprintf+0x50e>
   43b59:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43b60:	8b 00                	mov    (%rax),%eax
   43b62:	83 f8 2f             	cmp    $0x2f,%eax
   43b65:	77 30                	ja     43b97 <printer_vprintf+0x4f0>
   43b67:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43b6e:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43b72:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43b79:	8b 00                	mov    (%rax),%eax
   43b7b:	89 c0                	mov    %eax,%eax
   43b7d:	48 01 d0             	add    %rdx,%rax
   43b80:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43b87:	8b 12                	mov    (%rdx),%edx
   43b89:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43b8c:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43b93:	89 0a                	mov    %ecx,(%rdx)
   43b95:	eb 1a                	jmp    43bb1 <printer_vprintf+0x50a>
   43b97:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43b9e:	48 8b 40 08          	mov    0x8(%rax),%rax
   43ba2:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43ba6:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43bad:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43bb1:	8b 00                	mov    (%rax),%eax
   43bb3:	89 c0                	mov    %eax,%eax
   43bb5:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            flags |= FLAG_NUMERIC;
   43bb9:	83 4d ec 20          	orl    $0x20,-0x14(%rbp)
            break;
   43bbd:	e9 03 02 00 00       	jmp    43dc5 <printer_vprintf+0x71e>
        case 'x':
            base = -16;
   43bc2:	c7 45 e0 f0 ff ff ff 	movl   $0xfffffff0,-0x20(%rbp)
            goto format_unsigned;
   43bc9:	e9 28 ff ff ff       	jmp    43af6 <printer_vprintf+0x44f>
        case 'X':
            base = 16;
   43bce:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%rbp)
            goto format_unsigned;
   43bd5:	e9 1c ff ff ff       	jmp    43af6 <printer_vprintf+0x44f>
        case 'p':
            num = (uintptr_t) va_arg(val, void*);
   43bda:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43be1:	8b 00                	mov    (%rax),%eax
   43be3:	83 f8 2f             	cmp    $0x2f,%eax
   43be6:	77 30                	ja     43c18 <printer_vprintf+0x571>
   43be8:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43bef:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43bf3:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43bfa:	8b 00                	mov    (%rax),%eax
   43bfc:	89 c0                	mov    %eax,%eax
   43bfe:	48 01 d0             	add    %rdx,%rax
   43c01:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43c08:	8b 12                	mov    (%rdx),%edx
   43c0a:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43c0d:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43c14:	89 0a                	mov    %ecx,(%rdx)
   43c16:	eb 1a                	jmp    43c32 <printer_vprintf+0x58b>
   43c18:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43c1f:	48 8b 40 08          	mov    0x8(%rax),%rax
   43c23:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43c27:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43c2e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43c32:	48 8b 00             	mov    (%rax),%rax
   43c35:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            base = -16;
   43c39:	c7 45 e0 f0 ff ff ff 	movl   $0xfffffff0,-0x20(%rbp)
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
   43c40:	81 4d ec 21 01 00 00 	orl    $0x121,-0x14(%rbp)
            break;
   43c47:	e9 79 01 00 00       	jmp    43dc5 <printer_vprintf+0x71e>
        case 's':
            data = va_arg(val, char*);
   43c4c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43c53:	8b 00                	mov    (%rax),%eax
   43c55:	83 f8 2f             	cmp    $0x2f,%eax
   43c58:	77 30                	ja     43c8a <printer_vprintf+0x5e3>
   43c5a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43c61:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43c65:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43c6c:	8b 00                	mov    (%rax),%eax
   43c6e:	89 c0                	mov    %eax,%eax
   43c70:	48 01 d0             	add    %rdx,%rax
   43c73:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43c7a:	8b 12                	mov    (%rdx),%edx
   43c7c:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43c7f:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43c86:	89 0a                	mov    %ecx,(%rdx)
   43c88:	eb 1a                	jmp    43ca4 <printer_vprintf+0x5fd>
   43c8a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43c91:	48 8b 40 08          	mov    0x8(%rax),%rax
   43c95:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43c99:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43ca0:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43ca4:	48 8b 00             	mov    (%rax),%rax
   43ca7:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            break;
   43cab:	e9 15 01 00 00       	jmp    43dc5 <printer_vprintf+0x71e>
        case 'C':
            color = va_arg(val, int);
   43cb0:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43cb7:	8b 00                	mov    (%rax),%eax
   43cb9:	83 f8 2f             	cmp    $0x2f,%eax
   43cbc:	77 30                	ja     43cee <printer_vprintf+0x647>
   43cbe:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43cc5:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43cc9:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43cd0:	8b 00                	mov    (%rax),%eax
   43cd2:	89 c0                	mov    %eax,%eax
   43cd4:	48 01 d0             	add    %rdx,%rax
   43cd7:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43cde:	8b 12                	mov    (%rdx),%edx
   43ce0:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43ce3:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43cea:	89 0a                	mov    %ecx,(%rdx)
   43cec:	eb 1a                	jmp    43d08 <printer_vprintf+0x661>
   43cee:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43cf5:	48 8b 40 08          	mov    0x8(%rax),%rax
   43cf9:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43cfd:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43d04:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43d08:	8b 00                	mov    (%rax),%eax
   43d0a:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
            goto done;
   43d10:	e9 77 03 00 00       	jmp    4408c <printer_vprintf+0x9e5>
        case 'c':
            data = numbuf;
   43d15:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
   43d19:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            numbuf[0] = va_arg(val, int);
   43d1d:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43d24:	8b 00                	mov    (%rax),%eax
   43d26:	83 f8 2f             	cmp    $0x2f,%eax
   43d29:	77 30                	ja     43d5b <printer_vprintf+0x6b4>
   43d2b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43d32:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43d36:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43d3d:	8b 00                	mov    (%rax),%eax
   43d3f:	89 c0                	mov    %eax,%eax
   43d41:	48 01 d0             	add    %rdx,%rax
   43d44:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43d4b:	8b 12                	mov    (%rdx),%edx
   43d4d:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43d50:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43d57:	89 0a                	mov    %ecx,(%rdx)
   43d59:	eb 1a                	jmp    43d75 <printer_vprintf+0x6ce>
   43d5b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43d62:	48 8b 40 08          	mov    0x8(%rax),%rax
   43d66:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43d6a:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43d71:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43d75:	8b 00                	mov    (%rax),%eax
   43d77:	88 45 8c             	mov    %al,-0x74(%rbp)
            numbuf[1] = '\0';
   43d7a:	c6 45 8d 00          	movb   $0x0,-0x73(%rbp)
            break;
   43d7e:	eb 45                	jmp    43dc5 <printer_vprintf+0x71e>
        default:
            data = numbuf;
   43d80:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
   43d84:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            numbuf[0] = (*format ? *format : '%');
   43d88:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43d8f:	0f b6 00             	movzbl (%rax),%eax
   43d92:	84 c0                	test   %al,%al
   43d94:	74 0c                	je     43da2 <printer_vprintf+0x6fb>
   43d96:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43d9d:	0f b6 00             	movzbl (%rax),%eax
   43da0:	eb 05                	jmp    43da7 <printer_vprintf+0x700>
   43da2:	b8 25 00 00 00       	mov    $0x25,%eax
   43da7:	88 45 8c             	mov    %al,-0x74(%rbp)
            numbuf[1] = '\0';
   43daa:	c6 45 8d 00          	movb   $0x0,-0x73(%rbp)
            if (!*format) {
   43dae:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43db5:	0f b6 00             	movzbl (%rax),%eax
   43db8:	84 c0                	test   %al,%al
   43dba:	75 08                	jne    43dc4 <printer_vprintf+0x71d>
                format--;
   43dbc:	48 83 ad 68 ff ff ff 	subq   $0x1,-0x98(%rbp)
   43dc3:	01 
            }
            break;
   43dc4:	90                   	nop
        }

        if (flags & FLAG_NUMERIC) {
   43dc5:	8b 45 ec             	mov    -0x14(%rbp),%eax
   43dc8:	83 e0 20             	and    $0x20,%eax
   43dcb:	85 c0                	test   %eax,%eax
   43dcd:	74 1e                	je     43ded <printer_vprintf+0x746>
            data = fill_numbuf(numbuf + NUMBUFSIZ, num, base);
   43dcf:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
   43dd3:	48 83 c0 18          	add    $0x18,%rax
   43dd7:	8b 55 e0             	mov    -0x20(%rbp),%edx
   43dda:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
   43dde:	48 89 ce             	mov    %rcx,%rsi
   43de1:	48 89 c7             	mov    %rax,%rdi
   43de4:	e8 32 f8 ff ff       	call   4361b <fill_numbuf>
   43de9:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
        }

        const char* prefix = "";
   43ded:	48 8d 05 22 10 00 00 	lea    0x1022(%rip),%rax        # 44e16 <flag_chars+0x6>
   43df4:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
   43df8:	8b 45 ec             	mov    -0x14(%rbp),%eax
   43dfb:	83 e0 20             	and    $0x20,%eax
   43dfe:	85 c0                	test   %eax,%eax
   43e00:	74 51                	je     43e53 <printer_vprintf+0x7ac>
   43e02:	8b 45 ec             	mov    -0x14(%rbp),%eax
   43e05:	83 e0 40             	and    $0x40,%eax
   43e08:	85 c0                	test   %eax,%eax
   43e0a:	74 47                	je     43e53 <printer_vprintf+0x7ac>
            if (flags & FLAG_NEGATIVE) {
   43e0c:	8b 45 ec             	mov    -0x14(%rbp),%eax
   43e0f:	25 80 00 00 00       	and    $0x80,%eax
   43e14:	85 c0                	test   %eax,%eax
   43e16:	74 0d                	je     43e25 <printer_vprintf+0x77e>
                prefix = "-";
   43e18:	48 8d 05 f8 0f 00 00 	lea    0xff8(%rip),%rax        # 44e17 <flag_chars+0x7>
   43e1f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
   43e23:	eb 7d                	jmp    43ea2 <printer_vprintf+0x7fb>
            } else if (flags & FLAG_PLUSPOSITIVE) {
   43e25:	8b 45 ec             	mov    -0x14(%rbp),%eax
   43e28:	83 e0 10             	and    $0x10,%eax
   43e2b:	85 c0                	test   %eax,%eax
   43e2d:	74 0d                	je     43e3c <printer_vprintf+0x795>
                prefix = "+";
   43e2f:	48 8d 05 e3 0f 00 00 	lea    0xfe3(%rip),%rax        # 44e19 <flag_chars+0x9>
   43e36:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
   43e3a:	eb 66                	jmp    43ea2 <printer_vprintf+0x7fb>
            } else if (flags & FLAG_SPACEPOSITIVE) {
   43e3c:	8b 45 ec             	mov    -0x14(%rbp),%eax
   43e3f:	83 e0 08             	and    $0x8,%eax
   43e42:	85 c0                	test   %eax,%eax
   43e44:	74 5c                	je     43ea2 <printer_vprintf+0x7fb>
                prefix = " ";
   43e46:	48 8d 05 ce 0f 00 00 	lea    0xfce(%rip),%rax        # 44e1b <flag_chars+0xb>
   43e4d:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
   43e51:	eb 4f                	jmp    43ea2 <printer_vprintf+0x7fb>
            }
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   43e53:	8b 45 ec             	mov    -0x14(%rbp),%eax
   43e56:	83 e0 20             	and    $0x20,%eax
   43e59:	85 c0                	test   %eax,%eax
   43e5b:	74 46                	je     43ea3 <printer_vprintf+0x7fc>
   43e5d:	8b 45 ec             	mov    -0x14(%rbp),%eax
   43e60:	83 e0 01             	and    $0x1,%eax
   43e63:	85 c0                	test   %eax,%eax
   43e65:	74 3c                	je     43ea3 <printer_vprintf+0x7fc>
                   && (base == 16 || base == -16)
   43e67:	83 7d e0 10          	cmpl   $0x10,-0x20(%rbp)
   43e6b:	74 06                	je     43e73 <printer_vprintf+0x7cc>
   43e6d:	83 7d e0 f0          	cmpl   $0xfffffff0,-0x20(%rbp)
   43e71:	75 30                	jne    43ea3 <printer_vprintf+0x7fc>
                   && (num || (flags & FLAG_ALT2))) {
   43e73:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   43e78:	75 0c                	jne    43e86 <printer_vprintf+0x7df>
   43e7a:	8b 45 ec             	mov    -0x14(%rbp),%eax
   43e7d:	25 00 01 00 00       	and    $0x100,%eax
   43e82:	85 c0                	test   %eax,%eax
   43e84:	74 1d                	je     43ea3 <printer_vprintf+0x7fc>
            prefix = (base == -16 ? "0x" : "0X");
   43e86:	83 7d e0 f0          	cmpl   $0xfffffff0,-0x20(%rbp)
   43e8a:	75 09                	jne    43e95 <printer_vprintf+0x7ee>
   43e8c:	48 8d 05 8a 0f 00 00 	lea    0xf8a(%rip),%rax        # 44e1d <flag_chars+0xd>
   43e93:	eb 07                	jmp    43e9c <printer_vprintf+0x7f5>
   43e95:	48 8d 05 84 0f 00 00 	lea    0xf84(%rip),%rax        # 44e20 <flag_chars+0x10>
   43e9c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   43ea0:	eb 01                	jmp    43ea3 <printer_vprintf+0x7fc>
            if (flags & FLAG_NEGATIVE) {
   43ea2:	90                   	nop
        }

        int len;
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
   43ea3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
   43ea7:	78 24                	js     43ecd <printer_vprintf+0x826>
   43ea9:	8b 45 ec             	mov    -0x14(%rbp),%eax
   43eac:	83 e0 20             	and    $0x20,%eax
   43eaf:	85 c0                	test   %eax,%eax
   43eb1:	75 1a                	jne    43ecd <printer_vprintf+0x826>
            len = strnlen(data, precision);
   43eb3:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   43eb6:	48 63 d0             	movslq %eax,%rdx
   43eb9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   43ebd:	48 89 d6             	mov    %rdx,%rsi
   43ec0:	48 89 c7             	mov    %rax,%rdi
   43ec3:	e8 91 f5 ff ff       	call   43459 <strnlen>
   43ec8:	89 45 bc             	mov    %eax,-0x44(%rbp)
   43ecb:	eb 0f                	jmp    43edc <printer_vprintf+0x835>
        } else {
            len = strlen(data);
   43ecd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   43ed1:	48 89 c7             	mov    %rax,%rdi
   43ed4:	e8 4b f5 ff ff       	call   43424 <strlen>
   43ed9:	89 45 bc             	mov    %eax,-0x44(%rbp)
        }
        int zeros;
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
   43edc:	8b 45 ec             	mov    -0x14(%rbp),%eax
   43edf:	83 e0 20             	and    $0x20,%eax
   43ee2:	85 c0                	test   %eax,%eax
   43ee4:	74 20                	je     43f06 <printer_vprintf+0x85f>
   43ee6:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
   43eea:	78 1a                	js     43f06 <printer_vprintf+0x85f>
            zeros = precision > len ? precision - len : 0;
   43eec:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   43eef:	3b 45 bc             	cmp    -0x44(%rbp),%eax
   43ef2:	7e 08                	jle    43efc <printer_vprintf+0x855>
   43ef4:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   43ef7:	2b 45 bc             	sub    -0x44(%rbp),%eax
   43efa:	eb 05                	jmp    43f01 <printer_vprintf+0x85a>
   43efc:	b8 00 00 00 00       	mov    $0x0,%eax
   43f01:	89 45 b8             	mov    %eax,-0x48(%rbp)
   43f04:	eb 5c                	jmp    43f62 <printer_vprintf+0x8bb>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
   43f06:	8b 45 ec             	mov    -0x14(%rbp),%eax
   43f09:	83 e0 20             	and    $0x20,%eax
   43f0c:	85 c0                	test   %eax,%eax
   43f0e:	74 4b                	je     43f5b <printer_vprintf+0x8b4>
   43f10:	8b 45 ec             	mov    -0x14(%rbp),%eax
   43f13:	83 e0 02             	and    $0x2,%eax
   43f16:	85 c0                	test   %eax,%eax
   43f18:	74 41                	je     43f5b <printer_vprintf+0x8b4>
                   && !(flags & FLAG_LEFTJUSTIFY)
   43f1a:	8b 45 ec             	mov    -0x14(%rbp),%eax
   43f1d:	83 e0 04             	and    $0x4,%eax
   43f20:	85 c0                	test   %eax,%eax
   43f22:	75 37                	jne    43f5b <printer_vprintf+0x8b4>
                   && len + (int) strlen(prefix) < width) {
   43f24:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43f28:	48 89 c7             	mov    %rax,%rdi
   43f2b:	e8 f4 f4 ff ff       	call   43424 <strlen>
   43f30:	89 c2                	mov    %eax,%edx
   43f32:	8b 45 bc             	mov    -0x44(%rbp),%eax
   43f35:	01 d0                	add    %edx,%eax
   43f37:	39 45 e8             	cmp    %eax,-0x18(%rbp)
   43f3a:	7e 1f                	jle    43f5b <printer_vprintf+0x8b4>
            zeros = width - len - strlen(prefix);
   43f3c:	8b 45 e8             	mov    -0x18(%rbp),%eax
   43f3f:	2b 45 bc             	sub    -0x44(%rbp),%eax
   43f42:	89 c3                	mov    %eax,%ebx
   43f44:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43f48:	48 89 c7             	mov    %rax,%rdi
   43f4b:	e8 d4 f4 ff ff       	call   43424 <strlen>
   43f50:	89 c2                	mov    %eax,%edx
   43f52:	89 d8                	mov    %ebx,%eax
   43f54:	29 d0                	sub    %edx,%eax
   43f56:	89 45 b8             	mov    %eax,-0x48(%rbp)
   43f59:	eb 07                	jmp    43f62 <printer_vprintf+0x8bb>
        } else {
            zeros = 0;
   43f5b:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%rbp)
        }
        width -= len + zeros + strlen(prefix);
   43f62:	8b 55 bc             	mov    -0x44(%rbp),%edx
   43f65:	8b 45 b8             	mov    -0x48(%rbp),%eax
   43f68:	01 d0                	add    %edx,%eax
   43f6a:	48 63 d8             	movslq %eax,%rbx
   43f6d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43f71:	48 89 c7             	mov    %rax,%rdi
   43f74:	e8 ab f4 ff ff       	call   43424 <strlen>
   43f79:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
   43f7d:	8b 45 e8             	mov    -0x18(%rbp),%eax
   43f80:	29 d0                	sub    %edx,%eax
   43f82:	89 45 e8             	mov    %eax,-0x18(%rbp)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   43f85:	eb 25                	jmp    43fac <printer_vprintf+0x905>
            p->putc(p, ' ', color);
   43f87:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   43f8e:	48 8b 08             	mov    (%rax),%rcx
   43f91:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   43f97:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   43f9e:	be 20 00 00 00       	mov    $0x20,%esi
   43fa3:	48 89 c7             	mov    %rax,%rdi
   43fa6:	ff d1                	call   *%rcx
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   43fa8:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
   43fac:	8b 45 ec             	mov    -0x14(%rbp),%eax
   43faf:	83 e0 04             	and    $0x4,%eax
   43fb2:	85 c0                	test   %eax,%eax
   43fb4:	75 36                	jne    43fec <printer_vprintf+0x945>
   43fb6:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
   43fba:	7f cb                	jg     43f87 <printer_vprintf+0x8e0>
        }
        for (; *prefix; ++prefix) {
   43fbc:	eb 2e                	jmp    43fec <printer_vprintf+0x945>
            p->putc(p, *prefix, color);
   43fbe:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   43fc5:	4c 8b 00             	mov    (%rax),%r8
   43fc8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43fcc:	0f b6 00             	movzbl (%rax),%eax
   43fcf:	0f b6 c8             	movzbl %al,%ecx
   43fd2:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   43fd8:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   43fdf:	89 ce                	mov    %ecx,%esi
   43fe1:	48 89 c7             	mov    %rax,%rdi
   43fe4:	41 ff d0             	call   *%r8
        for (; *prefix; ++prefix) {
   43fe7:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
   43fec:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43ff0:	0f b6 00             	movzbl (%rax),%eax
   43ff3:	84 c0                	test   %al,%al
   43ff5:	75 c7                	jne    43fbe <printer_vprintf+0x917>
        }
        for (; zeros > 0; --zeros) {
   43ff7:	eb 25                	jmp    4401e <printer_vprintf+0x977>
            p->putc(p, '0', color);
   43ff9:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44000:	48 8b 08             	mov    (%rax),%rcx
   44003:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   44009:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44010:	be 30 00 00 00       	mov    $0x30,%esi
   44015:	48 89 c7             	mov    %rax,%rdi
   44018:	ff d1                	call   *%rcx
        for (; zeros > 0; --zeros) {
   4401a:	83 6d b8 01          	subl   $0x1,-0x48(%rbp)
   4401e:	83 7d b8 00          	cmpl   $0x0,-0x48(%rbp)
   44022:	7f d5                	jg     43ff9 <printer_vprintf+0x952>
        }
        for (; len > 0; ++data, --len) {
   44024:	eb 32                	jmp    44058 <printer_vprintf+0x9b1>
            p->putc(p, *data, color);
   44026:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   4402d:	4c 8b 00             	mov    (%rax),%r8
   44030:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   44034:	0f b6 00             	movzbl (%rax),%eax
   44037:	0f b6 c8             	movzbl %al,%ecx
   4403a:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   44040:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44047:	89 ce                	mov    %ecx,%esi
   44049:	48 89 c7             	mov    %rax,%rdi
   4404c:	41 ff d0             	call   *%r8
        for (; len > 0; ++data, --len) {
   4404f:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
   44054:	83 6d bc 01          	subl   $0x1,-0x44(%rbp)
   44058:	83 7d bc 00          	cmpl   $0x0,-0x44(%rbp)
   4405c:	7f c8                	jg     44026 <printer_vprintf+0x97f>
        }
        for (; width > 0; --width) {
   4405e:	eb 25                	jmp    44085 <printer_vprintf+0x9de>
            p->putc(p, ' ', color);
   44060:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44067:	48 8b 08             	mov    (%rax),%rcx
   4406a:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   44070:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44077:	be 20 00 00 00       	mov    $0x20,%esi
   4407c:	48 89 c7             	mov    %rax,%rdi
   4407f:	ff d1                	call   *%rcx
        for (; width > 0; --width) {
   44081:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
   44085:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
   44089:	7f d5                	jg     44060 <printer_vprintf+0x9b9>
        }
    done: ;
   4408b:	90                   	nop
    for (; *format; ++format) {
   4408c:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   44093:	01 
   44094:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   4409b:	0f b6 00             	movzbl (%rax),%eax
   4409e:	84 c0                	test   %al,%al
   440a0:	0f 85 31 f6 ff ff    	jne    436d7 <printer_vprintf+0x30>
    }
}
   440a6:	90                   	nop
   440a7:	90                   	nop
   440a8:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   440ac:	c9                   	leave  
   440ad:	c3                   	ret    

00000000000440ae <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
   440ae:	f3 0f 1e fa          	endbr64 
   440b2:	55                   	push   %rbp
   440b3:	48 89 e5             	mov    %rsp,%rbp
   440b6:	48 83 ec 20          	sub    $0x20,%rsp
   440ba:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   440be:	89 f0                	mov    %esi,%eax
   440c0:	89 55 e0             	mov    %edx,-0x20(%rbp)
   440c3:	88 45 e4             	mov    %al,-0x1c(%rbp)
    console_printer* cp = (console_printer*) p;
   440c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   440ca:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   440ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   440d2:	48 8b 40 08          	mov    0x8(%rax),%rax
   440d6:	48 8d 15 c3 4e 07 00 	lea    0x74ec3(%rip),%rdx        # b8fa0 <console+0xfa0>
   440dd:	48 39 d0             	cmp    %rdx,%rax
   440e0:	72 0f                	jb     440f1 <console_putc+0x43>
        cp->cursor = console;
   440e2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   440e6:	48 8d 15 13 3f 07 00 	lea    0x73f13(%rip),%rdx        # b8000 <console>
   440ed:	48 89 50 08          	mov    %rdx,0x8(%rax)
    }
    if (c == '\n') {
   440f1:	80 7d e4 0a          	cmpb   $0xa,-0x1c(%rbp)
   440f5:	0f 85 82 00 00 00    	jne    4417d <console_putc+0xcf>
        int pos = (cp->cursor - console) % 80;
   440fb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   440ff:	48 8b 40 08          	mov    0x8(%rax),%rax
   44103:	48 8d 15 f6 3e 07 00 	lea    0x73ef6(%rip),%rdx        # b8000 <console>
   4410a:	48 29 d0             	sub    %rdx,%rax
   4410d:	48 d1 f8             	sar    %rax
   44110:	48 89 c1             	mov    %rax,%rcx
   44113:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   4411a:	66 66 66 
   4411d:	48 89 c8             	mov    %rcx,%rax
   44120:	48 f7 ea             	imul   %rdx
   44123:	48 89 d0             	mov    %rdx,%rax
   44126:	48 c1 f8 05          	sar    $0x5,%rax
   4412a:	48 89 ce             	mov    %rcx,%rsi
   4412d:	48 c1 fe 3f          	sar    $0x3f,%rsi
   44131:	48 29 f0             	sub    %rsi,%rax
   44134:	48 89 c2             	mov    %rax,%rdx
   44137:	48 89 d0             	mov    %rdx,%rax
   4413a:	48 c1 e0 02          	shl    $0x2,%rax
   4413e:	48 01 d0             	add    %rdx,%rax
   44141:	48 c1 e0 04          	shl    $0x4,%rax
   44145:	48 29 c1             	sub    %rax,%rcx
   44148:	48 89 ca             	mov    %rcx,%rdx
   4414b:	89 55 fc             	mov    %edx,-0x4(%rbp)
        for (; pos != 80; pos++) {
   4414e:	eb 25                	jmp    44175 <console_putc+0xc7>
            *cp->cursor++ = ' ' | color;
   44150:	8b 45 e0             	mov    -0x20(%rbp),%eax
   44153:	83 c8 20             	or     $0x20,%eax
   44156:	89 c6                	mov    %eax,%esi
   44158:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4415c:	48 8b 40 08          	mov    0x8(%rax),%rax
   44160:	48 8d 48 02          	lea    0x2(%rax),%rcx
   44164:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   44168:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   4416c:	89 f2                	mov    %esi,%edx
   4416e:	66 89 10             	mov    %dx,(%rax)
        for (; pos != 80; pos++) {
   44171:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   44175:	83 7d fc 50          	cmpl   $0x50,-0x4(%rbp)
   44179:	75 d5                	jne    44150 <console_putc+0xa2>
        }
    } else {
        *cp->cursor++ = c | color;
    }
}
   4417b:	eb 24                	jmp    441a1 <console_putc+0xf3>
        *cp->cursor++ = c | color;
   4417d:	0f b6 55 e4          	movzbl -0x1c(%rbp),%edx
   44181:	8b 45 e0             	mov    -0x20(%rbp),%eax
   44184:	89 d6                	mov    %edx,%esi
   44186:	09 c6                	or     %eax,%esi
   44188:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4418c:	48 8b 40 08          	mov    0x8(%rax),%rax
   44190:	48 8d 48 02          	lea    0x2(%rax),%rcx
   44194:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   44198:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   4419c:	89 f2                	mov    %esi,%edx
   4419e:	66 89 10             	mov    %dx,(%rax)
}
   441a1:	90                   	nop
   441a2:	c9                   	leave  
   441a3:	c3                   	ret    

00000000000441a4 <console_vprintf>:

int console_vprintf(int cpos, int color, const char* format, va_list val) {
   441a4:	f3 0f 1e fa          	endbr64 
   441a8:	55                   	push   %rbp
   441a9:	48 89 e5             	mov    %rsp,%rbp
   441ac:	48 83 ec 30          	sub    $0x30,%rsp
   441b0:	89 7d ec             	mov    %edi,-0x14(%rbp)
   441b3:	89 75 e8             	mov    %esi,-0x18(%rbp)
   441b6:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   441ba:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    struct console_printer cp;
    cp.p.putc = console_putc;
   441be:	48 8d 05 e9 fe ff ff 	lea    -0x117(%rip),%rax        # 440ae <console_putc>
   441c5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (cpos < 0 || cpos >= CONSOLE_ROWS * CONSOLE_COLUMNS) {
   441c9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
   441cd:	78 09                	js     441d8 <console_vprintf+0x34>
   441cf:	81 7d ec cf 07 00 00 	cmpl   $0x7cf,-0x14(%rbp)
   441d6:	7e 07                	jle    441df <console_vprintf+0x3b>
        cpos = 0;
   441d8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    }
    cp.cursor = console + cpos;
   441df:	8b 45 ec             	mov    -0x14(%rbp),%eax
   441e2:	48 98                	cltq   
   441e4:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   441e8:	48 8d 05 11 3e 07 00 	lea    0x73e11(%rip),%rax        # b8000 <console>
   441ef:	48 01 d0             	add    %rdx,%rax
   441f2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&cp.p, color, format, val);
   441f6:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
   441fa:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   441fe:	8b 75 e8             	mov    -0x18(%rbp),%esi
   44201:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
   44205:	48 89 c7             	mov    %rax,%rdi
   44208:	e8 9a f4 ff ff       	call   436a7 <printer_vprintf>
    return cp.cursor - console;
   4420d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44211:	48 8d 15 e8 3d 07 00 	lea    0x73de8(%rip),%rdx        # b8000 <console>
   44218:	48 29 d0             	sub    %rdx,%rax
   4421b:	48 d1 f8             	sar    %rax
}
   4421e:	c9                   	leave  
   4421f:	c3                   	ret    

0000000000044220 <console_printf>:

int console_printf(int cpos, int color, const char* format, ...) {
   44220:	f3 0f 1e fa          	endbr64 
   44224:	55                   	push   %rbp
   44225:	48 89 e5             	mov    %rsp,%rbp
   44228:	48 83 ec 60          	sub    $0x60,%rsp
   4422c:	89 7d ac             	mov    %edi,-0x54(%rbp)
   4422f:	89 75 a8             	mov    %esi,-0x58(%rbp)
   44232:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   44236:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   4423a:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   4423e:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   44242:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   44249:	48 8d 45 10          	lea    0x10(%rbp),%rax
   4424d:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   44251:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   44255:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
   44259:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   4425d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   44261:	8b 75 a8             	mov    -0x58(%rbp),%esi
   44264:	8b 45 ac             	mov    -0x54(%rbp),%eax
   44267:	89 c7                	mov    %eax,%edi
   44269:	e8 36 ff ff ff       	call   441a4 <console_vprintf>
   4426e:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   44271:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   44274:	c9                   	leave  
   44275:	c3                   	ret    

0000000000044276 <string_putc>:
    printer p;
    char* s;
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
   44276:	f3 0f 1e fa          	endbr64 
   4427a:	55                   	push   %rbp
   4427b:	48 89 e5             	mov    %rsp,%rbp
   4427e:	48 83 ec 20          	sub    $0x20,%rsp
   44282:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   44286:	89 f0                	mov    %esi,%eax
   44288:	89 55 e0             	mov    %edx,-0x20(%rbp)
   4428b:	88 45 e4             	mov    %al,-0x1c(%rbp)
    string_printer* sp = (string_printer*) p;
   4428e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44292:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (sp->s < sp->end) {
   44296:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4429a:	48 8b 50 08          	mov    0x8(%rax),%rdx
   4429e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   442a2:	48 8b 40 10          	mov    0x10(%rax),%rax
   442a6:	48 39 c2             	cmp    %rax,%rdx
   442a9:	73 1a                	jae    442c5 <string_putc+0x4f>
        *sp->s++ = c;
   442ab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   442af:	48 8b 40 08          	mov    0x8(%rax),%rax
   442b3:	48 8d 48 01          	lea    0x1(%rax),%rcx
   442b7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   442bb:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   442bf:	0f b6 55 e4          	movzbl -0x1c(%rbp),%edx
   442c3:	88 10                	mov    %dl,(%rax)
    }
    (void) color;
}
   442c5:	90                   	nop
   442c6:	c9                   	leave  
   442c7:	c3                   	ret    

00000000000442c8 <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
   442c8:	f3 0f 1e fa          	endbr64 
   442cc:	55                   	push   %rbp
   442cd:	48 89 e5             	mov    %rsp,%rbp
   442d0:	48 83 ec 40          	sub    $0x40,%rsp
   442d4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   442d8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   442dc:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   442e0:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    string_printer sp;
    sp.p.putc = string_putc;
   442e4:	48 8d 05 8b ff ff ff 	lea    -0x75(%rip),%rax        # 44276 <string_putc>
   442eb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    sp.s = s;
   442ef:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   442f3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (size) {
   442f7:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
   442fc:	74 33                	je     44331 <vsnprintf+0x69>
        sp.end = s + size - 1;
   442fe:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   44302:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
   44306:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4430a:	48 01 d0             	add    %rdx,%rax
   4430d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
   44311:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   44315:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   44319:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   4431d:	be 00 00 00 00       	mov    $0x0,%esi
   44322:	48 89 c7             	mov    %rax,%rdi
   44325:	e8 7d f3 ff ff       	call   436a7 <printer_vprintf>
        *sp.s = 0;
   4432a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4432e:	c6 00 00             	movb   $0x0,(%rax)
    }
    return sp.s - s;
   44331:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44335:	48 2b 45 d8          	sub    -0x28(%rbp),%rax
}
   44339:	c9                   	leave  
   4433a:	c3                   	ret    

000000000004433b <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
   4433b:	f3 0f 1e fa          	endbr64 
   4433f:	55                   	push   %rbp
   44340:	48 89 e5             	mov    %rsp,%rbp
   44343:	48 83 ec 70          	sub    $0x70,%rsp
   44347:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   4434b:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
   4434f:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
   44353:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   44357:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   4435b:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   4435f:	c7 45 b0 18 00 00 00 	movl   $0x18,-0x50(%rbp)
   44366:	48 8d 45 10          	lea    0x10(%rbp),%rax
   4436a:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   4436e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   44372:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    int n = vsnprintf(s, size, format, val);
   44376:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   4437a:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
   4437e:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
   44382:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   44386:	48 89 c7             	mov    %rax,%rdi
   44389:	e8 3a ff ff ff       	call   442c8 <vsnprintf>
   4438e:	89 45 cc             	mov    %eax,-0x34(%rbp)
    va_end(val);
    return n;
   44391:	8b 45 cc             	mov    -0x34(%rbp),%eax
}
   44394:	c9                   	leave  
   44395:	c3                   	ret    

0000000000044396 <console_clear>:


// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
   44396:	f3 0f 1e fa          	endbr64 
   4439a:	55                   	push   %rbp
   4439b:	48 89 e5             	mov    %rsp,%rbp
   4439e:	48 83 ec 10          	sub    $0x10,%rsp
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   443a2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   443a9:	eb 1a                	jmp    443c5 <console_clear+0x2f>
        console[i] = ' ' | 0x0700;
   443ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
   443ae:	48 98                	cltq   
   443b0:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   443b4:	48 8d 05 45 3c 07 00 	lea    0x73c45(%rip),%rax        # b8000 <console>
   443bb:	66 c7 04 02 20 07    	movw   $0x720,(%rdx,%rax,1)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   443c1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   443c5:	81 7d fc cf 07 00 00 	cmpl   $0x7cf,-0x4(%rbp)
   443cc:	7e dd                	jle    443ab <console_clear+0x15>
    }
    cursorpos = 0;
   443ce:	c7 05 24 4c 07 00 00 	movl   $0x0,0x74c24(%rip)        # b8ffc <cursorpos>
   443d5:	00 00 00 
}
   443d8:	90                   	nop
   443d9:	c9                   	leave  
   443da:	c3                   	ret    
