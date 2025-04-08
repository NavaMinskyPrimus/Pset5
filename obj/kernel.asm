
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
   400be:	e8 32 0b 00 00       	call   40bf5 <exception>

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
   40177:	e8 70 21 00 00       	call   422ec <hardware_init>
    pageinfo_init();
   4017c:	e8 70 16 00 00       	call   417f1 <pageinfo_init>
    console_clear();
   40181:	e8 ed 4e 00 00       	call   45073 <console_clear>
    timer_init(HZ);
   40186:	bf 64 00 00 00       	mov    $0x64,%edi
   4018b:	e8 c4 26 00 00       	call   42854 <timer_init>

    // Set up process descriptors
    memset(processes, 0, sizeof(processes));
   40190:	ba 00 0e 00 00       	mov    $0xe00,%edx
   40195:	be 00 00 00 00       	mov    $0x0,%esi
   4019a:	48 8d 05 7f 1e 01 00 	lea    0x11e7f(%rip),%rax        # 52020 <processes>
   401a1:	48 89 c7             	mov    %rax,%rdi
   401a4:	e8 15 3f 00 00       	call   440be <memset>
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
   401c9:	48 8d 15 50 1e 01 00 	lea    0x11e50(%rip),%rdx        # 52020 <processes>
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
   401ed:	48 8d 05 f4 1e 01 00 	lea    0x11ef4(%rip),%rax        # 520e8 <processes+0xc8>
   401f4:	c7 04 02 00 00 00 00 	movl   $0x0,(%rdx,%rax,1)
    for (pid_t i = 0; i < NPROC; i++)
   401fb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   401ff:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   40203:	7e ad                	jle    401b2 <kernel+0x4b>
    }
    // Not sure if the second thing is right, the physical address.
    virtual_memory_map(kernel_pagetable, (uintptr_t)0, (uintptr_t)0, PROC_START_ADDR, PTE_P | PTE_W);
   40205:	48 8b 05 f4 4d 01 00 	mov    0x14df4(%rip),%rax        # 55000 <kernel_pagetable>
   4020c:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   40212:	b9 00 00 10 00       	mov    $0x100000,%ecx
   40217:	ba 00 00 00 00       	mov    $0x0,%edx
   4021c:	be 00 00 00 00       	mov    $0x0,%esi
   40221:	48 89 c7             	mov    %rax,%rdi
   40224:	e8 98 34 00 00       	call   436c1 <virtual_memory_map>
    virtual_memory_map(kernel_pagetable, (uintptr_t)CONSOLE_ADDR, (uintptr_t)CONSOLE_ADDR, PAGESIZE, PTE_P | PTE_W | PTE_U);
   40229:	48 8d 15 d0 7d 07 00 	lea    0x77dd0(%rip),%rdx        # b8000 <console>
   40230:	48 8d 35 c9 7d 07 00 	lea    0x77dc9(%rip),%rsi        # b8000 <console>
   40237:	48 8b 05 c2 4d 01 00 	mov    0x14dc2(%rip),%rax        # 55000 <kernel_pagetable>
   4023e:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40244:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40249:	48 89 c7             	mov    %rax,%rdi
   4024c:	e8 70 34 00 00       	call   436c1 <virtual_memory_map>
    if (command && strcmp(command, "fork") == 0)
   40251:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40256:	74 2e                	je     40286 <kernel+0x11f>
   40258:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4025c:	48 8d 15 5d 4e 00 00 	lea    0x4e5d(%rip),%rdx        # 450c0 <console_clear+0x4d>
   40263:	48 89 d6             	mov    %rdx,%rsi
   40266:	48 89 c7             	mov    %rax,%rdi
   40269:	e8 59 3f 00 00       	call   441c7 <strcmp>
   4026e:	85 c0                	test   %eax,%eax
   40270:	75 14                	jne    40286 <kernel+0x11f>
    {
        process_setup(1, 4);
   40272:	be 04 00 00 00       	mov    $0x4,%esi
   40277:	bf 01 00 00 00       	mov    $0x1,%edi
   4027c:	e8 ec 01 00 00       	call   4046d <process_setup>
   40281:	e9 d1 00 00 00       	jmp    40357 <kernel+0x1f0>
    }
    else if (command && strcmp(command, "forkexit") == 0)
   40286:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   4028b:	74 2e                	je     402bb <kernel+0x154>
   4028d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40291:	48 8d 15 2d 4e 00 00 	lea    0x4e2d(%rip),%rdx        # 450c5 <console_clear+0x52>
   40298:	48 89 d6             	mov    %rdx,%rsi
   4029b:	48 89 c7             	mov    %rax,%rdi
   4029e:	e8 24 3f 00 00       	call   441c7 <strcmp>
   402a3:	85 c0                	test   %eax,%eax
   402a5:	75 14                	jne    402bb <kernel+0x154>
    {
        process_setup(1, 5);
   402a7:	be 05 00 00 00       	mov    $0x5,%esi
   402ac:	bf 01 00 00 00       	mov    $0x1,%edi
   402b1:	e8 b7 01 00 00       	call   4046d <process_setup>
   402b6:	e9 9c 00 00 00       	jmp    40357 <kernel+0x1f0>
    }
    else if (command && strcmp(command, "test") == 0)
   402bb:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402c0:	74 2b                	je     402ed <kernel+0x186>
   402c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402c6:	48 8d 15 01 4e 00 00 	lea    0x4e01(%rip),%rdx        # 450ce <console_clear+0x5b>
   402cd:	48 89 d6             	mov    %rdx,%rsi
   402d0:	48 89 c7             	mov    %rax,%rdi
   402d3:	e8 ef 3e 00 00       	call   441c7 <strcmp>
   402d8:	85 c0                	test   %eax,%eax
   402da:	75 11                	jne    402ed <kernel+0x186>
    {
        process_setup(1, 6);
   402dc:	be 06 00 00 00       	mov    $0x6,%esi
   402e1:	bf 01 00 00 00       	mov    $0x1,%edi
   402e6:	e8 82 01 00 00       	call   4046d <process_setup>
   402eb:	eb 6a                	jmp    40357 <kernel+0x1f0>
    }
    else if (command && strcmp(command, "test2") == 0)
   402ed:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402f2:	74 3e                	je     40332 <kernel+0x1cb>
   402f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402f8:	48 8d 15 d4 4d 00 00 	lea    0x4dd4(%rip),%rdx        # 450d3 <console_clear+0x60>
   402ff:	48 89 d6             	mov    %rdx,%rsi
   40302:	48 89 c7             	mov    %rax,%rdi
   40305:	e8 bd 3e 00 00       	call   441c7 <strcmp>
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
   40321:	e8 47 01 00 00       	call   4046d <process_setup>
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
   40348:	e8 20 01 00 00       	call   4046d <process_setup>
        for (pid_t i = 1; i <= 4; ++i)
   4034d:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   40351:	83 7d f4 04          	cmpl   $0x4,-0xc(%rbp)
   40355:	7e e4                	jle    4033b <kernel+0x1d4>
        }
    }

    // Switch to the first process using run()
    run(&processes[1]);
   40357:	48 8d 05 a2 1d 01 00 	lea    0x11da2(%rip),%rax        # 52100 <processes+0xe0>
   4035e:	48 89 c7             	mov    %rax,%rdi
   40361:	e8 20 14 00 00       	call   41786 <run>

0000000000040366 <find_free_page>:
}

int find_free_page()
{
   40366:	f3 0f 1e fa          	endbr64 
   4036a:	55                   	push   %rbp
   4036b:	48 89 e5             	mov    %rsp,%rbp
   4036e:	48 83 ec 10          	sub    $0x10,%rsp
    for (int i = 0; i < PAGENUMBER(MEMSIZE_PHYSICAL); i++)
   40372:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   40379:	eb 21                	jmp    4039c <find_free_page+0x36>
    {
        if (pageinfo[i].refcount == 0)
   4037b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4037e:	48 98                	cltq   
   40380:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40384:	48 8d 05 b6 2a 01 00 	lea    0x12ab6(%rip),%rax        # 52e41 <pageinfo+0x1>
   4038b:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4038f:	84 c0                	test   %al,%al
   40391:	75 05                	jne    40398 <find_free_page+0x32>
        {
            return i;
   40393:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40396:	eb 12                	jmp    403aa <find_free_page+0x44>
    for (int i = 0; i < PAGENUMBER(MEMSIZE_PHYSICAL); i++)
   40398:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4039c:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   403a3:	7e d6                	jle    4037b <find_free_page+0x15>
        }
    }
    return -1;
   403a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   403aa:	c9                   	leave  
   403ab:	c3                   	ret    

00000000000403ac <numtopagetable>:

x86_64_pagetable *numtopagetable(int pn, int8_t owner)
{
   403ac:	f3 0f 1e fa          	endbr64 
   403b0:	55                   	push   %rbp
   403b1:	48 89 e5             	mov    %rsp,%rbp
   403b4:	48 83 ec 08          	sub    $0x8,%rsp
   403b8:	89 7d fc             	mov    %edi,-0x4(%rbp)
   403bb:	89 f0                	mov    %esi,%eax
   403bd:	88 45 f8             	mov    %al,-0x8(%rbp)
    if (pn == -1)
   403c0:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%rbp)
   403c4:	75 07                	jne    403cd <numtopagetable+0x21>
    {
        return NULL;
   403c6:	b8 00 00 00 00       	mov    $0x0,%eax
   403cb:	eb 4c                	jmp    40419 <numtopagetable+0x6d>
    }
    pageinfo[pn].refcount += 1;
   403cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
   403d0:	48 98                	cltq   
   403d2:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   403d6:	48 8d 05 64 2a 01 00 	lea    0x12a64(%rip),%rax        # 52e41 <pageinfo+0x1>
   403dd:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   403e1:	83 c0 01             	add    $0x1,%eax
   403e4:	89 c1                	mov    %eax,%ecx
   403e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
   403e9:	48 98                	cltq   
   403eb:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   403ef:	48 8d 05 4b 2a 01 00 	lea    0x12a4b(%rip),%rax        # 52e41 <pageinfo+0x1>
   403f6:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
    pageinfo[pn].owner = owner;
   403f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
   403fc:	48 98                	cltq   
   403fe:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   40402:	48 8d 15 37 2a 01 00 	lea    0x12a37(%rip),%rdx        # 52e40 <pageinfo>
   40409:	0f b6 45 f8          	movzbl -0x8(%rbp),%eax
   4040d:	88 04 11             	mov    %al,(%rcx,%rdx,1)
    return (x86_64_pagetable *)PAGEADDRESS(pn);
   40410:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40413:	48 98                	cltq   
   40415:	48 c1 e0 0c          	shl    $0xc,%rax
}
   40419:	c9                   	leave  
   4041a:	c3                   	ret    

000000000004041b <freepage>:

void freepage(int pn)
{
   4041b:	f3 0f 1e fa          	endbr64 
   4041f:	55                   	push   %rbp
   40420:	48 89 e5             	mov    %rsp,%rbp
   40423:	48 83 ec 08          	sub    $0x8,%rsp
   40427:	89 7d fc             	mov    %edi,-0x4(%rbp)
    pageinfo[pn].refcount -= 1;
   4042a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4042d:	48 98                	cltq   
   4042f:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40433:	48 8d 05 07 2a 01 00 	lea    0x12a07(%rip),%rax        # 52e41 <pageinfo+0x1>
   4043a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4043e:	83 e8 01             	sub    $0x1,%eax
   40441:	89 c1                	mov    %eax,%ecx
   40443:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40446:	48 98                	cltq   
   40448:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4044c:	48 8d 05 ee 29 01 00 	lea    0x129ee(%rip),%rax        # 52e41 <pageinfo+0x1>
   40453:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
    pageinfo[pn].owner = PO_FREE;
   40456:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40459:	48 98                	cltq   
   4045b:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4045f:	48 8d 05 da 29 01 00 	lea    0x129da(%rip),%rax        # 52e40 <pageinfo>
   40466:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
}
   4046a:	90                   	nop
   4046b:	c9                   	leave  
   4046c:	c3                   	ret    

000000000004046d <process_setup>:
//    Load application program `program_number` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

void process_setup(pid_t pid, int program_number)
{
   4046d:	f3 0f 1e fa          	endbr64 
   40471:	55                   	push   %rbp
   40472:	48 89 e5             	mov    %rsp,%rbp
   40475:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
   4047c:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
   40482:	89 b5 68 ff ff ff    	mov    %esi,-0x98(%rbp)
    process_init(&processes[pid], 0);
   40488:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   4048e:	48 63 d0             	movslq %eax,%rdx
   40491:	48 89 d0             	mov    %rdx,%rax
   40494:	48 c1 e0 03          	shl    $0x3,%rax
   40498:	48 29 d0             	sub    %rdx,%rax
   4049b:	48 c1 e0 05          	shl    $0x5,%rax
   4049f:	48 8d 15 7a 1b 01 00 	lea    0x11b7a(%rip),%rdx        # 52020 <processes>
   404a6:	48 01 d0             	add    %rdx,%rax
   404a9:	be 00 00 00 00       	mov    $0x0,%esi
   404ae:	48 89 c7             	mov    %rax,%rdi
   404b1:	e8 51 26 00 00       	call   42b07 <process_init>

    int pt4num = find_free_page();
   404b6:	b8 00 00 00 00       	mov    $0x0,%eax
   404bb:	e8 a6 fe ff ff       	call   40366 <find_free_page>
   404c0:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (pt4num == -1)
   404c3:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   404c7:	75 14                	jne    404dd <process_setup+0x70>
    {
        panic("No more physical pages\n");
   404c9:	48 8d 05 09 4c 00 00 	lea    0x4c09(%rip),%rax        # 450d9 <console_clear+0x66>
   404d0:	48 89 c7             	mov    %rax,%rdi
   404d3:	b8 00 00 00 00       	mov    $0x0,%eax
   404d8:	e8 70 2d 00 00       	call   4324d <panic>
        return;
    }
    x86_64_pagetable *pt_L4 = numtopagetable(pt4num, pid);
   404dd:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   404e3:	0f be d0             	movsbl %al,%edx
   404e6:	8b 45 f0             	mov    -0x10(%rbp),%eax
   404e9:	89 d6                	mov    %edx,%esi
   404eb:	89 c7                	mov    %eax,%edi
   404ed:	e8 ba fe ff ff       	call   403ac <numtopagetable>
   404f2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    int pt3num = find_free_page();
   404f6:	b8 00 00 00 00       	mov    $0x0,%eax
   404fb:	e8 66 fe ff ff       	call   40366 <find_free_page>
   40500:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (pt3num == -1)
   40503:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   40507:	75 1e                	jne    40527 <process_setup+0xba>
    {
        freepage(pt4num);
   40509:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4050c:	89 c7                	mov    %eax,%edi
   4050e:	e8 08 ff ff ff       	call   4041b <freepage>
        panic("No more physical pages\n");
   40513:	48 8d 05 bf 4b 00 00 	lea    0x4bbf(%rip),%rax        # 450d9 <console_clear+0x66>
   4051a:	48 89 c7             	mov    %rax,%rdi
   4051d:	b8 00 00 00 00       	mov    $0x0,%eax
   40522:	e8 26 2d 00 00       	call   4324d <panic>
        return;
    }
    x86_64_pagetable *pt_L3 = numtopagetable(pt3num, pid);
   40527:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   4052d:	0f be d0             	movsbl %al,%edx
   40530:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40533:	89 d6                	mov    %edx,%esi
   40535:	89 c7                	mov    %eax,%edi
   40537:	e8 70 fe ff ff       	call   403ac <numtopagetable>
   4053c:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    int pt2num = find_free_page();
   40540:	b8 00 00 00 00       	mov    $0x0,%eax
   40545:	e8 1c fe ff ff       	call   40366 <find_free_page>
   4054a:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    if (pt2num == -1)
   4054d:	83 7d d4 ff          	cmpl   $0xffffffff,-0x2c(%rbp)
   40551:	75 28                	jne    4057b <process_setup+0x10e>
    {
        freepage(pt4num);
   40553:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40556:	89 c7                	mov    %eax,%edi
   40558:	e8 be fe ff ff       	call   4041b <freepage>
        freepage(pt3num);
   4055d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40560:	89 c7                	mov    %eax,%edi
   40562:	e8 b4 fe ff ff       	call   4041b <freepage>
        panic("No more physical pages\n");
   40567:	48 8d 05 6b 4b 00 00 	lea    0x4b6b(%rip),%rax        # 450d9 <console_clear+0x66>
   4056e:	48 89 c7             	mov    %rax,%rdi
   40571:	b8 00 00 00 00       	mov    $0x0,%eax
   40576:	e8 d2 2c 00 00       	call   4324d <panic>
        return;
    }
    x86_64_pagetable *pt_L2 = numtopagetable(pt2num, pid);
   4057b:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   40581:	0f be d0             	movsbl %al,%edx
   40584:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   40587:	89 d6                	mov    %edx,%esi
   40589:	89 c7                	mov    %eax,%edi
   4058b:	e8 1c fe ff ff       	call   403ac <numtopagetable>
   40590:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int pt1_0num = find_free_page();
   40594:	b8 00 00 00 00       	mov    $0x0,%eax
   40599:	e8 c8 fd ff ff       	call   40366 <find_free_page>
   4059e:	89 45 c4             	mov    %eax,-0x3c(%rbp)
    if (pt1_0num == -1)
   405a1:	83 7d c4 ff          	cmpl   $0xffffffff,-0x3c(%rbp)
   405a5:	75 32                	jne    405d9 <process_setup+0x16c>
    {
        freepage(pt4num);
   405a7:	8b 45 f0             	mov    -0x10(%rbp),%eax
   405aa:	89 c7                	mov    %eax,%edi
   405ac:	e8 6a fe ff ff       	call   4041b <freepage>
        freepage(pt3num);
   405b1:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   405b4:	89 c7                	mov    %eax,%edi
   405b6:	e8 60 fe ff ff       	call   4041b <freepage>
        freepage(pt2num);
   405bb:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   405be:	89 c7                	mov    %eax,%edi
   405c0:	e8 56 fe ff ff       	call   4041b <freepage>

        panic("No more physical pages\n");
   405c5:	48 8d 05 0d 4b 00 00 	lea    0x4b0d(%rip),%rax        # 450d9 <console_clear+0x66>
   405cc:	48 89 c7             	mov    %rax,%rdi
   405cf:	b8 00 00 00 00       	mov    $0x0,%eax
   405d4:	e8 74 2c 00 00       	call   4324d <panic>
        return;
    }
    x86_64_pagetable *pt_L1_0 = numtopagetable(pt1_0num, pid);
   405d9:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   405df:	0f be d0             	movsbl %al,%edx
   405e2:	8b 45 c4             	mov    -0x3c(%rbp),%eax
   405e5:	89 d6                	mov    %edx,%esi
   405e7:	89 c7                	mov    %eax,%edi
   405e9:	e8 be fd ff ff       	call   403ac <numtopagetable>
   405ee:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    int pt1_1num = find_free_page();
   405f2:	b8 00 00 00 00       	mov    $0x0,%eax
   405f7:	e8 6a fd ff ff       	call   40366 <find_free_page>
   405fc:	89 45 b4             	mov    %eax,-0x4c(%rbp)
    if (pt1_1num == -1)
   405ff:	83 7d b4 ff          	cmpl   $0xffffffff,-0x4c(%rbp)
   40603:	75 3c                	jne    40641 <process_setup+0x1d4>
    {
        freepage(pt4num);
   40605:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40608:	89 c7                	mov    %eax,%edi
   4060a:	e8 0c fe ff ff       	call   4041b <freepage>
        freepage(pt3num);
   4060f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40612:	89 c7                	mov    %eax,%edi
   40614:	e8 02 fe ff ff       	call   4041b <freepage>
        freepage(pt2num);
   40619:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   4061c:	89 c7                	mov    %eax,%edi
   4061e:	e8 f8 fd ff ff       	call   4041b <freepage>
        freepage(pt1_0num);
   40623:	8b 45 c4             	mov    -0x3c(%rbp),%eax
   40626:	89 c7                	mov    %eax,%edi
   40628:	e8 ee fd ff ff       	call   4041b <freepage>
        panic("No more physical pages\n");
   4062d:	48 8d 05 a5 4a 00 00 	lea    0x4aa5(%rip),%rax        # 450d9 <console_clear+0x66>
   40634:	48 89 c7             	mov    %rax,%rdi
   40637:	b8 00 00 00 00       	mov    $0x0,%eax
   4063c:	e8 0c 2c 00 00       	call   4324d <panic>
        return;
    }
    x86_64_pagetable *pt_L1_1 = numtopagetable(pt1_1num, pid);
   40641:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   40647:	0f be d0             	movsbl %al,%edx
   4064a:	8b 45 b4             	mov    -0x4c(%rbp),%eax
   4064d:	89 d6                	mov    %edx,%esi
   4064f:	89 c7                	mov    %eax,%edi
   40651:	e8 56 fd ff ff       	call   403ac <numtopagetable>
   40656:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    // set the pages to zero
    memset(pt_L4, 0, PAGESIZE);
   4065a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4065e:	ba 00 10 00 00       	mov    $0x1000,%edx
   40663:	be 00 00 00 00       	mov    $0x0,%esi
   40668:	48 89 c7             	mov    %rax,%rdi
   4066b:	e8 4e 3a 00 00       	call   440be <memset>
    memset(pt_L3, 0, PAGESIZE);
   40670:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40674:	ba 00 10 00 00       	mov    $0x1000,%edx
   40679:	be 00 00 00 00       	mov    $0x0,%esi
   4067e:	48 89 c7             	mov    %rax,%rdi
   40681:	e8 38 3a 00 00       	call   440be <memset>
    memset(pt_L2, 0, PAGESIZE);
   40686:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4068a:	ba 00 10 00 00       	mov    $0x1000,%edx
   4068f:	be 00 00 00 00       	mov    $0x0,%esi
   40694:	48 89 c7             	mov    %rax,%rdi
   40697:	e8 22 3a 00 00       	call   440be <memset>
    memset(pt_L1_0, 0, PAGESIZE);
   4069c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   406a0:	ba 00 10 00 00       	mov    $0x1000,%edx
   406a5:	be 00 00 00 00       	mov    $0x0,%esi
   406aa:	48 89 c7             	mov    %rax,%rdi
   406ad:	e8 0c 3a 00 00       	call   440be <memset>
    memset(pt_L1_1, 0, PAGESIZE);
   406b2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   406b6:	ba 00 10 00 00       	mov    $0x1000,%edx
   406bb:	be 00 00 00 00       	mov    $0x0,%esi
   406c0:	48 89 c7             	mov    %rax,%rdi
   406c3:	e8 f6 39 00 00       	call   440be <memset>

    // Link the page tables together. Did I do this right?
    pt_L4->entry[0] = (x86_64_pageentry_t)pt_L3 | PTE_P | PTE_W | PTE_U;
   406c8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   406cc:	48 83 c8 07          	or     $0x7,%rax
   406d0:	48 89 c2             	mov    %rax,%rdx
   406d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   406d7:	48 89 10             	mov    %rdx,(%rax)
    pt_L3->entry[0] = (x86_64_pageentry_t)pt_L2 | PTE_P | PTE_W | PTE_U;
   406da:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   406de:	48 83 c8 07          	or     $0x7,%rax
   406e2:	48 89 c2             	mov    %rax,%rdx
   406e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   406e9:	48 89 10             	mov    %rdx,(%rax)
    pt_L2->entry[0] = (x86_64_pageentry_t)pt_L1_0 | PTE_P | PTE_W | PTE_U;
   406ec:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   406f0:	48 83 c8 07          	or     $0x7,%rax
   406f4:	48 89 c2             	mov    %rax,%rdx
   406f7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   406fb:	48 89 10             	mov    %rdx,(%rax)
    pt_L2->entry[1] = (x86_64_pageentry_t)pt_L1_1 | PTE_P | PTE_W | PTE_U;
   406fe:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   40702:	48 83 c8 07          	or     $0x7,%rax
   40706:	48 89 c2             	mov    %rax,%rdx
   40709:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4070d:	48 89 50 08          	mov    %rdx,0x8(%rax)

    // Copy kernel mappings (for addresses below PROC_START_ADDR)
    for (uintptr_t addr = 0; addr < PROC_START_ADDR; addr += PAGESIZE)
   40711:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   40718:	00 
   40719:	eb 6b                	jmp    40786 <process_setup+0x319>
    {                                                                   // we're gonna go page by page I think
        vamapping vmap = virtual_memory_lookup(kernel_pagetable, addr); // get the pagetable page of addr in the kernel
   4071b:	48 8b 0d de 48 01 00 	mov    0x148de(%rip),%rcx        # 55000 <kernel_pagetable>
   40722:	48 8d 85 78 ff ff ff 	lea    -0x88(%rbp),%rax
   40729:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4072d:	48 89 ce             	mov    %rcx,%rsi
   40730:	48 89 c7             	mov    %rax,%rdi
   40733:	e8 cd 33 00 00       	call   43b05 <virtual_memory_lookup>
        if (vmap.pn >= 0)
   40738:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
   4073e:	85 c0                	test   %eax,%eax
   40740:	78 3c                	js     4077e <process_setup+0x311>
        {
            // Copy the mapping, but ensure the console is user-accessible
            int perm = vmap.perm;
   40742:	8b 45 88             	mov    -0x78(%rbp),%eax
   40745:	89 45 f4             	mov    %eax,-0xc(%rbp)
            if (addr == CONSOLE_ADDR)
   40748:	48 8d 05 b1 78 07 00 	lea    0x778b1(%rip),%rax        # b8000 <console>
   4074f:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40753:	75 06                	jne    4075b <process_setup+0x2ee>
            {
                perm |= PTE_U; // Make console user-accessible
   40755:	83 4d f4 04          	orl    $0x4,-0xc(%rbp)
   40759:	eb 04                	jmp    4075f <process_setup+0x2f2>
            }
            else
            {
                perm &= ~PTE_U; // Make sure kernel memory is not user-accessible
   4075b:	83 65 f4 fb          	andl   $0xfffffffb,-0xc(%rbp)
            }
            virtual_memory_map(pt_L4, addr, vmap.pa, PAGESIZE, perm);
   4075f:	48 8b 55 80          	mov    -0x80(%rbp),%rdx
   40763:	8b 4d f4             	mov    -0xc(%rbp),%ecx
   40766:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   4076a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4076e:	41 89 c8             	mov    %ecx,%r8d
   40771:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40776:	48 89 c7             	mov    %rax,%rdi
   40779:	e8 43 2f 00 00       	call   436c1 <virtual_memory_map>
    for (uintptr_t addr = 0; addr < PROC_START_ADDR; addr += PAGESIZE)
   4077e:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40785:	00 
   40786:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   4078d:	00 
   4078e:	76 8b                	jbe    4071b <process_setup+0x2ae>
        }
    }

    processes[pid].p_pagetable = pt_L4;
   40790:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   40796:	48 63 d0             	movslq %eax,%rdx
   40799:	48 89 d0             	mov    %rdx,%rax
   4079c:	48 c1 e0 03          	shl    $0x3,%rax
   407a0:	48 29 d0             	sub    %rdx,%rax
   407a3:	48 c1 e0 05          	shl    $0x5,%rax
   407a7:	48 89 c1             	mov    %rax,%rcx
   407aa:	48 8d 15 3f 19 01 00 	lea    0x1193f(%rip),%rdx        # 520f0 <processes+0xd0>
   407b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   407b5:	48 89 04 11          	mov    %rax,(%rcx,%rdx,1)

    int r = program_load(&processes[pid], program_number, NULL);
   407b9:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   407bf:	48 63 d0             	movslq %eax,%rdx
   407c2:	48 89 d0             	mov    %rdx,%rax
   407c5:	48 c1 e0 03          	shl    $0x3,%rax
   407c9:	48 29 d0             	sub    %rdx,%rax
   407cc:	48 c1 e0 05          	shl    $0x5,%rax
   407d0:	48 8d 15 49 18 01 00 	lea    0x11849(%rip),%rdx        # 52020 <processes>
   407d7:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
   407db:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
   407e1:	ba 00 00 00 00       	mov    $0x0,%edx
   407e6:	89 c6                	mov    %eax,%esi
   407e8:	48 89 cf             	mov    %rcx,%rdi
   407eb:	e8 10 34 00 00       	call   43c00 <program_load>
   407f0:	89 45 a4             	mov    %eax,-0x5c(%rbp)
    assert(r >= 0);
   407f3:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
   407f7:	79 1e                	jns    40817 <process_setup+0x3aa>
   407f9:	48 8d 05 f1 48 00 00 	lea    0x48f1(%rip),%rax        # 450f1 <console_clear+0x7e>
   40800:	48 89 c2             	mov    %rax,%rdx
   40803:	be fa 00 00 00       	mov    $0xfa,%esi
   40808:	48 8d 05 e9 48 00 00 	lea    0x48e9(%rip),%rax        # 450f8 <console_clear+0x85>
   4080f:	48 89 c7             	mov    %rax,%rdi
   40812:	e8 26 2b 00 00       	call   4333d <assert_fail>

    processes[pid].p_registers.reg_rsp = MEMSIZE_VIRTUAL;
   40817:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   4081d:	48 63 d0             	movslq %eax,%rdx
   40820:	48 89 d0             	mov    %rdx,%rax
   40823:	48 c1 e0 03          	shl    $0x3,%rax
   40827:	48 29 d0             	sub    %rdx,%rax
   4082a:	48 c1 e0 05          	shl    $0x5,%rax
   4082e:	48 89 c2             	mov    %rax,%rdx
   40831:	48 8d 05 a0 18 01 00 	lea    0x118a0(%rip),%rax        # 520d8 <processes+0xb8>
   40838:	48 c7 04 02 00 00 30 	movq   $0x300000,(%rdx,%rax,1)
   4083f:	00 
    int physpage = find_free_page();
   40840:	b8 00 00 00 00       	mov    $0x0,%eax
   40845:	e8 1c fb ff ff       	call   40366 <find_free_page>
   4084a:	89 45 a0             	mov    %eax,-0x60(%rbp)
    if (physpage == -1)
   4084d:	83 7d a0 ff          	cmpl   $0xffffffff,-0x60(%rbp)
   40851:	75 46                	jne    40899 <process_setup+0x42c>
    {
        freepage(pt4num);
   40853:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40856:	89 c7                	mov    %eax,%edi
   40858:	e8 be fb ff ff       	call   4041b <freepage>
        freepage(pt3num);
   4085d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40860:	89 c7                	mov    %eax,%edi
   40862:	e8 b4 fb ff ff       	call   4041b <freepage>
        freepage(pt2num);
   40867:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   4086a:	89 c7                	mov    %eax,%edi
   4086c:	e8 aa fb ff ff       	call   4041b <freepage>
        freepage(pt1_0num);
   40871:	8b 45 c4             	mov    -0x3c(%rbp),%eax
   40874:	89 c7                	mov    %eax,%edi
   40876:	e8 a0 fb ff ff       	call   4041b <freepage>
        freepage(pt1_1num);
   4087b:	8b 45 b4             	mov    -0x4c(%rbp),%eax
   4087e:	89 c7                	mov    %eax,%edi
   40880:	e8 96 fb ff ff       	call   4041b <freepage>
        panic("No more physical pages\n");
   40885:	48 8d 05 4d 48 00 00 	lea    0x484d(%rip),%rax        # 450d9 <console_clear+0x66>
   4088c:	48 89 c7             	mov    %rax,%rdi
   4088f:	b8 00 00 00 00       	mov    $0x0,%eax
   40894:	e8 b4 29 00 00       	call   4324d <panic>
        return;
    }

    uintptr_t stack_page = processes[pid].p_registers.reg_rsp - PAGESIZE;
   40899:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   4089f:	48 63 d0             	movslq %eax,%rdx
   408a2:	48 89 d0             	mov    %rdx,%rax
   408a5:	48 c1 e0 03          	shl    $0x3,%rax
   408a9:	48 29 d0             	sub    %rdx,%rax
   408ac:	48 c1 e0 05          	shl    $0x5,%rax
   408b0:	48 89 c2             	mov    %rax,%rdx
   408b3:	48 8d 05 1e 18 01 00 	lea    0x1181e(%rip),%rax        # 520d8 <processes+0xb8>
   408ba:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   408be:	48 2d 00 10 00 00    	sub    $0x1000,%rax
   408c4:	48 89 45 98          	mov    %rax,-0x68(%rbp)
    int val = assign_physical_page(PAGEADDRESS(physpage), pid);
   408c8:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   408ce:	0f be c0             	movsbl %al,%eax
   408d1:	8b 55 a0             	mov    -0x60(%rbp),%edx
   408d4:	48 63 d2             	movslq %edx,%rdx
   408d7:	48 c1 e2 0c          	shl    $0xc,%rdx
   408db:	89 c6                	mov    %eax,%esi
   408dd:	48 89 d7             	mov    %rdx,%rdi
   408e0:	e8 c1 00 00 00       	call   409a6 <assign_physical_page>
   408e5:	89 45 94             	mov    %eax,-0x6c(%rbp)
    if (val == -1)
   408e8:	83 7d 94 ff          	cmpl   $0xffffffff,-0x6c(%rbp)
   408ec:	75 46                	jne    40934 <process_setup+0x4c7>
    {
        freepage(pt4num);
   408ee:	8b 45 f0             	mov    -0x10(%rbp),%eax
   408f1:	89 c7                	mov    %eax,%edi
   408f3:	e8 23 fb ff ff       	call   4041b <freepage>
        freepage(pt3num);
   408f8:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   408fb:	89 c7                	mov    %eax,%edi
   408fd:	e8 19 fb ff ff       	call   4041b <freepage>
        freepage(pt2num);
   40902:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   40905:	89 c7                	mov    %eax,%edi
   40907:	e8 0f fb ff ff       	call   4041b <freepage>
        freepage(pt1_0num);
   4090c:	8b 45 c4             	mov    -0x3c(%rbp),%eax
   4090f:	89 c7                	mov    %eax,%edi
   40911:	e8 05 fb ff ff       	call   4041b <freepage>
        freepage(pt1_1num);
   40916:	8b 45 b4             	mov    -0x4c(%rbp),%eax
   40919:	89 c7                	mov    %eax,%edi
   4091b:	e8 fb fa ff ff       	call   4041b <freepage>
        panic("no idea");
   40920:	48 8d 05 e1 47 00 00 	lea    0x47e1(%rip),%rax        # 45108 <console_clear+0x95>
   40927:	48 89 c7             	mov    %rax,%rdi
   4092a:	b8 00 00 00 00       	mov    $0x0,%eax
   4092f:	e8 19 29 00 00       	call   4324d <panic>
        return;
    }
    virtual_memory_map(processes[pid].p_pagetable, stack_page, PAGEADDRESS(physpage), PAGESIZE, PTE_P | PTE_W | PTE_U);
   40934:	8b 45 a0             	mov    -0x60(%rbp),%eax
   40937:	48 98                	cltq   
   40939:	48 c1 e0 0c          	shl    $0xc,%rax
   4093d:	48 89 c2             	mov    %rax,%rdx
   40940:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   40946:	48 63 c8             	movslq %eax,%rcx
   40949:	48 89 c8             	mov    %rcx,%rax
   4094c:	48 c1 e0 03          	shl    $0x3,%rax
   40950:	48 29 c8             	sub    %rcx,%rax
   40953:	48 c1 e0 05          	shl    $0x5,%rax
   40957:	48 89 c1             	mov    %rax,%rcx
   4095a:	48 8d 05 8f 17 01 00 	lea    0x1178f(%rip),%rax        # 520f0 <processes+0xd0>
   40961:	48 8b 04 01          	mov    (%rcx,%rax,1),%rax
   40965:	48 8b 75 98          	mov    -0x68(%rbp),%rsi
   40969:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   4096f:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40974:	48 89 c7             	mov    %rax,%rdi
   40977:	e8 45 2d 00 00       	call   436c1 <virtual_memory_map>
    processes[pid].p_state = P_RUNNABLE;
   4097c:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   40982:	48 63 d0             	movslq %eax,%rdx
   40985:	48 89 d0             	mov    %rdx,%rax
   40988:	48 c1 e0 03          	shl    $0x3,%rax
   4098c:	48 29 d0             	sub    %rdx,%rax
   4098f:	48 c1 e0 05          	shl    $0x5,%rax
   40993:	48 89 c2             	mov    %rax,%rdx
   40996:	48 8d 05 4b 17 01 00 	lea    0x1174b(%rip),%rax        # 520e8 <processes+0xc8>
   4099d:	c7 04 02 01 00 00 00 	movl   $0x1,(%rdx,%rax,1)
}
   409a4:	c9                   	leave  
   409a5:	c3                   	ret    

00000000000409a6 <assign_physical_page>:
//    Allocates the page with physical address `addr` to the given owner.
//    Fails if physical page `addr` was already allocated. Returns 0 on
//    success and -1 on failure. Used by the program loader.

int assign_physical_page(uintptr_t addr, int8_t owner)
{
   409a6:	f3 0f 1e fa          	endbr64 
   409aa:	55                   	push   %rbp
   409ab:	48 89 e5             	mov    %rsp,%rbp
   409ae:	48 83 ec 10          	sub    $0x10,%rsp
   409b2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   409b6:	89 f0                	mov    %esi,%eax
   409b8:	88 45 f4             	mov    %al,-0xc(%rbp)
    if ((addr & 0xFFF) != 0 || addr >= MEMSIZE_PHYSICAL || pageinfo[PAGENUMBER(addr)].refcount != 0)
   409bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   409bf:	25 ff 0f 00 00       	and    $0xfff,%eax
   409c4:	48 85 c0             	test   %rax,%rax
   409c7:	75 27                	jne    409f0 <assign_physical_page+0x4a>
   409c9:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   409d0:	00 
   409d1:	77 1d                	ja     409f0 <assign_physical_page+0x4a>
   409d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   409d7:	48 c1 e8 0c          	shr    $0xc,%rax
   409db:	48 98                	cltq   
   409dd:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   409e1:	48 8d 05 59 24 01 00 	lea    0x12459(%rip),%rax        # 52e41 <pageinfo+0x1>
   409e8:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   409ec:	84 c0                	test   %al,%al
   409ee:	74 07                	je     409f7 <assign_physical_page+0x51>
    {
        return -1;
   409f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   409f5:	eb 57                	jmp    40a4e <assign_physical_page+0xa8>
    }
    else
    {
        pageinfo[PAGENUMBER(addr)].refcount += 1;
   409f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   409fb:	48 c1 e8 0c          	shr    $0xc,%rax
   409ff:	48 98                	cltq   
   40a01:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40a05:	48 8d 05 35 24 01 00 	lea    0x12435(%rip),%rax        # 52e41 <pageinfo+0x1>
   40a0c:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   40a10:	8d 50 01             	lea    0x1(%rax),%edx
   40a13:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40a17:	48 c1 e8 0c          	shr    $0xc,%rax
   40a1b:	89 d1                	mov    %edx,%ecx
   40a1d:	48 98                	cltq   
   40a1f:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40a23:	48 8d 05 17 24 01 00 	lea    0x12417(%rip),%rax        # 52e41 <pageinfo+0x1>
   40a2a:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
        pageinfo[PAGENUMBER(addr)].owner = owner;
   40a2d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40a31:	48 c1 e8 0c          	shr    $0xc,%rax
   40a35:	48 98                	cltq   
   40a37:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   40a3b:	48 8d 15 fe 23 01 00 	lea    0x123fe(%rip),%rdx        # 52e40 <pageinfo>
   40a42:	0f b6 45 f4          	movzbl -0xc(%rbp),%eax
   40a46:	88 04 11             	mov    %al,(%rcx,%rdx,1)
        return 0;
   40a49:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   40a4e:	c9                   	leave  
   40a4f:	c3                   	ret    

0000000000040a50 <syscall_mapping>:

void syscall_mapping(proc *p)
{
   40a50:	f3 0f 1e fa          	endbr64 
   40a54:	55                   	push   %rbp
   40a55:	48 89 e5             	mov    %rsp,%rbp
   40a58:	48 83 ec 70          	sub    $0x70,%rsp
   40a5c:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)

    uintptr_t mapping_ptr = p->p_registers.reg_rdi;
   40a60:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40a64:	48 8b 40 38          	mov    0x38(%rax),%rax
   40a68:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    uintptr_t ptr = p->p_registers.reg_rsi;
   40a6c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40a70:	48 8b 40 30          	mov    0x30(%rax),%rax
   40a74:	48 89 45 f0          	mov    %rax,-0x10(%rbp)

    // convert to physical address so kernel can write to it
    vamapping map = virtual_memory_lookup(p->p_pagetable, mapping_ptr);
   40a78:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40a7c:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40a83:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   40a87:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40a8b:	48 89 ce             	mov    %rcx,%rsi
   40a8e:	48 89 c7             	mov    %rax,%rdi
   40a91:	e8 6f 30 00 00       	call   43b05 <virtual_memory_lookup>

    // check for write access
    if ((map.perm & (PTE_W | PTE_U)) != (PTE_W | PTE_U))
   40a96:	8b 45 e0             	mov    -0x20(%rbp),%eax
   40a99:	48 98                	cltq   
   40a9b:	83 e0 06             	and    $0x6,%eax
   40a9e:	48 83 f8 06          	cmp    $0x6,%rax
   40aa2:	75 73                	jne    40b17 <syscall_mapping+0xc7>
        return;
    uintptr_t endaddr = mapping_ptr + sizeof(vamapping) - 1;
   40aa4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40aa8:	48 83 c0 17          	add    $0x17,%rax
   40aac:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    // check for write access for end address
    vamapping end_map = virtual_memory_lookup(p->p_pagetable, endaddr);
   40ab0:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40ab4:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40abb:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
   40abf:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   40ac3:	48 89 ce             	mov    %rcx,%rsi
   40ac6:	48 89 c7             	mov    %rax,%rdi
   40ac9:	e8 37 30 00 00       	call   43b05 <virtual_memory_lookup>
    if ((end_map.perm & (PTE_W | PTE_P)) != (PTE_W | PTE_P))
   40ace:	8b 45 c8             	mov    -0x38(%rbp),%eax
   40ad1:	48 98                	cltq   
   40ad3:	83 e0 03             	and    $0x3,%eax
   40ad6:	48 83 f8 03          	cmp    $0x3,%rax
   40ada:	75 3e                	jne    40b1a <syscall_mapping+0xca>
        return;
    // find the actual mapping now
    vamapping ptr_lookup = virtual_memory_lookup(p->p_pagetable, ptr);
   40adc:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40ae0:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40ae7:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40aeb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40aef:	48 89 ce             	mov    %rcx,%rsi
   40af2:	48 89 c7             	mov    %rax,%rdi
   40af5:	e8 0b 30 00 00       	call   43b05 <virtual_memory_lookup>
    memcpy((void *)map.pa, &ptr_lookup, sizeof(vamapping));
   40afa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40afe:	48 89 c1             	mov    %rax,%rcx
   40b01:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40b05:	ba 18 00 00 00       	mov    $0x18,%edx
   40b0a:	48 89 c6             	mov    %rax,%rsi
   40b0d:	48 89 cf             	mov    %rcx,%rdi
   40b10:	e8 a3 34 00 00       	call   43fb8 <memcpy>
   40b15:	eb 04                	jmp    40b1b <syscall_mapping+0xcb>
        return;
   40b17:	90                   	nop
   40b18:	eb 01                	jmp    40b1b <syscall_mapping+0xcb>
        return;
   40b1a:	90                   	nop
}
   40b1b:	c9                   	leave  
   40b1c:	c3                   	ret    

0000000000040b1d <syscall_mem_tog>:

void syscall_mem_tog(proc *process)
{
   40b1d:	f3 0f 1e fa          	endbr64 
   40b21:	55                   	push   %rbp
   40b22:	48 89 e5             	mov    %rsp,%rbp
   40b25:	48 83 ec 18          	sub    $0x18,%rsp
   40b29:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)

    pid_t p = process->p_registers.reg_rdi;
   40b2d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40b31:	48 8b 40 38          	mov    0x38(%rax),%rax
   40b35:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (p == 0)
   40b38:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40b3c:	75 14                	jne    40b52 <syscall_mem_tog+0x35>
    {
        disp_global = !disp_global;
   40b3e:	0f b6 05 bb 54 00 00 	movzbl 0x54bb(%rip),%eax        # 46000 <disp_global>
   40b45:	84 c0                	test   %al,%al
   40b47:	0f 94 c0             	sete   %al
   40b4a:	88 05 b0 54 00 00    	mov    %al,0x54b0(%rip)        # 46000 <disp_global>
   40b50:	eb 36                	jmp    40b88 <syscall_mem_tog+0x6b>
    }
    else
    {
        if (p < 0 || p > NPROC || p != process->p_pid)
   40b52:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40b56:	78 2f                	js     40b87 <syscall_mem_tog+0x6a>
   40b58:	83 7d fc 10          	cmpl   $0x10,-0x4(%rbp)
   40b5c:	7f 29                	jg     40b87 <syscall_mem_tog+0x6a>
   40b5e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40b62:	8b 00                	mov    (%rax),%eax
   40b64:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   40b67:	75 1e                	jne    40b87 <syscall_mem_tog+0x6a>
            return;
        process->display_status = !(process->display_status);
   40b69:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40b6d:	0f b6 80 d8 00 00 00 	movzbl 0xd8(%rax),%eax
   40b74:	84 c0                	test   %al,%al
   40b76:	0f 94 c0             	sete   %al
   40b79:	89 c2                	mov    %eax,%edx
   40b7b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40b7f:	88 90 d8 00 00 00    	mov    %dl,0xd8(%rax)
   40b85:	eb 01                	jmp    40b88 <syscall_mem_tog+0x6b>
            return;
   40b87:	90                   	nop
    }
}
   40b88:	c9                   	leave  
   40b89:	c3                   	ret    

0000000000040b8a <find_free_process>:

int find_free_process()
{
   40b8a:	f3 0f 1e fa          	endbr64 
   40b8e:	55                   	push   %rbp
   40b8f:	48 89 e5             	mov    %rsp,%rbp
   40b92:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
    proc holder;
    for (int i = 1; i < NPROC; i++)
   40b99:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
   40ba0:	eb 46                	jmp    40be8 <find_free_process+0x5e>
    {
        holder = processes[i];
   40ba2:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40ba5:	48 63 d0             	movslq %eax,%rdx
   40ba8:	48 89 d0             	mov    %rdx,%rax
   40bab:	48 c1 e0 03          	shl    $0x3,%rax
   40baf:	48 29 d0             	sub    %rdx,%rax
   40bb2:	48 c1 e0 05          	shl    $0x5,%rax
   40bb6:	48 89 c1             	mov    %rax,%rcx
   40bb9:	48 8d 15 60 14 01 00 	lea    0x11460(%rip),%rdx        # 52020 <processes>
   40bc0:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
   40bc7:	48 01 ca             	add    %rcx,%rdx
   40bca:	b9 1c 00 00 00       	mov    $0x1c,%ecx
   40bcf:	48 89 c7             	mov    %rax,%rdi
   40bd2:	48 89 d6             	mov    %rdx,%rsi
   40bd5:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
        if (holder.p_state == P_FREE)
   40bd8:	8b 45 e0             	mov    -0x20(%rbp),%eax
   40bdb:	85 c0                	test   %eax,%eax
   40bdd:	75 05                	jne    40be4 <find_free_process+0x5a>
        {
            return i;
   40bdf:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40be2:	eb 0f                	jmp    40bf3 <find_free_process+0x69>
    for (int i = 1; i < NPROC; i++)
   40be4:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   40be8:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   40bec:	7e b4                	jle    40ba2 <find_free_process+0x18>
        }
    }
    return -1;
   40bee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   40bf3:	c9                   	leave  
   40bf4:	c3                   	ret    

0000000000040bf5 <exception>:
//    then calls exception().
//
//    Note that hardware interrupts are disabled whenever the kernel is running.

void exception(x86_64_registers *reg)
{
   40bf5:	f3 0f 1e fa          	endbr64 
   40bf9:	55                   	push   %rbp
   40bfa:	48 89 e5             	mov    %rsp,%rbp
   40bfd:	48 81 ec b0 01 00 00 	sub    $0x1b0,%rsp
   40c04:	48 89 bd 58 fe ff ff 	mov    %rdi,-0x1a8(%rbp)
    // Copy the saved registers into the `current` process descriptor
    // and always use the kernel's page table.
    current->p_registers = *reg;
   40c0b:	48 8b 05 ee 13 01 00 	mov    0x113ee(%rip),%rax        # 52000 <current>
   40c12:	48 8b 95 58 fe ff ff 	mov    -0x1a8(%rbp),%rdx
   40c19:	48 83 c0 08          	add    $0x8,%rax
   40c1d:	48 89 d6             	mov    %rdx,%rsi
   40c20:	ba 18 00 00 00       	mov    $0x18,%edx
   40c25:	48 89 c7             	mov    %rax,%rdi
   40c28:	48 89 d1             	mov    %rdx,%rcx
   40c2b:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    set_pagetable(kernel_pagetable);
   40c2e:	48 8b 05 cb 43 01 00 	mov    0x143cb(%rip),%rax        # 55000 <kernel_pagetable>
   40c35:	48 89 c7             	mov    %rax,%rdi
   40c38:	e8 12 29 00 00       	call   4354f <set_pagetable>
    // Events logged this way are stored in the host's `log.txt` file.
    /*log_printf("proc %d: exception %d\n", current->p_pid, reg->reg_intno);*/

    // Show the current cursor location and memory state
    // (unless this is a kernel fault).
    console_show_cursor(cursorpos);
   40c3d:	8b 05 b9 83 07 00    	mov    0x783b9(%rip),%eax        # b8ffc <cursorpos>
   40c43:	89 c7                	mov    %eax,%edi
   40c45:	e8 8b 1f 00 00       	call   42bd5 <console_show_cursor>
    if ((reg->reg_intno != INT_PAGEFAULT && reg->reg_intno != INT_GPF) // no error due to pagefault or general fault
   40c4a:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   40c51:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40c58:	48 83 f8 0e          	cmp    $0xe,%rax
   40c5c:	74 14                	je     40c72 <exception+0x7d>
   40c5e:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   40c65:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40c6c:	48 83 f8 0d          	cmp    $0xd,%rax
   40c70:	75 16                	jne    40c88 <exception+0x93>
        || (reg->reg_err & PFERR_USER))                                // pagefault error in user mode
   40c72:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   40c79:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40c80:	83 e0 04             	and    $0x4,%eax
   40c83:	48 85 c0             	test   %rax,%rax
   40c86:	74 1a                	je     40ca2 <exception+0xad>
    {
        check_virtual_memory();
   40c88:	e8 8e 0f 00 00       	call   41c1b <check_virtual_memory>
        if (disp_global)
   40c8d:	0f b6 05 6c 53 00 00 	movzbl 0x536c(%rip),%eax        # 46000 <disp_global>
   40c94:	84 c0                	test   %al,%al
   40c96:	74 0a                	je     40ca2 <exception+0xad>
        {
            memshow_physical();
   40c98:	e8 47 11 00 00       	call   41de4 <memshow_physical>
            memshow_virtual_animate();
   40c9d:	e8 e4 14 00 00       	call   42186 <memshow_virtual_animate>
        }
    }

    // If Control-C was typed, exit the virtual machine.
    check_keyboard();
   40ca2:	e8 44 24 00 00       	call   430eb <check_keyboard>

    // Actually handle the exception.
    switch (reg->reg_intno)
   40ca7:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   40cae:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40cb5:	48 83 e8 0e          	sub    $0xe,%rax
   40cb9:	48 83 f8 2a          	cmp    $0x2a,%rax
   40cbd:	0f 87 0c 0a 00 00    	ja     416cf <exception+0xada>
   40cc3:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
   40cca:	00 
   40ccb:	48 8d 05 e6 44 00 00 	lea    0x44e6(%rip),%rax        # 451b8 <console_clear+0x145>
   40cd2:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   40cd5:	48 98                	cltq   
   40cd7:	48 8d 15 da 44 00 00 	lea    0x44da(%rip),%rdx        # 451b8 <console_clear+0x145>
   40cde:	48 01 d0             	add    %rdx,%rax
   40ce1:	3e ff e0             	notrack jmp *%rax
    {
    case INT_SYS_FORK:
    {
        int val = find_free_process();
   40ce4:	b8 00 00 00 00       	mov    $0x0,%eax
   40ce9:	e8 9c fe ff ff       	call   40b8a <find_free_process>
   40cee:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (val == -1)
   40cf1:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%rbp)
   40cf5:	75 14                	jne    40d0b <exception+0x116>
        {
            current->p_registers.reg_rax = -1;
   40cf7:	48 8b 05 02 13 01 00 	mov    0x11302(%rip),%rax        # 52000 <current>
   40cfe:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40d05:	ff 
            break;
   40d06:	e9 d4 09 00 00       	jmp    416df <exception+0xaea>
        }
        process_init(&processes[val], 0);
   40d0b:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40d0e:	48 63 d0             	movslq %eax,%rdx
   40d11:	48 89 d0             	mov    %rdx,%rax
   40d14:	48 c1 e0 03          	shl    $0x3,%rax
   40d18:	48 29 d0             	sub    %rdx,%rax
   40d1b:	48 c1 e0 05          	shl    $0x5,%rax
   40d1f:	48 8d 15 fa 12 01 00 	lea    0x112fa(%rip),%rdx        # 52020 <processes>
   40d26:	48 01 d0             	add    %rdx,%rax
   40d29:	be 00 00 00 00       	mov    $0x0,%esi
   40d2e:	48 89 c7             	mov    %rax,%rdi
   40d31:	e8 d1 1d 00 00       	call   42b07 <process_init>
        int pt4num = find_free_page();
   40d36:	b8 00 00 00 00       	mov    $0x0,%eax
   40d3b:	e8 26 f6 ff ff       	call   40366 <find_free_page>
   40d40:	89 45 f0             	mov    %eax,-0x10(%rbp)
        if (pt4num == -1)
   40d43:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   40d47:	75 14                	jne    40d5d <exception+0x168>
        {
            panic("No more physical pages\n");
   40d49:	48 8d 05 89 43 00 00 	lea    0x4389(%rip),%rax        # 450d9 <console_clear+0x66>
   40d50:	48 89 c7             	mov    %rax,%rdi
   40d53:	b8 00 00 00 00       	mov    $0x0,%eax
   40d58:	e8 f0 24 00 00       	call   4324d <panic>
            return;
        }
        int pid = processes[val].p_pid;
   40d5d:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40d60:	48 63 d0             	movslq %eax,%rdx
   40d63:	48 89 d0             	mov    %rdx,%rax
   40d66:	48 c1 e0 03          	shl    $0x3,%rax
   40d6a:	48 29 d0             	sub    %rdx,%rax
   40d6d:	48 c1 e0 05          	shl    $0x5,%rax
   40d71:	48 89 c2             	mov    %rax,%rdx
   40d74:	48 8d 05 a5 12 01 00 	lea    0x112a5(%rip),%rax        # 52020 <processes>
   40d7b:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   40d7e:	89 45 ec             	mov    %eax,-0x14(%rbp)
        x86_64_pagetable *pt_L4 = numtopagetable(pt4num, pid);
   40d81:	8b 45 ec             	mov    -0x14(%rbp),%eax
   40d84:	0f be d0             	movsbl %al,%edx
   40d87:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40d8a:	89 d6                	mov    %edx,%esi
   40d8c:	89 c7                	mov    %eax,%edi
   40d8e:	e8 19 f6 ff ff       	call   403ac <numtopagetable>
   40d93:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        int pt3num = find_free_page();
   40d97:	b8 00 00 00 00       	mov    $0x0,%eax
   40d9c:	e8 c5 f5 ff ff       	call   40366 <find_free_page>
   40da1:	89 45 dc             	mov    %eax,-0x24(%rbp)
        if (pt3num == -1)
   40da4:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%rbp)
   40da8:	75 1e                	jne    40dc8 <exception+0x1d3>
        {
            freepage(pt4num);
   40daa:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40dad:	89 c7                	mov    %eax,%edi
   40daf:	e8 67 f6 ff ff       	call   4041b <freepage>
            panic("No more physical pages\n");
   40db4:	48 8d 05 1e 43 00 00 	lea    0x431e(%rip),%rax        # 450d9 <console_clear+0x66>
   40dbb:	48 89 c7             	mov    %rax,%rdi
   40dbe:	b8 00 00 00 00       	mov    $0x0,%eax
   40dc3:	e8 85 24 00 00       	call   4324d <panic>
            return;
        }
        x86_64_pagetable *pt_L3 = numtopagetable(pt3num, pid);
   40dc8:	8b 45 ec             	mov    -0x14(%rbp),%eax
   40dcb:	0f be d0             	movsbl %al,%edx
   40dce:	8b 45 dc             	mov    -0x24(%rbp),%eax
   40dd1:	89 d6                	mov    %edx,%esi
   40dd3:	89 c7                	mov    %eax,%edi
   40dd5:	e8 d2 f5 ff ff       	call   403ac <numtopagetable>
   40dda:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        int pt2num = find_free_page();
   40dde:	b8 00 00 00 00       	mov    $0x0,%eax
   40de3:	e8 7e f5 ff ff       	call   40366 <find_free_page>
   40de8:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (pt2num == -1)
   40deb:	83 7d cc ff          	cmpl   $0xffffffff,-0x34(%rbp)
   40def:	75 28                	jne    40e19 <exception+0x224>
        {
            freepage(pt4num);
   40df1:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40df4:	89 c7                	mov    %eax,%edi
   40df6:	e8 20 f6 ff ff       	call   4041b <freepage>
            freepage(pt3num);
   40dfb:	8b 45 dc             	mov    -0x24(%rbp),%eax
   40dfe:	89 c7                	mov    %eax,%edi
   40e00:	e8 16 f6 ff ff       	call   4041b <freepage>
            panic("No more physical pages\n");
   40e05:	48 8d 05 cd 42 00 00 	lea    0x42cd(%rip),%rax        # 450d9 <console_clear+0x66>
   40e0c:	48 89 c7             	mov    %rax,%rdi
   40e0f:	b8 00 00 00 00       	mov    $0x0,%eax
   40e14:	e8 34 24 00 00       	call   4324d <panic>
            return;
        }
        x86_64_pagetable *pt_L2 = numtopagetable(pt2num, pid);
   40e19:	8b 45 ec             	mov    -0x14(%rbp),%eax
   40e1c:	0f be d0             	movsbl %al,%edx
   40e1f:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40e22:	89 d6                	mov    %edx,%esi
   40e24:	89 c7                	mov    %eax,%edi
   40e26:	e8 81 f5 ff ff       	call   403ac <numtopagetable>
   40e2b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
        int pt1_0num = find_free_page();
   40e2f:	b8 00 00 00 00       	mov    $0x0,%eax
   40e34:	e8 2d f5 ff ff       	call   40366 <find_free_page>
   40e39:	89 45 bc             	mov    %eax,-0x44(%rbp)
        if (pt1_0num == -1)
   40e3c:	83 7d bc ff          	cmpl   $0xffffffff,-0x44(%rbp)
   40e40:	75 32                	jne    40e74 <exception+0x27f>
        {
            freepage(pt4num);
   40e42:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40e45:	89 c7                	mov    %eax,%edi
   40e47:	e8 cf f5 ff ff       	call   4041b <freepage>
            freepage(pt3num);
   40e4c:	8b 45 dc             	mov    -0x24(%rbp),%eax
   40e4f:	89 c7                	mov    %eax,%edi
   40e51:	e8 c5 f5 ff ff       	call   4041b <freepage>
            freepage(pt2num);
   40e56:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40e59:	89 c7                	mov    %eax,%edi
   40e5b:	e8 bb f5 ff ff       	call   4041b <freepage>

            panic("No more physical pages\n");
   40e60:	48 8d 05 72 42 00 00 	lea    0x4272(%rip),%rax        # 450d9 <console_clear+0x66>
   40e67:	48 89 c7             	mov    %rax,%rdi
   40e6a:	b8 00 00 00 00       	mov    $0x0,%eax
   40e6f:	e8 d9 23 00 00       	call   4324d <panic>
            return;
        }
        x86_64_pagetable *pt_L1_0 = numtopagetable(pt1_0num, pid);
   40e74:	8b 45 ec             	mov    -0x14(%rbp),%eax
   40e77:	0f be d0             	movsbl %al,%edx
   40e7a:	8b 45 bc             	mov    -0x44(%rbp),%eax
   40e7d:	89 d6                	mov    %edx,%esi
   40e7f:	89 c7                	mov    %eax,%edi
   40e81:	e8 26 f5 ff ff       	call   403ac <numtopagetable>
   40e86:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
        int pt1_1num = find_free_page();
   40e8a:	b8 00 00 00 00       	mov    $0x0,%eax
   40e8f:	e8 d2 f4 ff ff       	call   40366 <find_free_page>
   40e94:	89 45 ac             	mov    %eax,-0x54(%rbp)
        if (pt1_1num == -1)
   40e97:	83 7d ac ff          	cmpl   $0xffffffff,-0x54(%rbp)
   40e9b:	75 3c                	jne    40ed9 <exception+0x2e4>
        {
            freepage(pt4num);
   40e9d:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40ea0:	89 c7                	mov    %eax,%edi
   40ea2:	e8 74 f5 ff ff       	call   4041b <freepage>
            freepage(pt3num);
   40ea7:	8b 45 dc             	mov    -0x24(%rbp),%eax
   40eaa:	89 c7                	mov    %eax,%edi
   40eac:	e8 6a f5 ff ff       	call   4041b <freepage>
            freepage(pt2num);
   40eb1:	8b 45 cc             	mov    -0x34(%rbp),%eax
   40eb4:	89 c7                	mov    %eax,%edi
   40eb6:	e8 60 f5 ff ff       	call   4041b <freepage>
            freepage(pt1_0num);
   40ebb:	8b 45 bc             	mov    -0x44(%rbp),%eax
   40ebe:	89 c7                	mov    %eax,%edi
   40ec0:	e8 56 f5 ff ff       	call   4041b <freepage>
            panic("No more physical pages\n");
   40ec5:	48 8d 05 0d 42 00 00 	lea    0x420d(%rip),%rax        # 450d9 <console_clear+0x66>
   40ecc:	48 89 c7             	mov    %rax,%rdi
   40ecf:	b8 00 00 00 00       	mov    $0x0,%eax
   40ed4:	e8 74 23 00 00       	call   4324d <panic>
            return;
        }
        x86_64_pagetable *pt_L1_1 = numtopagetable(pt1_1num, pid);
   40ed9:	8b 45 ec             	mov    -0x14(%rbp),%eax
   40edc:	0f be d0             	movsbl %al,%edx
   40edf:	8b 45 ac             	mov    -0x54(%rbp),%eax
   40ee2:	89 d6                	mov    %edx,%esi
   40ee4:	89 c7                	mov    %eax,%edi
   40ee6:	e8 c1 f4 ff ff       	call   403ac <numtopagetable>
   40eeb:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
        // set the pages to zero
        memset(pt_L4, 0, PAGESIZE);
   40eef:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40ef3:	ba 00 10 00 00       	mov    $0x1000,%edx
   40ef8:	be 00 00 00 00       	mov    $0x0,%esi
   40efd:	48 89 c7             	mov    %rax,%rdi
   40f00:	e8 b9 31 00 00       	call   440be <memset>
        memset(pt_L3, 0, PAGESIZE);
   40f05:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40f09:	ba 00 10 00 00       	mov    $0x1000,%edx
   40f0e:	be 00 00 00 00       	mov    $0x0,%esi
   40f13:	48 89 c7             	mov    %rax,%rdi
   40f16:	e8 a3 31 00 00       	call   440be <memset>
        memset(pt_L2, 0, PAGESIZE);
   40f1b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   40f1f:	ba 00 10 00 00       	mov    $0x1000,%edx
   40f24:	be 00 00 00 00       	mov    $0x0,%esi
   40f29:	48 89 c7             	mov    %rax,%rdi
   40f2c:	e8 8d 31 00 00       	call   440be <memset>
        memset(pt_L1_0, 0, PAGESIZE);
   40f31:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   40f35:	ba 00 10 00 00       	mov    $0x1000,%edx
   40f3a:	be 00 00 00 00       	mov    $0x0,%esi
   40f3f:	48 89 c7             	mov    %rax,%rdi
   40f42:	e8 77 31 00 00       	call   440be <memset>
        memset(pt_L1_1, 0, PAGESIZE);
   40f47:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   40f4b:	ba 00 10 00 00       	mov    $0x1000,%edx
   40f50:	be 00 00 00 00       	mov    $0x0,%esi
   40f55:	48 89 c7             	mov    %rax,%rdi
   40f58:	e8 61 31 00 00       	call   440be <memset>

        // Link the page tables together. Did I do this right?
        pt_L4->entry[0] = (x86_64_pageentry_t)pt_L3 | PTE_P | PTE_W | PTE_U;
   40f5d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40f61:	48 83 c8 07          	or     $0x7,%rax
   40f65:	48 89 c2             	mov    %rax,%rdx
   40f68:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40f6c:	48 89 10             	mov    %rdx,(%rax)
        pt_L3->entry[0] = (x86_64_pageentry_t)pt_L2 | PTE_P | PTE_W | PTE_U;
   40f6f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   40f73:	48 83 c8 07          	or     $0x7,%rax
   40f77:	48 89 c2             	mov    %rax,%rdx
   40f7a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40f7e:	48 89 10             	mov    %rdx,(%rax)
        pt_L2->entry[0] = (x86_64_pageentry_t)pt_L1_0 | PTE_P | PTE_W | PTE_U;
   40f81:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   40f85:	48 83 c8 07          	or     $0x7,%rax
   40f89:	48 89 c2             	mov    %rax,%rdx
   40f8c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   40f90:	48 89 10             	mov    %rdx,(%rax)
        pt_L2->entry[1] = (x86_64_pageentry_t)pt_L1_1 | PTE_P | PTE_W | PTE_U;
   40f93:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   40f97:	48 83 c8 07          	or     $0x7,%rax
   40f9b:	48 89 c2             	mov    %rax,%rdx
   40f9e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   40fa2:	48 89 50 08          	mov    %rdx,0x8(%rax)
        // Copy address space
        for (uintptr_t addr = 0; addr < MEMSIZE_VIRTUAL; addr += PAGESIZE)
   40fa6:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   40fad:	00 
   40fae:	e9 5e 02 00 00       	jmp    41211 <exception+0x61c>
        {                                                                                 // we're gonna go page by page I think
            vamapping parent_mapping = virtual_memory_lookup(current->p_pagetable, addr); // get the pagetable page of addr in the kernel
   40fb3:	48 8b 05 46 10 01 00 	mov    0x11046(%rip),%rax        # 52000 <current>
   40fba:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40fc1:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
   40fc8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40fcc:	48 89 ce             	mov    %rcx,%rsi
   40fcf:	48 89 c7             	mov    %rax,%rdi
   40fd2:	e8 2e 2b 00 00       	call   43b05 <virtual_memory_lookup>
            if (parent_mapping.pn >= 0)
   40fd7:	8b 85 30 ff ff ff    	mov    -0xd0(%rbp),%eax
   40fdd:	85 c0                	test   %eax,%eax
   40fdf:	0f 88 24 02 00 00    	js     41209 <exception+0x614>
            {
                // Copy the mapping. You'll have to deal with accessability
                int perm = parent_mapping.perm;
   40fe5:	8b 85 40 ff ff ff    	mov    -0xc0(%rbp),%eax
   40feb:	89 45 9c             	mov    %eax,-0x64(%rbp)
                if (addr == CONSOLE_ADDR)
   40fee:	48 8d 05 0b 70 07 00 	lea    0x7700b(%rip),%rax        # b8000 <console>
   40ff5:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40ff9:	75 2e                	jne    41029 <exception+0x434>
                {
                    perm |= PTE_U; // Make console user-accessible
   40ffb:	83 4d 9c 04          	orl    $0x4,-0x64(%rbp)
                    virtual_memory_map(pt_L4, CONSOLE_ADDR, CONSOLE_ADDR, PAGESIZE, perm);
   40fff:	48 8d 15 fa 6f 07 00 	lea    0x76ffa(%rip),%rdx        # b8000 <console>
   41006:	48 8d 35 f3 6f 07 00 	lea    0x76ff3(%rip),%rsi        # b8000 <console>
   4100d:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
   41010:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41014:	41 89 c8             	mov    %ecx,%r8d
   41017:	b9 00 10 00 00       	mov    $0x1000,%ecx
   4101c:	48 89 c7             	mov    %rax,%rdi
   4101f:	e8 9d 26 00 00       	call   436c1 <virtual_memory_map>
                    continue;
   41024:	e9 e0 01 00 00       	jmp    41209 <exception+0x614>
                }
                else if (addr < PROC_START_ADDR)
   41029:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   41030:	00 
   41031:	77 2b                	ja     4105e <exception+0x469>
                {
                    // Kernel pages - map with non-user access
                    perm &= ~PTE_U;
   41033:	83 65 9c fb          	andl   $0xfffffffb,-0x64(%rbp)
                    virtual_memory_map(pt_L4, addr, parent_mapping.pa, PAGESIZE, perm);
   41037:	48 8b 95 38 ff ff ff 	mov    -0xc8(%rbp),%rdx
   4103e:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
   41041:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   41045:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41049:	41 89 c8             	mov    %ecx,%r8d
   4104c:	b9 00 10 00 00       	mov    $0x1000,%ecx
   41051:	48 89 c7             	mov    %rax,%rdi
   41054:	e8 68 26 00 00       	call   436c1 <virtual_memory_map>
                    continue;
   41059:	e9 ab 01 00 00       	jmp    41209 <exception+0x614>
                }
                else if (!(perm & PTE_W))
   4105e:	8b 45 9c             	mov    -0x64(%rbp),%eax
   41061:	48 98                	cltq   
   41063:	83 e0 02             	and    $0x2,%eax
   41066:	48 85 c0             	test   %rax,%rax
   41069:	75 63                	jne    410ce <exception+0x4d9>
                {
                    // This is a read-only page - share it rather than copying
                    virtual_memory_map(pt_L4, addr, parent_mapping.pa, PAGESIZE, perm);
   4106b:	48 8b 95 38 ff ff ff 	mov    -0xc8(%rbp),%rdx
   41072:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
   41075:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   41079:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4107d:	41 89 c8             	mov    %ecx,%r8d
   41080:	b9 00 10 00 00       	mov    $0x1000,%ecx
   41085:	48 89 c7             	mov    %rax,%rdi
   41088:	e8 34 26 00 00       	call   436c1 <virtual_memory_map>

                    // Increment the reference count for this physical page
                    pageinfo[PAGENUMBER(parent_mapping.pa)].refcount += 1;
   4108d:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
   41094:	48 c1 e8 0c          	shr    $0xc,%rax
   41098:	48 98                	cltq   
   4109a:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4109e:	48 8d 05 9c 1d 01 00 	lea    0x11d9c(%rip),%rax        # 52e41 <pageinfo+0x1>
   410a5:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   410a9:	8d 50 01             	lea    0x1(%rax),%edx
   410ac:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
   410b3:	48 c1 e8 0c          	shr    $0xc,%rax
   410b7:	89 d1                	mov    %edx,%ecx
   410b9:	48 98                	cltq   
   410bb:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   410bf:	48 8d 05 7b 1d 01 00 	lea    0x11d7b(%rip),%rax        # 52e41 <pageinfo+0x1>
   410c6:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
   410c9:	e9 3b 01 00 00       	jmp    41209 <exception+0x614>
                }
                else if (perm & PTE_U) // check if you have user access to it. you'll have to make a new page
   410ce:	8b 45 9c             	mov    -0x64(%rbp),%eax
   410d1:	48 98                	cltq   
   410d3:	83 e0 04             	and    $0x4,%eax
   410d6:	48 85 c0             	test   %rax,%rax
   410d9:	0f 84 04 01 00 00    	je     411e3 <exception+0x5ee>
                {
                    int new_page_physical = find_free_page();
   410df:	b8 00 00 00 00       	mov    $0x0,%eax
   410e4:	e8 7d f2 ff ff       	call   40366 <find_free_page>
   410e9:	89 45 98             	mov    %eax,-0x68(%rbp)
                    if (new_page_physical == -1)
   410ec:	83 7d 98 ff          	cmpl   $0xffffffff,-0x68(%rbp)
   410f0:	75 41                	jne    41133 <exception+0x53e>
                    {
                        freepage(pt4num);
   410f2:	8b 45 f0             	mov    -0x10(%rbp),%eax
   410f5:	89 c7                	mov    %eax,%edi
   410f7:	e8 1f f3 ff ff       	call   4041b <freepage>
                        freepage(pt3num);
   410fc:	8b 45 dc             	mov    -0x24(%rbp),%eax
   410ff:	89 c7                	mov    %eax,%edi
   41101:	e8 15 f3 ff ff       	call   4041b <freepage>
                        freepage(pt2num);
   41106:	8b 45 cc             	mov    -0x34(%rbp),%eax
   41109:	89 c7                	mov    %eax,%edi
   4110b:	e8 0b f3 ff ff       	call   4041b <freepage>
                        freepage(pt1_0num);
   41110:	8b 45 bc             	mov    -0x44(%rbp),%eax
   41113:	89 c7                	mov    %eax,%edi
   41115:	e8 01 f3 ff ff       	call   4041b <freepage>
                        freepage(pt1_1num);
   4111a:	8b 45 ac             	mov    -0x54(%rbp),%eax
   4111d:	89 c7                	mov    %eax,%edi
   4111f:	e8 f7 f2 ff ff       	call   4041b <freepage>
                        current->p_registers.reg_rax = -1; // ERROR? Should this panic?
   41124:	48 8b 05 d5 0e 01 00 	mov    0x10ed5(%rip),%rax        # 52000 <current>
   4112b:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   41132:	ff 
                    }
                    memcpy((void *)PAGEADDRESS(new_page_physical), (void *)parent_mapping.pa, PAGESIZE);
   41133:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
   4113a:	48 89 c1             	mov    %rax,%rcx
   4113d:	8b 45 98             	mov    -0x68(%rbp),%eax
   41140:	48 98                	cltq   
   41142:	48 c1 e0 0c          	shl    $0xc,%rax
   41146:	ba 00 10 00 00       	mov    $0x1000,%edx
   4114b:	48 89 ce             	mov    %rcx,%rsi
   4114e:	48 89 c7             	mov    %rax,%rdi
   41151:	e8 62 2e 00 00       	call   43fb8 <memcpy>
                    int r = assign_physical_page(PAGEADDRESS(new_page_physical), pid);
   41156:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41159:	0f be c0             	movsbl %al,%eax
   4115c:	8b 55 98             	mov    -0x68(%rbp),%edx
   4115f:	48 63 d2             	movslq %edx,%rdx
   41162:	48 c1 e2 0c          	shl    $0xc,%rdx
   41166:	89 c6                	mov    %eax,%esi
   41168:	48 89 d7             	mov    %rdx,%rdi
   4116b:	e8 36 f8 ff ff       	call   409a6 <assign_physical_page>
   41170:	89 45 94             	mov    %eax,-0x6c(%rbp)
                    if (r < 0)
   41173:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
   41177:	79 41                	jns    411ba <exception+0x5c5>
                    {
                        freepage(pt4num);
   41179:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4117c:	89 c7                	mov    %eax,%edi
   4117e:	e8 98 f2 ff ff       	call   4041b <freepage>
                        freepage(pt3num);
   41183:	8b 45 dc             	mov    -0x24(%rbp),%eax
   41186:	89 c7                	mov    %eax,%edi
   41188:	e8 8e f2 ff ff       	call   4041b <freepage>
                        freepage(pt2num);
   4118d:	8b 45 cc             	mov    -0x34(%rbp),%eax
   41190:	89 c7                	mov    %eax,%edi
   41192:	e8 84 f2 ff ff       	call   4041b <freepage>
                        freepage(pt1_0num);
   41197:	8b 45 bc             	mov    -0x44(%rbp),%eax
   4119a:	89 c7                	mov    %eax,%edi
   4119c:	e8 7a f2 ff ff       	call   4041b <freepage>
                        freepage(pt1_1num);
   411a1:	8b 45 ac             	mov    -0x54(%rbp),%eax
   411a4:	89 c7                	mov    %eax,%edi
   411a6:	e8 70 f2 ff ff       	call   4041b <freepage>
                        current->p_registers.reg_rax = -1; // ERROR? Should this panic?
   411ab:	48 8b 05 4e 0e 01 00 	mov    0x10e4e(%rip),%rax        # 52000 <current>
   411b2:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   411b9:	ff 
                    }
                    virtual_memory_map(pt_L4, addr, PAGEADDRESS(new_page_physical), PAGESIZE, perm);
   411ba:	8b 45 98             	mov    -0x68(%rbp),%eax
   411bd:	48 98                	cltq   
   411bf:	48 c1 e0 0c          	shl    $0xc,%rax
   411c3:	48 89 c2             	mov    %rax,%rdx
   411c6:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
   411c9:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   411cd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   411d1:	41 89 c8             	mov    %ecx,%r8d
   411d4:	b9 00 10 00 00       	mov    $0x1000,%ecx
   411d9:	48 89 c7             	mov    %rax,%rdi
   411dc:	e8 e0 24 00 00       	call   436c1 <virtual_memory_map>
                    continue;
   411e1:	eb 26                	jmp    41209 <exception+0x614>
                }
                else
                {
                    virtual_memory_map(pt_L4, addr, parent_mapping.pa, PAGESIZE, parent_mapping.perm);
   411e3:	8b 8d 40 ff ff ff    	mov    -0xc0(%rbp),%ecx
   411e9:	48 8b 95 38 ff ff ff 	mov    -0xc8(%rbp),%rdx
   411f0:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   411f4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   411f8:	41 89 c8             	mov    %ecx,%r8d
   411fb:	b9 00 10 00 00       	mov    $0x1000,%ecx
   41200:	48 89 c7             	mov    %rax,%rdi
   41203:	e8 b9 24 00 00       	call   436c1 <virtual_memory_map>
                    continue;
   41208:	90                   	nop
        for (uintptr_t addr = 0; addr < MEMSIZE_VIRTUAL; addr += PAGESIZE)
   41209:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41210:	00 
   41211:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   41218:	00 
   41219:	0f 86 94 fd ff ff    	jbe    40fb3 <exception+0x3be>
                }
            }
        }
        // Set the child's page table
        processes[val].p_pagetable = pt_L4;
   4121f:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41222:	48 63 d0             	movslq %eax,%rdx
   41225:	48 89 d0             	mov    %rdx,%rax
   41228:	48 c1 e0 03          	shl    $0x3,%rax
   4122c:	48 29 d0             	sub    %rdx,%rax
   4122f:	48 c1 e0 05          	shl    $0x5,%rax
   41233:	48 89 c1             	mov    %rax,%rcx
   41236:	48 8d 15 b3 0e 01 00 	lea    0x10eb3(%rip),%rdx        # 520f0 <processes+0xd0>
   4123d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41241:	48 89 04 11          	mov    %rax,(%rcx,%rdx,1)

        // Copy the parent's registers to the child
        processes[val].p_registers = current->p_registers;
   41245:	48 8b 0d b4 0d 01 00 	mov    0x10db4(%rip),%rcx        # 52000 <current>
   4124c:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4124f:	48 63 d0             	movslq %eax,%rdx
   41252:	48 89 d0             	mov    %rdx,%rax
   41255:	48 c1 e0 03          	shl    $0x3,%rax
   41259:	48 29 d0             	sub    %rdx,%rax
   4125c:	48 c1 e0 05          	shl    $0x5,%rax
   41260:	48 89 c2             	mov    %rax,%rdx
   41263:	48 8d 05 b6 0d 01 00 	lea    0x10db6(%rip),%rax        # 52020 <processes>
   4126a:	48 01 d0             	add    %rdx,%rax
   4126d:	48 83 c0 08          	add    $0x8,%rax
   41271:	48 8d 51 08          	lea    0x8(%rcx),%rdx
   41275:	b9 18 00 00 00       	mov    $0x18,%ecx
   4127a:	48 89 c7             	mov    %rax,%rdi
   4127d:	48 89 d6             	mov    %rdx,%rsi
   41280:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)

        // Set the return values
        // - Child gets 0
        processes[val].p_registers.reg_rax = 0;
   41283:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41286:	48 63 d0             	movslq %eax,%rdx
   41289:	48 89 d0             	mov    %rdx,%rax
   4128c:	48 c1 e0 03          	shl    $0x3,%rax
   41290:	48 29 d0             	sub    %rdx,%rax
   41293:	48 c1 e0 05          	shl    $0x5,%rax
   41297:	48 89 c2             	mov    %rax,%rdx
   4129a:	48 8d 05 87 0d 01 00 	lea    0x10d87(%rip),%rax        # 52028 <processes+0x8>
   412a1:	48 c7 04 02 00 00 00 	movq   $0x0,(%rdx,%rax,1)
   412a8:	00 
        // - Parent gets child's PID
        current->p_registers.reg_rax = pid;
   412a9:	48 8b 05 50 0d 01 00 	mov    0x10d50(%rip),%rax        # 52000 <current>
   412b0:	8b 55 ec             	mov    -0x14(%rbp),%edx
   412b3:	48 63 d2             	movslq %edx,%rdx
   412b6:	48 89 50 08          	mov    %rdx,0x8(%rax)

        // Mark the child as runnable
        processes[val].p_state = P_RUNNABLE;
   412ba:	8b 45 f4             	mov    -0xc(%rbp),%eax
   412bd:	48 63 d0             	movslq %eax,%rdx
   412c0:	48 89 d0             	mov    %rdx,%rax
   412c3:	48 c1 e0 03          	shl    $0x3,%rax
   412c7:	48 29 d0             	sub    %rdx,%rax
   412ca:	48 c1 e0 05          	shl    $0x5,%rax
   412ce:	48 89 c2             	mov    %rax,%rdx
   412d1:	48 8d 05 10 0e 01 00 	lea    0x10e10(%rip),%rax        # 520e8 <processes+0xc8>
   412d8:	c7 04 02 01 00 00 00 	movl   $0x1,(%rdx,%rax,1)
        processes[val].display_status = 1;
   412df:	8b 45 f4             	mov    -0xc(%rbp),%eax
   412e2:	48 63 d0             	movslq %eax,%rdx
   412e5:	48 89 d0             	mov    %rdx,%rax
   412e8:	48 c1 e0 03          	shl    $0x3,%rax
   412ec:	48 29 d0             	sub    %rdx,%rax
   412ef:	48 c1 e0 05          	shl    $0x5,%rax
   412f3:	48 89 c2             	mov    %rax,%rdx
   412f6:	48 8d 05 fb 0d 01 00 	lea    0x10dfb(%rip),%rax        # 520f8 <processes+0xd8>
   412fd:	c6 04 02 01          	movb   $0x1,(%rdx,%rax,1)
        processes[val].p_registers.reg_rsp = MEMSIZE_VIRTUAL;
   41301:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41304:	48 63 d0             	movslq %eax,%rdx
   41307:	48 89 d0             	mov    %rdx,%rax
   4130a:	48 c1 e0 03          	shl    $0x3,%rax
   4130e:	48 29 d0             	sub    %rdx,%rax
   41311:	48 c1 e0 05          	shl    $0x5,%rax
   41315:	48 89 c2             	mov    %rax,%rdx
   41318:	48 8d 05 b9 0d 01 00 	lea    0x10db9(%rip),%rax        # 520d8 <processes+0xb8>
   4131f:	48 c7 04 02 00 00 30 	movq   $0x300000,(%rdx,%rax,1)
   41326:	00 

        break;
   41327:	e9 b3 03 00 00       	jmp    416df <exception+0xaea>
    }
    case INT_SYS_PANIC:
        // rdi stores pointer for msg string
        {
            char msg[160];
            uintptr_t addr = current->p_registers.reg_rdi;
   4132c:	48 8b 05 cd 0c 01 00 	mov    0x10ccd(%rip),%rax        # 52000 <current>
   41333:	48 8b 40 38          	mov    0x38(%rax),%rax
   41337:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
            if ((void *)addr == NULL)
   4133e:	48 83 bd 68 ff ff ff 	cmpq   $0x0,-0x98(%rbp)
   41345:	00 
   41346:	75 0f                	jne    41357 <exception+0x762>
                panic(NULL);
   41348:	bf 00 00 00 00       	mov    $0x0,%edi
   4134d:	b8 00 00 00 00       	mov    $0x0,%eax
   41352:	e8 f6 1e 00 00       	call   4324d <panic>
            vamapping map = virtual_memory_lookup(current->p_pagetable, addr);
   41357:	48 8b 05 a2 0c 01 00 	mov    0x10ca2(%rip),%rax        # 52000 <current>
   4135e:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   41365:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
   4136c:	48 8b 95 68 ff ff ff 	mov    -0x98(%rbp),%rdx
   41373:	48 89 ce             	mov    %rcx,%rsi
   41376:	48 89 c7             	mov    %rax,%rdi
   41379:	e8 87 27 00 00       	call   43b05 <virtual_memory_lookup>
            memcpy(msg, (void *)map.pa, 160);
   4137e:	48 8b 85 20 ff ff ff 	mov    -0xe0(%rbp),%rax
   41385:	48 89 c1             	mov    %rax,%rcx
   41388:	48 8d 85 60 fe ff ff 	lea    -0x1a0(%rbp),%rax
   4138f:	ba a0 00 00 00       	mov    $0xa0,%edx
   41394:	48 89 ce             	mov    %rcx,%rsi
   41397:	48 89 c7             	mov    %rax,%rdi
   4139a:	e8 19 2c 00 00       	call   43fb8 <memcpy>
            panic(msg);
   4139f:	48 8d 85 60 fe ff ff 	lea    -0x1a0(%rbp),%rax
   413a6:	48 89 c7             	mov    %rax,%rdi
   413a9:	b8 00 00 00 00       	mov    $0x0,%eax
   413ae:	e8 9a 1e 00 00       	call   4324d <panic>
        }
        panic(NULL);
        break; // will not be reached

    case INT_SYS_GETPID:
        current->p_registers.reg_rax = current->p_pid;
   413b3:	48 8b 05 46 0c 01 00 	mov    0x10c46(%rip),%rax        # 52000 <current>
   413ba:	8b 10                	mov    (%rax),%edx
   413bc:	48 8b 05 3d 0c 01 00 	mov    0x10c3d(%rip),%rax        # 52000 <current>
   413c3:	48 63 d2             	movslq %edx,%rdx
   413c6:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   413ca:	e9 10 03 00 00       	jmp    416df <exception+0xaea>

    case INT_SYS_YIELD:
        schedule();
   413cf:	e8 33 03 00 00       	call   41707 <schedule>
        break; /* will not be reached */
   413d4:	e9 06 03 00 00       	jmp    416df <exception+0xaea>

    case INT_SYS_PAGE_ALLOC:
    {
        uintptr_t addr = current->p_registers.reg_rdi;
   413d9:	48 8b 05 20 0c 01 00 	mov    0x10c20(%rip),%rax        # 52000 <current>
   413e0:	48 8b 40 38          	mov    0x38(%rax),%rax
   413e4:	48 89 45 88          	mov    %rax,-0x78(%rbp)

        if ((addr & 0xFFF) != 0)
   413e8:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   413ec:	25 ff 0f 00 00       	and    $0xfff,%eax
   413f1:	48 85 c0             	test   %rax,%rax
   413f4:	74 14                	je     4140a <exception+0x815>
        { // Check if page-aligned
            current->p_registers.reg_rax = -1;
   413f6:	48 8b 05 03 0c 01 00 	mov    0x10c03(%rip),%rax        # 52000 <current>
   413fd:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   41404:	ff 
            break;
   41405:	e9 d5 02 00 00       	jmp    416df <exception+0xaea>
        }
        if (addr < PROC_START_ADDR && addr != CONSOLE_ADDR)
   4140a:	48 81 7d 88 ff ff 0f 	cmpq   $0xfffff,-0x78(%rbp)
   41411:	00 
   41412:	77 21                	ja     41435 <exception+0x840>
   41414:	48 8d 05 e5 6b 07 00 	lea    0x76be5(%rip),%rax        # b8000 <console>
   4141b:	48 39 45 88          	cmp    %rax,-0x78(%rbp)
   4141f:	74 14                	je     41435 <exception+0x840>
        {
            current->p_registers.reg_rax = -1;
   41421:	48 8b 05 d8 0b 01 00 	mov    0x10bd8(%rip),%rax        # 52000 <current>
   41428:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   4142f:	ff 
            break;
   41430:	e9 aa 02 00 00       	jmp    416df <exception+0xaea>
        }
        // Check if address is below max virtual memory size
        if (addr >= MEMSIZE_VIRTUAL)
   41435:	48 81 7d 88 ff ff 2f 	cmpq   $0x2fffff,-0x78(%rbp)
   4143c:	00 
   4143d:	76 14                	jbe    41453 <exception+0x85e>
        {
            current->p_registers.reg_rax = -1;
   4143f:	48 8b 05 ba 0b 01 00 	mov    0x10bba(%rip),%rax        # 52000 <current>
   41446:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   4144d:	ff 
            break;
   4144e:	e9 8c 02 00 00       	jmp    416df <exception+0xaea>
        }
        // if the page already exists
        vamapping vam = virtual_memory_lookup(current->p_pagetable, addr);
   41453:	48 8b 05 a6 0b 01 00 	mov    0x10ba6(%rip),%rax        # 52000 <current>
   4145a:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   41461:	48 8d 85 00 ff ff ff 	lea    -0x100(%rbp),%rax
   41468:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
   4146c:	48 89 ce             	mov    %rcx,%rsi
   4146f:	48 89 c7             	mov    %rax,%rdi
   41472:	e8 8e 26 00 00       	call   43b05 <virtual_memory_lookup>
        if (vam.pn >= 0)
   41477:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
   4147d:	85 c0                	test   %eax,%eax
   4147f:	78 14                	js     41495 <exception+0x8a0>
        {
            current->p_registers.reg_rax = -1;
   41481:	48 8b 05 78 0b 01 00 	mov    0x10b78(%rip),%rax        # 52000 <current>
   41488:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   4148f:	ff 
            break;
   41490:	e9 4a 02 00 00       	jmp    416df <exception+0xaea>
        }

        int i = find_free_page();
   41495:	b8 00 00 00 00       	mov    $0x0,%eax
   4149a:	e8 c7 ee ff ff       	call   40366 <find_free_page>
   4149f:	89 45 84             	mov    %eax,-0x7c(%rbp)
        if (i == -1)
   414a2:	83 7d 84 ff          	cmpl   $0xffffffff,-0x7c(%rbp)
   414a6:	75 23                	jne    414cb <exception+0x8d6>
        {
            current->p_registers.reg_rax = -1;
   414a8:	48 8b 05 51 0b 01 00 	mov    0x10b51(%rip),%rax        # 52000 <current>
   414af:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   414b6:	ff 
            panic("Out of physical space");
   414b7:	48 8d 05 52 3c 00 00 	lea    0x3c52(%rip),%rax        # 45110 <console_clear+0x9d>
   414be:	48 89 c7             	mov    %rax,%rdi
   414c1:	b8 00 00 00 00       	mov    $0x0,%eax
   414c6:	e8 82 1d 00 00       	call   4324d <panic>
            break;
        }
        uintptr_t physaddr = PAGEADDRESS(i);
   414cb:	8b 45 84             	mov    -0x7c(%rbp),%eax
   414ce:	48 98                	cltq   
   414d0:	48 c1 e0 0c          	shl    $0xc,%rax
   414d4:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
        int r = assign_physical_page(physaddr, current->p_pid);
   414db:	48 8b 05 1e 0b 01 00 	mov    0x10b1e(%rip),%rax        # 52000 <current>
   414e2:	8b 00                	mov    (%rax),%eax
   414e4:	0f be d0             	movsbl %al,%edx
   414e7:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   414ee:	89 d6                	mov    %edx,%esi
   414f0:	48 89 c7             	mov    %rax,%rdi
   414f3:	e8 ae f4 ff ff       	call   409a6 <assign_physical_page>
   414f8:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
        if (r >= 0)
   414fe:	83 bd 74 ff ff ff 00 	cmpl   $0x0,-0x8c(%rbp)
   41505:	78 45                	js     4154c <exception+0x957>
        {
            virtual_memory_map(current->p_pagetable, addr, physaddr,
   41507:	48 8b 05 f2 0a 01 00 	mov    0x10af2(%rip),%rax        # 52000 <current>
   4150e:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   41515:	48 8b 95 78 ff ff ff 	mov    -0x88(%rbp),%rdx
   4151c:	48 8b 75 88          	mov    -0x78(%rbp),%rsi
   41520:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   41526:	b9 00 10 00 00       	mov    $0x1000,%ecx
   4152b:	48 89 c7             	mov    %rax,%rdi
   4152e:	e8 8e 21 00 00       	call   436c1 <virtual_memory_map>
                               PAGESIZE, PTE_P | PTE_W | PTE_U);
            current->p_registers.reg_rax = r;
   41533:	48 8b 05 c6 0a 01 00 	mov    0x10ac6(%rip),%rax        # 52000 <current>
   4153a:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   41540:	48 63 d2             	movslq %edx,%rdx
   41543:	48 89 50 08          	mov    %rdx,0x8(%rax)
        }
        else
        {
            panic("NOPE");
        }
        break;
   41547:	e9 93 01 00 00       	jmp    416df <exception+0xaea>
            panic("NOPE");
   4154c:	48 8d 05 d3 3b 00 00 	lea    0x3bd3(%rip),%rax        # 45126 <console_clear+0xb3>
   41553:	48 89 c7             	mov    %rax,%rdi
   41556:	b8 00 00 00 00       	mov    $0x0,%eax
   4155b:	e8 ed 1c 00 00       	call   4324d <panic>
    }

    case INT_SYS_MAPPING:
    {
        syscall_mapping(current);
   41560:	48 8b 05 99 0a 01 00 	mov    0x10a99(%rip),%rax        # 52000 <current>
   41567:	48 89 c7             	mov    %rax,%rdi
   4156a:	e8 e1 f4 ff ff       	call   40a50 <syscall_mapping>
        break;
   4156f:	e9 6b 01 00 00       	jmp    416df <exception+0xaea>
    }

    case INT_SYS_MEM_TOG:
    {
        syscall_mem_tog(current);
   41574:	48 8b 05 85 0a 01 00 	mov    0x10a85(%rip),%rax        # 52000 <current>
   4157b:	48 89 c7             	mov    %rax,%rdi
   4157e:	e8 9a f5 ff ff       	call   40b1d <syscall_mem_tog>
        break;
   41583:	e9 57 01 00 00       	jmp    416df <exception+0xaea>
    }

    case INT_TIMER:
        ++ticks;
   41588:	8b 05 92 18 01 00    	mov    0x11892(%rip),%eax        # 52e20 <ticks>
   4158e:	83 c0 01             	add    $0x1,%eax
   41591:	89 05 89 18 01 00    	mov    %eax,0x11889(%rip)        # 52e20 <ticks>
        schedule();
   41597:	e8 6b 01 00 00       	call   41707 <schedule>
        break; /* will not be reached */
   4159c:	e9 3e 01 00 00       	jmp    416df <exception+0xaea>
    return val;
}

static inline uintptr_t rcr2(void) {
    uintptr_t val;
    asm volatile("movq %%cr2,%0" : "=r" (val));
   415a1:	0f 20 d0             	mov    %cr2,%rax
   415a4:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
    return val;
   415ab:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax

    case INT_PAGEFAULT:
    {
        // Analyze faulting address and access type.
        uintptr_t addr = rcr2();
   415b2:	48 89 85 60 ff ff ff 	mov    %rax,-0xa0(%rbp)
        const char *operation = reg->reg_err & PFERR_WRITE
   415b9:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   415c0:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   415c7:	83 e0 02             	and    $0x2,%eax
                                    ? "write"
                                    : "read";
   415ca:	48 85 c0             	test   %rax,%rax
   415cd:	74 09                	je     415d8 <exception+0x9e3>
   415cf:	48 8d 05 55 3b 00 00 	lea    0x3b55(%rip),%rax        # 4512b <console_clear+0xb8>
   415d6:	eb 07                	jmp    415df <exception+0x9ea>
   415d8:	48 8d 05 52 3b 00 00 	lea    0x3b52(%rip),%rax        # 45131 <console_clear+0xbe>
        const char *operation = reg->reg_err & PFERR_WRITE
   415df:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
        const char *problem = reg->reg_err & PFERR_PRESENT
   415e6:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   415ed:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   415f4:	83 e0 01             	and    $0x1,%eax
                                  ? "protection problem"
                                  : "missing page";
   415f7:	48 85 c0             	test   %rax,%rax
   415fa:	74 09                	je     41605 <exception+0xa10>
   415fc:	48 8d 05 33 3b 00 00 	lea    0x3b33(%rip),%rax        # 45136 <console_clear+0xc3>
   41603:	eb 07                	jmp    4160c <exception+0xa17>
   41605:	48 8d 05 3d 3b 00 00 	lea    0x3b3d(%rip),%rax        # 45149 <console_clear+0xd6>
        const char *problem = reg->reg_err & PFERR_PRESENT
   4160c:	48 89 85 50 ff ff ff 	mov    %rax,-0xb0(%rbp)

        if (!(reg->reg_err & PFERR_USER))
   41613:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   4161a:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   41621:	83 e0 04             	and    $0x4,%eax
   41624:	48 85 c0             	test   %rax,%rax
   41627:	75 3d                	jne    41666 <exception+0xa71>
        {
            panic("Kernel page fault for %p (%s %s, rip=%p)!\n",
   41629:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   41630:	48 8b b0 98 00 00 00 	mov    0x98(%rax),%rsi
   41637:	48 8b 8d 50 ff ff ff 	mov    -0xb0(%rbp),%rcx
   4163e:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
   41645:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4164c:	49 89 f0             	mov    %rsi,%r8
   4164f:	48 89 c6             	mov    %rax,%rsi
   41652:	48 8d 05 ff 3a 00 00 	lea    0x3aff(%rip),%rax        # 45158 <console_clear+0xe5>
   41659:	48 89 c7             	mov    %rax,%rdi
   4165c:	b8 00 00 00 00       	mov    $0x0,%eax
   41661:	e8 e7 1b 00 00       	call   4324d <panic>
                  addr, operation, problem, reg->reg_rip);
        }
        console_printf(CPOS(24, 0), 0x0C00,
   41666:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   4166d:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
                       "Process %d page fault for %p (%s %s, rip=%p)!\n",
                       current->p_pid, addr, operation, problem, reg->reg_rip);
   41674:	48 8b 05 85 09 01 00 	mov    0x10985(%rip),%rax        # 52000 <current>
        console_printf(CPOS(24, 0), 0x0C00,
   4167b:	8b 00                	mov    (%rax),%eax
   4167d:	48 8b b5 58 ff ff ff 	mov    -0xa8(%rbp),%rsi
   41684:	48 8b 8d 60 ff ff ff 	mov    -0xa0(%rbp),%rcx
   4168b:	52                   	push   %rdx
   4168c:	ff b5 50 ff ff ff    	push   -0xb0(%rbp)
   41692:	49 89 f1             	mov    %rsi,%r9
   41695:	49 89 c8             	mov    %rcx,%r8
   41698:	89 c1                	mov    %eax,%ecx
   4169a:	48 8d 05 e7 3a 00 00 	lea    0x3ae7(%rip),%rax        # 45188 <console_clear+0x115>
   416a1:	48 89 c2             	mov    %rax,%rdx
   416a4:	be 00 0c 00 00       	mov    $0xc00,%esi
   416a9:	bf 80 07 00 00       	mov    $0x780,%edi
   416ae:	b8 00 00 00 00       	mov    $0x0,%eax
   416b3:	e8 45 38 00 00       	call   44efd <console_printf>
   416b8:	48 83 c4 10          	add    $0x10,%rsp
        current->p_state = P_BROKEN;
   416bc:	48 8b 05 3d 09 01 00 	mov    0x1093d(%rip),%rax        # 52000 <current>
   416c3:	c7 80 c8 00 00 00 03 	movl   $0x3,0xc8(%rax)
   416ca:	00 00 00 
        break;
   416cd:	eb 10                	jmp    416df <exception+0xaea>
    }

    default:
        default_exception(current);
   416cf:	48 8b 05 2a 09 01 00 	mov    0x1092a(%rip),%rax        # 52000 <current>
   416d6:	48 89 c7             	mov    %rax,%rdi
   416d9:	e8 98 1c 00 00       	call   43376 <default_exception>
        break; /* will not be reached */
   416de:	90                   	nop
    }

    // Return to the current process (or run something else).
    if (current->p_state == P_RUNNABLE)
   416df:	48 8b 05 1a 09 01 00 	mov    0x1091a(%rip),%rax        # 52000 <current>
   416e6:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   416ec:	83 f8 01             	cmp    $0x1,%eax
   416ef:	75 0f                	jne    41700 <exception+0xb0b>
    {
        run(current);
   416f1:	48 8b 05 08 09 01 00 	mov    0x10908(%rip),%rax        # 52000 <current>
   416f8:	48 89 c7             	mov    %rax,%rdi
   416fb:	e8 86 00 00 00       	call   41786 <run>
    }
    else
    {
        schedule();
   41700:	e8 02 00 00 00       	call   41707 <schedule>
    }
}
   41705:	c9                   	leave  
   41706:	c3                   	ret    

0000000000041707 <schedule>:
// schedule
//    Pick the next process to run and then run it.
//    If there are no runnable processes, spins forever.

void schedule(void)
{
   41707:	f3 0f 1e fa          	endbr64 
   4170b:	55                   	push   %rbp
   4170c:	48 89 e5             	mov    %rsp,%rbp
   4170f:	48 83 ec 10          	sub    $0x10,%rsp
    pid_t pid = current->p_pid;
   41713:	48 8b 05 e6 08 01 00 	mov    0x108e6(%rip),%rax        # 52000 <current>
   4171a:	8b 00                	mov    (%rax),%eax
   4171c:	89 45 fc             	mov    %eax,-0x4(%rbp)
    while (1)
    {
        pid = (pid + 1) % NPROC;
   4171f:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41722:	83 c0 01             	add    $0x1,%eax
   41725:	99                   	cltd   
   41726:	c1 ea 1c             	shr    $0x1c,%edx
   41729:	01 d0                	add    %edx,%eax
   4172b:	83 e0 0f             	and    $0xf,%eax
   4172e:	29 d0                	sub    %edx,%eax
   41730:	89 45 fc             	mov    %eax,-0x4(%rbp)
        if (processes[pid].p_state == P_RUNNABLE)
   41733:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41736:	48 63 d0             	movslq %eax,%rdx
   41739:	48 89 d0             	mov    %rdx,%rax
   4173c:	48 c1 e0 03          	shl    $0x3,%rax
   41740:	48 29 d0             	sub    %rdx,%rax
   41743:	48 c1 e0 05          	shl    $0x5,%rax
   41747:	48 89 c2             	mov    %rax,%rdx
   4174a:	48 8d 05 97 09 01 00 	lea    0x10997(%rip),%rax        # 520e8 <processes+0xc8>
   41751:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   41754:	83 f8 01             	cmp    $0x1,%eax
   41757:	75 26                	jne    4177f <schedule+0x78>
        {
            run(&processes[pid]);
   41759:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4175c:	48 63 d0             	movslq %eax,%rdx
   4175f:	48 89 d0             	mov    %rdx,%rax
   41762:	48 c1 e0 03          	shl    $0x3,%rax
   41766:	48 29 d0             	sub    %rdx,%rax
   41769:	48 c1 e0 05          	shl    $0x5,%rax
   4176d:	48 8d 15 ac 08 01 00 	lea    0x108ac(%rip),%rdx        # 52020 <processes>
   41774:	48 01 d0             	add    %rdx,%rax
   41777:	48 89 c7             	mov    %rax,%rdi
   4177a:	e8 07 00 00 00       	call   41786 <run>
        }
        // If Control-C was typed, exit the virtual machine.
        check_keyboard();
   4177f:	e8 67 19 00 00       	call   430eb <check_keyboard>
        pid = (pid + 1) % NPROC;
   41784:	eb 99                	jmp    4171f <schedule+0x18>

0000000000041786 <run>:
//    `p->p_registers` using the `popal`, `popl`, and `iret` instructions.
//
//    As a side effect, sets `current = p`.

void run(proc *p)
{
   41786:	f3 0f 1e fa          	endbr64 
   4178a:	55                   	push   %rbp
   4178b:	48 89 e5             	mov    %rsp,%rbp
   4178e:	48 83 ec 10          	sub    $0x10,%rsp
   41792:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    assert(p->p_state == P_RUNNABLE);
   41796:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4179a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   417a0:	83 f8 01             	cmp    $0x1,%eax
   417a3:	74 1e                	je     417c3 <run+0x3d>
   417a5:	48 8d 05 b8 3a 00 00 	lea    0x3ab8(%rip),%rax        # 45264 <console_clear+0x1f1>
   417ac:	48 89 c2             	mov    %rax,%rdx
   417af:	be ba 02 00 00       	mov    $0x2ba,%esi
   417b4:	48 8d 05 3d 39 00 00 	lea    0x393d(%rip),%rax        # 450f8 <console_clear+0x85>
   417bb:	48 89 c7             	mov    %rax,%rdi
   417be:	e8 7a 1b 00 00       	call   4333d <assert_fail>
    current = p;
   417c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   417c7:	48 89 05 32 08 01 00 	mov    %rax,0x10832(%rip)        # 52000 <current>

    // Load the process's current pagetable.
    set_pagetable(p->p_pagetable);
   417ce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   417d2:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   417d9:	48 89 c7             	mov    %rax,%rdi
   417dc:	e8 6e 1d 00 00       	call   4354f <set_pagetable>

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(&p->p_registers);
   417e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   417e5:	48 83 c0 08          	add    $0x8,%rax
   417e9:	48 89 c7             	mov    %rax,%rdi
   417ec:	e8 d2 e8 ff ff       	call   400c3 <exception_return>

00000000000417f1 <pageinfo_init>:

// pageinfo_init
//    Initialize the `pageinfo[]` array.

void pageinfo_init(void)
{
   417f1:	f3 0f 1e fa          	endbr64 
   417f5:	55                   	push   %rbp
   417f6:	48 89 e5             	mov    %rsp,%rbp
   417f9:	48 83 ec 10          	sub    $0x10,%rsp
    extern char end[];

    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE)
   417fd:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   41804:	00 
   41805:	e9 93 00 00 00       	jmp    4189d <pageinfo_init+0xac>
    {
        int owner;
        if (physical_memory_isreserved(addr))
   4180a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4180e:	48 89 c7             	mov    %rax,%rdi
   41811:	e8 0f 11 00 00       	call   42925 <physical_memory_isreserved>
   41816:	85 c0                	test   %eax,%eax
   41818:	74 09                	je     41823 <pageinfo_init+0x32>
        {
            owner = PO_RESERVED;
   4181a:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%rbp)
   41821:	eb 31                	jmp    41854 <pageinfo_init+0x63>
        }
        else if ((addr >= KERNEL_START_ADDR && addr < (uintptr_t)end) || addr == KERNEL_STACK_TOP - PAGESIZE)
   41823:	48 81 7d f8 ff ff 03 	cmpq   $0x3ffff,-0x8(%rbp)
   4182a:	00 
   4182b:	76 0d                	jbe    4183a <pageinfo_init+0x49>
   4182d:	48 8d 05 d4 97 01 00 	lea    0x197d4(%rip),%rax        # 5b008 <end>
   41834:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41838:	72 0a                	jb     41844 <pageinfo_init+0x53>
   4183a:	48 81 7d f8 00 f0 07 	cmpq   $0x7f000,-0x8(%rbp)
   41841:	00 
   41842:	75 09                	jne    4184d <pageinfo_init+0x5c>
        {
            owner = PO_KERNEL;
   41844:	c7 45 f4 fe ff ff ff 	movl   $0xfffffffe,-0xc(%rbp)
   4184b:	eb 07                	jmp    41854 <pageinfo_init+0x63>
        }
        else
        {
            owner = PO_FREE;
   4184d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
        }
        pageinfo[PAGENUMBER(addr)].owner = owner;
   41854:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41858:	48 c1 e8 0c          	shr    $0xc,%rax
   4185c:	89 c2                	mov    %eax,%edx
   4185e:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41861:	89 c1                	mov    %eax,%ecx
   41863:	48 63 c2             	movslq %edx,%rax
   41866:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4186a:	48 8d 05 cf 15 01 00 	lea    0x115cf(%rip),%rax        # 52e40 <pageinfo>
   41871:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
        pageinfo[PAGENUMBER(addr)].refcount = (owner != PO_FREE);
   41874:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   41878:	0f 95 c2             	setne  %dl
   4187b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4187f:	48 c1 e8 0c          	shr    $0xc,%rax
   41883:	89 d1                	mov    %edx,%ecx
   41885:	48 98                	cltq   
   41887:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4188b:	48 8d 05 af 15 01 00 	lea    0x115af(%rip),%rax        # 52e41 <pageinfo+0x1>
   41892:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE)
   41895:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   4189c:	00 
   4189d:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   418a4:	00 
   418a5:	0f 86 5f ff ff ff    	jbe    4180a <pageinfo_init+0x19>
    }
}
   418ab:	90                   	nop
   418ac:	90                   	nop
   418ad:	c9                   	leave  
   418ae:	c3                   	ret    

00000000000418af <check_page_table_mappings>:
// check_page_table_mappings
//    Check operating system invariants about kernel mappings for page
//    table `pt`. Panic if any of the invariants are false.

void check_page_table_mappings(x86_64_pagetable *pt)
{
   418af:	f3 0f 1e fa          	endbr64 
   418b3:	55                   	push   %rbp
   418b4:	48 89 e5             	mov    %rsp,%rbp
   418b7:	48 83 ec 50          	sub    $0x50,%rsp
   418bb:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    extern char start_data[], end[];
    assert(PTE_ADDR(pt) == (uintptr_t)pt);
   418bf:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   418c3:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   418c9:	48 89 c2             	mov    %rax,%rdx
   418cc:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   418d0:	48 39 c2             	cmp    %rax,%rdx
   418d3:	74 1e                	je     418f3 <check_page_table_mappings+0x44>
   418d5:	48 8d 05 a1 39 00 00 	lea    0x39a1(%rip),%rax        # 4527d <console_clear+0x20a>
   418dc:	48 89 c2             	mov    %rax,%rdx
   418df:	be ea 02 00 00       	mov    $0x2ea,%esi
   418e4:	48 8d 05 0d 38 00 00 	lea    0x380d(%rip),%rax        # 450f8 <console_clear+0x85>
   418eb:	48 89 c7             	mov    %rax,%rdi
   418ee:	e8 4a 1a 00 00       	call   4333d <assert_fail>

    // kernel memory is identity mapped; data is writable
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t)end;
   418f3:	48 c7 45 f8 00 00 04 	movq   $0x40000,-0x8(%rbp)
   418fa:	00 
   418fb:	e9 b5 00 00 00       	jmp    419b5 <check_page_table_mappings+0x106>
         va += PAGESIZE)
    {
        vamapping vam = virtual_memory_lookup(pt, va);
   41900:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   41904:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   41908:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   4190c:	48 89 ce             	mov    %rcx,%rsi
   4190f:	48 89 c7             	mov    %rax,%rdi
   41912:	e8 ee 21 00 00       	call   43b05 <virtual_memory_lookup>
        if (vam.pa != va)
   41917:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4191b:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   4191f:	74 2c                	je     4194d <check_page_table_mappings+0x9e>
        {
            console_printf(CPOS(22, 0), 0xC000, "%p vs %p\n", va, vam.pa);
   41921:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   41925:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41929:	49 89 d0             	mov    %rdx,%r8
   4192c:	48 89 c1             	mov    %rax,%rcx
   4192f:	48 8d 05 65 39 00 00 	lea    0x3965(%rip),%rax        # 4529b <console_clear+0x228>
   41936:	48 89 c2             	mov    %rax,%rdx
   41939:	be 00 c0 00 00       	mov    $0xc000,%esi
   4193e:	bf e0 06 00 00       	mov    $0x6e0,%edi
   41943:	b8 00 00 00 00       	mov    $0x0,%eax
   41948:	e8 b0 35 00 00       	call   44efd <console_printf>
        }
        assert(vam.pa == va);
   4194d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41951:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41955:	74 1e                	je     41975 <check_page_table_mappings+0xc6>
   41957:	48 8d 05 47 39 00 00 	lea    0x3947(%rip),%rax        # 452a5 <console_clear+0x232>
   4195e:	48 89 c2             	mov    %rax,%rdx
   41961:	be f5 02 00 00       	mov    $0x2f5,%esi
   41966:	48 8d 05 8b 37 00 00 	lea    0x378b(%rip),%rax        # 450f8 <console_clear+0x85>
   4196d:	48 89 c7             	mov    %rax,%rdi
   41970:	e8 c8 19 00 00       	call   4333d <assert_fail>
        if (va >= (uintptr_t)start_data)
   41975:	48 8d 05 84 46 00 00 	lea    0x4684(%rip),%rax        # 46000 <disp_global>
   4197c:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41980:	72 2b                	jb     419ad <check_page_table_mappings+0xfe>
        {
            assert(vam.perm & PTE_W);
   41982:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41985:	48 98                	cltq   
   41987:	83 e0 02             	and    $0x2,%eax
   4198a:	48 85 c0             	test   %rax,%rax
   4198d:	75 1e                	jne    419ad <check_page_table_mappings+0xfe>
   4198f:	48 8d 05 1c 39 00 00 	lea    0x391c(%rip),%rax        # 452b2 <console_clear+0x23f>
   41996:	48 89 c2             	mov    %rax,%rdx
   41999:	be f8 02 00 00       	mov    $0x2f8,%esi
   4199e:	48 8d 05 53 37 00 00 	lea    0x3753(%rip),%rax        # 450f8 <console_clear+0x85>
   419a5:	48 89 c7             	mov    %rax,%rdi
   419a8:	e8 90 19 00 00       	call   4333d <assert_fail>
         va += PAGESIZE)
   419ad:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   419b4:	00 
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t)end;
   419b5:	48 8d 05 4c 96 01 00 	lea    0x1964c(%rip),%rax        # 5b008 <end>
   419bc:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   419c0:	0f 82 3a ff ff ff    	jb     41900 <check_page_table_mappings+0x51>
        }
    }

    // kernel stack is identity mapped and writable
    uintptr_t kstack = KERNEL_STACK_TOP - PAGESIZE;
   419c6:	48 c7 45 f0 00 f0 07 	movq   $0x7f000,-0x10(%rbp)
   419cd:	00 
    vamapping vam = virtual_memory_lookup(pt, kstack);
   419ce:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
   419d2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   419d6:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   419da:	48 89 ce             	mov    %rcx,%rsi
   419dd:	48 89 c7             	mov    %rax,%rdi
   419e0:	e8 20 21 00 00       	call   43b05 <virtual_memory_lookup>
    assert(vam.pa == kstack);
   419e5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   419e9:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   419ed:	74 1e                	je     41a0d <check_page_table_mappings+0x15e>
   419ef:	48 8d 05 cd 38 00 00 	lea    0x38cd(%rip),%rax        # 452c3 <console_clear+0x250>
   419f6:	48 89 c2             	mov    %rax,%rdx
   419f9:	be ff 02 00 00       	mov    $0x2ff,%esi
   419fe:	48 8d 05 f3 36 00 00 	lea    0x36f3(%rip),%rax        # 450f8 <console_clear+0x85>
   41a05:	48 89 c7             	mov    %rax,%rdi
   41a08:	e8 30 19 00 00       	call   4333d <assert_fail>
    assert(vam.perm & PTE_W);
   41a0d:	8b 45 e8             	mov    -0x18(%rbp),%eax
   41a10:	48 98                	cltq   
   41a12:	83 e0 02             	and    $0x2,%eax
   41a15:	48 85 c0             	test   %rax,%rax
   41a18:	75 1e                	jne    41a38 <check_page_table_mappings+0x189>
   41a1a:	48 8d 05 91 38 00 00 	lea    0x3891(%rip),%rax        # 452b2 <console_clear+0x23f>
   41a21:	48 89 c2             	mov    %rax,%rdx
   41a24:	be 00 03 00 00       	mov    $0x300,%esi
   41a29:	48 8d 05 c8 36 00 00 	lea    0x36c8(%rip),%rax        # 450f8 <console_clear+0x85>
   41a30:	48 89 c7             	mov    %rax,%rdi
   41a33:	e8 05 19 00 00       	call   4333d <assert_fail>
}
   41a38:	90                   	nop
   41a39:	c9                   	leave  
   41a3a:	c3                   	ret    

0000000000041a3b <check_page_table_ownership>:

static void check_page_table_ownership_level(x86_64_pagetable *pt, int level,
                                             int owner, int refcount);

void check_page_table_ownership(x86_64_pagetable *pt, pid_t pid)
{
   41a3b:	f3 0f 1e fa          	endbr64 
   41a3f:	55                   	push   %rbp
   41a40:	48 89 e5             	mov    %rsp,%rbp
   41a43:	48 83 ec 20          	sub    $0x20,%rsp
   41a47:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   41a4b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    // calculate expected reference count for page tables
    int owner = pid;
   41a4e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41a51:	89 45 fc             	mov    %eax,-0x4(%rbp)
    int expected_refcount = 1;
   41a54:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
    if (pt == kernel_pagetable)
   41a5b:	48 8b 05 9e 35 01 00 	mov    0x1359e(%rip),%rax        # 55000 <kernel_pagetable>
   41a62:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
   41a66:	75 71                	jne    41ad9 <check_page_table_ownership+0x9e>
    {
        owner = PO_KERNEL;
   41a68:	c7 45 fc fe ff ff ff 	movl   $0xfffffffe,-0x4(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid)
   41a6f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   41a76:	eb 5b                	jmp    41ad3 <check_page_table_ownership+0x98>
        {
            if (processes[xpid].p_state != P_FREE && processes[xpid].p_pagetable == kernel_pagetable)
   41a78:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41a7b:	48 63 d0             	movslq %eax,%rdx
   41a7e:	48 89 d0             	mov    %rdx,%rax
   41a81:	48 c1 e0 03          	shl    $0x3,%rax
   41a85:	48 29 d0             	sub    %rdx,%rax
   41a88:	48 c1 e0 05          	shl    $0x5,%rax
   41a8c:	48 89 c2             	mov    %rax,%rdx
   41a8f:	48 8d 05 52 06 01 00 	lea    0x10652(%rip),%rax        # 520e8 <processes+0xc8>
   41a96:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   41a99:	85 c0                	test   %eax,%eax
   41a9b:	74 32                	je     41acf <check_page_table_ownership+0x94>
   41a9d:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41aa0:	48 63 d0             	movslq %eax,%rdx
   41aa3:	48 89 d0             	mov    %rdx,%rax
   41aa6:	48 c1 e0 03          	shl    $0x3,%rax
   41aaa:	48 29 d0             	sub    %rdx,%rax
   41aad:	48 c1 e0 05          	shl    $0x5,%rax
   41ab1:	48 89 c2             	mov    %rax,%rdx
   41ab4:	48 8d 05 35 06 01 00 	lea    0x10635(%rip),%rax        # 520f0 <processes+0xd0>
   41abb:	48 8b 14 02          	mov    (%rdx,%rax,1),%rdx
   41abf:	48 8b 05 3a 35 01 00 	mov    0x1353a(%rip),%rax        # 55000 <kernel_pagetable>
   41ac6:	48 39 c2             	cmp    %rax,%rdx
   41ac9:	75 04                	jne    41acf <check_page_table_ownership+0x94>
            {
                ++expected_refcount;
   41acb:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid)
   41acf:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   41ad3:	83 7d f4 0f          	cmpl   $0xf,-0xc(%rbp)
   41ad7:	7e 9f                	jle    41a78 <check_page_table_ownership+0x3d>
            }
        }
    }
    check_page_table_ownership_level(pt, 0, owner, expected_refcount);
   41ad9:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   41adc:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41adf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41ae3:	be 00 00 00 00       	mov    $0x0,%esi
   41ae8:	48 89 c7             	mov    %rax,%rdi
   41aeb:	e8 03 00 00 00       	call   41af3 <check_page_table_ownership_level>
}
   41af0:	90                   	nop
   41af1:	c9                   	leave  
   41af2:	c3                   	ret    

0000000000041af3 <check_page_table_ownership_level>:

static void check_page_table_ownership_level(x86_64_pagetable *pt, int level,
                                             int owner, int refcount)
{
   41af3:	f3 0f 1e fa          	endbr64 
   41af7:	55                   	push   %rbp
   41af8:	48 89 e5             	mov    %rsp,%rbp
   41afb:	48 83 ec 30          	sub    $0x30,%rsp
   41aff:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   41b03:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   41b06:	89 55 e0             	mov    %edx,-0x20(%rbp)
   41b09:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    assert(PAGENUMBER(pt) < NPAGES);
   41b0c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41b10:	48 c1 e8 0c          	shr    $0xc,%rax
   41b14:	3d ff 01 00 00       	cmp    $0x1ff,%eax
   41b19:	7e 1e                	jle    41b39 <check_page_table_ownership_level+0x46>
   41b1b:	48 8d 05 b2 37 00 00 	lea    0x37b2(%rip),%rax        # 452d4 <console_clear+0x261>
   41b22:	48 89 c2             	mov    %rax,%rdx
   41b25:	be 20 03 00 00       	mov    $0x320,%esi
   41b2a:	48 8d 05 c7 35 00 00 	lea    0x35c7(%rip),%rax        # 450f8 <console_clear+0x85>
   41b31:	48 89 c7             	mov    %rax,%rdi
   41b34:	e8 04 18 00 00       	call   4333d <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].owner == owner);
   41b39:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41b3d:	48 c1 e8 0c          	shr    $0xc,%rax
   41b41:	48 98                	cltq   
   41b43:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41b47:	48 8d 05 f2 12 01 00 	lea    0x112f2(%rip),%rax        # 52e40 <pageinfo>
   41b4e:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41b52:	0f be c0             	movsbl %al,%eax
   41b55:	39 45 e0             	cmp    %eax,-0x20(%rbp)
   41b58:	74 1e                	je     41b78 <check_page_table_ownership_level+0x85>
   41b5a:	48 8d 05 8f 37 00 00 	lea    0x378f(%rip),%rax        # 452f0 <console_clear+0x27d>
   41b61:	48 89 c2             	mov    %rax,%rdx
   41b64:	be 21 03 00 00       	mov    $0x321,%esi
   41b69:	48 8d 05 88 35 00 00 	lea    0x3588(%rip),%rax        # 450f8 <console_clear+0x85>
   41b70:	48 89 c7             	mov    %rax,%rdi
   41b73:	e8 c5 17 00 00       	call   4333d <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].refcount == refcount);
   41b78:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41b7c:	48 c1 e8 0c          	shr    $0xc,%rax
   41b80:	48 98                	cltq   
   41b82:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41b86:	48 8d 05 b4 12 01 00 	lea    0x112b4(%rip),%rax        # 52e41 <pageinfo+0x1>
   41b8d:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41b91:	0f be c0             	movsbl %al,%eax
   41b94:	39 45 dc             	cmp    %eax,-0x24(%rbp)
   41b97:	74 1e                	je     41bb7 <check_page_table_ownership_level+0xc4>
   41b99:	48 8d 05 78 37 00 00 	lea    0x3778(%rip),%rax        # 45318 <console_clear+0x2a5>
   41ba0:	48 89 c2             	mov    %rax,%rdx
   41ba3:	be 22 03 00 00       	mov    $0x322,%esi
   41ba8:	48 8d 05 49 35 00 00 	lea    0x3549(%rip),%rax        # 450f8 <console_clear+0x85>
   41baf:	48 89 c7             	mov    %rax,%rdi
   41bb2:	e8 86 17 00 00       	call   4333d <assert_fail>
    if (level < 3)
   41bb7:	83 7d e4 02          	cmpl   $0x2,-0x1c(%rbp)
   41bbb:	7f 5b                	jg     41c18 <check_page_table_ownership_level+0x125>
    {
        for (int index = 0; index < NPAGETABLEENTRIES; ++index)
   41bbd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41bc4:	eb 49                	jmp    41c0f <check_page_table_ownership_level+0x11c>
        {
            if (pt->entry[index])
   41bc6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41bca:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41bcd:	48 63 d2             	movslq %edx,%rdx
   41bd0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   41bd4:	48 85 c0             	test   %rax,%rax
   41bd7:	74 32                	je     41c0b <check_page_table_ownership_level+0x118>
            {
                x86_64_pagetable *nextpt =
                    (x86_64_pagetable *)PTE_ADDR(pt->entry[index]);
   41bd9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41bdd:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41be0:	48 63 d2             	movslq %edx,%rdx
   41be3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   41be7:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
                x86_64_pagetable *nextpt =
   41bed:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
                check_page_table_ownership_level(nextpt, level + 1, owner, 1);
   41bf1:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41bf4:	8d 70 01             	lea    0x1(%rax),%esi
   41bf7:	8b 55 e0             	mov    -0x20(%rbp),%edx
   41bfa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   41bfe:	b9 01 00 00 00       	mov    $0x1,%ecx
   41c03:	48 89 c7             	mov    %rax,%rdi
   41c06:	e8 e8 fe ff ff       	call   41af3 <check_page_table_ownership_level>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index)
   41c0b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41c0f:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   41c16:	7e ae                	jle    41bc6 <check_page_table_ownership_level+0xd3>
            }
        }
    }
}
   41c18:	90                   	nop
   41c19:	c9                   	leave  
   41c1a:	c3                   	ret    

0000000000041c1b <check_virtual_memory>:
// check_virtual_memory
//    Check operating system invariants about virtual memory. Panic if any
//    of the invariants are false.

void check_virtual_memory(void)
{
   41c1b:	f3 0f 1e fa          	endbr64 
   41c1f:	55                   	push   %rbp
   41c20:	48 89 e5             	mov    %rsp,%rbp
   41c23:	48 83 ec 10          	sub    $0x10,%rsp
    // Process 0 must never be used.
    assert(processes[0].p_state == P_FREE);
   41c27:	8b 05 bb 04 01 00    	mov    0x104bb(%rip),%eax        # 520e8 <processes+0xc8>
   41c2d:	85 c0                	test   %eax,%eax
   41c2f:	74 1e                	je     41c4f <check_virtual_memory+0x34>
   41c31:	48 8d 05 10 37 00 00 	lea    0x3710(%rip),%rax        # 45348 <console_clear+0x2d5>
   41c38:	48 89 c2             	mov    %rax,%rdx
   41c3b:	be 38 03 00 00       	mov    $0x338,%esi
   41c40:	48 8d 05 b1 34 00 00 	lea    0x34b1(%rip),%rax        # 450f8 <console_clear+0x85>
   41c47:	48 89 c7             	mov    %rax,%rdi
   41c4a:	e8 ee 16 00 00       	call   4333d <assert_fail>
    // that don't have their own page tables.
    // Active processes have their own page tables. A process page table
    // should be owned by that process and have reference count 1.
    // All level-2-4 page tables must have reference count 1.

    check_page_table_mappings(kernel_pagetable);
   41c4f:	48 8b 05 aa 33 01 00 	mov    0x133aa(%rip),%rax        # 55000 <kernel_pagetable>
   41c56:	48 89 c7             	mov    %rax,%rdi
   41c59:	e8 51 fc ff ff       	call   418af <check_page_table_mappings>
    check_page_table_ownership(kernel_pagetable, -1);
   41c5e:	48 8b 05 9b 33 01 00 	mov    0x1339b(%rip),%rax        # 55000 <kernel_pagetable>
   41c65:	be ff ff ff ff       	mov    $0xffffffff,%esi
   41c6a:	48 89 c7             	mov    %rax,%rdi
   41c6d:	e8 c9 fd ff ff       	call   41a3b <check_page_table_ownership>

    for (int pid = 0; pid < NPROC; ++pid)
   41c72:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41c79:	e9 b4 00 00 00       	jmp    41d32 <check_virtual_memory+0x117>
    {
        if (processes[pid].p_state != P_FREE && processes[pid].p_pagetable != kernel_pagetable)
   41c7e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41c81:	48 63 d0             	movslq %eax,%rdx
   41c84:	48 89 d0             	mov    %rdx,%rax
   41c87:	48 c1 e0 03          	shl    $0x3,%rax
   41c8b:	48 29 d0             	sub    %rdx,%rax
   41c8e:	48 c1 e0 05          	shl    $0x5,%rax
   41c92:	48 89 c2             	mov    %rax,%rdx
   41c95:	48 8d 05 4c 04 01 00 	lea    0x1044c(%rip),%rax        # 520e8 <processes+0xc8>
   41c9c:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   41c9f:	85 c0                	test   %eax,%eax
   41ca1:	0f 84 87 00 00 00    	je     41d2e <check_virtual_memory+0x113>
   41ca7:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41caa:	48 63 d0             	movslq %eax,%rdx
   41cad:	48 89 d0             	mov    %rdx,%rax
   41cb0:	48 c1 e0 03          	shl    $0x3,%rax
   41cb4:	48 29 d0             	sub    %rdx,%rax
   41cb7:	48 c1 e0 05          	shl    $0x5,%rax
   41cbb:	48 89 c2             	mov    %rax,%rdx
   41cbe:	48 8d 05 2b 04 01 00 	lea    0x1042b(%rip),%rax        # 520f0 <processes+0xd0>
   41cc5:	48 8b 14 02          	mov    (%rdx,%rax,1),%rdx
   41cc9:	48 8b 05 30 33 01 00 	mov    0x13330(%rip),%rax        # 55000 <kernel_pagetable>
   41cd0:	48 39 c2             	cmp    %rax,%rdx
   41cd3:	74 59                	je     41d2e <check_virtual_memory+0x113>
        {
            check_page_table_mappings(processes[pid].p_pagetable);
   41cd5:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41cd8:	48 63 d0             	movslq %eax,%rdx
   41cdb:	48 89 d0             	mov    %rdx,%rax
   41cde:	48 c1 e0 03          	shl    $0x3,%rax
   41ce2:	48 29 d0             	sub    %rdx,%rax
   41ce5:	48 c1 e0 05          	shl    $0x5,%rax
   41ce9:	48 89 c2             	mov    %rax,%rdx
   41cec:	48 8d 05 fd 03 01 00 	lea    0x103fd(%rip),%rax        # 520f0 <processes+0xd0>
   41cf3:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   41cf7:	48 89 c7             	mov    %rax,%rdi
   41cfa:	e8 b0 fb ff ff       	call   418af <check_page_table_mappings>
            check_page_table_ownership(processes[pid].p_pagetable, pid);
   41cff:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41d02:	48 63 d0             	movslq %eax,%rdx
   41d05:	48 89 d0             	mov    %rdx,%rax
   41d08:	48 c1 e0 03          	shl    $0x3,%rax
   41d0c:	48 29 d0             	sub    %rdx,%rax
   41d0f:	48 c1 e0 05          	shl    $0x5,%rax
   41d13:	48 89 c2             	mov    %rax,%rdx
   41d16:	48 8d 05 d3 03 01 00 	lea    0x103d3(%rip),%rax        # 520f0 <processes+0xd0>
   41d1d:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   41d21:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41d24:	89 d6                	mov    %edx,%esi
   41d26:	48 89 c7             	mov    %rax,%rdi
   41d29:	e8 0d fd ff ff       	call   41a3b <check_page_table_ownership>
    for (int pid = 0; pid < NPROC; ++pid)
   41d2e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41d32:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   41d36:	0f 8e 42 ff ff ff    	jle    41c7e <check_virtual_memory+0x63>
        }
    }

    // Check that all referenced pages refer to active processes
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn)
   41d3c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   41d43:	e9 8b 00 00 00       	jmp    41dd3 <check_virtual_memory+0x1b8>
    {
        if (pageinfo[pn].refcount > 0 && pageinfo[pn].owner >= 0)
   41d48:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41d4b:	48 98                	cltq   
   41d4d:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41d51:	48 8d 05 e9 10 01 00 	lea    0x110e9(%rip),%rax        # 52e41 <pageinfo+0x1>
   41d58:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41d5c:	84 c0                	test   %al,%al
   41d5e:	7e 6f                	jle    41dcf <check_virtual_memory+0x1b4>
   41d60:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41d63:	48 98                	cltq   
   41d65:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41d69:	48 8d 05 d0 10 01 00 	lea    0x110d0(%rip),%rax        # 52e40 <pageinfo>
   41d70:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41d74:	84 c0                	test   %al,%al
   41d76:	78 57                	js     41dcf <check_virtual_memory+0x1b4>
        {
            assert(processes[pageinfo[pn].owner].p_state != P_FREE);
   41d78:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41d7b:	48 98                	cltq   
   41d7d:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41d81:	48 8d 05 b8 10 01 00 	lea    0x110b8(%rip),%rax        # 52e40 <pageinfo>
   41d88:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41d8c:	0f be c0             	movsbl %al,%eax
   41d8f:	48 63 d0             	movslq %eax,%rdx
   41d92:	48 89 d0             	mov    %rdx,%rax
   41d95:	48 c1 e0 03          	shl    $0x3,%rax
   41d99:	48 29 d0             	sub    %rdx,%rax
   41d9c:	48 c1 e0 05          	shl    $0x5,%rax
   41da0:	48 89 c2             	mov    %rax,%rdx
   41da3:	48 8d 05 3e 03 01 00 	lea    0x1033e(%rip),%rax        # 520e8 <processes+0xc8>
   41daa:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   41dad:	85 c0                	test   %eax,%eax
   41daf:	75 1e                	jne    41dcf <check_virtual_memory+0x1b4>
   41db1:	48 8d 05 b0 35 00 00 	lea    0x35b0(%rip),%rax        # 45368 <console_clear+0x2f5>
   41db8:	48 89 c2             	mov    %rax,%rdx
   41dbb:	be 52 03 00 00       	mov    $0x352,%esi
   41dc0:	48 8d 05 31 33 00 00 	lea    0x3331(%rip),%rax        # 450f8 <console_clear+0x85>
   41dc7:	48 89 c7             	mov    %rax,%rdi
   41dca:	e8 6e 15 00 00       	call   4333d <assert_fail>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn)
   41dcf:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   41dd3:	81 7d f8 ff 01 00 00 	cmpl   $0x1ff,-0x8(%rbp)
   41dda:	0f 8e 68 ff ff ff    	jle    41d48 <check_virtual_memory+0x12d>
        }
    }
}
   41de0:	90                   	nop
   41de1:	90                   	nop
   41de2:	c9                   	leave  
   41de3:	c3                   	ret    

0000000000041de4 <memshow_physical>:
    'E' | 0x0E00, 'F' | 0x0F00, 'S'};
#define SHARED_COLOR memstate_colors[18]
#define SHARED

void memshow_physical(void)
{
   41de4:	f3 0f 1e fa          	endbr64 
   41de8:	55                   	push   %rbp
   41de9:	48 89 e5             	mov    %rsp,%rbp
   41dec:	48 83 ec 10          	sub    $0x10,%rsp
    console_printf(CPOS(0, 32), 0x0F00, "PHYSICAL MEMORY");
   41df0:	48 8d 05 cf 35 00 00 	lea    0x35cf(%rip),%rax        # 453c6 <memstate_colors+0x26>
   41df7:	48 89 c2             	mov    %rax,%rdx
   41dfa:	be 00 0f 00 00       	mov    $0xf00,%esi
   41dff:	bf 20 00 00 00       	mov    $0x20,%edi
   41e04:	b8 00 00 00 00       	mov    $0x0,%eax
   41e09:	e8 ef 30 00 00       	call   44efd <console_printf>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn)
   41e0e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41e15:	e9 1b 01 00 00       	jmp    41f35 <memshow_physical+0x151>
    {
        if (pn % 64 == 0)
   41e1a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41e1d:	83 e0 3f             	and    $0x3f,%eax
   41e20:	85 c0                	test   %eax,%eax
   41e22:	75 40                	jne    41e64 <memshow_physical+0x80>
        {
            console_printf(CPOS(1 + pn / 64, 3), 0x0F00, "0x%06X ", pn << 12);
   41e24:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41e27:	c1 e0 0c             	shl    $0xc,%eax
   41e2a:	89 c2                	mov    %eax,%edx
   41e2c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41e2f:	8d 48 3f             	lea    0x3f(%rax),%ecx
   41e32:	85 c0                	test   %eax,%eax
   41e34:	0f 48 c1             	cmovs  %ecx,%eax
   41e37:	c1 f8 06             	sar    $0x6,%eax
   41e3a:	8d 48 01             	lea    0x1(%rax),%ecx
   41e3d:	89 c8                	mov    %ecx,%eax
   41e3f:	c1 e0 02             	shl    $0x2,%eax
   41e42:	01 c8                	add    %ecx,%eax
   41e44:	c1 e0 04             	shl    $0x4,%eax
   41e47:	83 c0 03             	add    $0x3,%eax
   41e4a:	89 d1                	mov    %edx,%ecx
   41e4c:	48 8d 15 83 35 00 00 	lea    0x3583(%rip),%rdx        # 453d6 <memstate_colors+0x36>
   41e53:	be 00 0f 00 00       	mov    $0xf00,%esi
   41e58:	89 c7                	mov    %eax,%edi
   41e5a:	b8 00 00 00 00       	mov    $0x0,%eax
   41e5f:	e8 99 30 00 00       	call   44efd <console_printf>
        }

        int owner = pageinfo[pn].owner;
   41e64:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41e67:	48 98                	cltq   
   41e69:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41e6d:	48 8d 05 cc 0f 01 00 	lea    0x10fcc(%rip),%rax        # 52e40 <pageinfo>
   41e74:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41e78:	0f be c0             	movsbl %al,%eax
   41e7b:	89 45 f8             	mov    %eax,-0x8(%rbp)
        if (pageinfo[pn].refcount == 0)
   41e7e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41e81:	48 98                	cltq   
   41e83:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41e87:	48 8d 05 b3 0f 01 00 	lea    0x10fb3(%rip),%rax        # 52e41 <pageinfo+0x1>
   41e8e:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41e92:	84 c0                	test   %al,%al
   41e94:	75 07                	jne    41e9d <memshow_physical+0xb9>
        {
            owner = PO_FREE;
   41e96:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
        }
        uint16_t color = memstate_colors[owner - PO_KERNEL];
   41e9d:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41ea0:	83 c0 02             	add    $0x2,%eax
   41ea3:	48 98                	cltq   
   41ea5:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41ea9:	48 8d 05 f0 34 00 00 	lea    0x34f0(%rip),%rax        # 453a0 <memstate_colors>
   41eb0:	0f b7 04 02          	movzwl (%rdx,%rax,1),%eax
   41eb4:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
        // darker color for shared pages
        if (pageinfo[pn].refcount > 1 && pn != PAGENUMBER(CONSOLE_ADDR))
   41eb8:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41ebb:	48 98                	cltq   
   41ebd:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41ec1:	48 8d 05 79 0f 01 00 	lea    0x10f79(%rip),%rax        # 52e41 <pageinfo+0x1>
   41ec8:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41ecc:	3c 01                	cmp    $0x1,%al
   41ece:	7e 1c                	jle    41eec <memshow_physical+0x108>
   41ed0:	48 8d 05 29 61 07 00 	lea    0x76129(%rip),%rax        # b8000 <console>
   41ed7:	48 c1 e8 0c          	shr    $0xc,%rax
   41edb:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   41ede:	74 0c                	je     41eec <memshow_physical+0x108>
        {
#ifdef SHARED
            color = SHARED_COLOR | 0x0F00;
   41ee0:	b8 53 00 00 00       	mov    $0x53,%eax
   41ee5:	80 cc 0f             	or     $0xf,%ah
   41ee8:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
#else
            color &= 0x77FF;
#endif
        }

        console[CPOS(1 + pn / 64, 12 + pn % 64)] = color;
   41eec:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41eef:	8d 50 3f             	lea    0x3f(%rax),%edx
   41ef2:	85 c0                	test   %eax,%eax
   41ef4:	0f 48 c2             	cmovs  %edx,%eax
   41ef7:	c1 f8 06             	sar    $0x6,%eax
   41efa:	8d 50 01             	lea    0x1(%rax),%edx
   41efd:	89 d0                	mov    %edx,%eax
   41eff:	c1 e0 02             	shl    $0x2,%eax
   41f02:	01 d0                	add    %edx,%eax
   41f04:	c1 e0 04             	shl    $0x4,%eax
   41f07:	89 c1                	mov    %eax,%ecx
   41f09:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41f0c:	99                   	cltd   
   41f0d:	c1 ea 1a             	shr    $0x1a,%edx
   41f10:	01 d0                	add    %edx,%eax
   41f12:	83 e0 3f             	and    $0x3f,%eax
   41f15:	29 d0                	sub    %edx,%eax
   41f17:	83 c0 0c             	add    $0xc,%eax
   41f1a:	01 c8                	add    %ecx,%eax
   41f1c:	48 98                	cltq   
   41f1e:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   41f22:	48 8d 15 d7 60 07 00 	lea    0x760d7(%rip),%rdx        # b8000 <console>
   41f29:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41f2d:	66 89 04 11          	mov    %ax,(%rcx,%rdx,1)
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn)
   41f31:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41f35:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   41f3c:	0f 8e d8 fe ff ff    	jle    41e1a <memshow_physical+0x36>
    }
}
   41f42:	90                   	nop
   41f43:	90                   	nop
   41f44:	c9                   	leave  
   41f45:	c3                   	ret    

0000000000041f46 <memshow_virtual>:
// memshow_virtual(pagetable, name)
//    Draw a picture of the virtual memory map `pagetable` (named `name`) on
//    the CGA console.

void memshow_virtual(x86_64_pagetable *pagetable, const char *name)
{
   41f46:	f3 0f 1e fa          	endbr64 
   41f4a:	55                   	push   %rbp
   41f4b:	48 89 e5             	mov    %rsp,%rbp
   41f4e:	48 83 ec 40          	sub    $0x40,%rsp
   41f52:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   41f56:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    assert((uintptr_t)pagetable == PTE_ADDR(pagetable));
   41f5a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41f5e:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   41f64:	48 89 c2             	mov    %rax,%rdx
   41f67:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41f6b:	48 39 c2             	cmp    %rax,%rdx
   41f6e:	74 1e                	je     41f8e <memshow_virtual+0x48>
   41f70:	48 8d 05 69 34 00 00 	lea    0x3469(%rip),%rax        # 453e0 <memstate_colors+0x40>
   41f77:	48 89 c2             	mov    %rax,%rdx
   41f7a:	be 87 03 00 00       	mov    $0x387,%esi
   41f7f:	48 8d 05 72 31 00 00 	lea    0x3172(%rip),%rax        # 450f8 <console_clear+0x85>
   41f86:	48 89 c7             	mov    %rax,%rdi
   41f89:	e8 af 13 00 00       	call   4333d <assert_fail>

    console_printf(CPOS(10, 26), 0x0F00, "VIRTUAL ADDRESS SPACE FOR %s", name);
   41f8e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   41f92:	48 89 c1             	mov    %rax,%rcx
   41f95:	48 8d 05 70 34 00 00 	lea    0x3470(%rip),%rax        # 4540c <memstate_colors+0x6c>
   41f9c:	48 89 c2             	mov    %rax,%rdx
   41f9f:	be 00 0f 00 00       	mov    $0xf00,%esi
   41fa4:	bf 3a 03 00 00       	mov    $0x33a,%edi
   41fa9:	b8 00 00 00 00       	mov    $0x0,%eax
   41fae:	e8 4a 2f 00 00       	call   44efd <console_printf>
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE)
   41fb3:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   41fba:	00 
   41fbb:	e9 b4 01 00 00       	jmp    42174 <memshow_virtual+0x22e>
    {
        vamapping vam = virtual_memory_lookup(pagetable, va);
   41fc0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   41fc4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   41fc8:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   41fcc:	48 89 ce             	mov    %rcx,%rsi
   41fcf:	48 89 c7             	mov    %rax,%rdi
   41fd2:	e8 2e 1b 00 00       	call   43b05 <virtual_memory_lookup>
        uint16_t color;
        if (vam.pn < 0)
   41fd7:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41fda:	85 c0                	test   %eax,%eax
   41fdc:	79 0b                	jns    41fe9 <memshow_virtual+0xa3>
        {
            color = ' ';
   41fde:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%rbp)
   41fe4:	e9 ff 00 00 00       	jmp    420e8 <memshow_virtual+0x1a2>
        }
        else
        {
            assert(vam.pa < MEMSIZE_PHYSICAL);
   41fe9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41fed:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   41ff3:	76 1e                	jbe    42013 <memshow_virtual+0xcd>
   41ff5:	48 8d 05 2d 34 00 00 	lea    0x342d(%rip),%rax        # 45429 <memstate_colors+0x89>
   41ffc:	48 89 c2             	mov    %rax,%rdx
   41fff:	be 94 03 00 00       	mov    $0x394,%esi
   42004:	48 8d 05 ed 30 00 00 	lea    0x30ed(%rip),%rax        # 450f8 <console_clear+0x85>
   4200b:	48 89 c7             	mov    %rax,%rdi
   4200e:	e8 2a 13 00 00       	call   4333d <assert_fail>
            int owner = pageinfo[vam.pn].owner;
   42013:	8b 45 d0             	mov    -0x30(%rbp),%eax
   42016:	48 98                	cltq   
   42018:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4201c:	48 8d 05 1d 0e 01 00 	lea    0x10e1d(%rip),%rax        # 52e40 <pageinfo>
   42023:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   42027:	0f be c0             	movsbl %al,%eax
   4202a:	89 45 f0             	mov    %eax,-0x10(%rbp)
            if (pageinfo[vam.pn].refcount == 0)
   4202d:	8b 45 d0             	mov    -0x30(%rbp),%eax
   42030:	48 98                	cltq   
   42032:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   42036:	48 8d 05 04 0e 01 00 	lea    0x10e04(%rip),%rax        # 52e41 <pageinfo+0x1>
   4203d:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   42041:	84 c0                	test   %al,%al
   42043:	75 07                	jne    4204c <memshow_virtual+0x106>
            {
                owner = PO_FREE;
   42045:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
            }
            color = memstate_colors[owner - PO_KERNEL];
   4204c:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4204f:	83 c0 02             	add    $0x2,%eax
   42052:	48 98                	cltq   
   42054:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   42058:	48 8d 05 41 33 00 00 	lea    0x3341(%rip),%rax        # 453a0 <memstate_colors>
   4205f:	0f b7 04 02          	movzwl (%rdx,%rax,1),%eax
   42063:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            // reverse video for user-accessible pages
            if (vam.perm & PTE_U)
   42067:	8b 45 e0             	mov    -0x20(%rbp),%eax
   4206a:	48 98                	cltq   
   4206c:	83 e0 04             	and    $0x4,%eax
   4206f:	48 85 c0             	test   %rax,%rax
   42072:	74 27                	je     4209b <memshow_virtual+0x155>
            {
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4) | (color & 0x00FF);
   42074:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   42078:	c1 e0 04             	shl    $0x4,%eax
   4207b:	66 25 00 f0          	and    $0xf000,%ax
   4207f:	89 c2                	mov    %eax,%edx
   42081:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   42085:	c1 f8 04             	sar    $0x4,%eax
   42088:	66 25 00 0f          	and    $0xf00,%ax
   4208c:	09 c2                	or     %eax,%edx
   4208e:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   42092:	0f b6 c0             	movzbl %al,%eax
   42095:	09 d0                	or     %edx,%eax
   42097:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            }
            // darker color for shared pages
            if (pageinfo[vam.pn].refcount > 1 && va != CONSOLE_ADDR)
   4209b:	8b 45 d0             	mov    -0x30(%rbp),%eax
   4209e:	48 98                	cltq   
   420a0:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   420a4:	48 8d 05 96 0d 01 00 	lea    0x10d96(%rip),%rax        # 52e41 <pageinfo+0x1>
   420ab:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   420af:	3c 01                	cmp    $0x1,%al
   420b1:	7e 35                	jle    420e8 <memshow_virtual+0x1a2>
   420b3:	48 8d 05 46 5f 07 00 	lea    0x75f46(%rip),%rax        # b8000 <console>
   420ba:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   420be:	74 28                	je     420e8 <memshow_virtual+0x1a2>
            {
#ifdef SHARED
                color = (SHARED_COLOR | (color & 0xF000));
   420c0:	b8 53 00 00 00       	mov    $0x53,%eax
   420c5:	89 c2                	mov    %eax,%edx
   420c7:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   420cb:	66 25 00 f0          	and    $0xf000,%ax
   420cf:	09 d0                	or     %edx,%eax
   420d1:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
                if (!(vam.perm & PTE_U))
   420d5:	8b 45 e0             	mov    -0x20(%rbp),%eax
   420d8:	48 98                	cltq   
   420da:	83 e0 04             	and    $0x4,%eax
   420dd:	48 85 c0             	test   %rax,%rax
   420e0:	75 06                	jne    420e8 <memshow_virtual+0x1a2>
                    color = color | 0x0F00;
   420e2:	66 81 4d f6 00 0f    	orw    $0xf00,-0xa(%rbp)
#else
                color &= 0x77FF;
#endif
            }
        }
        uint32_t pn = PAGENUMBER(va);
   420e8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   420ec:	48 c1 e8 0c          	shr    $0xc,%rax
   420f0:	89 45 ec             	mov    %eax,-0x14(%rbp)
        if (pn % 64 == 0)
   420f3:	8b 45 ec             	mov    -0x14(%rbp),%eax
   420f6:	83 e0 3f             	and    $0x3f,%eax
   420f9:	85 c0                	test   %eax,%eax
   420fb:	75 39                	jne    42136 <memshow_virtual+0x1f0>
        {
            console_printf(CPOS(11 + pn / 64, 3), 0x0F00, "0x%06X ", va);
   420fd:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42100:	c1 e8 06             	shr    $0x6,%eax
   42103:	89 c2                	mov    %eax,%edx
   42105:	89 d0                	mov    %edx,%eax
   42107:	c1 e0 02             	shl    $0x2,%eax
   4210a:	01 d0                	add    %edx,%eax
   4210c:	c1 e0 04             	shl    $0x4,%eax
   4210f:	05 73 03 00 00       	add    $0x373,%eax
   42114:	89 c7                	mov    %eax,%edi
   42116:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4211a:	48 89 c1             	mov    %rax,%rcx
   4211d:	48 8d 05 b2 32 00 00 	lea    0x32b2(%rip),%rax        # 453d6 <memstate_colors+0x36>
   42124:	48 89 c2             	mov    %rax,%rdx
   42127:	be 00 0f 00 00       	mov    $0xf00,%esi
   4212c:	b8 00 00 00 00       	mov    $0x0,%eax
   42131:	e8 c7 2d 00 00       	call   44efd <console_printf>
        }
        console[CPOS(11 + pn / 64, 12 + pn % 64)] = color;
   42136:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42139:	c1 e8 06             	shr    $0x6,%eax
   4213c:	89 c2                	mov    %eax,%edx
   4213e:	89 d0                	mov    %edx,%eax
   42140:	c1 e0 02             	shl    $0x2,%eax
   42143:	01 d0                	add    %edx,%eax
   42145:	c1 e0 04             	shl    $0x4,%eax
   42148:	89 c2                	mov    %eax,%edx
   4214a:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4214d:	83 e0 3f             	and    $0x3f,%eax
   42150:	01 d0                	add    %edx,%eax
   42152:	05 7c 03 00 00       	add    $0x37c,%eax
   42157:	89 c0                	mov    %eax,%eax
   42159:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   4215d:	48 8d 15 9c 5e 07 00 	lea    0x75e9c(%rip),%rdx        # b8000 <console>
   42164:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   42168:	66 89 04 11          	mov    %ax,(%rcx,%rdx,1)
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE)
   4216c:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   42173:	00 
   42174:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   4217b:	00 
   4217c:	0f 86 3e fe ff ff    	jbe    41fc0 <memshow_virtual+0x7a>
    }
}
   42182:	90                   	nop
   42183:	90                   	nop
   42184:	c9                   	leave  
   42185:	c3                   	ret    

0000000000042186 <memshow_virtual_animate>:
// memshow_virtual_animate
//    Draw a picture of process virtual memory maps on the CGA console.
//    Starts with process 1, then switches to a new process every 0.25 sec.

void memshow_virtual_animate(void)
{
   42186:	f3 0f 1e fa          	endbr64 
   4218a:	55                   	push   %rbp
   4218b:	48 89 e5             	mov    %rsp,%rbp
   4218e:	48 83 ec 10          	sub    $0x10,%rsp
    static unsigned last_ticks = 0;
    static int showing = 1;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2)
   42192:	8b 05 a8 10 01 00    	mov    0x110a8(%rip),%eax        # 53240 <last_ticks.1>
   42198:	85 c0                	test   %eax,%eax
   4219a:	74 13                	je     421af <memshow_virtual_animate+0x29>
   4219c:	8b 05 7e 0c 01 00    	mov    0x10c7e(%rip),%eax        # 52e20 <ticks>
   421a2:	8b 15 98 10 01 00    	mov    0x11098(%rip),%edx        # 53240 <last_ticks.1>
   421a8:	29 d0                	sub    %edx,%eax
   421aa:	83 f8 31             	cmp    $0x31,%eax
   421ad:	76 2c                	jbe    421db <memshow_virtual_animate+0x55>
    {
        last_ticks = ticks;
   421af:	8b 05 6b 0c 01 00    	mov    0x10c6b(%rip),%eax        # 52e20 <ticks>
   421b5:	89 05 85 10 01 00    	mov    %eax,0x11085(%rip)        # 53240 <last_ticks.1>
        ++showing;
   421bb:	8b 05 43 3e 00 00    	mov    0x3e43(%rip),%eax        # 46004 <showing.0>
   421c1:	83 c0 01             	add    $0x1,%eax
   421c4:	89 05 3a 3e 00 00    	mov    %eax,0x3e3a(%rip)        # 46004 <showing.0>
    }

    // the current process may have died -- don't display it if so
    while (showing <= 2 * NPROC && (processes[showing % NPROC].p_state == P_FREE || processes[showing % NPROC].display_status == 0))
   421ca:	eb 0f                	jmp    421db <memshow_virtual_animate+0x55>
    {
        ++showing;
   421cc:	8b 05 32 3e 00 00    	mov    0x3e32(%rip),%eax        # 46004 <showing.0>
   421d2:	83 c0 01             	add    $0x1,%eax
   421d5:	89 05 29 3e 00 00    	mov    %eax,0x3e29(%rip)        # 46004 <showing.0>
    while (showing <= 2 * NPROC && (processes[showing % NPROC].p_state == P_FREE || processes[showing % NPROC].display_status == 0))
   421db:	8b 05 23 3e 00 00    	mov    0x3e23(%rip),%eax        # 46004 <showing.0>
   421e1:	83 f8 20             	cmp    $0x20,%eax
   421e4:	7f 6b                	jg     42251 <memshow_virtual_animate+0xcb>
   421e6:	8b 05 18 3e 00 00    	mov    0x3e18(%rip),%eax        # 46004 <showing.0>
   421ec:	99                   	cltd   
   421ed:	c1 ea 1c             	shr    $0x1c,%edx
   421f0:	01 d0                	add    %edx,%eax
   421f2:	83 e0 0f             	and    $0xf,%eax
   421f5:	29 d0                	sub    %edx,%eax
   421f7:	48 63 d0             	movslq %eax,%rdx
   421fa:	48 89 d0             	mov    %rdx,%rax
   421fd:	48 c1 e0 03          	shl    $0x3,%rax
   42201:	48 29 d0             	sub    %rdx,%rax
   42204:	48 c1 e0 05          	shl    $0x5,%rax
   42208:	48 89 c2             	mov    %rax,%rdx
   4220b:	48 8d 05 d6 fe 00 00 	lea    0xfed6(%rip),%rax        # 520e8 <processes+0xc8>
   42212:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   42215:	85 c0                	test   %eax,%eax
   42217:	74 b3                	je     421cc <memshow_virtual_animate+0x46>
   42219:	8b 05 e5 3d 00 00    	mov    0x3de5(%rip),%eax        # 46004 <showing.0>
   4221f:	99                   	cltd   
   42220:	c1 ea 1c             	shr    $0x1c,%edx
   42223:	01 d0                	add    %edx,%eax
   42225:	83 e0 0f             	and    $0xf,%eax
   42228:	29 d0                	sub    %edx,%eax
   4222a:	48 63 d0             	movslq %eax,%rdx
   4222d:	48 89 d0             	mov    %rdx,%rax
   42230:	48 c1 e0 03          	shl    $0x3,%rax
   42234:	48 29 d0             	sub    %rdx,%rax
   42237:	48 c1 e0 05          	shl    $0x5,%rax
   4223b:	48 89 c2             	mov    %rax,%rdx
   4223e:	48 8d 05 b3 fe 00 00 	lea    0xfeb3(%rip),%rax        # 520f8 <processes+0xd8>
   42245:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   42249:	84 c0                	test   %al,%al
   4224b:	0f 84 7b ff ff ff    	je     421cc <memshow_virtual_animate+0x46>
    }
    showing = showing % NPROC;
   42251:	8b 05 ad 3d 00 00    	mov    0x3dad(%rip),%eax        # 46004 <showing.0>
   42257:	99                   	cltd   
   42258:	c1 ea 1c             	shr    $0x1c,%edx
   4225b:	01 d0                	add    %edx,%eax
   4225d:	83 e0 0f             	and    $0xf,%eax
   42260:	29 d0                	sub    %edx,%eax
   42262:	89 05 9c 3d 00 00    	mov    %eax,0x3d9c(%rip)        # 46004 <showing.0>

    if (processes[showing].p_state != P_FREE)
   42268:	8b 05 96 3d 00 00    	mov    0x3d96(%rip),%eax        # 46004 <showing.0>
   4226e:	48 63 d0             	movslq %eax,%rdx
   42271:	48 89 d0             	mov    %rdx,%rax
   42274:	48 c1 e0 03          	shl    $0x3,%rax
   42278:	48 29 d0             	sub    %rdx,%rax
   4227b:	48 c1 e0 05          	shl    $0x5,%rax
   4227f:	48 89 c2             	mov    %rax,%rdx
   42282:	48 8d 05 5f fe 00 00 	lea    0xfe5f(%rip),%rax        # 520e8 <processes+0xc8>
   42289:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   4228c:	85 c0                	test   %eax,%eax
   4228e:	74 59                	je     422e9 <memshow_virtual_animate+0x163>
    {
        char s[4];
        snprintf(s, 4, "%d ", showing);
   42290:	8b 15 6e 3d 00 00    	mov    0x3d6e(%rip),%edx        # 46004 <showing.0>
   42296:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
   4229a:	89 d1                	mov    %edx,%ecx
   4229c:	48 8d 15 a0 31 00 00 	lea    0x31a0(%rip),%rdx        # 45443 <memstate_colors+0xa3>
   422a3:	be 04 00 00 00       	mov    $0x4,%esi
   422a8:	48 89 c7             	mov    %rax,%rdi
   422ab:	b8 00 00 00 00       	mov    $0x0,%eax
   422b0:	e8 63 2d 00 00       	call   45018 <snprintf>
        memshow_virtual(processes[showing].p_pagetable, s);
   422b5:	8b 05 49 3d 00 00    	mov    0x3d49(%rip),%eax        # 46004 <showing.0>
   422bb:	48 63 d0             	movslq %eax,%rdx
   422be:	48 89 d0             	mov    %rdx,%rax
   422c1:	48 c1 e0 03          	shl    $0x3,%rax
   422c5:	48 29 d0             	sub    %rdx,%rax
   422c8:	48 c1 e0 05          	shl    $0x5,%rax
   422cc:	48 89 c2             	mov    %rax,%rdx
   422cf:	48 8d 05 1a fe 00 00 	lea    0xfe1a(%rip),%rax        # 520f0 <processes+0xd0>
   422d6:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   422da:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
   422de:	48 89 d6             	mov    %rdx,%rsi
   422e1:	48 89 c7             	mov    %rax,%rdi
   422e4:	e8 5d fc ff ff       	call   41f46 <memshow_virtual>
    }
}
   422e9:	90                   	nop
   422ea:	c9                   	leave  
   422eb:	c3                   	ret    

00000000000422ec <hardware_init>:

static void segments_init(void);
static void interrupt_init(void);
extern void virtual_memory_init(void);

void hardware_init(void) {
   422ec:	f3 0f 1e fa          	endbr64 
   422f0:	55                   	push   %rbp
   422f1:	48 89 e5             	mov    %rsp,%rbp
    segments_init();
   422f4:	e8 5f 01 00 00       	call   42458 <segments_init>
    interrupt_init();
   422f9:	e8 44 04 00 00       	call   42742 <interrupt_init>
    virtual_memory_init();
   422fe:	e8 11 11 00 00       	call   43414 <virtual_memory_init>
}
   42303:	90                   	nop
   42304:	5d                   	pop    %rbp
   42305:	c3                   	ret    

0000000000042306 <set_app_segment>:
#define SEGSEL_TASKSTATE        0x28            // task state segment

// Segments
static uint64_t segments[7];

static void set_app_segment(uint64_t* segment, uint64_t type, int dpl) {
   42306:	f3 0f 1e fa          	endbr64 
   4230a:	55                   	push   %rbp
   4230b:	48 89 e5             	mov    %rsp,%rbp
   4230e:	48 83 ec 18          	sub    $0x18,%rsp
   42312:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42316:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   4231a:	89 55 ec             	mov    %edx,-0x14(%rbp)
    *segment = type
        | X86SEG_S                    // code/data segment
        | ((uint64_t) dpl << 45)
   4231d:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42320:	48 98                	cltq   
   42322:	48 c1 e0 2d          	shl    $0x2d,%rax
   42326:	48 0b 45 f0          	or     -0x10(%rbp),%rax
        | X86SEG_P;                   // segment present
   4232a:	48 ba 00 00 00 00 00 	movabs $0x900000000000,%rdx
   42331:	90 00 00 
   42334:	48 09 c2             	or     %rax,%rdx
    *segment = type
   42337:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4233b:	48 89 10             	mov    %rdx,(%rax)
}
   4233e:	90                   	nop
   4233f:	c9                   	leave  
   42340:	c3                   	ret    

0000000000042341 <set_sys_segment>:

static void set_sys_segment(uint64_t* segment, uint64_t type, int dpl,
                            uintptr_t addr, size_t size) {
   42341:	f3 0f 1e fa          	endbr64 
   42345:	55                   	push   %rbp
   42346:	48 89 e5             	mov    %rsp,%rbp
   42349:	48 83 ec 28          	sub    $0x28,%rsp
   4234d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42351:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   42355:	89 55 ec             	mov    %edx,-0x14(%rbp)
   42358:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
   4235c:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   42360:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42364:	48 c1 e0 10          	shl    $0x10,%rax
   42368:	48 89 c2             	mov    %rax,%rdx
   4236b:	48 b8 00 00 ff ff ff 	movabs $0xffffff0000,%rax
   42372:	00 00 00 
   42375:	48 21 c2             	and    %rax,%rdx
        | ((addr & 0x00000000FF000000UL) << 32)
   42378:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4237c:	48 c1 e0 20          	shl    $0x20,%rax
   42380:	48 89 c1             	mov    %rax,%rcx
   42383:	48 b8 00 00 00 00 00 	movabs $0xff00000000000000,%rax
   4238a:	00 00 ff 
   4238d:	48 21 c8             	and    %rcx,%rax
   42390:	48 09 c2             	or     %rax,%rdx
        | ((size - 1) & 0x0FFFFUL)
   42393:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42397:	48 83 e8 01          	sub    $0x1,%rax
   4239b:	0f b7 c0             	movzwl %ax,%eax
        | (((size - 1) & 0xF0000UL) << 48)
   4239e:	48 09 d0             	or     %rdx,%rax
        | type
   423a1:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   423a5:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   423a8:	8b 45 ec             	mov    -0x14(%rbp),%eax
   423ab:	48 98                	cltq   
   423ad:	48 c1 e0 2d          	shl    $0x2d,%rax
   423b1:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P;                   // segment present
   423b4:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
   423bb:	80 00 00 
   423be:	48 09 c2             	or     %rax,%rdx
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   423c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   423c5:	48 89 10             	mov    %rdx,(%rax)
    segment[1] = addr >> 32;
   423c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   423cc:	48 83 c0 08          	add    $0x8,%rax
   423d0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   423d4:	48 c1 ea 20          	shr    $0x20,%rdx
   423d8:	48 89 10             	mov    %rdx,(%rax)
}
   423db:	90                   	nop
   423dc:	c9                   	leave  
   423dd:	c3                   	ret    

00000000000423de <set_gate>:

// Processor state for taking an interrupt
static x86_64_taskstate kernel_task_descriptor;

static void set_gate(x86_64_gatedescriptor* gate, uint64_t type, int dpl,
                     uintptr_t function) {
   423de:	f3 0f 1e fa          	endbr64 
   423e2:	55                   	push   %rbp
   423e3:	48 89 e5             	mov    %rsp,%rbp
   423e6:	48 83 ec 20          	sub    $0x20,%rsp
   423ea:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   423ee:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   423f2:	89 55 ec             	mov    %edx,-0x14(%rbp)
   423f5:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    gate->gd_low = (function & 0x000000000000FFFFUL)
   423f9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   423fd:	0f b7 c0             	movzwl %ax,%eax
        | (SEGSEL_KERN_CODE << 16)
        | type
   42400:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   42404:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   42407:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4240a:	48 98                	cltq   
   4240c:	48 c1 e0 2d          	shl    $0x2d,%rax
   42410:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P
        | ((function & 0x00000000FFFF0000UL) << 32);
   42413:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42417:	48 c1 e0 20          	shl    $0x20,%rax
   4241b:	48 89 c1             	mov    %rax,%rcx
   4241e:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   42425:	00 ff ff 
   42428:	48 21 c8             	and    %rcx,%rax
   4242b:	48 09 c2             	or     %rax,%rdx
   4242e:	48 b8 00 00 08 00 00 	movabs $0x800000080000,%rax
   42435:	80 00 00 
   42438:	48 09 c2             	or     %rax,%rdx
    gate->gd_low = (function & 0x000000000000FFFFUL)
   4243b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4243f:	48 89 10             	mov    %rdx,(%rax)
    gate->gd_high = function >> 32;
   42442:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42446:	48 c1 e8 20          	shr    $0x20,%rax
   4244a:	48 89 c2             	mov    %rax,%rdx
   4244d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42451:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
   42455:	90                   	nop
   42456:	c9                   	leave  
   42457:	c3                   	ret    

0000000000042458 <segments_init>:
extern void default_int_handler(void);
extern void gpf_int_handler(void);
extern void pagefault_int_handler(void);
extern void timer_int_handler(void);

void segments_init(void) {
   42458:	f3 0f 1e fa          	endbr64 
   4245c:	55                   	push   %rbp
   4245d:	48 89 e5             	mov    %rsp,%rbp
   42460:	48 83 ec 40          	sub    $0x40,%rsp
    // Segments for kernel & user code & data
    // The privilege level, which can be 0 or 3, differentiates between
    // kernel and user code. (Data segments are unused in WeensyOS.)
    segments[0] = 0;
   42464:	48 c7 05 f1 0d 01 00 	movq   $0x0,0x10df1(%rip)        # 53260 <segments>
   4246b:	00 00 00 00 
    set_app_segment(&segments[SEGSEL_KERN_CODE >> 3], X86SEG_X | X86SEG_L, 0);
   4246f:	ba 00 00 00 00       	mov    $0x0,%edx
   42474:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   4247b:	08 20 00 
   4247e:	48 89 c6             	mov    %rax,%rsi
   42481:	48 8d 05 e0 0d 01 00 	lea    0x10de0(%rip),%rax        # 53268 <segments+0x8>
   42488:	48 89 c7             	mov    %rax,%rdi
   4248b:	e8 76 fe ff ff       	call   42306 <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_CODE >> 3], X86SEG_X | X86SEG_L, 3);
   42490:	ba 03 00 00 00       	mov    $0x3,%edx
   42495:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   4249c:	08 20 00 
   4249f:	48 89 c6             	mov    %rax,%rsi
   424a2:	48 8d 05 c7 0d 01 00 	lea    0x10dc7(%rip),%rax        # 53270 <segments+0x10>
   424a9:	48 89 c7             	mov    %rax,%rdi
   424ac:	e8 55 fe ff ff       	call   42306 <set_app_segment>
    set_app_segment(&segments[SEGSEL_KERN_DATA >> 3], X86SEG_W, 0);
   424b1:	ba 00 00 00 00       	mov    $0x0,%edx
   424b6:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   424bd:	02 00 00 
   424c0:	48 89 c6             	mov    %rax,%rsi
   424c3:	48 8d 05 ae 0d 01 00 	lea    0x10dae(%rip),%rax        # 53278 <segments+0x18>
   424ca:	48 89 c7             	mov    %rax,%rdi
   424cd:	e8 34 fe ff ff       	call   42306 <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_DATA >> 3], X86SEG_W, 3);
   424d2:	ba 03 00 00 00       	mov    $0x3,%edx
   424d7:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   424de:	02 00 00 
   424e1:	48 89 c6             	mov    %rax,%rsi
   424e4:	48 8d 05 95 0d 01 00 	lea    0x10d95(%rip),%rax        # 53280 <segments+0x20>
   424eb:	48 89 c7             	mov    %rax,%rdi
   424ee:	e8 13 fe ff ff       	call   42306 <set_app_segment>
    set_sys_segment(&segments[SEGSEL_TASKSTATE >> 3], X86SEG_TSS, 0,
   424f3:	48 8d 05 a6 1d 01 00 	lea    0x11da6(%rip),%rax        # 542a0 <kernel_task_descriptor>
   424fa:	41 b8 60 00 00 00    	mov    $0x60,%r8d
   42500:	48 89 c1             	mov    %rax,%rcx
   42503:	ba 00 00 00 00       	mov    $0x0,%edx
   42508:	48 b8 00 00 00 00 00 	movabs $0x90000000000,%rax
   4250f:	09 00 00 
   42512:	48 89 c6             	mov    %rax,%rsi
   42515:	48 8d 05 6c 0d 01 00 	lea    0x10d6c(%rip),%rax        # 53288 <segments+0x28>
   4251c:	48 89 c7             	mov    %rax,%rdi
   4251f:	e8 1d fe ff ff       	call   42341 <set_sys_segment>
                    (uintptr_t) &kernel_task_descriptor,
                    sizeof(kernel_task_descriptor));

    x86_64_pseudodescriptor gdt;
    gdt.pseudod_limit = sizeof(segments) - 1;
   42524:	66 c7 45 d6 37 00    	movw   $0x37,-0x2a(%rbp)
    gdt.pseudod_base = (uint64_t) segments;
   4252a:	48 8d 05 2f 0d 01 00 	lea    0x10d2f(%rip),%rax        # 53260 <segments>
   42531:	48 89 45 d8          	mov    %rax,-0x28(%rbp)

    // Kernel task descriptor lets us receive interrupts
    memset(&kernel_task_descriptor, 0, sizeof(kernel_task_descriptor));
   42535:	ba 60 00 00 00       	mov    $0x60,%edx
   4253a:	be 00 00 00 00       	mov    $0x0,%esi
   4253f:	48 8d 05 5a 1d 01 00 	lea    0x11d5a(%rip),%rax        # 542a0 <kernel_task_descriptor>
   42546:	48 89 c7             	mov    %rax,%rdi
   42549:	e8 70 1b 00 00       	call   440be <memset>
    kernel_task_descriptor.ts_rsp[0] = KERNEL_STACK_TOP;
   4254e:	48 c7 05 4b 1d 01 00 	movq   $0x80000,0x11d4b(%rip)        # 542a4 <kernel_task_descriptor+0x4>
   42555:	00 00 08 00 

    // Interrupt handler; most interrupts are effectively ignored
    memset(interrupt_descriptors, 0, sizeof(interrupt_descriptors));
   42559:	ba 00 10 00 00       	mov    $0x1000,%edx
   4255e:	be 00 00 00 00       	mov    $0x0,%esi
   42563:	48 8d 05 36 0d 01 00 	lea    0x10d36(%rip),%rax        # 532a0 <interrupt_descriptors>
   4256a:	48 89 c7             	mov    %rax,%rdi
   4256d:	e8 4c 1b 00 00       	call   440be <memset>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   42572:	c7 45 fc 10 00 00 00 	movl   $0x10,-0x4(%rbp)
   42579:	eb 3c                	jmp    425b7 <segments_init+0x15f>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 0,
   4257b:	48 c7 c0 9c 00 04 00 	mov    $0x4009c,%rax
   42582:	48 89 c2             	mov    %rax,%rdx
   42585:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42588:	48 c1 e0 04          	shl    $0x4,%rax
   4258c:	48 89 c1             	mov    %rax,%rcx
   4258f:	48 8d 05 0a 0d 01 00 	lea    0x10d0a(%rip),%rax        # 532a0 <interrupt_descriptors>
   42596:	48 01 c8             	add    %rcx,%rax
   42599:	48 89 d1             	mov    %rdx,%rcx
   4259c:	ba 00 00 00 00       	mov    $0x0,%edx
   425a1:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   425a8:	0e 00 00 
   425ab:	48 89 c7             	mov    %rax,%rdi
   425ae:	e8 2b fe ff ff       	call   423de <set_gate>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   425b3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   425b7:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
   425be:	76 bb                	jbe    4257b <segments_init+0x123>
                 (uint64_t) default_int_handler);
    }

    // Timer interrupt
    set_gate(&interrupt_descriptors[INT_TIMER], X86GATE_INTERRUPT, 0,
   425c0:	48 c7 c0 36 00 04 00 	mov    $0x40036,%rax
   425c7:	48 89 c1             	mov    %rax,%rcx
   425ca:	ba 00 00 00 00       	mov    $0x0,%edx
   425cf:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   425d6:	0e 00 00 
   425d9:	48 89 c6             	mov    %rax,%rsi
   425dc:	48 8d 05 bd 0e 01 00 	lea    0x10ebd(%rip),%rax        # 534a0 <interrupt_descriptors+0x200>
   425e3:	48 89 c7             	mov    %rax,%rdi
   425e6:	e8 f3 fd ff ff       	call   423de <set_gate>
             (uint64_t) timer_int_handler);

    // GPF and page fault
    set_gate(&interrupt_descriptors[INT_GPF], X86GATE_INTERRUPT, 0,
   425eb:	48 c7 c0 2e 00 04 00 	mov    $0x4002e,%rax
   425f2:	48 89 c1             	mov    %rax,%rcx
   425f5:	ba 00 00 00 00       	mov    $0x0,%edx
   425fa:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   42601:	0e 00 00 
   42604:	48 89 c6             	mov    %rax,%rsi
   42607:	48 8d 05 62 0d 01 00 	lea    0x10d62(%rip),%rax        # 53370 <interrupt_descriptors+0xd0>
   4260e:	48 89 c7             	mov    %rax,%rdi
   42611:	e8 c8 fd ff ff       	call   423de <set_gate>
             (uint64_t) gpf_int_handler);
    set_gate(&interrupt_descriptors[INT_PAGEFAULT], X86GATE_INTERRUPT, 0,
   42616:	48 c7 c0 32 00 04 00 	mov    $0x40032,%rax
   4261d:	48 89 c1             	mov    %rax,%rcx
   42620:	ba 00 00 00 00       	mov    $0x0,%edx
   42625:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   4262c:	0e 00 00 
   4262f:	48 89 c6             	mov    %rax,%rsi
   42632:	48 8d 05 47 0d 01 00 	lea    0x10d47(%rip),%rax        # 53380 <interrupt_descriptors+0xe0>
   42639:	48 89 c7             	mov    %rax,%rdi
   4263c:	e8 9d fd ff ff       	call   423de <set_gate>
             (uint64_t) pagefault_int_handler);

    // System calls get special handling.
    // Note that the last argument is '3'.  This means that unprivileged
    // (level-3) applications may generate these interrupts.
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   42641:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%rbp)
   42648:	eb 50                	jmp    4269a <segments_init+0x242>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
                 (uint64_t) sys_int_handlers[i - INT_SYS]);
   4264a:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4264d:	83 e8 30             	sub    $0x30,%eax
   42650:	89 c0                	mov    %eax,%eax
   42652:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   42659:	00 
   4265a:	48 8d 05 86 da ff ff 	lea    -0x257a(%rip),%rax        # 400e7 <sys_int_handlers>
   42661:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
   42665:	48 89 c2             	mov    %rax,%rdx
   42668:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4266b:	48 c1 e0 04          	shl    $0x4,%rax
   4266f:	48 89 c1             	mov    %rax,%rcx
   42672:	48 8d 05 27 0c 01 00 	lea    0x10c27(%rip),%rax        # 532a0 <interrupt_descriptors>
   42679:	48 01 c8             	add    %rcx,%rax
   4267c:	48 89 d1             	mov    %rdx,%rcx
   4267f:	ba 03 00 00 00       	mov    $0x3,%edx
   42684:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   4268b:	0e 00 00 
   4268e:	48 89 c7             	mov    %rax,%rdi
   42691:	e8 48 fd ff ff       	call   423de <set_gate>
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   42696:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   4269a:	83 7d f8 3f          	cmpl   $0x3f,-0x8(%rbp)
   4269e:	76 aa                	jbe    4264a <segments_init+0x1f2>
    }

    x86_64_pseudodescriptor idt;
    idt.pseudod_limit = sizeof(interrupt_descriptors) - 1;
   426a0:	66 c7 45 cc ff 0f    	movw   $0xfff,-0x34(%rbp)
    idt.pseudod_base = (uint64_t) interrupt_descriptors;
   426a6:	48 8d 05 f3 0b 01 00 	lea    0x10bf3(%rip),%rax        # 532a0 <interrupt_descriptors>
   426ad:	48 89 45 ce          	mov    %rax,-0x32(%rbp)

    // Reload segment pointers
    asm volatile("lgdt %0\n\t"
   426b1:	b8 28 00 00 00       	mov    $0x28,%eax
   426b6:	0f 01 55 d6          	lgdt   -0x2a(%rbp)
   426ba:	0f 00 d8             	ltr    %ax
   426bd:	0f 01 5d cc          	lidt   -0x34(%rbp)
    asm volatile("movq %%cr0,%0" : "=r" (val));
   426c1:	0f 20 c0             	mov    %cr0,%rax
   426c4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    return val;
   426c8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
                     "r" ((uint16_t) SEGSEL_TASKSTATE),
                     "m" (idt)
                 : "memory");

    // Set up control registers: check alignment
    uint32_t cr0 = rcr0();
   426cc:	89 45 f4             	mov    %eax,-0xc(%rbp)
    cr0 |= CR0_PE | CR0_PG | CR0_WP | CR0_AM | CR0_MP | CR0_NE;
   426cf:	81 4d f4 23 00 05 80 	orl    $0x80050023,-0xc(%rbp)
   426d6:	8b 45 f4             	mov    -0xc(%rbp),%eax
   426d9:	89 45 f0             	mov    %eax,-0x10(%rbp)
    uint64_t xval = val;
   426dc:	8b 45 f0             	mov    -0x10(%rbp),%eax
   426df:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    asm volatile("movq %0,%%cr0" : : "r" (xval));
   426e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   426e7:	0f 22 c0             	mov    %rax,%cr0
}
   426ea:	90                   	nop
    lcr0(cr0);
}
   426eb:	90                   	nop
   426ec:	c9                   	leave  
   426ed:	c3                   	ret    

00000000000426ee <interrupt_mask>:
#define TIMER_FREQ      1193182
#define TIMER_DIV(x)    ((TIMER_FREQ+(x)/2)/(x))

static uint16_t interrupts_enabled;

static void interrupt_mask(void) {
   426ee:	f3 0f 1e fa          	endbr64 
   426f2:	55                   	push   %rbp
   426f3:	48 89 e5             	mov    %rsp,%rbp
   426f6:	48 83 ec 20          	sub    $0x20,%rsp
    uint16_t masked = ~interrupts_enabled;
   426fa:	0f b7 05 ff 1b 01 00 	movzwl 0x11bff(%rip),%eax        # 54300 <interrupts_enabled>
   42701:	f7 d0                	not    %eax
   42703:	66 89 45 fe          	mov    %ax,-0x2(%rbp)
    outb(IO_PIC1+1, masked & 0xFF);
   42707:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   4270b:	0f b6 c0             	movzbl %al,%eax
   4270e:	c7 45 f0 21 00 00 00 	movl   $0x21,-0x10(%rbp)
   42715:	88 45 ef             	mov    %al,-0x11(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42718:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   4271c:	8b 55 f0             	mov    -0x10(%rbp),%edx
   4271f:	ee                   	out    %al,(%dx)
}
   42720:	90                   	nop
    outb(IO_PIC2+1, (masked >> 8) & 0xFF);
   42721:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   42725:	66 c1 e8 08          	shr    $0x8,%ax
   42729:	0f b6 c0             	movzbl %al,%eax
   4272c:	c7 45 f8 a1 00 00 00 	movl   $0xa1,-0x8(%rbp)
   42733:	88 45 f7             	mov    %al,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42736:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   4273a:	8b 55 f8             	mov    -0x8(%rbp),%edx
   4273d:	ee                   	out    %al,(%dx)
}
   4273e:	90                   	nop
}
   4273f:	90                   	nop
   42740:	c9                   	leave  
   42741:	c3                   	ret    

0000000000042742 <interrupt_init>:

void interrupt_init(void) {
   42742:	f3 0f 1e fa          	endbr64 
   42746:	55                   	push   %rbp
   42747:	48 89 e5             	mov    %rsp,%rbp
   4274a:	48 83 ec 60          	sub    $0x60,%rsp
    // mask all interrupts
    interrupts_enabled = 0;
   4274e:	66 c7 05 a9 1b 01 00 	movw   $0x0,0x11ba9(%rip)        # 54300 <interrupts_enabled>
   42755:	00 00 
    interrupt_mask();
   42757:	e8 92 ff ff ff       	call   426ee <interrupt_mask>
   4275c:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%rbp)
   42763:	c6 45 a3 11          	movb   $0x11,-0x5d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42767:	0f b6 45 a3          	movzbl -0x5d(%rbp),%eax
   4276b:	8b 55 a4             	mov    -0x5c(%rbp),%edx
   4276e:	ee                   	out    %al,(%dx)
}
   4276f:	90                   	nop
   42770:	c7 45 ac 21 00 00 00 	movl   $0x21,-0x54(%rbp)
   42777:	c6 45 ab 20          	movb   $0x20,-0x55(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4277b:	0f b6 45 ab          	movzbl -0x55(%rbp),%eax
   4277f:	8b 55 ac             	mov    -0x54(%rbp),%edx
   42782:	ee                   	out    %al,(%dx)
}
   42783:	90                   	nop
   42784:	c7 45 b4 21 00 00 00 	movl   $0x21,-0x4c(%rbp)
   4278b:	c6 45 b3 04          	movb   $0x4,-0x4d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4278f:	0f b6 45 b3          	movzbl -0x4d(%rbp),%eax
   42793:	8b 55 b4             	mov    -0x4c(%rbp),%edx
   42796:	ee                   	out    %al,(%dx)
}
   42797:	90                   	nop
   42798:	c7 45 bc 21 00 00 00 	movl   $0x21,-0x44(%rbp)
   4279f:	c6 45 bb 03          	movb   $0x3,-0x45(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   427a3:	0f b6 45 bb          	movzbl -0x45(%rbp),%eax
   427a7:	8b 55 bc             	mov    -0x44(%rbp),%edx
   427aa:	ee                   	out    %al,(%dx)
}
   427ab:	90                   	nop
   427ac:	c7 45 c4 a0 00 00 00 	movl   $0xa0,-0x3c(%rbp)
   427b3:	c6 45 c3 11          	movb   $0x11,-0x3d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   427b7:	0f b6 45 c3          	movzbl -0x3d(%rbp),%eax
   427bb:	8b 55 c4             	mov    -0x3c(%rbp),%edx
   427be:	ee                   	out    %al,(%dx)
}
   427bf:	90                   	nop
   427c0:	c7 45 cc a1 00 00 00 	movl   $0xa1,-0x34(%rbp)
   427c7:	c6 45 cb 28          	movb   $0x28,-0x35(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   427cb:	0f b6 45 cb          	movzbl -0x35(%rbp),%eax
   427cf:	8b 55 cc             	mov    -0x34(%rbp),%edx
   427d2:	ee                   	out    %al,(%dx)
}
   427d3:	90                   	nop
   427d4:	c7 45 d4 a1 00 00 00 	movl   $0xa1,-0x2c(%rbp)
   427db:	c6 45 d3 02          	movb   $0x2,-0x2d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   427df:	0f b6 45 d3          	movzbl -0x2d(%rbp),%eax
   427e3:	8b 55 d4             	mov    -0x2c(%rbp),%edx
   427e6:	ee                   	out    %al,(%dx)
}
   427e7:	90                   	nop
   427e8:	c7 45 dc a1 00 00 00 	movl   $0xa1,-0x24(%rbp)
   427ef:	c6 45 db 01          	movb   $0x1,-0x25(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   427f3:	0f b6 45 db          	movzbl -0x25(%rbp),%eax
   427f7:	8b 55 dc             	mov    -0x24(%rbp),%edx
   427fa:	ee                   	out    %al,(%dx)
}
   427fb:	90                   	nop
   427fc:	c7 45 e4 20 00 00 00 	movl   $0x20,-0x1c(%rbp)
   42803:	c6 45 e3 68          	movb   $0x68,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42807:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   4280b:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   4280e:	ee                   	out    %al,(%dx)
}
   4280f:	90                   	nop
   42810:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
   42817:	c6 45 eb 0a          	movb   $0xa,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4281b:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   4281f:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42822:	ee                   	out    %al,(%dx)
}
   42823:	90                   	nop
   42824:	c7 45 f4 a0 00 00 00 	movl   $0xa0,-0xc(%rbp)
   4282b:	c6 45 f3 68          	movb   $0x68,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4282f:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   42833:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42836:	ee                   	out    %al,(%dx)
}
   42837:	90                   	nop
   42838:	c7 45 fc a0 00 00 00 	movl   $0xa0,-0x4(%rbp)
   4283f:	c6 45 fb 0a          	movb   $0xa,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42843:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42847:	8b 55 fc             	mov    -0x4(%rbp),%edx
   4284a:	ee                   	out    %al,(%dx)
}
   4284b:	90                   	nop

    outb(IO_PIC2, 0x68);               /* OCW3 */
    outb(IO_PIC2, 0x0a);               /* OCW3 */

    // re-disable interrupts
    interrupt_mask();
   4284c:	e8 9d fe ff ff       	call   426ee <interrupt_mask>
}
   42851:	90                   	nop
   42852:	c9                   	leave  
   42853:	c3                   	ret    

0000000000042854 <timer_init>:

// timer_init(rate)
//    Set the timer interrupt to fire `rate` times a second. Disables the
//    timer interrupt if `rate <= 0`.

void timer_init(int rate) {
   42854:	f3 0f 1e fa          	endbr64 
   42858:	55                   	push   %rbp
   42859:	48 89 e5             	mov    %rsp,%rbp
   4285c:	48 83 ec 28          	sub    $0x28,%rsp
   42860:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (rate > 0) {
   42863:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   42867:	0f 8e 9f 00 00 00    	jle    4290c <timer_init+0xb8>
   4286d:	c7 45 ec 43 00 00 00 	movl   $0x43,-0x14(%rbp)
   42874:	c6 45 eb 34          	movb   $0x34,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42878:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   4287c:	8b 55 ec             	mov    -0x14(%rbp),%edx
   4287f:	ee                   	out    %al,(%dx)
}
   42880:	90                   	nop
        outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
        outb(IO_TIMER1, TIMER_DIV(rate) % 256);
   42881:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42884:	89 c2                	mov    %eax,%edx
   42886:	c1 ea 1f             	shr    $0x1f,%edx
   42889:	01 d0                	add    %edx,%eax
   4288b:	d1 f8                	sar    %eax
   4288d:	05 de 34 12 00       	add    $0x1234de,%eax
   42892:	99                   	cltd   
   42893:	f7 7d dc             	idivl  -0x24(%rbp)
   42896:	89 c2                	mov    %eax,%edx
   42898:	89 d0                	mov    %edx,%eax
   4289a:	c1 f8 1f             	sar    $0x1f,%eax
   4289d:	c1 e8 18             	shr    $0x18,%eax
   428a0:	89 c1                	mov    %eax,%ecx
   428a2:	8d 04 0a             	lea    (%rdx,%rcx,1),%eax
   428a5:	0f b6 c0             	movzbl %al,%eax
   428a8:	29 c8                	sub    %ecx,%eax
   428aa:	0f b6 c0             	movzbl %al,%eax
   428ad:	c7 45 f4 40 00 00 00 	movl   $0x40,-0xc(%rbp)
   428b4:	88 45 f3             	mov    %al,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   428b7:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   428bb:	8b 55 f4             	mov    -0xc(%rbp),%edx
   428be:	ee                   	out    %al,(%dx)
}
   428bf:	90                   	nop
        outb(IO_TIMER1, TIMER_DIV(rate) / 256);
   428c0:	8b 45 dc             	mov    -0x24(%rbp),%eax
   428c3:	89 c2                	mov    %eax,%edx
   428c5:	c1 ea 1f             	shr    $0x1f,%edx
   428c8:	01 d0                	add    %edx,%eax
   428ca:	d1 f8                	sar    %eax
   428cc:	05 de 34 12 00       	add    $0x1234de,%eax
   428d1:	99                   	cltd   
   428d2:	f7 7d dc             	idivl  -0x24(%rbp)
   428d5:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   428db:	85 c0                	test   %eax,%eax
   428dd:	0f 48 c2             	cmovs  %edx,%eax
   428e0:	c1 f8 08             	sar    $0x8,%eax
   428e3:	0f b6 c0             	movzbl %al,%eax
   428e6:	c7 45 fc 40 00 00 00 	movl   $0x40,-0x4(%rbp)
   428ed:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   428f0:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   428f4:	8b 55 fc             	mov    -0x4(%rbp),%edx
   428f7:	ee                   	out    %al,(%dx)
}
   428f8:	90                   	nop
        interrupts_enabled |= 1 << (INT_TIMER - INT_HARDWARE);
   428f9:	0f b7 05 00 1a 01 00 	movzwl 0x11a00(%rip),%eax        # 54300 <interrupts_enabled>
   42900:	83 c8 01             	or     $0x1,%eax
   42903:	66 89 05 f6 19 01 00 	mov    %ax,0x119f6(%rip)        # 54300 <interrupts_enabled>
   4290a:	eb 11                	jmp    4291d <timer_init+0xc9>
    } else {
        interrupts_enabled &= ~(1 << (INT_TIMER - INT_HARDWARE));
   4290c:	0f b7 05 ed 19 01 00 	movzwl 0x119ed(%rip),%eax        # 54300 <interrupts_enabled>
   42913:	83 e0 fe             	and    $0xfffffffe,%eax
   42916:	66 89 05 e3 19 01 00 	mov    %ax,0x119e3(%rip)        # 54300 <interrupts_enabled>
    }
    interrupt_mask();
   4291d:	e8 cc fd ff ff       	call   426ee <interrupt_mask>
}
   42922:	90                   	nop
   42923:	c9                   	leave  
   42924:	c3                   	ret    

0000000000042925 <physical_memory_isreserved>:
//    Returns non-zero iff `pa` is a reserved physical address.

#define IOPHYSMEM       0x000A0000
#define EXTPHYSMEM      0x00100000

int physical_memory_isreserved(uintptr_t pa) {
   42925:	f3 0f 1e fa          	endbr64 
   42929:	55                   	push   %rbp
   4292a:	48 89 e5             	mov    %rsp,%rbp
   4292d:	48 83 ec 08          	sub    $0x8,%rsp
   42931:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return pa == 0 || (pa >= IOPHYSMEM && pa < EXTPHYSMEM);
   42935:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   4293a:	74 14                	je     42950 <physical_memory_isreserved+0x2b>
   4293c:	48 81 7d f8 ff ff 09 	cmpq   $0x9ffff,-0x8(%rbp)
   42943:	00 
   42944:	76 11                	jbe    42957 <physical_memory_isreserved+0x32>
   42946:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   4294d:	00 
   4294e:	77 07                	ja     42957 <physical_memory_isreserved+0x32>
   42950:	b8 01 00 00 00       	mov    $0x1,%eax
   42955:	eb 05                	jmp    4295c <physical_memory_isreserved+0x37>
   42957:	b8 00 00 00 00       	mov    $0x0,%eax
}
   4295c:	c9                   	leave  
   4295d:	c3                   	ret    

000000000004295e <pci_make_configaddr>:


// pci_make_configaddr(bus, slot, func)
//    Construct a PCI configuration space address from parts.

static int pci_make_configaddr(int bus, int slot, int func) {
   4295e:	f3 0f 1e fa          	endbr64 
   42962:	55                   	push   %rbp
   42963:	48 89 e5             	mov    %rsp,%rbp
   42966:	48 83 ec 10          	sub    $0x10,%rsp
   4296a:	89 7d fc             	mov    %edi,-0x4(%rbp)
   4296d:	89 75 f8             	mov    %esi,-0x8(%rbp)
   42970:	89 55 f4             	mov    %edx,-0xc(%rbp)
    return (bus << 16) | (slot << 11) | (func << 8);
   42973:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42976:	c1 e0 10             	shl    $0x10,%eax
   42979:	89 c2                	mov    %eax,%edx
   4297b:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4297e:	c1 e0 0b             	shl    $0xb,%eax
   42981:	09 c2                	or     %eax,%edx
   42983:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42986:	c1 e0 08             	shl    $0x8,%eax
   42989:	09 d0                	or     %edx,%eax
}
   4298b:	c9                   	leave  
   4298c:	c3                   	ret    

000000000004298d <pci_config_readl>:
//    Read a 32-bit word in PCI configuration space.

#define PCI_HOST_BRIDGE_CONFIG_ADDR 0xCF8
#define PCI_HOST_BRIDGE_CONFIG_DATA 0xCFC

static uint32_t pci_config_readl(int configaddr, int offset) {
   4298d:	f3 0f 1e fa          	endbr64 
   42991:	55                   	push   %rbp
   42992:	48 89 e5             	mov    %rsp,%rbp
   42995:	48 83 ec 18          	sub    $0x18,%rsp
   42999:	89 7d ec             	mov    %edi,-0x14(%rbp)
   4299c:	89 75 e8             	mov    %esi,-0x18(%rbp)
    outl(PCI_HOST_BRIDGE_CONFIG_ADDR, 0x80000000 | configaddr | offset);
   4299f:	8b 55 ec             	mov    -0x14(%rbp),%edx
   429a2:	8b 45 e8             	mov    -0x18(%rbp),%eax
   429a5:	09 d0                	or     %edx,%eax
   429a7:	0d 00 00 00 80       	or     $0x80000000,%eax
   429ac:	c7 45 f4 f8 0c 00 00 	movl   $0xcf8,-0xc(%rbp)
   429b3:	89 45 f0             	mov    %eax,-0x10(%rbp)
    asm volatile("outl %0,%w1" : : "a" (data), "d" (port));
   429b6:	8b 45 f0             	mov    -0x10(%rbp),%eax
   429b9:	8b 55 f4             	mov    -0xc(%rbp),%edx
   429bc:	ef                   	out    %eax,(%dx)
}
   429bd:	90                   	nop
   429be:	c7 45 fc fc 0c 00 00 	movl   $0xcfc,-0x4(%rbp)
    asm volatile("inl %w1,%0" : "=a" (data) : "d" (port));
   429c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
   429c8:	89 c2                	mov    %eax,%edx
   429ca:	ed                   	in     (%dx),%eax
   429cb:	89 45 f8             	mov    %eax,-0x8(%rbp)
    return data;
   429ce:	8b 45 f8             	mov    -0x8(%rbp),%eax
    return inl(PCI_HOST_BRIDGE_CONFIG_DATA);
}
   429d1:	c9                   	leave  
   429d2:	c3                   	ret    

00000000000429d3 <pci_find_device>:

// pci_find_device
//    Search for a PCI device matching `vendor` and `device`. Return
//    the config base address or -1 if no device was found.

static int pci_find_device(int vendor, int device) {
   429d3:	f3 0f 1e fa          	endbr64 
   429d7:	55                   	push   %rbp
   429d8:	48 89 e5             	mov    %rsp,%rbp
   429db:	48 83 ec 28          	sub    $0x28,%rsp
   429df:	89 7d dc             	mov    %edi,-0x24(%rbp)
   429e2:	89 75 d8             	mov    %esi,-0x28(%rbp)
    for (int bus = 0; bus != 256; ++bus) {
   429e5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   429ec:	eb 73                	jmp    42a61 <pci_find_device+0x8e>
        for (int slot = 0; slot != 32; ++slot) {
   429ee:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   429f5:	eb 60                	jmp    42a57 <pci_find_device+0x84>
            for (int func = 0; func != 8; ++func) {
   429f7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   429fe:	eb 4a                	jmp    42a4a <pci_find_device+0x77>
                int configaddr = pci_make_configaddr(bus, slot, func);
   42a00:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42a03:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   42a06:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42a09:	89 ce                	mov    %ecx,%esi
   42a0b:	89 c7                	mov    %eax,%edi
   42a0d:	e8 4c ff ff ff       	call   4295e <pci_make_configaddr>
   42a12:	89 45 f0             	mov    %eax,-0x10(%rbp)
                uint32_t vendor_device = pci_config_readl(configaddr, 0);
   42a15:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42a18:	be 00 00 00 00       	mov    $0x0,%esi
   42a1d:	89 c7                	mov    %eax,%edi
   42a1f:	e8 69 ff ff ff       	call   4298d <pci_config_readl>
   42a24:	89 45 ec             	mov    %eax,-0x14(%rbp)
                if (vendor_device == (uint32_t) (vendor | (device << 16))) {
   42a27:	8b 45 d8             	mov    -0x28(%rbp),%eax
   42a2a:	c1 e0 10             	shl    $0x10,%eax
   42a2d:	0b 45 dc             	or     -0x24(%rbp),%eax
   42a30:	39 45 ec             	cmp    %eax,-0x14(%rbp)
   42a33:	75 05                	jne    42a3a <pci_find_device+0x67>
                    return configaddr;
   42a35:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42a38:	eb 35                	jmp    42a6f <pci_find_device+0x9c>
                } else if (vendor_device == (uint32_t) -1 && func == 0) {
   42a3a:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%rbp)
   42a3e:	75 06                	jne    42a46 <pci_find_device+0x73>
   42a40:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   42a44:	74 0c                	je     42a52 <pci_find_device+0x7f>
            for (int func = 0; func != 8; ++func) {
   42a46:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   42a4a:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
   42a4e:	75 b0                	jne    42a00 <pci_find_device+0x2d>
   42a50:	eb 01                	jmp    42a53 <pci_find_device+0x80>
                    break;
   42a52:	90                   	nop
        for (int slot = 0; slot != 32; ++slot) {
   42a53:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   42a57:	83 7d f8 20          	cmpl   $0x20,-0x8(%rbp)
   42a5b:	75 9a                	jne    429f7 <pci_find_device+0x24>
    for (int bus = 0; bus != 256; ++bus) {
   42a5d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   42a61:	81 7d fc 00 01 00 00 	cmpl   $0x100,-0x4(%rbp)
   42a68:	75 84                	jne    429ee <pci_find_device+0x1b>
                }
            }
        }
    }
    return -1;
   42a6a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   42a6f:	c9                   	leave  
   42a70:	c3                   	ret    

0000000000042a71 <poweroff>:
//    that speaks ACPI; QEMU emulates a PIIX4 Power Management Controller.

#define PCI_VENDOR_ID_INTEL     0x8086
#define PCI_DEVICE_ID_PIIX4     0x7113

void poweroff(void) {
   42a71:	f3 0f 1e fa          	endbr64 
   42a75:	55                   	push   %rbp
   42a76:	48 89 e5             	mov    %rsp,%rbp
   42a79:	48 83 ec 10          	sub    $0x10,%rsp
    int configaddr = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PIIX4);
   42a7d:	be 13 71 00 00       	mov    $0x7113,%esi
   42a82:	bf 86 80 00 00       	mov    $0x8086,%edi
   42a87:	e8 47 ff ff ff       	call   429d3 <pci_find_device>
   42a8c:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (configaddr >= 0) {
   42a8f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   42a93:	78 30                	js     42ac5 <poweroff+0x54>
        // Read I/O base register from controller's PCI configuration space.
        int pm_io_base = pci_config_readl(configaddr, 0x40) & 0xFFC0;
   42a95:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42a98:	be 40 00 00 00       	mov    $0x40,%esi
   42a9d:	89 c7                	mov    %eax,%edi
   42a9f:	e8 e9 fe ff ff       	call   4298d <pci_config_readl>
   42aa4:	25 c0 ff 00 00       	and    $0xffc0,%eax
   42aa9:	89 45 f8             	mov    %eax,-0x8(%rbp)
        // Write `suspend enable` to the power management control register.
        outw(pm_io_base + 4, 0x2000);
   42aac:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42aaf:	83 c0 04             	add    $0x4,%eax
   42ab2:	89 45 f4             	mov    %eax,-0xc(%rbp)
   42ab5:	66 c7 45 f2 00 20    	movw   $0x2000,-0xe(%rbp)
    asm volatile("outw %0,%w1" : : "a" (data), "d" (port));
   42abb:	0f b7 45 f2          	movzwl -0xe(%rbp),%eax
   42abf:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42ac2:	66 ef                	out    %ax,(%dx)
}
   42ac4:	90                   	nop
    }
    // No PIIX4; spin.
    console_printf(CPOS(24, 0), 0xC000, "Cannot power off!\n");
   42ac5:	48 8d 05 94 29 00 00 	lea    0x2994(%rip),%rax        # 45460 <memstate_colors+0xc0>
   42acc:	48 89 c2             	mov    %rax,%rdx
   42acf:	be 00 c0 00 00       	mov    $0xc000,%esi
   42ad4:	bf 80 07 00 00       	mov    $0x780,%edi
   42ad9:	b8 00 00 00 00       	mov    $0x0,%eax
   42ade:	e8 1a 24 00 00       	call   44efd <console_printf>
 spinloop: goto spinloop;
   42ae3:	eb fe                	jmp    42ae3 <poweroff+0x72>

0000000000042ae5 <reboot>:


// reboot
//    Reboot the virtual machine.

void reboot(void) {
   42ae5:	f3 0f 1e fa          	endbr64 
   42ae9:	55                   	push   %rbp
   42aea:	48 89 e5             	mov    %rsp,%rbp
   42aed:	48 83 ec 10          	sub    $0x10,%rsp
   42af1:	c7 45 fc 92 00 00 00 	movl   $0x92,-0x4(%rbp)
   42af8:	c6 45 fb 03          	movb   $0x3,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42afc:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42b00:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42b03:	ee                   	out    %al,(%dx)
}
   42b04:	90                   	nop
    outb(0x92, 3);
 spinloop: goto spinloop;
   42b05:	eb fe                	jmp    42b05 <reboot+0x20>

0000000000042b07 <process_init>:


// process_init(p, flags)
//    Initialize special-purpose registers for process `p`.

void process_init(proc* p, int flags) {
   42b07:	f3 0f 1e fa          	endbr64 
   42b0b:	55                   	push   %rbp
   42b0c:	48 89 e5             	mov    %rsp,%rbp
   42b0f:	48 83 ec 10          	sub    $0x10,%rsp
   42b13:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42b17:	89 75 f4             	mov    %esi,-0xc(%rbp)
    memset(&p->p_registers, 0, sizeof(p->p_registers));
   42b1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42b1e:	48 83 c0 08          	add    $0x8,%rax
   42b22:	ba c0 00 00 00       	mov    $0xc0,%edx
   42b27:	be 00 00 00 00       	mov    $0x0,%esi
   42b2c:	48 89 c7             	mov    %rax,%rdi
   42b2f:	e8 8a 15 00 00       	call   440be <memset>
    p->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
   42b34:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42b38:	66 c7 80 a8 00 00 00 	movw   $0x13,0xa8(%rax)
   42b3f:	13 00 
    p->p_registers.reg_fs = SEGSEL_APP_DATA | 3;
   42b41:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42b45:	48 c7 80 80 00 00 00 	movq   $0x23,0x80(%rax)
   42b4c:	23 00 00 00 
    p->p_registers.reg_gs = SEGSEL_APP_DATA | 3;
   42b50:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42b54:	48 c7 80 88 00 00 00 	movq   $0x23,0x88(%rax)
   42b5b:	23 00 00 00 
    p->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
   42b5f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42b63:	66 c7 80 c0 00 00 00 	movw   $0x23,0xc0(%rax)
   42b6a:	23 00 
    p->p_registers.reg_rflags = EFLAGS_IF;
   42b6c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42b70:	48 c7 80 b0 00 00 00 	movq   $0x200,0xb0(%rax)
   42b77:	00 02 00 00 
    p->display_status = 1;
   42b7b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42b7f:	c6 80 d8 00 00 00 01 	movb   $0x1,0xd8(%rax)

    if (flags & PROCINIT_ALLOW_PROGRAMMED_IO) {
   42b86:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42b89:	83 e0 01             	and    $0x1,%eax
   42b8c:	85 c0                	test   %eax,%eax
   42b8e:	74 1c                	je     42bac <process_init+0xa5>
        p->p_registers.reg_rflags |= EFLAGS_IOPL_3;
   42b90:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42b94:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   42b9b:	80 cc 30             	or     $0x30,%ah
   42b9e:	48 89 c2             	mov    %rax,%rdx
   42ba1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42ba5:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
    if (flags & PROCINIT_DISABLE_INTERRUPTS) {
   42bac:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42baf:	83 e0 02             	and    $0x2,%eax
   42bb2:	85 c0                	test   %eax,%eax
   42bb4:	74 1c                	je     42bd2 <process_init+0xcb>
        p->p_registers.reg_rflags &= ~EFLAGS_IF;
   42bb6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42bba:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   42bc1:	80 e4 fd             	and    $0xfd,%ah
   42bc4:	48 89 c2             	mov    %rax,%rdx
   42bc7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42bcb:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
}
   42bd2:	90                   	nop
   42bd3:	c9                   	leave  
   42bd4:	c3                   	ret    

0000000000042bd5 <console_show_cursor>:

// console_show_cursor(cpos)
//    Move the console cursor to position `cpos`, which should be between 0
//    and 80 * 25.

void console_show_cursor(int cpos) {
   42bd5:	f3 0f 1e fa          	endbr64 
   42bd9:	55                   	push   %rbp
   42bda:	48 89 e5             	mov    %rsp,%rbp
   42bdd:	48 83 ec 28          	sub    $0x28,%rsp
   42be1:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (cpos < 0 || cpos > CONSOLE_ROWS * CONSOLE_COLUMNS) {
   42be4:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   42be8:	78 09                	js     42bf3 <console_show_cursor+0x1e>
   42bea:	81 7d dc d0 07 00 00 	cmpl   $0x7d0,-0x24(%rbp)
   42bf1:	7e 07                	jle    42bfa <console_show_cursor+0x25>
        cpos = 0;
   42bf3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
   42bfa:	c7 45 e4 d4 03 00 00 	movl   $0x3d4,-0x1c(%rbp)
   42c01:	c6 45 e3 0e          	movb   $0xe,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42c05:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   42c09:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   42c0c:	ee                   	out    %al,(%dx)
}
   42c0d:	90                   	nop
    }
    outb(0x3D4, 14);
    outb(0x3D5, cpos / 256);
   42c0e:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42c11:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   42c17:	85 c0                	test   %eax,%eax
   42c19:	0f 48 c2             	cmovs  %edx,%eax
   42c1c:	c1 f8 08             	sar    $0x8,%eax
   42c1f:	0f b6 c0             	movzbl %al,%eax
   42c22:	c7 45 ec d5 03 00 00 	movl   $0x3d5,-0x14(%rbp)
   42c29:	88 45 eb             	mov    %al,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42c2c:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   42c30:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42c33:	ee                   	out    %al,(%dx)
}
   42c34:	90                   	nop
   42c35:	c7 45 f4 d4 03 00 00 	movl   $0x3d4,-0xc(%rbp)
   42c3c:	c6 45 f3 0f          	movb   $0xf,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42c40:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   42c44:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42c47:	ee                   	out    %al,(%dx)
}
   42c48:	90                   	nop
    outb(0x3D4, 15);
    outb(0x3D5, cpos % 256);
   42c49:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42c4c:	99                   	cltd   
   42c4d:	c1 ea 18             	shr    $0x18,%edx
   42c50:	01 d0                	add    %edx,%eax
   42c52:	0f b6 c0             	movzbl %al,%eax
   42c55:	29 d0                	sub    %edx,%eax
   42c57:	0f b6 c0             	movzbl %al,%eax
   42c5a:	c7 45 fc d5 03 00 00 	movl   $0x3d5,-0x4(%rbp)
   42c61:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42c64:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42c68:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42c6b:	ee                   	out    %al,(%dx)
}
   42c6c:	90                   	nop
}
   42c6d:	90                   	nop
   42c6e:	c9                   	leave  
   42c6f:	c3                   	ret    

0000000000042c70 <keyboard_readc>:
    /*CKEY(16)*/ {{'\'', '"', 0, 0}},  /*CKEY(17)*/ {{'`', '~', 0, 0}},
    /*CKEY(18)*/ {{'\\', '|', 034, 0}},  /*CKEY(19)*/ {{',', '<', 0, 0}},
    /*CKEY(20)*/ {{'.', '>', 0, 0}},  /*CKEY(21)*/ {{'/', '?', 0, 0}}
};

int keyboard_readc(void) {
   42c70:	f3 0f 1e fa          	endbr64 
   42c74:	55                   	push   %rbp
   42c75:	48 89 e5             	mov    %rsp,%rbp
   42c78:	48 83 ec 20          	sub    $0x20,%rsp
   42c7c:	c7 45 f0 64 00 00 00 	movl   $0x64,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42c83:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42c86:	89 c2                	mov    %eax,%edx
   42c88:	ec                   	in     (%dx),%al
   42c89:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   42c8c:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    static uint8_t modifiers;
    static uint8_t last_escape;

    if ((inb(KEYBOARD_STATUSREG) & KEYBOARD_STATUS_READY) == 0) {
   42c90:	0f b6 c0             	movzbl %al,%eax
   42c93:	83 e0 01             	and    $0x1,%eax
   42c96:	85 c0                	test   %eax,%eax
   42c98:	75 0a                	jne    42ca4 <keyboard_readc+0x34>
        return -1;
   42c9a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   42c9f:	e9 fd 01 00 00       	jmp    42ea1 <keyboard_readc+0x231>
   42ca4:	c7 45 e8 60 00 00 00 	movl   $0x60,-0x18(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42cab:	8b 45 e8             	mov    -0x18(%rbp),%eax
   42cae:	89 c2                	mov    %eax,%edx
   42cb0:	ec                   	in     (%dx),%al
   42cb1:	88 45 e7             	mov    %al,-0x19(%rbp)
    return data;
   42cb4:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
    }

    uint8_t data = inb(KEYBOARD_DATAREG);
   42cb8:	88 45 fb             	mov    %al,-0x5(%rbp)
    uint8_t escape = last_escape;
   42cbb:	0f b6 05 40 16 01 00 	movzbl 0x11640(%rip),%eax        # 54302 <last_escape.2>
   42cc2:	88 45 fa             	mov    %al,-0x6(%rbp)
    last_escape = 0;
   42cc5:	c6 05 36 16 01 00 00 	movb   $0x0,0x11636(%rip)        # 54302 <last_escape.2>

    if (data == 0xE0) {         // mode shift
   42ccc:	80 7d fb e0          	cmpb   $0xe0,-0x5(%rbp)
   42cd0:	75 11                	jne    42ce3 <keyboard_readc+0x73>
        last_escape = 0x80;
   42cd2:	c6 05 29 16 01 00 80 	movb   $0x80,0x11629(%rip)        # 54302 <last_escape.2>
        return 0;
   42cd9:	b8 00 00 00 00       	mov    $0x0,%eax
   42cde:	e9 be 01 00 00       	jmp    42ea1 <keyboard_readc+0x231>
    } else if (data & 0x80) {   // key release: matters only for modifier keys
   42ce3:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42ce7:	84 c0                	test   %al,%al
   42ce9:	79 64                	jns    42d4f <keyboard_readc+0xdf>
        int ch = keymap[(data & 0x7F) | escape];
   42ceb:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42cef:	83 e0 7f             	and    $0x7f,%eax
   42cf2:	89 c2                	mov    %eax,%edx
   42cf4:	0f b6 45 fa          	movzbl -0x6(%rbp),%eax
   42cf8:	09 d0                	or     %edx,%eax
   42cfa:	48 98                	cltq   
   42cfc:	48 8d 15 7d 27 00 00 	lea    0x277d(%rip),%rdx        # 45480 <keymap>
   42d03:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
   42d07:	0f b6 c0             	movzbl %al,%eax
   42d0a:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   42d0d:	81 7d f4 f9 00 00 00 	cmpl   $0xf9,-0xc(%rbp)
   42d14:	7e 2f                	jle    42d45 <keyboard_readc+0xd5>
   42d16:	81 7d f4 fc 00 00 00 	cmpl   $0xfc,-0xc(%rbp)
   42d1d:	7f 26                	jg     42d45 <keyboard_readc+0xd5>
            modifiers &= ~(1 << (ch - KEY_SHIFT));
   42d1f:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42d22:	2d fa 00 00 00       	sub    $0xfa,%eax
   42d27:	ba 01 00 00 00       	mov    $0x1,%edx
   42d2c:	89 c1                	mov    %eax,%ecx
   42d2e:	d3 e2                	shl    %cl,%edx
   42d30:	89 d0                	mov    %edx,%eax
   42d32:	f7 d0                	not    %eax
   42d34:	89 c2                	mov    %eax,%edx
   42d36:	0f b6 05 c6 15 01 00 	movzbl 0x115c6(%rip),%eax        # 54303 <modifiers.1>
   42d3d:	21 d0                	and    %edx,%eax
   42d3f:	88 05 be 15 01 00    	mov    %al,0x115be(%rip)        # 54303 <modifiers.1>
        }
        return 0;
   42d45:	b8 00 00 00 00       	mov    $0x0,%eax
   42d4a:	e9 52 01 00 00       	jmp    42ea1 <keyboard_readc+0x231>
    }

    int ch = (unsigned char) keymap[data | escape];
   42d4f:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42d53:	0a 45 fa             	or     -0x6(%rbp),%al
   42d56:	0f b6 c0             	movzbl %al,%eax
   42d59:	48 98                	cltq   
   42d5b:	48 8d 15 1e 27 00 00 	lea    0x271e(%rip),%rdx        # 45480 <keymap>
   42d62:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
   42d66:	0f b6 c0             	movzbl %al,%eax
   42d69:	89 45 fc             	mov    %eax,-0x4(%rbp)

    if (ch >= 'a' && ch <= 'z') {
   42d6c:	83 7d fc 60          	cmpl   $0x60,-0x4(%rbp)
   42d70:	7e 57                	jle    42dc9 <keyboard_readc+0x159>
   42d72:	83 7d fc 7a          	cmpl   $0x7a,-0x4(%rbp)
   42d76:	7f 51                	jg     42dc9 <keyboard_readc+0x159>
        if (modifiers & MOD_CONTROL) {
   42d78:	0f b6 05 84 15 01 00 	movzbl 0x11584(%rip),%eax        # 54303 <modifiers.1>
   42d7f:	0f b6 c0             	movzbl %al,%eax
   42d82:	83 e0 02             	and    $0x2,%eax
   42d85:	85 c0                	test   %eax,%eax
   42d87:	74 09                	je     42d92 <keyboard_readc+0x122>
            ch -= 0x60;
   42d89:	83 6d fc 60          	subl   $0x60,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   42d8d:	e9 0b 01 00 00       	jmp    42e9d <keyboard_readc+0x22d>
        } else if (!(modifiers & MOD_SHIFT) != !(modifiers & MOD_CAPSLOCK)) {
   42d92:	0f b6 05 6a 15 01 00 	movzbl 0x1156a(%rip),%eax        # 54303 <modifiers.1>
   42d99:	0f b6 c0             	movzbl %al,%eax
   42d9c:	83 e0 01             	and    $0x1,%eax
   42d9f:	85 c0                	test   %eax,%eax
   42da1:	0f 94 c2             	sete   %dl
   42da4:	0f b6 05 58 15 01 00 	movzbl 0x11558(%rip),%eax        # 54303 <modifiers.1>
   42dab:	0f b6 c0             	movzbl %al,%eax
   42dae:	83 e0 08             	and    $0x8,%eax
   42db1:	85 c0                	test   %eax,%eax
   42db3:	0f 94 c0             	sete   %al
   42db6:	31 d0                	xor    %edx,%eax
   42db8:	84 c0                	test   %al,%al
   42dba:	0f 84 dd 00 00 00    	je     42e9d <keyboard_readc+0x22d>
            ch -= 0x20;
   42dc0:	83 6d fc 20          	subl   $0x20,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   42dc4:	e9 d4 00 00 00       	jmp    42e9d <keyboard_readc+0x22d>
        }
    } else if (ch >= KEY_CAPSLOCK) {
   42dc9:	81 7d fc fc 00 00 00 	cmpl   $0xfc,-0x4(%rbp)
   42dd0:	7e 30                	jle    42e02 <keyboard_readc+0x192>
        modifiers ^= 1 << (ch - KEY_SHIFT);
   42dd2:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42dd5:	2d fa 00 00 00       	sub    $0xfa,%eax
   42dda:	ba 01 00 00 00       	mov    $0x1,%edx
   42ddf:	89 c1                	mov    %eax,%ecx
   42de1:	d3 e2                	shl    %cl,%edx
   42de3:	89 d0                	mov    %edx,%eax
   42de5:	89 c2                	mov    %eax,%edx
   42de7:	0f b6 05 15 15 01 00 	movzbl 0x11515(%rip),%eax        # 54303 <modifiers.1>
   42dee:	31 d0                	xor    %edx,%eax
   42df0:	88 05 0d 15 01 00    	mov    %al,0x1150d(%rip)        # 54303 <modifiers.1>
        ch = 0;
   42df6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42dfd:	e9 9c 00 00 00       	jmp    42e9e <keyboard_readc+0x22e>
    } else if (ch >= KEY_SHIFT) {
   42e02:	81 7d fc f9 00 00 00 	cmpl   $0xf9,-0x4(%rbp)
   42e09:	7e 2d                	jle    42e38 <keyboard_readc+0x1c8>
        modifiers |= 1 << (ch - KEY_SHIFT);
   42e0b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42e0e:	2d fa 00 00 00       	sub    $0xfa,%eax
   42e13:	ba 01 00 00 00       	mov    $0x1,%edx
   42e18:	89 c1                	mov    %eax,%ecx
   42e1a:	d3 e2                	shl    %cl,%edx
   42e1c:	89 d0                	mov    %edx,%eax
   42e1e:	89 c2                	mov    %eax,%edx
   42e20:	0f b6 05 dc 14 01 00 	movzbl 0x114dc(%rip),%eax        # 54303 <modifiers.1>
   42e27:	09 d0                	or     %edx,%eax
   42e29:	88 05 d4 14 01 00    	mov    %al,0x114d4(%rip)        # 54303 <modifiers.1>
        ch = 0;
   42e2f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42e36:	eb 66                	jmp    42e9e <keyboard_readc+0x22e>
    } else if (ch >= CKEY(0) && ch <= CKEY(21)) {
   42e38:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   42e3c:	7e 3f                	jle    42e7d <keyboard_readc+0x20d>
   42e3e:	81 7d fc 95 00 00 00 	cmpl   $0x95,-0x4(%rbp)
   42e45:	7f 36                	jg     42e7d <keyboard_readc+0x20d>
        ch = complex_keymap[ch - CKEY(0)].map[modifiers & 3];
   42e47:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42e4a:	8d 50 80             	lea    -0x80(%rax),%edx
   42e4d:	0f b6 05 af 14 01 00 	movzbl 0x114af(%rip),%eax        # 54303 <modifiers.1>
   42e54:	0f b6 c0             	movzbl %al,%eax
   42e57:	83 e0 03             	and    $0x3,%eax
   42e5a:	48 63 c8             	movslq %eax,%rcx
   42e5d:	48 63 c2             	movslq %edx,%rax
   42e60:	48 c1 e0 02          	shl    $0x2,%rax
   42e64:	48 8d 14 08          	lea    (%rax,%rcx,1),%rdx
   42e68:	48 8d 05 11 27 00 00 	lea    0x2711(%rip),%rax        # 45580 <complex_keymap>
   42e6f:	48 01 d0             	add    %rdx,%rax
   42e72:	0f b6 00             	movzbl (%rax),%eax
   42e75:	0f b6 c0             	movzbl %al,%eax
   42e78:	89 45 fc             	mov    %eax,-0x4(%rbp)
   42e7b:	eb 21                	jmp    42e9e <keyboard_readc+0x22e>
    } else if (ch < 0x80 && (modifiers & MOD_CONTROL)) {
   42e7d:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   42e81:	7f 1b                	jg     42e9e <keyboard_readc+0x22e>
   42e83:	0f b6 05 79 14 01 00 	movzbl 0x11479(%rip),%eax        # 54303 <modifiers.1>
   42e8a:	0f b6 c0             	movzbl %al,%eax
   42e8d:	83 e0 02             	and    $0x2,%eax
   42e90:	85 c0                	test   %eax,%eax
   42e92:	74 0a                	je     42e9e <keyboard_readc+0x22e>
        ch = 0;
   42e94:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42e9b:	eb 01                	jmp    42e9e <keyboard_readc+0x22e>
        if (modifiers & MOD_CONTROL) {
   42e9d:	90                   	nop
    }

    return ch;
   42e9e:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
   42ea1:	c9                   	leave  
   42ea2:	c3                   	ret    

0000000000042ea3 <delay>:
#define IO_PARALLEL1_CONTROL    0x37A
# define IO_PARALLEL_CONTROL_SELECT     0x08
# define IO_PARALLEL_CONTROL_INIT       0x04
# define IO_PARALLEL_CONTROL_STROBE     0x01

static void delay(void) {
   42ea3:	f3 0f 1e fa          	endbr64 
   42ea7:	55                   	push   %rbp
   42ea8:	48 89 e5             	mov    %rsp,%rbp
   42eab:	48 83 ec 20          	sub    $0x20,%rsp
   42eaf:	c7 45 e4 84 00 00 00 	movl   $0x84,-0x1c(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42eb6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   42eb9:	89 c2                	mov    %eax,%edx
   42ebb:	ec                   	in     (%dx),%al
   42ebc:	88 45 e3             	mov    %al,-0x1d(%rbp)
   42ebf:	c7 45 ec 84 00 00 00 	movl   $0x84,-0x14(%rbp)
   42ec6:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42ec9:	89 c2                	mov    %eax,%edx
   42ecb:	ec                   	in     (%dx),%al
   42ecc:	88 45 eb             	mov    %al,-0x15(%rbp)
   42ecf:	c7 45 f4 84 00 00 00 	movl   $0x84,-0xc(%rbp)
   42ed6:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42ed9:	89 c2                	mov    %eax,%edx
   42edb:	ec                   	in     (%dx),%al
   42edc:	88 45 f3             	mov    %al,-0xd(%rbp)
   42edf:	c7 45 fc 84 00 00 00 	movl   $0x84,-0x4(%rbp)
   42ee6:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42ee9:	89 c2                	mov    %eax,%edx
   42eeb:	ec                   	in     (%dx),%al
   42eec:	88 45 fb             	mov    %al,-0x5(%rbp)
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
}
   42eef:	90                   	nop
   42ef0:	c9                   	leave  
   42ef1:	c3                   	ret    

0000000000042ef2 <parallel_port_putc>:

static void parallel_port_putc(printer* p, unsigned char c, int color) {
   42ef2:	f3 0f 1e fa          	endbr64 
   42ef6:	55                   	push   %rbp
   42ef7:	48 89 e5             	mov    %rsp,%rbp
   42efa:	48 83 ec 40          	sub    $0x40,%rsp
   42efe:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   42f02:	89 f0                	mov    %esi,%eax
   42f04:	89 55 c0             	mov    %edx,-0x40(%rbp)
   42f07:	88 45 c4             	mov    %al,-0x3c(%rbp)
    static int initialized;
    (void) p, (void) color;
    if (!initialized) {
   42f0a:	8b 05 f4 13 01 00    	mov    0x113f4(%rip),%eax        # 54304 <initialized.0>
   42f10:	85 c0                	test   %eax,%eax
   42f12:	75 1e                	jne    42f32 <parallel_port_putc+0x40>
   42f14:	c7 45 f8 7a 03 00 00 	movl   $0x37a,-0x8(%rbp)
   42f1b:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42f1f:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   42f23:	8b 55 f8             	mov    -0x8(%rbp),%edx
   42f26:	ee                   	out    %al,(%dx)
}
   42f27:	90                   	nop
        outb(IO_PARALLEL1_CONTROL, 0);
        initialized = 1;
   42f28:	c7 05 d2 13 01 00 01 	movl   $0x1,0x113d2(%rip)        # 54304 <initialized.0>
   42f2f:	00 00 00 
    }

    for (int i = 0;
   42f32:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42f39:	eb 09                	jmp    42f44 <parallel_port_putc+0x52>
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
         ++i) {
        delay();
   42f3b:	e8 63 ff ff ff       	call   42ea3 <delay>
         ++i) {
   42f40:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
   42f44:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%rbp)
   42f4b:	7f 18                	jg     42f65 <parallel_port_putc+0x73>
   42f4d:	c7 45 f0 79 03 00 00 	movl   $0x379,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42f54:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42f57:	89 c2                	mov    %eax,%edx
   42f59:	ec                   	in     (%dx),%al
   42f5a:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   42f5d:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   42f61:	84 c0                	test   %al,%al
   42f63:	79 d6                	jns    42f3b <parallel_port_putc+0x49>
    }
    outb(IO_PARALLEL1_DATA, c);
   42f65:	0f b6 45 c4          	movzbl -0x3c(%rbp),%eax
   42f69:	c7 45 d8 78 03 00 00 	movl   $0x378,-0x28(%rbp)
   42f70:	88 45 d7             	mov    %al,-0x29(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42f73:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
   42f77:	8b 55 d8             	mov    -0x28(%rbp),%edx
   42f7a:	ee                   	out    %al,(%dx)
}
   42f7b:	90                   	nop
   42f7c:	c7 45 e0 7a 03 00 00 	movl   $0x37a,-0x20(%rbp)
   42f83:	c6 45 df 0d          	movb   $0xd,-0x21(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42f87:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
   42f8b:	8b 55 e0             	mov    -0x20(%rbp),%edx
   42f8e:	ee                   	out    %al,(%dx)
}
   42f8f:	90                   	nop
   42f90:	c7 45 e8 7a 03 00 00 	movl   $0x37a,-0x18(%rbp)
   42f97:	c6 45 e7 0c          	movb   $0xc,-0x19(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42f9b:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
   42f9f:	8b 55 e8             	mov    -0x18(%rbp),%edx
   42fa2:	ee                   	out    %al,(%dx)
}
   42fa3:	90                   	nop
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT | IO_PARALLEL_CONTROL_STROBE);
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT);
}
   42fa4:	90                   	nop
   42fa5:	c9                   	leave  
   42fa6:	c3                   	ret    

0000000000042fa7 <log_vprintf>:

void log_vprintf(const char* format, va_list val) {
   42fa7:	f3 0f 1e fa          	endbr64 
   42fab:	55                   	push   %rbp
   42fac:	48 89 e5             	mov    %rsp,%rbp
   42faf:	48 83 ec 20          	sub    $0x20,%rsp
   42fb3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   42fb7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    printer p;
    p.putc = parallel_port_putc;
   42fbb:	48 8d 05 30 ff ff ff 	lea    -0xd0(%rip),%rax        # 42ef2 <parallel_port_putc>
   42fc2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&p, 0, format, val);
   42fc6:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
   42fca:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   42fce:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
   42fd2:	be 00 00 00 00       	mov    $0x0,%esi
   42fd7:	48 89 c7             	mov    %rax,%rdi
   42fda:	e8 a5 13 00 00       	call   44384 <printer_vprintf>
}
   42fdf:	90                   	nop
   42fe0:	c9                   	leave  
   42fe1:	c3                   	ret    

0000000000042fe2 <log_printf>:

void log_printf(const char* format, ...) {
   42fe2:	f3 0f 1e fa          	endbr64 
   42fe6:	55                   	push   %rbp
   42fe7:	48 89 e5             	mov    %rsp,%rbp
   42fea:	48 83 ec 60          	sub    $0x60,%rsp
   42fee:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   42ff2:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   42ff6:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   42ffa:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42ffe:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   43002:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   43006:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   4300d:	48 8d 45 10          	lea    0x10(%rbp),%rax
   43011:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   43015:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   43019:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    log_vprintf(format, val);
   4301d:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
   43021:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   43025:	48 89 d6             	mov    %rdx,%rsi
   43028:	48 89 c7             	mov    %rax,%rdi
   4302b:	e8 77 ff ff ff       	call   42fa7 <log_vprintf>
    va_end(val);
}
   43030:	90                   	nop
   43031:	c9                   	leave  
   43032:	c3                   	ret    

0000000000043033 <error_vprintf>:

// error_printf, error_vprintf
//    Print debugging messages to the console and to the host's
//    `log.txt` file via `log_printf`.

int error_vprintf(int cpos, int color, const char* format, va_list val) {
   43033:	f3 0f 1e fa          	endbr64 
   43037:	55                   	push   %rbp
   43038:	48 89 e5             	mov    %rsp,%rbp
   4303b:	48 83 ec 40          	sub    $0x40,%rsp
   4303f:	89 7d dc             	mov    %edi,-0x24(%rbp)
   43042:	89 75 d8             	mov    %esi,-0x28(%rbp)
   43045:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   43049:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    va_list val2;
    __builtin_va_copy(val2, val);
   4304d:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   43051:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   43055:	48 8b 0a             	mov    (%rdx),%rcx
   43058:	48 89 08             	mov    %rcx,(%rax)
   4305b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   4305f:	48 89 48 08          	mov    %rcx,0x8(%rax)
   43063:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   43067:	48 89 50 10          	mov    %rdx,0x10(%rax)
    log_vprintf(format, val2);
   4306b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
   4306f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   43073:	48 89 d6             	mov    %rdx,%rsi
   43076:	48 89 c7             	mov    %rax,%rdi
   43079:	e8 29 ff ff ff       	call   42fa7 <log_vprintf>
    va_end(val2);
    return console_vprintf(cpos, color, format, val);
   4307e:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   43082:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   43086:	8b 75 d8             	mov    -0x28(%rbp),%esi
   43089:	8b 45 dc             	mov    -0x24(%rbp),%eax
   4308c:	89 c7                	mov    %eax,%edi
   4308e:	e8 ee 1d 00 00       	call   44e81 <console_vprintf>
}
   43093:	c9                   	leave  
   43094:	c3                   	ret    

0000000000043095 <error_printf>:

int error_printf(int cpos, int color, const char* format, ...) {
   43095:	f3 0f 1e fa          	endbr64 
   43099:	55                   	push   %rbp
   4309a:	48 89 e5             	mov    %rsp,%rbp
   4309d:	48 83 ec 60          	sub    $0x60,%rsp
   430a1:	89 7d ac             	mov    %edi,-0x54(%rbp)
   430a4:	89 75 a8             	mov    %esi,-0x58(%rbp)
   430a7:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   430ab:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   430af:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   430b3:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   430b7:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   430be:	48 8d 45 10          	lea    0x10(%rbp),%rax
   430c2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   430c6:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   430ca:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = error_vprintf(cpos, color, format, val);
   430ce:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   430d2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   430d6:	8b 75 a8             	mov    -0x58(%rbp),%esi
   430d9:	8b 45 ac             	mov    -0x54(%rbp),%eax
   430dc:	89 c7                	mov    %eax,%edi
   430de:	e8 50 ff ff ff       	call   43033 <error_vprintf>
   430e3:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   430e6:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   430e9:	c9                   	leave  
   430ea:	c3                   	ret    

00000000000430eb <check_keyboard>:
//    Check for the user typing a control key. 'a', 'f', and 'e' cause a soft
//    reboot where the kernel runs the allocator programs, "fork", or
//    "forkexit", respectively. Control-C or 'q' exit the virtual machine.
//    Returns key typed or -1 for no key.

int check_keyboard(void) {
   430eb:	f3 0f 1e fa          	endbr64 
   430ef:	55                   	push   %rbp
   430f0:	48 89 e5             	mov    %rsp,%rbp
   430f3:	53                   	push   %rbx
   430f4:	48 83 ec 48          	sub    $0x48,%rsp
    int c = keyboard_readc();
   430f8:	e8 73 fb ff ff       	call   42c70 <keyboard_readc>
   430fd:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   43100:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   43104:	74 1c                	je     43122 <check_keyboard+0x37>
   43106:	83 7d e4 66          	cmpl   $0x66,-0x1c(%rbp)
   4310a:	74 16                	je     43122 <check_keyboard+0x37>
   4310c:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   43110:	74 10                	je     43122 <check_keyboard+0x37>
   43112:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   43116:	74 0a                	je     43122 <check_keyboard+0x37>
   43118:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   4311c:	0f 85 02 01 00 00    	jne    43224 <check_keyboard+0x139>
        // Install a temporary page table to carry us through the
        // process of reinitializing memory. This replicates work the
        // bootloader does.
        x86_64_pagetable* pt = (x86_64_pagetable*) 0x8000;
   43122:	48 c7 45 d8 00 80 00 	movq   $0x8000,-0x28(%rbp)
   43129:	00 
        memset(pt, 0, PAGESIZE * 3);
   4312a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4312e:	ba 00 30 00 00       	mov    $0x3000,%edx
   43133:	be 00 00 00 00       	mov    $0x0,%esi
   43138:	48 89 c7             	mov    %rax,%rdi
   4313b:	e8 7e 0f 00 00       	call   440be <memset>
        pt[0].entry[0] = 0x9000 | PTE_P | PTE_W | PTE_U;
   43140:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43144:	48 c7 00 07 90 00 00 	movq   $0x9007,(%rax)
        pt[1].entry[0] = 0xA000 | PTE_P | PTE_W | PTE_U;
   4314b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4314f:	48 05 00 10 00 00    	add    $0x1000,%rax
   43155:	48 c7 00 07 a0 00 00 	movq   $0xa007,(%rax)
        pt[2].entry[0] = PTE_P | PTE_W | PTE_U | PTE_PS;
   4315c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43160:	48 05 00 20 00 00    	add    $0x2000,%rax
   43166:	48 c7 00 87 00 00 00 	movq   $0x87,(%rax)
        lcr3((uintptr_t) pt);
   4316d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43171:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
}

static inline void lcr3(uintptr_t val) {
    asm volatile("" : : : "memory");
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   43175:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   43179:	0f 22 d8             	mov    %rax,%cr3
}
   4317c:	90                   	nop
        // The soft reboot process doesn't modify memory, so it's
        // safe to pass `multiboot_info` on the kernel stack, even
        // though it will get overwritten as the kernel runs.
        uint32_t multiboot_info[5];
        multiboot_info[0] = 4;
   4317d:	c7 45 b4 04 00 00 00 	movl   $0x4,-0x4c(%rbp)
        const char* argument = "fork";
   43184:	48 8d 05 4d 24 00 00 	lea    0x244d(%rip),%rax        # 455d8 <complex_keymap+0x58>
   4318b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        if (c == 'a') {
   4318f:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   43193:	75 0d                	jne    431a2 <check_keyboard+0xb7>
            argument = "allocator";
   43195:	48 8d 05 41 24 00 00 	lea    0x2441(%rip),%rax        # 455dd <complex_keymap+0x5d>
   4319c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   431a0:	eb 37                	jmp    431d9 <check_keyboard+0xee>
        } else if (c == 'e') {
   431a2:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   431a6:	75 0d                	jne    431b5 <check_keyboard+0xca>
            argument = "forkexit";
   431a8:	48 8d 05 38 24 00 00 	lea    0x2438(%rip),%rax        # 455e7 <complex_keymap+0x67>
   431af:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   431b3:	eb 24                	jmp    431d9 <check_keyboard+0xee>
        }
        else if (c == 't'){
   431b5:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   431b9:	75 0d                	jne    431c8 <check_keyboard+0xdd>
            argument = "test";
   431bb:	48 8d 05 2e 24 00 00 	lea    0x242e(%rip),%rax        # 455f0 <complex_keymap+0x70>
   431c2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   431c6:	eb 11                	jmp    431d9 <check_keyboard+0xee>
        }
        else if(c == '2'){
   431c8:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   431cc:	75 0b                	jne    431d9 <check_keyboard+0xee>
            argument = "test2";
   431ce:	48 8d 05 20 24 00 00 	lea    0x2420(%rip),%rax        # 455f5 <complex_keymap+0x75>
   431d5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        }
        uintptr_t argument_ptr = (uintptr_t) argument;
   431d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   431dd:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        assert(argument_ptr < 0x100000000L);
   431e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   431e6:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
   431ea:	76 1e                	jbe    4320a <check_keyboard+0x11f>
   431ec:	48 8d 05 08 24 00 00 	lea    0x2408(%rip),%rax        # 455fb <complex_keymap+0x7b>
   431f3:	48 89 c2             	mov    %rax,%rdx
   431f6:	be 5d 02 00 00       	mov    $0x25d,%esi
   431fb:	48 8d 05 15 24 00 00 	lea    0x2415(%rip),%rax        # 45617 <complex_keymap+0x97>
   43202:	48 89 c7             	mov    %rax,%rdi
   43205:	e8 33 01 00 00       	call   4333d <assert_fail>
        multiboot_info[4] = (uint32_t) argument_ptr;
   4320a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4320e:	89 45 c4             	mov    %eax,-0x3c(%rbp)
        asm volatile("movl $0x2BADB002, %%eax; jmp entry_from_boot"
   43211:	48 8d 45 b4          	lea    -0x4c(%rbp),%rax
   43215:	48 89 c3             	mov    %rax,%rbx
   43218:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
   4321d:	e9 de cd ff ff       	jmp    40000 <entry_from_boot>
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   43222:	eb 11                	jmp    43235 <check_keyboard+0x14a>
                     : : "b" (multiboot_info) : "memory");
    } else if (c == 0x03 || c == 'q') {
   43224:	83 7d e4 03          	cmpl   $0x3,-0x1c(%rbp)
   43228:	74 06                	je     43230 <check_keyboard+0x145>
   4322a:	83 7d e4 71          	cmpl   $0x71,-0x1c(%rbp)
   4322e:	75 05                	jne    43235 <check_keyboard+0x14a>
        poweroff();
   43230:	e8 3c f8 ff ff       	call   42a71 <poweroff>
    }
    return c;
   43235:	8b 45 e4             	mov    -0x1c(%rbp),%eax
}
   43238:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   4323c:	c9                   	leave  
   4323d:	c3                   	ret    

000000000004323e <fail>:

// fail
//    Loop until user presses Control-C, then poweroff.

static void fail(void) __attribute__((noreturn));
static void fail(void) {
   4323e:	f3 0f 1e fa          	endbr64 
   43242:	55                   	push   %rbp
   43243:	48 89 e5             	mov    %rsp,%rbp
    while (1) {
        check_keyboard();
   43246:	e8 a0 fe ff ff       	call   430eb <check_keyboard>
   4324b:	eb f9                	jmp    43246 <fail+0x8>

000000000004324d <panic>:

// panic, assert_fail
//    Use console_printf() to print a failure message and then wait for
//    control-C. Also write the failure message to the log.

void panic(const char* format, ...) {
   4324d:	f3 0f 1e fa          	endbr64 
   43251:	55                   	push   %rbp
   43252:	48 89 e5             	mov    %rsp,%rbp
   43255:	48 83 ec 60          	sub    $0x60,%rsp
   43259:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   4325d:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   43261:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   43265:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   43269:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   4326d:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   43271:	c7 45 b0 08 00 00 00 	movl   $0x8,-0x50(%rbp)
   43278:	48 8d 45 10          	lea    0x10(%rbp),%rax
   4327c:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   43280:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   43284:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

    if (format) {
   43288:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
   4328d:	0f 84 87 00 00 00    	je     4331a <panic+0xcd>
        // Print panic message to both the screen and the log
        int cpos = error_printf(CPOS(23, 0), 0xC000, "PANIC: ");
   43293:	48 8d 05 91 23 00 00 	lea    0x2391(%rip),%rax        # 4562b <complex_keymap+0xab>
   4329a:	48 89 c2             	mov    %rax,%rdx
   4329d:	be 00 c0 00 00       	mov    $0xc000,%esi
   432a2:	bf 30 07 00 00       	mov    $0x730,%edi
   432a7:	b8 00 00 00 00       	mov    $0x0,%eax
   432ac:	e8 e4 fd ff ff       	call   43095 <error_printf>
   432b1:	89 45 cc             	mov    %eax,-0x34(%rbp)
        cpos = error_vprintf(cpos, 0xC000, format, val);
   432b4:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   432b8:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   432bc:	8b 45 cc             	mov    -0x34(%rbp),%eax
   432bf:	be 00 c0 00 00       	mov    $0xc000,%esi
   432c4:	89 c7                	mov    %eax,%edi
   432c6:	e8 68 fd ff ff       	call   43033 <error_vprintf>
   432cb:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (CCOL(cpos)) {
   432ce:	8b 4d cc             	mov    -0x34(%rbp),%ecx
   432d1:	48 63 c1             	movslq %ecx,%rax
   432d4:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   432db:	48 c1 e8 20          	shr    $0x20,%rax
   432df:	c1 f8 05             	sar    $0x5,%eax
   432e2:	89 ce                	mov    %ecx,%esi
   432e4:	c1 fe 1f             	sar    $0x1f,%esi
   432e7:	29 f0                	sub    %esi,%eax
   432e9:	89 c2                	mov    %eax,%edx
   432eb:	89 d0                	mov    %edx,%eax
   432ed:	c1 e0 02             	shl    $0x2,%eax
   432f0:	01 d0                	add    %edx,%eax
   432f2:	c1 e0 04             	shl    $0x4,%eax
   432f5:	29 c1                	sub    %eax,%ecx
   432f7:	89 ca                	mov    %ecx,%edx
   432f9:	85 d2                	test   %edx,%edx
   432fb:	74 3b                	je     43338 <panic+0xeb>
            error_printf(cpos, 0xC000, "\n");
   432fd:	8b 45 cc             	mov    -0x34(%rbp),%eax
   43300:	48 8d 15 2c 23 00 00 	lea    0x232c(%rip),%rdx        # 45633 <complex_keymap+0xb3>
   43307:	be 00 c0 00 00       	mov    $0xc000,%esi
   4330c:	89 c7                	mov    %eax,%edi
   4330e:	b8 00 00 00 00       	mov    $0x0,%eax
   43313:	e8 7d fd ff ff       	call   43095 <error_printf>
   43318:	eb 1e                	jmp    43338 <panic+0xeb>
        }
    } else {
        error_printf(CPOS(23, 0), 0xC000, "PANIC");
   4331a:	48 8d 05 14 23 00 00 	lea    0x2314(%rip),%rax        # 45635 <complex_keymap+0xb5>
   43321:	48 89 c2             	mov    %rax,%rdx
   43324:	be 00 c0 00 00       	mov    $0xc000,%esi
   43329:	bf 30 07 00 00       	mov    $0x730,%edi
   4332e:	b8 00 00 00 00       	mov    $0x0,%eax
   43333:	e8 5d fd ff ff       	call   43095 <error_printf>
    }

    va_end(val);
    fail();
   43338:	e8 01 ff ff ff       	call   4323e <fail>

000000000004333d <assert_fail>:
}

void assert_fail(const char* file, int line, const char* msg) {
   4333d:	f3 0f 1e fa          	endbr64 
   43341:	55                   	push   %rbp
   43342:	48 89 e5             	mov    %rsp,%rbp
   43345:	48 83 ec 20          	sub    $0x20,%rsp
   43349:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   4334d:	89 75 f4             	mov    %esi,-0xc(%rbp)
   43350:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    panic("%s:%d: assertion '%s' failed\n", file, line, msg);
   43354:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
   43358:	8b 55 f4             	mov    -0xc(%rbp),%edx
   4335b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4335f:	48 89 c6             	mov    %rax,%rsi
   43362:	48 8d 05 d2 22 00 00 	lea    0x22d2(%rip),%rax        # 4563b <complex_keymap+0xbb>
   43369:	48 89 c7             	mov    %rax,%rdi
   4336c:	b8 00 00 00 00       	mov    $0x0,%eax
   43371:	e8 d7 fe ff ff       	call   4324d <panic>

0000000000043376 <default_exception>:
}

void default_exception(proc* p){
   43376:	f3 0f 1e fa          	endbr64 
   4337a:	55                   	push   %rbp
   4337b:	48 89 e5             	mov    %rsp,%rbp
   4337e:	48 83 ec 20          	sub    $0x20,%rsp
   43382:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    x86_64_registers * reg = &(p->p_registers);
   43386:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4338a:	48 83 c0 08          	add    $0x8,%rax
   4338e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    panic("Unexpected exception %d!\n", reg->reg_intno);
   43392:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43396:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   4339d:	48 89 c6             	mov    %rax,%rsi
   433a0:	48 8d 05 b2 22 00 00 	lea    0x22b2(%rip),%rax        # 45659 <complex_keymap+0xd9>
   433a7:	48 89 c7             	mov    %rax,%rdi
   433aa:	b8 00 00 00 00       	mov    $0x0,%eax
   433af:	e8 99 fe ff ff       	call   4324d <panic>

00000000000433b4 <pageindex>:
static inline int pageindex(uintptr_t addr, int level) {
   433b4:	55                   	push   %rbp
   433b5:	48 89 e5             	mov    %rsp,%rbp
   433b8:	48 83 ec 10          	sub    $0x10,%rsp
   433bc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   433c0:	89 75 f4             	mov    %esi,-0xc(%rbp)
    assert(level >= 0 && level <= 3);
   433c3:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   433c7:	78 06                	js     433cf <pageindex+0x1b>
   433c9:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
   433cd:	7e 1e                	jle    433ed <pageindex+0x39>
   433cf:	48 8d 05 a2 22 00 00 	lea    0x22a2(%rip),%rax        # 45678 <complex_keymap+0xf8>
   433d6:	48 89 c2             	mov    %rax,%rdx
   433d9:	be 1e 00 00 00       	mov    $0x1e,%esi
   433de:	48 8d 05 ac 22 00 00 	lea    0x22ac(%rip),%rax        # 45691 <complex_keymap+0x111>
   433e5:	48 89 c7             	mov    %rax,%rdi
   433e8:	e8 50 ff ff ff       	call   4333d <assert_fail>
    return (int) (addr >> (PAGEOFFBITS + (3 - level) * PAGEINDEXBITS)) & 0x1FF;
   433ed:	b8 03 00 00 00       	mov    $0x3,%eax
   433f2:	2b 45 f4             	sub    -0xc(%rbp),%eax
   433f5:	89 c2                	mov    %eax,%edx
   433f7:	89 d0                	mov    %edx,%eax
   433f9:	c1 e0 03             	shl    $0x3,%eax
   433fc:	01 d0                	add    %edx,%eax
   433fe:	83 c0 0c             	add    $0xc,%eax
   43401:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43405:	89 c1                	mov    %eax,%ecx
   43407:	48 d3 ea             	shr    %cl,%rdx
   4340a:	48 89 d0             	mov    %rdx,%rax
   4340d:	25 ff 01 00 00       	and    $0x1ff,%eax
}
   43412:	c9                   	leave  
   43413:	c3                   	ret    

0000000000043414 <virtual_memory_init>:

static x86_64_pagetable kernel_pagetables[5];
x86_64_pagetable *kernel_pagetable;

void virtual_memory_init(void)
{
   43414:	f3 0f 1e fa          	endbr64 
   43418:	55                   	push   %rbp
   43419:	48 89 e5             	mov    %rsp,%rbp
   4341c:	48 83 ec 20          	sub    $0x20,%rsp
    kernel_pagetable = &kernel_pagetables[0];
   43420:	48 8d 05 d9 2b 01 00 	lea    0x12bd9(%rip),%rax        # 56000 <kernel_pagetables>
   43427:	48 89 05 d2 1b 01 00 	mov    %rax,0x11bd2(%rip)        # 55000 <kernel_pagetable>
    memset(kernel_pagetables, 0, sizeof(kernel_pagetables));
   4342e:	ba 00 50 00 00       	mov    $0x5000,%edx
   43433:	be 00 00 00 00       	mov    $0x0,%esi
   43438:	48 8d 05 c1 2b 01 00 	lea    0x12bc1(%rip),%rax        # 56000 <kernel_pagetables>
   4343f:	48 89 c7             	mov    %rax,%rdi
   43442:	e8 77 0c 00 00       	call   440be <memset>

    // connect the pagetable pages
    kernel_pagetables[0].entry[0] =
        (x86_64_pageentry_t)&kernel_pagetables[1] | PTE_P | PTE_W | PTE_U;
   43447:	48 8d 05 b2 3b 01 00 	lea    0x13bb2(%rip),%rax        # 57000 <kernel_pagetables+0x1000>
   4344e:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[0].entry[0] =
   43452:	48 89 05 a7 2b 01 00 	mov    %rax,0x12ba7(%rip)        # 56000 <kernel_pagetables>
    kernel_pagetables[1].entry[0] =
        (x86_64_pageentry_t)&kernel_pagetables[2] | PTE_P | PTE_W | PTE_U;
   43459:	48 8d 05 a0 4b 01 00 	lea    0x14ba0(%rip),%rax        # 58000 <kernel_pagetables+0x2000>
   43460:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[1].entry[0] =
   43464:	48 89 05 95 3b 01 00 	mov    %rax,0x13b95(%rip)        # 57000 <kernel_pagetables+0x1000>
    kernel_pagetables[2].entry[0] =
        (x86_64_pageentry_t)&kernel_pagetables[3] | PTE_P | PTE_W | PTE_U;
   4346b:	48 8d 05 8e 5b 01 00 	lea    0x15b8e(%rip),%rax        # 59000 <kernel_pagetables+0x3000>
   43472:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[0] =
   43476:	48 89 05 83 4b 01 00 	mov    %rax,0x14b83(%rip)        # 58000 <kernel_pagetables+0x2000>
    kernel_pagetables[2].entry[1] =
        (x86_64_pageentry_t)&kernel_pagetables[4] | PTE_P | PTE_W | PTE_U;
   4347d:	48 8d 05 7c 6b 01 00 	lea    0x16b7c(%rip),%rax        # 5a000 <kernel_pagetables+0x4000>
   43484:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[1] =
   43488:	48 89 05 79 4b 01 00 	mov    %rax,0x14b79(%rip)        # 58008 <kernel_pagetables+0x2008>

    // identity map the page table
    virtual_memory_map(kernel_pagetable, (uintptr_t)0, (uintptr_t)0,
   4348f:	48 8b 05 6a 1b 01 00 	mov    0x11b6a(%rip),%rax        # 55000 <kernel_pagetable>
   43496:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   4349c:	b9 00 00 20 00       	mov    $0x200000,%ecx
   434a1:	ba 00 00 00 00       	mov    $0x0,%edx
   434a6:	be 00 00 00 00       	mov    $0x0,%esi
   434ab:	48 89 c7             	mov    %rax,%rdi
   434ae:	e8 0e 02 00 00       	call   436c1 <virtual_memory_map>
                       MEMSIZE_PHYSICAL, PTE_P | PTE_W | PTE_U);

    // check if kernel is identity mapped
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE)
   434b3:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   434ba:	00 
   434bb:	eb 76                	jmp    43533 <virtual_memory_init+0x11f>
    {
        vamapping vmap = virtual_memory_lookup(kernel_pagetable, addr);
   434bd:	48 8b 0d 3c 1b 01 00 	mov    0x11b3c(%rip),%rcx        # 55000 <kernel_pagetable>
   434c4:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   434c8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   434cc:	48 89 ce             	mov    %rcx,%rsi
   434cf:	48 89 c7             	mov    %rax,%rdi
   434d2:	e8 2e 06 00 00       	call   43b05 <virtual_memory_lookup>
        // this assert will probably fail initially!
        // have you implemented virtual_memory_map and lookup_l1pagetable ?
        assert(vmap.pa == addr);
   434d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   434db:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   434df:	74 1e                	je     434ff <virtual_memory_init+0xeb>
   434e1:	48 8d 05 bd 21 00 00 	lea    0x21bd(%rip),%rax        # 456a5 <complex_keymap+0x125>
   434e8:	48 89 c2             	mov    %rax,%rdx
   434eb:	be 2e 00 00 00       	mov    $0x2e,%esi
   434f0:	48 8d 05 be 21 00 00 	lea    0x21be(%rip),%rax        # 456b5 <complex_keymap+0x135>
   434f7:	48 89 c7             	mov    %rax,%rdi
   434fa:	e8 3e fe ff ff       	call   4333d <assert_fail>
        assert((vmap.perm & (PTE_P | PTE_W)) == (PTE_P | PTE_W));
   434ff:	8b 45 f0             	mov    -0x10(%rbp),%eax
   43502:	48 98                	cltq   
   43504:	83 e0 03             	and    $0x3,%eax
   43507:	48 83 f8 03          	cmp    $0x3,%rax
   4350b:	74 1e                	je     4352b <virtual_memory_init+0x117>
   4350d:	48 8d 05 b4 21 00 00 	lea    0x21b4(%rip),%rax        # 456c8 <complex_keymap+0x148>
   43514:	48 89 c2             	mov    %rax,%rdx
   43517:	be 2f 00 00 00       	mov    $0x2f,%esi
   4351c:	48 8d 05 92 21 00 00 	lea    0x2192(%rip),%rax        # 456b5 <complex_keymap+0x135>
   43523:	48 89 c7             	mov    %rax,%rdi
   43526:	e8 12 fe ff ff       	call   4333d <assert_fail>
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE)
   4352b:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   43532:	00 
   43533:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   4353a:	00 
   4353b:	76 80                	jbe    434bd <virtual_memory_init+0xa9>
    }

    // set pointer to this pagetable in the CR3 register
    // set_pagetable also does several checks for a valid pagetable
    set_pagetable(kernel_pagetable);
   4353d:	48 8b 05 bc 1a 01 00 	mov    0x11abc(%rip),%rax        # 55000 <kernel_pagetable>
   43544:	48 89 c7             	mov    %rax,%rdi
   43547:	e8 03 00 00 00       	call   4354f <set_pagetable>
}
   4354c:	90                   	nop
   4354d:	c9                   	leave  
   4354e:	c3                   	ret    

000000000004354f <set_pagetable>:
//    Change page directory. lcr3() is the hardware instruction;
//    set_pagetable() additionally checks that important kernel procedures are
//    mappable in `pagetable`, and calls panic() if they aren't.

void set_pagetable(x86_64_pagetable *pagetable)
{
   4354f:	f3 0f 1e fa          	endbr64 
   43553:	55                   	push   %rbp
   43554:	48 89 e5             	mov    %rsp,%rbp
   43557:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   4355b:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
    assert(PAGEOFFSET(pagetable) == 0); // must be page aligned
   4355f:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   43563:	25 ff 0f 00 00       	and    $0xfff,%eax
   43568:	48 85 c0             	test   %rax,%rax
   4356b:	74 1e                	je     4358b <set_pagetable+0x3c>
   4356d:	48 8d 05 85 21 00 00 	lea    0x2185(%rip),%rax        # 456f9 <complex_keymap+0x179>
   43574:	48 89 c2             	mov    %rax,%rdx
   43577:	be 3e 00 00 00       	mov    $0x3e,%esi
   4357c:	48 8d 05 32 21 00 00 	lea    0x2132(%rip),%rax        # 456b5 <complex_keymap+0x135>
   43583:	48 89 c7             	mov    %rax,%rdi
   43586:	e8 b2 fd ff ff       	call   4333d <assert_fail>
    // check for kernel space being mapped in pagetable
    assert(virtual_memory_lookup(pagetable, (uintptr_t)default_int_handler).pa == (uintptr_t)default_int_handler);
   4358b:	48 c7 c0 9c 00 04 00 	mov    $0x4009c,%rax
   43592:	48 89 c2             	mov    %rax,%rdx
   43595:	48 8d 45 98          	lea    -0x68(%rbp),%rax
   43599:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   4359d:	48 89 ce             	mov    %rcx,%rsi
   435a0:	48 89 c7             	mov    %rax,%rdi
   435a3:	e8 5d 05 00 00       	call   43b05 <virtual_memory_lookup>
   435a8:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   435ac:	48 c7 c2 9c 00 04 00 	mov    $0x4009c,%rdx
   435b3:	48 39 d0             	cmp    %rdx,%rax
   435b6:	74 1e                	je     435d6 <set_pagetable+0x87>
   435b8:	48 8d 05 59 21 00 00 	lea    0x2159(%rip),%rax        # 45718 <complex_keymap+0x198>
   435bf:	48 89 c2             	mov    %rax,%rdx
   435c2:	be 40 00 00 00       	mov    $0x40,%esi
   435c7:	48 8d 05 e7 20 00 00 	lea    0x20e7(%rip),%rax        # 456b5 <complex_keymap+0x135>
   435ce:	48 89 c7             	mov    %rax,%rdi
   435d1:	e8 67 fd ff ff       	call   4333d <assert_fail>
    assert(virtual_memory_lookup(kernel_pagetable, (uintptr_t)pagetable).pa == (uintptr_t)pagetable);
   435d6:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
   435da:	48 8b 0d 1f 1a 01 00 	mov    0x11a1f(%rip),%rcx        # 55000 <kernel_pagetable>
   435e1:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
   435e5:	48 89 ce             	mov    %rcx,%rsi
   435e8:	48 89 c7             	mov    %rax,%rdi
   435eb:	e8 15 05 00 00       	call   43b05 <virtual_memory_lookup>
   435f0:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   435f4:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   435f8:	48 39 c2             	cmp    %rax,%rdx
   435fb:	74 1e                	je     4361b <set_pagetable+0xcc>
   435fd:	48 8d 05 7c 21 00 00 	lea    0x217c(%rip),%rax        # 45780 <complex_keymap+0x200>
   43604:	48 89 c2             	mov    %rax,%rdx
   43607:	be 41 00 00 00       	mov    $0x41,%esi
   4360c:	48 8d 05 a2 20 00 00 	lea    0x20a2(%rip),%rax        # 456b5 <complex_keymap+0x135>
   43613:	48 89 c7             	mov    %rax,%rdi
   43616:	e8 22 fd ff ff       	call   4333d <assert_fail>
    assert(virtual_memory_lookup(pagetable, (uintptr_t)kernel_pagetable).pa == (uintptr_t)kernel_pagetable);
   4361b:	48 8b 05 de 19 01 00 	mov    0x119de(%rip),%rax        # 55000 <kernel_pagetable>
   43622:	48 89 c2             	mov    %rax,%rdx
   43625:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
   43629:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   4362d:	48 89 ce             	mov    %rcx,%rsi
   43630:	48 89 c7             	mov    %rax,%rdi
   43633:	e8 cd 04 00 00       	call   43b05 <virtual_memory_lookup>
   43638:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4363c:	48 8b 15 bd 19 01 00 	mov    0x119bd(%rip),%rdx        # 55000 <kernel_pagetable>
   43643:	48 39 d0             	cmp    %rdx,%rax
   43646:	74 1e                	je     43666 <set_pagetable+0x117>
   43648:	48 8d 05 91 21 00 00 	lea    0x2191(%rip),%rax        # 457e0 <complex_keymap+0x260>
   4364f:	48 89 c2             	mov    %rax,%rdx
   43652:	be 42 00 00 00       	mov    $0x42,%esi
   43657:	48 8d 05 57 20 00 00 	lea    0x2057(%rip),%rax        # 456b5 <complex_keymap+0x135>
   4365e:	48 89 c7             	mov    %rax,%rdi
   43661:	e8 d7 fc ff ff       	call   4333d <assert_fail>
    assert(virtual_memory_lookup(pagetable, (uintptr_t)virtual_memory_map).pa == (uintptr_t)virtual_memory_map);
   43666:	48 8d 15 54 00 00 00 	lea    0x54(%rip),%rdx        # 436c1 <virtual_memory_map>
   4366d:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   43671:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   43675:	48 89 ce             	mov    %rcx,%rsi
   43678:	48 89 c7             	mov    %rax,%rdi
   4367b:	e8 85 04 00 00       	call   43b05 <virtual_memory_lookup>
   43680:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43684:	48 8d 15 36 00 00 00 	lea    0x36(%rip),%rdx        # 436c1 <virtual_memory_map>
   4368b:	48 39 d0             	cmp    %rdx,%rax
   4368e:	74 1e                	je     436ae <set_pagetable+0x15f>
   43690:	48 8d 05 a9 21 00 00 	lea    0x21a9(%rip),%rax        # 45840 <complex_keymap+0x2c0>
   43697:	48 89 c2             	mov    %rax,%rdx
   4369a:	be 43 00 00 00       	mov    $0x43,%esi
   4369f:	48 8d 05 0f 20 00 00 	lea    0x200f(%rip),%rax        # 456b5 <complex_keymap+0x135>
   436a6:	48 89 c7             	mov    %rax,%rdi
   436a9:	e8 8f fc ff ff       	call   4333d <assert_fail>
    lcr3((uintptr_t)pagetable);
   436ae:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   436b2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   436b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   436ba:	0f 22 d8             	mov    %rax,%cr3
}
   436bd:	90                   	nop
}
   436be:	90                   	nop
   436bf:	c9                   	leave  
   436c0:	c3                   	ret    

00000000000436c1 <virtual_memory_map>:
static x86_64_pagetable *lookup_l1pagetable(x86_64_pagetable *pagetable,
                                            uintptr_t va, int perm);

int virtual_memory_map(x86_64_pagetable *pagetable, uintptr_t va,
                       uintptr_t pa, size_t sz, int perm)
{
   436c1:	f3 0f 1e fa          	endbr64 
   436c5:	55                   	push   %rbp
   436c6:	48 89 e5             	mov    %rsp,%rbp
   436c9:	53                   	push   %rbx
   436ca:	48 83 ec 58          	sub    $0x58,%rsp
   436ce:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   436d2:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   436d6:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
   436da:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
   436de:	44 89 45 ac          	mov    %r8d,-0x54(%rbp)

    // sanity checks for virtual address, size, and permisions
    assert(va % PAGESIZE == 0);            // virtual address is page-aligned
   436e2:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   436e6:	25 ff 0f 00 00       	and    $0xfff,%eax
   436eb:	48 85 c0             	test   %rax,%rax
   436ee:	74 1e                	je     4370e <virtual_memory_map+0x4d>
   436f0:	48 8d 05 ad 21 00 00 	lea    0x21ad(%rip),%rax        # 458a4 <complex_keymap+0x324>
   436f7:	48 89 c2             	mov    %rax,%rdx
   436fa:	be 64 00 00 00       	mov    $0x64,%esi
   436ff:	48 8d 05 af 1f 00 00 	lea    0x1faf(%rip),%rax        # 456b5 <complex_keymap+0x135>
   43706:	48 89 c7             	mov    %rax,%rdi
   43709:	e8 2f fc ff ff       	call   4333d <assert_fail>
    assert(sz % PAGESIZE == 0);            // size is a multiple of PAGESIZE
   4370e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   43712:	25 ff 0f 00 00       	and    $0xfff,%eax
   43717:	48 85 c0             	test   %rax,%rax
   4371a:	74 1e                	je     4373a <virtual_memory_map+0x79>
   4371c:	48 8d 05 94 21 00 00 	lea    0x2194(%rip),%rax        # 458b7 <complex_keymap+0x337>
   43723:	48 89 c2             	mov    %rax,%rdx
   43726:	be 65 00 00 00       	mov    $0x65,%esi
   4372b:	48 8d 05 83 1f 00 00 	lea    0x1f83(%rip),%rax        # 456b5 <complex_keymap+0x135>
   43732:	48 89 c7             	mov    %rax,%rdi
   43735:	e8 03 fc ff ff       	call   4333d <assert_fail>
    assert(va + sz >= va || va + sz == 0); // va range does not wrap
   4373a:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   4373e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   43742:	48 01 d0             	add    %rdx,%rax
   43745:	48 39 45 c0          	cmp    %rax,-0x40(%rbp)
   43749:	76 2e                	jbe    43779 <virtual_memory_map+0xb8>
   4374b:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   4374f:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   43753:	48 01 d0             	add    %rdx,%rax
   43756:	48 85 c0             	test   %rax,%rax
   43759:	74 1e                	je     43779 <virtual_memory_map+0xb8>
   4375b:	48 8d 05 68 21 00 00 	lea    0x2168(%rip),%rax        # 458ca <complex_keymap+0x34a>
   43762:	48 89 c2             	mov    %rax,%rdx
   43765:	be 66 00 00 00       	mov    $0x66,%esi
   4376a:	48 8d 05 44 1f 00 00 	lea    0x1f44(%rip),%rax        # 456b5 <complex_keymap+0x135>
   43771:	48 89 c7             	mov    %rax,%rdi
   43774:	e8 c4 fb ff ff       	call   4333d <assert_fail>
    if (perm & PTE_P)
   43779:	8b 45 ac             	mov    -0x54(%rbp),%eax
   4377c:	48 98                	cltq   
   4377e:	83 e0 01             	and    $0x1,%eax
   43781:	48 85 c0             	test   %rax,%rax
   43784:	0f 84 8c 00 00 00    	je     43816 <virtual_memory_map+0x155>
    {
        assert(pa % PAGESIZE == 0);          // physical addr is page-aligned
   4378a:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4378e:	25 ff 0f 00 00       	and    $0xfff,%eax
   43793:	48 85 c0             	test   %rax,%rax
   43796:	74 1e                	je     437b6 <virtual_memory_map+0xf5>
   43798:	48 8d 05 49 21 00 00 	lea    0x2149(%rip),%rax        # 458e8 <complex_keymap+0x368>
   4379f:	48 89 c2             	mov    %rax,%rdx
   437a2:	be 69 00 00 00       	mov    $0x69,%esi
   437a7:	48 8d 05 07 1f 00 00 	lea    0x1f07(%rip),%rax        # 456b5 <complex_keymap+0x135>
   437ae:	48 89 c7             	mov    %rax,%rdi
   437b1:	e8 87 fb ff ff       	call   4333d <assert_fail>
        assert(pa + sz >= pa);               // physical address range does not wrap
   437b6:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   437ba:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   437be:	48 01 d0             	add    %rdx,%rax
   437c1:	48 39 45 b8          	cmp    %rax,-0x48(%rbp)
   437c5:	76 1e                	jbe    437e5 <virtual_memory_map+0x124>
   437c7:	48 8d 05 2d 21 00 00 	lea    0x212d(%rip),%rax        # 458fb <complex_keymap+0x37b>
   437ce:	48 89 c2             	mov    %rax,%rdx
   437d1:	be 6a 00 00 00       	mov    $0x6a,%esi
   437d6:	48 8d 05 d8 1e 00 00 	lea    0x1ed8(%rip),%rax        # 456b5 <complex_keymap+0x135>
   437dd:	48 89 c7             	mov    %rax,%rdi
   437e0:	e8 58 fb ff ff       	call   4333d <assert_fail>
        assert(pa + sz <= MEMSIZE_PHYSICAL); // physical addresses exist
   437e5:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   437e9:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   437ed:	48 01 d0             	add    %rdx,%rax
   437f0:	48 3d 00 00 20 00    	cmp    $0x200000,%rax
   437f6:	76 1e                	jbe    43816 <virtual_memory_map+0x155>
   437f8:	48 8d 05 0a 21 00 00 	lea    0x210a(%rip),%rax        # 45909 <complex_keymap+0x389>
   437ff:	48 89 c2             	mov    %rax,%rdx
   43802:	be 6b 00 00 00       	mov    $0x6b,%esi
   43807:	48 8d 05 a7 1e 00 00 	lea    0x1ea7(%rip),%rax        # 456b5 <complex_keymap+0x135>
   4380e:	48 89 c7             	mov    %rax,%rdi
   43811:	e8 27 fb ff ff       	call   4333d <assert_fail>
    }
    assert(perm >= 0 && perm < 0x1000);           // `perm` makes sense (perm can only be 12 bits)
   43816:	83 7d ac 00          	cmpl   $0x0,-0x54(%rbp)
   4381a:	78 09                	js     43825 <virtual_memory_map+0x164>
   4381c:	81 7d ac ff 0f 00 00 	cmpl   $0xfff,-0x54(%rbp)
   43823:	7e 1e                	jle    43843 <virtual_memory_map+0x182>
   43825:	48 8d 05 f9 20 00 00 	lea    0x20f9(%rip),%rax        # 45925 <complex_keymap+0x3a5>
   4382c:	48 89 c2             	mov    %rax,%rdx
   4382f:	be 6d 00 00 00       	mov    $0x6d,%esi
   43834:	48 8d 05 7a 1e 00 00 	lea    0x1e7a(%rip),%rax        # 456b5 <complex_keymap+0x135>
   4383b:	48 89 c7             	mov    %rax,%rdi
   4383e:	e8 fa fa ff ff       	call   4333d <assert_fail>
    assert((uintptr_t)pagetable % PAGESIZE == 0); // `pagetable` page-aligned
   43843:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   43847:	25 ff 0f 00 00       	and    $0xfff,%eax
   4384c:	48 85 c0             	test   %rax,%rax
   4384f:	74 1e                	je     4386f <virtual_memory_map+0x1ae>
   43851:	48 8d 05 e8 20 00 00 	lea    0x20e8(%rip),%rax        # 45940 <complex_keymap+0x3c0>
   43858:	48 89 c2             	mov    %rax,%rdx
   4385b:	be 6e 00 00 00       	mov    $0x6e,%esi
   43860:	48 8d 05 4e 1e 00 00 	lea    0x1e4e(%rip),%rax        # 456b5 <complex_keymap+0x135>
   43867:	48 89 c7             	mov    %rax,%rdi
   4386a:	e8 ce fa ff ff       	call   4333d <assert_fail>

    int last_index123 = -1;
   4386f:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%rbp)
    x86_64_pagetable *l1pagetable = NULL;
   43876:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
   4387d:	00 

    // for each page-aligned address, set the appropriate page entry
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE)
   4387e:	e9 e6 00 00 00       	jmp    43969 <virtual_memory_map+0x2a8>
    {
        int cur_index123 = (va >> (PAGEOFFBITS + PAGEINDEXBITS));
   43883:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43887:	48 c1 e8 15          	shr    $0x15,%rax
   4388b:	89 45 dc             	mov    %eax,-0x24(%rbp)
        if (cur_index123 != last_index123)
   4388e:	8b 45 dc             	mov    -0x24(%rbp),%eax
   43891:	3b 45 ec             	cmp    -0x14(%rbp),%eax
   43894:	74 20                	je     438b6 <virtual_memory_map+0x1f5>
        {
            // TODO
            // find pointer to last level pagetable for current va
            l1pagetable = lookup_l1pagetable(pagetable, va, perm);
   43896:	8b 55 ac             	mov    -0x54(%rbp),%edx
   43899:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   4389d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   438a1:	48 89 ce             	mov    %rcx,%rsi
   438a4:	48 89 c7             	mov    %rax,%rdi
   438a7:	e8 d3 00 00 00       	call   4397f <lookup_l1pagetable>
   438ac:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            last_index123 = cur_index123;
   438b0:	8b 45 dc             	mov    -0x24(%rbp),%eax
   438b3:	89 45 ec             	mov    %eax,-0x14(%rbp)
        }
        if ((perm & PTE_P) && l1pagetable)
   438b6:	8b 45 ac             	mov    -0x54(%rbp),%eax
   438b9:	48 98                	cltq   
   438bb:	83 e0 01             	and    $0x1,%eax
   438be:	48 85 c0             	test   %rax,%rax
   438c1:	74 34                	je     438f7 <virtual_memory_map+0x236>
   438c3:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   438c8:	74 2d                	je     438f7 <virtual_memory_map+0x236>
        { // if page is marked present
            l1pagetable->entry[PAGEINDEX(va, 3)] = pa | perm;
   438ca:	8b 45 ac             	mov    -0x54(%rbp),%eax
   438cd:	48 63 d8             	movslq %eax,%rbx
   438d0:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   438d4:	be 03 00 00 00       	mov    $0x3,%esi
   438d9:	48 89 c7             	mov    %rax,%rdi
   438dc:	e8 d3 fa ff ff       	call   433b4 <pageindex>
   438e1:	89 c2                	mov    %eax,%edx
   438e3:	48 0b 5d b8          	or     -0x48(%rbp),%rbx
   438e7:	48 89 d9             	mov    %rbx,%rcx
   438ea:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   438ee:	48 63 d2             	movslq %edx,%rdx
   438f1:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   438f5:	eb 5a                	jmp    43951 <virtual_memory_map+0x290>
        }
        else if (l1pagetable)
   438f7:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   438fc:	74 26                	je     43924 <virtual_memory_map+0x263>
        { // if page is NOT marked present
            // TODO
            l1pagetable->entry[PAGEINDEX(va, 3)] = perm;
   438fe:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43902:	be 03 00 00 00       	mov    $0x3,%esi
   43907:	48 89 c7             	mov    %rax,%rdi
   4390a:	e8 a5 fa ff ff       	call   433b4 <pageindex>
   4390f:	89 c2                	mov    %eax,%edx
   43911:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43914:	48 63 c8             	movslq %eax,%rcx
   43917:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4391b:	48 63 d2             	movslq %edx,%rdx
   4391e:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   43922:	eb 2d                	jmp    43951 <virtual_memory_map+0x290>
        }
        else if (perm & PTE_P)
   43924:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43927:	48 98                	cltq   
   43929:	83 e0 01             	and    $0x1,%eax
   4392c:	48 85 c0             	test   %rax,%rax
   4392f:	74 20                	je     43951 <virtual_memory_map+0x290>
        {
            // error, no allocated l1 page found for va
            log_printf("[Kern Info] failed to find l1pagetable address at " __FILE__ ": %d\n", __LINE__);
   43931:	be 8a 00 00 00       	mov    $0x8a,%esi
   43936:	48 8d 05 2b 20 00 00 	lea    0x202b(%rip),%rax        # 45968 <complex_keymap+0x3e8>
   4393d:	48 89 c7             	mov    %rax,%rdi
   43940:	b8 00 00 00 00       	mov    $0x0,%eax
   43945:	e8 98 f6 ff ff       	call   42fe2 <log_printf>
            return -1;
   4394a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   4394f:	eb 28                	jmp    43979 <virtual_memory_map+0x2b8>
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE)
   43951:	48 81 45 c0 00 10 00 	addq   $0x1000,-0x40(%rbp)
   43958:	00 
   43959:	48 81 45 b8 00 10 00 	addq   $0x1000,-0x48(%rbp)
   43960:	00 
   43961:	48 81 6d b0 00 10 00 	subq   $0x1000,-0x50(%rbp)
   43968:	00 
   43969:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   4396e:	0f 85 0f ff ff ff    	jne    43883 <virtual_memory_map+0x1c2>
        }
    }
    return 0;
   43974:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43979:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   4397d:	c9                   	leave  
   4397e:	c3                   	ret    

000000000004397f <lookup_l1pagetable>:
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable *lookup_l1pagetable(x86_64_pagetable *pagetable,
                                            uintptr_t va, int perm)
{
   4397f:	f3 0f 1e fa          	endbr64 
   43983:	55                   	push   %rbp
   43984:	48 89 e5             	mov    %rsp,%rbp
   43987:	48 83 ec 40          	sub    $0x40,%rsp
   4398b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   4398f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   43993:	89 55 cc             	mov    %edx,-0x34(%rbp)
    x86_64_pagetable *pt = pagetable;
   43996:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4399a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    // 1. Find index to the next pagetable entry using the `va`
    // 2. Check if this entry has the appropriate requested permissions
    // 3. Repeat the steps till you reach the l1 pagetable (i.e thrice)
    // 4. return the pagetable address

    for (int i = 0; i <= 2; ++i)
   4399e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   439a5:	e9 4b 01 00 00       	jmp    43af5 <lookup_l1pagetable+0x176>
    {
        // TODO
        // find page entry by finding `ith` level index of va to index pagetable entries of `pt`
        // you should read x86-64.h to understand relevant structs and macros to make this part easier
        x86_64_pageentry_t pe = pt->entry[PAGEINDEX(va, i)]; // replace this
   439aa:	8b 55 f4             	mov    -0xc(%rbp),%edx
   439ad:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   439b1:	89 d6                	mov    %edx,%esi
   439b3:	48 89 c7             	mov    %rax,%rdi
   439b6:	e8 f9 f9 ff ff       	call   433b4 <pageindex>
   439bb:	89 c2                	mov    %eax,%edx
   439bd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   439c1:	48 63 d2             	movslq %edx,%rdx
   439c4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   439c8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

        if (!(pe & PTE_P))
   439cc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   439d0:	83 e0 01             	and    $0x1,%eax
   439d3:	48 85 c0             	test   %rax,%rax
   439d6:	75 6d                	jne    43a45 <lookup_l1pagetable+0xc6>
        { // address of next level should be present AND PTE_P should be set, error otherwise
            log_printf("[Kern Info] Error looking up l1pagetable: Pagetable address: 0x%x perm: 0x%x."
   439d8:	8b 45 f4             	mov    -0xc(%rbp),%eax
   439db:	8d 48 02             	lea    0x2(%rax),%ecx
   439de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   439e2:	25 ff 0f 00 00       	and    $0xfff,%eax
   439e7:	48 89 c2             	mov    %rax,%rdx
   439ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   439ee:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   439f4:	48 89 c6             	mov    %rax,%rsi
   439f7:	48 8d 05 b2 1f 00 00 	lea    0x1fb2(%rip),%rax        # 459b0 <complex_keymap+0x430>
   439fe:	48 89 c7             	mov    %rax,%rdi
   43a01:	b8 00 00 00 00       	mov    $0x0,%eax
   43a06:	e8 d7 f5 ff ff       	call   42fe2 <log_printf>
                       " Failed to get level (%d)\n",
                       PTE_ADDR(pe), PTE_FLAGS(pe), (i + 2));
            if (!(perm & PTE_P))
   43a0b:	8b 45 cc             	mov    -0x34(%rbp),%eax
   43a0e:	48 98                	cltq   
   43a10:	83 e0 01             	and    $0x1,%eax
   43a13:	48 85 c0             	test   %rax,%rax
   43a16:	75 0a                	jne    43a22 <lookup_l1pagetable+0xa3>
            {
                return NULL;
   43a18:	b8 00 00 00 00       	mov    $0x0,%eax
   43a1d:	e9 e1 00 00 00       	jmp    43b03 <lookup_l1pagetable+0x184>
            }
            log_printf("[Kern Info] failed to find pagetable address at " __FILE__ ": %d\n", __LINE__);
   43a22:	be b2 00 00 00       	mov    $0xb2,%esi
   43a27:	48 8d 05 ea 1f 00 00 	lea    0x1fea(%rip),%rax        # 45a18 <complex_keymap+0x498>
   43a2e:	48 89 c7             	mov    %rax,%rdi
   43a31:	b8 00 00 00 00       	mov    $0x0,%eax
   43a36:	e8 a7 f5 ff ff       	call   42fe2 <log_printf>
            return NULL;
   43a3b:	b8 00 00 00 00       	mov    $0x0,%eax
   43a40:	e9 be 00 00 00       	jmp    43b03 <lookup_l1pagetable+0x184>
        }

        // sanity-check page entry and permissions
        assert(PTE_ADDR(pe) < MEMSIZE_PHYSICAL); // at sensible address
   43a45:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43a49:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   43a4f:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   43a55:	76 1e                	jbe    43a75 <lookup_l1pagetable+0xf6>
   43a57:	48 8d 05 02 20 00 00 	lea    0x2002(%rip),%rax        # 45a60 <complex_keymap+0x4e0>
   43a5e:	48 89 c2             	mov    %rax,%rdx
   43a61:	be b7 00 00 00       	mov    $0xb7,%esi
   43a66:	48 8d 05 48 1c 00 00 	lea    0x1c48(%rip),%rax        # 456b5 <complex_keymap+0x135>
   43a6d:	48 89 c7             	mov    %rax,%rdi
   43a70:	e8 c8 f8 ff ff       	call   4333d <assert_fail>
        if (perm & PTE_W)
   43a75:	8b 45 cc             	mov    -0x34(%rbp),%eax
   43a78:	48 98                	cltq   
   43a7a:	83 e0 02             	and    $0x2,%eax
   43a7d:	48 85 c0             	test   %rax,%rax
   43a80:	74 2a                	je     43aac <lookup_l1pagetable+0x12d>
        {                       // if requester wants PTE_W,
            assert(pe & PTE_W); //   entry must allow PTE_W
   43a82:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43a86:	83 e0 02             	and    $0x2,%eax
   43a89:	48 85 c0             	test   %rax,%rax
   43a8c:	75 1e                	jne    43aac <lookup_l1pagetable+0x12d>
   43a8e:	48 8d 05 eb 1f 00 00 	lea    0x1feb(%rip),%rax        # 45a80 <complex_keymap+0x500>
   43a95:	48 89 c2             	mov    %rax,%rdx
   43a98:	be ba 00 00 00       	mov    $0xba,%esi
   43a9d:	48 8d 05 11 1c 00 00 	lea    0x1c11(%rip),%rax        # 456b5 <complex_keymap+0x135>
   43aa4:	48 89 c7             	mov    %rax,%rdi
   43aa7:	e8 91 f8 ff ff       	call   4333d <assert_fail>
        }
        if (perm & PTE_U)
   43aac:	8b 45 cc             	mov    -0x34(%rbp),%eax
   43aaf:	48 98                	cltq   
   43ab1:	83 e0 04             	and    $0x4,%eax
   43ab4:	48 85 c0             	test   %rax,%rax
   43ab7:	74 2a                	je     43ae3 <lookup_l1pagetable+0x164>
        {                       // if requester wants PTE_U,
            assert(pe & PTE_U); //   entry must allow PTE_U
   43ab9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43abd:	83 e0 04             	and    $0x4,%eax
   43ac0:	48 85 c0             	test   %rax,%rax
   43ac3:	75 1e                	jne    43ae3 <lookup_l1pagetable+0x164>
   43ac5:	48 8d 05 bf 1f 00 00 	lea    0x1fbf(%rip),%rax        # 45a8b <complex_keymap+0x50b>
   43acc:	48 89 c2             	mov    %rax,%rdx
   43acf:	be be 00 00 00       	mov    $0xbe,%esi
   43ad4:	48 8d 05 da 1b 00 00 	lea    0x1bda(%rip),%rax        # 456b5 <complex_keymap+0x135>
   43adb:	48 89 c7             	mov    %rax,%rdi
   43ade:	e8 5a f8 ff ff       	call   4333d <assert_fail>
        }

        // TODO
        // set pt to physical address to next pagetable using `pe`
        pt = (x86_64_pagetable *)PTE_ADDR(pe);
   43ae3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43ae7:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   43aed:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 2; ++i)
   43af1:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   43af5:	83 7d f4 02          	cmpl   $0x2,-0xc(%rbp)
   43af9:	0f 8e ab fe ff ff    	jle    439aa <lookup_l1pagetable+0x2b>
        // replace this
    }
    return pt;
   43aff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   43b03:	c9                   	leave  
   43b04:	c3                   	ret    

0000000000043b05 <virtual_memory_lookup>:
// virtual_memory_lookup(pagetable, va)
//    Returns information about the mapping of the virtual address `va` in
//    `pagetable`. The information is returned as a `vamapping` object.

vamapping virtual_memory_lookup(x86_64_pagetable *pagetable, uintptr_t va)
{
   43b05:	f3 0f 1e fa          	endbr64 
   43b09:	55                   	push   %rbp
   43b0a:	48 89 e5             	mov    %rsp,%rbp
   43b0d:	48 83 ec 50          	sub    $0x50,%rsp
   43b11:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   43b15:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   43b19:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    x86_64_pagetable *pt = pagetable;
   43b1d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43b21:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    x86_64_pageentry_t pe = PTE_W | PTE_U | PTE_P;
   43b25:	48 c7 45 f0 07 00 00 	movq   $0x7,-0x10(%rbp)
   43b2c:	00 
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i)
   43b2d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
   43b34:	eb 41                	jmp    43b77 <virtual_memory_lookup+0x72>
    {
        pe = pt->entry[PAGEINDEX(va, i)] & ~(pe & (PTE_W | PTE_U));
   43b36:	8b 55 ec             	mov    -0x14(%rbp),%edx
   43b39:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   43b3d:	89 d6                	mov    %edx,%esi
   43b3f:	48 89 c7             	mov    %rax,%rdi
   43b42:	e8 6d f8 ff ff       	call   433b4 <pageindex>
   43b47:	89 c2                	mov    %eax,%edx
   43b49:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43b4d:	48 63 d2             	movslq %edx,%rdx
   43b50:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
   43b54:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43b58:	83 e0 06             	and    $0x6,%eax
   43b5b:	48 f7 d0             	not    %rax
   43b5e:	48 21 d0             	and    %rdx,%rax
   43b61:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        pt = (x86_64_pagetable *)PTE_ADDR(pe);
   43b65:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43b69:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   43b6f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i)
   43b73:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
   43b77:	83 7d ec 03          	cmpl   $0x3,-0x14(%rbp)
   43b7b:	7f 0c                	jg     43b89 <virtual_memory_lookup+0x84>
   43b7d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43b81:	83 e0 01             	and    $0x1,%eax
   43b84:	48 85 c0             	test   %rax,%rax
   43b87:	75 ad                	jne    43b36 <virtual_memory_lookup+0x31>
    }
    vamapping vam = {-1, (uintptr_t)-1, 0};
   43b89:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%rbp)
   43b90:	48 c7 45 d8 ff ff ff 	movq   $0xffffffffffffffff,-0x28(%rbp)
   43b97:	ff 
   43b98:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    if (pe & PTE_P)
   43b9f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43ba3:	83 e0 01             	and    $0x1,%eax
   43ba6:	48 85 c0             	test   %rax,%rax
   43ba9:	74 34                	je     43bdf <virtual_memory_lookup+0xda>
    {
        vam.pn = PAGENUMBER(pe);
   43bab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43baf:	48 c1 e8 0c          	shr    $0xc,%rax
   43bb3:	89 45 d0             	mov    %eax,-0x30(%rbp)
        vam.pa = PTE_ADDR(pe) + PAGEOFFSET(va);
   43bb6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43bba:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   43bc0:	48 89 c2             	mov    %rax,%rdx
   43bc3:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   43bc7:	25 ff 0f 00 00       	and    $0xfff,%eax
   43bcc:	48 09 d0             	or     %rdx,%rax
   43bcf:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        vam.perm = PTE_FLAGS(pe);
   43bd3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43bd7:	25 ff 0f 00 00       	and    $0xfff,%eax
   43bdc:	89 45 e0             	mov    %eax,-0x20(%rbp)
    }
    return vam;
   43bdf:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   43be3:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   43be7:	48 89 10             	mov    %rdx,(%rax)
   43bea:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   43bee:	48 89 50 08          	mov    %rdx,0x8(%rax)
   43bf2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   43bf6:	48 89 50 10          	mov    %rdx,0x10(%rax)
}
   43bfa:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   43bfe:	c9                   	leave  
   43bff:	c3                   	ret    

0000000000043c00 <program_load>:
//    -1 on failure (e.g. out-of-memory). `allocator` is passed to
//    `virtual_memory_map`.

int program_load(proc *p, int programnumber,
                 x86_64_pagetable *(*allocator)(void))
{
   43c00:	f3 0f 1e fa          	endbr64 
   43c04:	55                   	push   %rbp
   43c05:	48 89 e5             	mov    %rsp,%rbp
   43c08:	48 83 ec 40          	sub    $0x40,%rsp
   43c0c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   43c10:	89 75 d4             	mov    %esi,-0x2c(%rbp)
   43c13:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    // is this a valid program?
    int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);
   43c17:	c7 45 f8 07 00 00 00 	movl   $0x7,-0x8(%rbp)
    assert(programnumber >= 0 && programnumber < nprograms);
   43c1e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   43c22:	78 08                	js     43c2c <program_load+0x2c>
   43c24:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   43c27:	3b 45 f8             	cmp    -0x8(%rbp),%eax
   43c2a:	7c 1e                	jl     43c4a <program_load+0x4a>
   43c2c:	48 8d 05 65 1e 00 00 	lea    0x1e65(%rip),%rax        # 45a98 <complex_keymap+0x518>
   43c33:	48 89 c2             	mov    %rax,%rdx
   43c36:	be 38 00 00 00       	mov    $0x38,%esi
   43c3b:	48 8d 05 86 1e 00 00 	lea    0x1e86(%rip),%rax        # 45ac8 <complex_keymap+0x548>
   43c42:	48 89 c7             	mov    %rax,%rdi
   43c45:	e8 f3 f6 ff ff       	call   4333d <assert_fail>
    elf_header *eh = (elf_header *)ramimages[programnumber].begin;
   43c4a:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   43c4d:	48 98                	cltq   
   43c4f:	48 c1 e0 04          	shl    $0x4,%rax
   43c53:	48 89 c2             	mov    %rax,%rdx
   43c56:	48 8d 05 c3 23 00 00 	lea    0x23c3(%rip),%rax        # 46020 <ramimages>
   43c5d:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   43c61:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    assert(eh->e_magic == ELF_MAGIC);
   43c65:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43c69:	8b 00                	mov    (%rax),%eax
   43c6b:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
   43c70:	74 1e                	je     43c90 <program_load+0x90>
   43c72:	48 8d 05 61 1e 00 00 	lea    0x1e61(%rip),%rax        # 45ada <complex_keymap+0x55a>
   43c79:	48 89 c2             	mov    %rax,%rdx
   43c7c:	be 3a 00 00 00       	mov    $0x3a,%esi
   43c81:	48 8d 05 40 1e 00 00 	lea    0x1e40(%rip),%rax        # 45ac8 <complex_keymap+0x548>
   43c88:	48 89 c7             	mov    %rax,%rdi
   43c8b:	e8 ad f6 ff ff       	call   4333d <assert_fail>

    // load each loadable program segment into memory
    elf_program *ph = (elf_program *)((const uint8_t *)eh + eh->e_phoff);
   43c90:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43c94:	48 8b 50 20          	mov    0x20(%rax),%rdx
   43c98:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43c9c:	48 01 d0             	add    %rdx,%rax
   43c9f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    for (int i = 0; i < eh->e_phnum; ++i)
   43ca3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   43caa:	e9 94 00 00 00       	jmp    43d43 <program_load+0x143>
    {
        if (ph[i].p_type == ELF_PTYPE_LOAD)
   43caf:	8b 45 fc             	mov    -0x4(%rbp),%eax
   43cb2:	48 63 d0             	movslq %eax,%rdx
   43cb5:	48 89 d0             	mov    %rdx,%rax
   43cb8:	48 c1 e0 03          	shl    $0x3,%rax
   43cbc:	48 29 d0             	sub    %rdx,%rax
   43cbf:	48 c1 e0 03          	shl    $0x3,%rax
   43cc3:	48 89 c2             	mov    %rax,%rdx
   43cc6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43cca:	48 01 d0             	add    %rdx,%rax
   43ccd:	8b 00                	mov    (%rax),%eax
   43ccf:	83 f8 01             	cmp    $0x1,%eax
   43cd2:	75 6b                	jne    43d3f <program_load+0x13f>
        {
            const uint8_t *pdata = (const uint8_t *)eh + ph[i].p_offset;
   43cd4:	8b 45 fc             	mov    -0x4(%rbp),%eax
   43cd7:	48 63 d0             	movslq %eax,%rdx
   43cda:	48 89 d0             	mov    %rdx,%rax
   43cdd:	48 c1 e0 03          	shl    $0x3,%rax
   43ce1:	48 29 d0             	sub    %rdx,%rax
   43ce4:	48 c1 e0 03          	shl    $0x3,%rax
   43ce8:	48 89 c2             	mov    %rax,%rdx
   43ceb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43cef:	48 01 d0             	add    %rdx,%rax
   43cf2:	48 8b 50 08          	mov    0x8(%rax),%rdx
   43cf6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43cfa:	48 01 d0             	add    %rdx,%rax
   43cfd:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            if (program_load_segment(p, &ph[i], pdata, allocator) < 0)
   43d01:	8b 45 fc             	mov    -0x4(%rbp),%eax
   43d04:	48 63 d0             	movslq %eax,%rdx
   43d07:	48 89 d0             	mov    %rdx,%rax
   43d0a:	48 c1 e0 03          	shl    $0x3,%rax
   43d0e:	48 29 d0             	sub    %rdx,%rax
   43d11:	48 c1 e0 03          	shl    $0x3,%rax
   43d15:	48 89 c2             	mov    %rax,%rdx
   43d18:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43d1c:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   43d20:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   43d24:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   43d28:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43d2c:	48 89 c7             	mov    %rax,%rdi
   43d2f:	e8 3d 00 00 00       	call   43d71 <program_load_segment>
   43d34:	85 c0                	test   %eax,%eax
   43d36:	79 07                	jns    43d3f <program_load+0x13f>
            {
                return -1;
   43d38:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43d3d:	eb 30                	jmp    43d6f <program_load+0x16f>
    for (int i = 0; i < eh->e_phnum; ++i)
   43d3f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   43d43:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43d47:	0f b7 40 38          	movzwl 0x38(%rax),%eax
   43d4b:	0f b7 c0             	movzwl %ax,%eax
   43d4e:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   43d51:	0f 8c 58 ff ff ff    	jl     43caf <program_load+0xaf>
            }
        }
    }

    // set the entry point from the ELF header
    p->p_registers.reg_rip = eh->e_entry;
   43d57:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43d5b:	48 8b 50 18          	mov    0x18(%rax),%rdx
   43d5f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43d63:	48 89 90 a0 00 00 00 	mov    %rdx,0xa0(%rax)
    return 0;
   43d6a:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43d6f:	c9                   	leave  
   43d70:	c3                   	ret    

0000000000043d71 <program_load_segment>:
//    to map them in `p->p_pagetable`. Returns 0 on success and -1 on failure.

static int program_load_segment(proc *p, const elf_program *ph,
                                const uint8_t *src,
                                x86_64_pagetable *(*allocator)(void))
{
   43d71:	f3 0f 1e fa          	endbr64 
   43d75:	55                   	push   %rbp
   43d76:	48 89 e5             	mov    %rsp,%rbp
   43d79:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   43d7d:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)
   43d81:	48 89 75 90          	mov    %rsi,-0x70(%rbp)
   43d85:	48 89 55 88          	mov    %rdx,-0x78(%rbp)
   43d89:	48 89 4d 80          	mov    %rcx,-0x80(%rbp)
    uintptr_t va = (uintptr_t)ph->p_va;
   43d8d:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   43d91:	48 8b 40 10          	mov    0x10(%rax),%rax
   43d95:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    uintptr_t end_file = va + ph->p_filesz, end_mem = va + ph->p_memsz;
   43d99:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   43d9d:	48 8b 50 20          	mov    0x20(%rax),%rdx
   43da1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43da5:	48 01 d0             	add    %rdx,%rax
   43da8:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
   43dac:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   43db0:	48 8b 50 28          	mov    0x28(%rax),%rdx
   43db4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43db8:	48 01 d0             	add    %rdx,%rax
   43dbb:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    va &= ~(PAGESIZE - 1); // round to page boundary
   43dbf:	48 81 65 e8 00 f0 ff 	andq   $0xfffffffffffff000,-0x18(%rbp)
   43dc6:	ff 
    // allocate memory

    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE)
   43dc7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43dcb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   43dcf:	e9 d4 00 00 00       	jmp    43ea8 <program_load_segment+0x137>
    {
        int pn = find_free_page();
   43dd4:	b8 00 00 00 00       	mov    $0x0,%eax
   43dd9:	e8 88 c5 ff ff       	call   40366 <find_free_page>
   43dde:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (pn == -1)
   43de1:	83 7d cc ff          	cmpl   $0xffffffff,-0x34(%rbp)
   43de5:	75 30                	jne    43e17 <program_load_segment+0xa6>
        {
            console_printf(CPOS(22, 0), 0xC000,
   43de7:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43deb:	8b 00                	mov    (%rax),%eax
   43ded:	89 c1                	mov    %eax,%ecx
   43def:	48 8d 05 02 1d 00 00 	lea    0x1d02(%rip),%rax        # 45af8 <complex_keymap+0x578>
   43df6:	48 89 c2             	mov    %rax,%rdx
   43df9:	be 00 c0 00 00       	mov    $0xc000,%esi
   43dfe:	bf e0 06 00 00       	mov    $0x6e0,%edi
   43e03:	b8 00 00 00 00       	mov    $0x0,%eax
   43e08:	e8 f0 10 00 00       	call   44efd <console_printf>
                           "program_load_segment(pid %d): out of physical memory\n",
                           p->p_pid);
            return -1;
   43e0d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43e12:	e9 9f 01 00 00       	jmp    43fb6 <program_load_segment+0x245>
        }
        uintptr_t pa = PAGEADDRESS(pn);
   43e17:	8b 45 cc             	mov    -0x34(%rbp),%eax
   43e1a:	48 98                	cltq   
   43e1c:	48 c1 e0 0c          	shl    $0xc,%rax
   43e20:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
        if (assign_physical_page(pa, p->p_pid) < 0 || virtual_memory_map(p->p_pagetable, addr, pa, PAGESIZE,
   43e24:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43e28:	8b 00                	mov    (%rax),%eax
   43e2a:	0f be d0             	movsbl %al,%edx
   43e2d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43e31:	89 d6                	mov    %edx,%esi
   43e33:	48 89 c7             	mov    %rax,%rdi
   43e36:	e8 6b cb ff ff       	call   409a6 <assign_physical_page>
   43e3b:	85 c0                	test   %eax,%eax
   43e3d:	78 2a                	js     43e69 <program_load_segment+0xf8>
   43e3f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43e43:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43e4a:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   43e4e:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   43e52:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   43e58:	b9 00 10 00 00       	mov    $0x1000,%ecx
   43e5d:	48 89 c7             	mov    %rax,%rdi
   43e60:	e8 5c f8 ff ff       	call   436c1 <virtual_memory_map>
   43e65:	85 c0                	test   %eax,%eax
   43e67:	79 37                	jns    43ea0 <program_load_segment+0x12f>
                                                                         PTE_P | PTE_U | PTE_W) < 0)
        {
            console_printf(CPOS(22, 0), 0xC000, "program_load_segment(pid %d): can't assign address %p\n", p->p_pid, addr);
   43e69:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43e6d:	8b 00                	mov    (%rax),%eax
   43e6f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43e73:	49 89 d0             	mov    %rdx,%r8
   43e76:	89 c1                	mov    %eax,%ecx
   43e78:	48 8d 05 b1 1c 00 00 	lea    0x1cb1(%rip),%rax        # 45b30 <complex_keymap+0x5b0>
   43e7f:	48 89 c2             	mov    %rax,%rdx
   43e82:	be 00 c0 00 00       	mov    $0xc000,%esi
   43e87:	bf e0 06 00 00       	mov    $0x6e0,%edi
   43e8c:	b8 00 00 00 00       	mov    $0x0,%eax
   43e91:	e8 67 10 00 00       	call   44efd <console_printf>
            return -1;
   43e96:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43e9b:	e9 16 01 00 00       	jmp    43fb6 <program_load_segment+0x245>
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE)
   43ea0:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   43ea7:	00 
   43ea8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43eac:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
   43eb0:	0f 82 1e ff ff ff    	jb     43dd4 <program_load_segment+0x63>
        }
    }

    // ensure new memory mappings are active
    set_pagetable(p->p_pagetable);
   43eb6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43eba:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43ec1:	48 89 c7             	mov    %rax,%rdi
   43ec4:	e8 86 f6 ff ff       	call   4354f <set_pagetable>

    // copy data from executable image into process memory
    memcpy((uint8_t *)va, src, end_file - va);
   43ec9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43ecd:	48 2b 45 e8          	sub    -0x18(%rbp),%rax
   43ed1:	48 89 c2             	mov    %rax,%rdx
   43ed4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43ed8:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   43edc:	48 89 ce             	mov    %rcx,%rsi
   43edf:	48 89 c7             	mov    %rax,%rdi
   43ee2:	e8 d1 00 00 00       	call   43fb8 <memcpy>
    memset((uint8_t *)end_file, 0, end_mem - end_file);
   43ee7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43eeb:	48 2b 45 e0          	sub    -0x20(%rbp),%rax
   43eef:	48 89 c2             	mov    %rax,%rdx
   43ef2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43ef6:	be 00 00 00 00       	mov    $0x0,%esi
   43efb:	48 89 c7             	mov    %rax,%rdi
   43efe:	e8 bb 01 00 00       	call   440be <memset>

    int perm = PTE_P | PTE_U;
   43f03:	c7 45 d4 05 00 00 00 	movl   $0x5,-0x2c(%rbp)
    int read_only = ((ph->p_flags & ELF_PFLAG_WRITE) == 0);
   43f0a:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   43f0e:	8b 40 04             	mov    0x4(%rax),%eax
   43f11:	83 e0 02             	and    $0x2,%eax
   43f14:	85 c0                	test   %eax,%eax
   43f16:	0f 94 c0             	sete   %al
   43f19:	0f b6 c0             	movzbl %al,%eax
   43f1c:	89 45 d0             	mov    %eax,-0x30(%rbp)
    if (read_only)
   43f1f:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
   43f23:	74 7d                	je     43fa2 <program_load_segment+0x231>
    {
        for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE)
   43f25:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43f29:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
   43f2d:	eb 69                	jmp    43f98 <program_load_segment+0x227>
        {
            vamapping vmap = virtual_memory_lookup(p->p_pagetable, addr);
   43f2f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43f33:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   43f3a:	48 8d 45 a8          	lea    -0x58(%rbp),%rax
   43f3e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   43f42:	48 89 ce             	mov    %rcx,%rsi
   43f45:	48 89 c7             	mov    %rax,%rdi
   43f48:	e8 b8 fb ff ff       	call   43b05 <virtual_memory_lookup>
            if (vmap.pn >= 0)
   43f4d:	8b 45 a8             	mov    -0x58(%rbp),%eax
   43f50:	85 c0                	test   %eax,%eax
   43f52:	78 30                	js     43f84 <program_load_segment+0x213>
            {
                virtual_memory_map(p->p_pagetable, addr, vmap.pa, PAGESIZE, perm);
   43f54:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
   43f58:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   43f5c:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43f63:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
   43f66:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   43f6a:	41 89 c8             	mov    %ecx,%r8d
   43f6d:	b9 00 10 00 00       	mov    $0x1000,%ecx
   43f72:	48 89 c7             	mov    %rax,%rdi
   43f75:	e8 47 f7 ff ff       	call   436c1 <virtual_memory_map>
        for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE)
   43f7a:	48 81 45 f0 00 10 00 	addq   $0x1000,-0x10(%rbp)
   43f81:	00 
   43f82:	eb 14                	jmp    43f98 <program_load_segment+0x227>
            }
            else
            {
                panic("nope\n");
   43f84:	48 8d 05 dc 1b 00 00 	lea    0x1bdc(%rip),%rax        # 45b67 <complex_keymap+0x5e7>
   43f8b:	48 89 c7             	mov    %rax,%rdi
   43f8e:	b8 00 00 00 00       	mov    $0x0,%eax
   43f93:	e8 b5 f2 ff ff       	call   4324d <panic>
        for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE)
   43f98:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43f9c:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
   43fa0:	72 8d                	jb     43f2f <program_load_segment+0x1be>
            }
        }
    }
    // restore kernel pagetable
    set_pagetable(kernel_pagetable);
   43fa2:	48 8b 05 57 10 01 00 	mov    0x11057(%rip),%rax        # 55000 <kernel_pagetable>
   43fa9:	48 89 c7             	mov    %rax,%rdi
   43fac:	e8 9e f5 ff ff       	call   4354f <set_pagetable>
    return 0;
   43fb1:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43fb6:	c9                   	leave  
   43fb7:	c3                   	ret    

0000000000043fb8 <memcpy>:


// memcpy, memmove, memset, strcmp, strlen, strnlen
//    We must provide our own implementations.

void* memcpy(void* dst, const void* src, size_t n) {
   43fb8:	f3 0f 1e fa          	endbr64 
   43fbc:	55                   	push   %rbp
   43fbd:	48 89 e5             	mov    %rsp,%rbp
   43fc0:	48 83 ec 28          	sub    $0x28,%rsp
   43fc4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   43fc8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
   43fcc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    const char* s = (const char*) src;
   43fd0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43fd4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   43fd8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43fdc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
   43fe0:	eb 1c                	jmp    43ffe <memcpy+0x46>
        *d = *s;
   43fe2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43fe6:	0f b6 10             	movzbl (%rax),%edx
   43fe9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43fed:	88 10                	mov    %dl,(%rax)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   43fef:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
   43ff4:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   43ff9:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
   43ffe:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   44003:	75 dd                	jne    43fe2 <memcpy+0x2a>
    }
    return dst;
   44005:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   44009:	c9                   	leave  
   4400a:	c3                   	ret    

000000000004400b <memmove>:

void* memmove(void* dst, const void* src, size_t n) {
   4400b:	f3 0f 1e fa          	endbr64 
   4400f:	55                   	push   %rbp
   44010:	48 89 e5             	mov    %rsp,%rbp
   44013:	48 83 ec 28          	sub    $0x28,%rsp
   44017:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4401b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
   4401f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    const char* s = (const char*) src;
   44023:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   44027:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    char* d = (char*) dst;
   4402b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4402f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (s < d && s + n > d) {
   44033:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44037:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
   4403b:	73 6a                	jae    440a7 <memmove+0x9c>
   4403d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   44041:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   44045:	48 01 d0             	add    %rdx,%rax
   44048:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   4404c:	73 59                	jae    440a7 <memmove+0x9c>
        s += n, d += n;
   4404e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   44052:	48 01 45 f8          	add    %rax,-0x8(%rbp)
   44056:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4405a:	48 01 45 f0          	add    %rax,-0x10(%rbp)
        while (n-- > 0) {
   4405e:	eb 17                	jmp    44077 <memmove+0x6c>
            *--d = *--s;
   44060:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
   44065:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
   4406a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4406e:	0f b6 10             	movzbl (%rax),%edx
   44071:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44075:	88 10                	mov    %dl,(%rax)
        while (n-- > 0) {
   44077:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4407b:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
   4407f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
   44083:	48 85 c0             	test   %rax,%rax
   44086:	75 d8                	jne    44060 <memmove+0x55>
    if (s < d && s + n > d) {
   44088:	eb 2e                	jmp    440b8 <memmove+0xad>
        }
    } else {
        while (n-- > 0) {
            *d++ = *s++;
   4408a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4408e:	48 8d 42 01          	lea    0x1(%rdx),%rax
   44092:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   44096:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4409a:	48 8d 48 01          	lea    0x1(%rax),%rcx
   4409e:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
   440a2:	0f b6 12             	movzbl (%rdx),%edx
   440a5:	88 10                	mov    %dl,(%rax)
        while (n-- > 0) {
   440a7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   440ab:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
   440af:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
   440b3:	48 85 c0             	test   %rax,%rax
   440b6:	75 d2                	jne    4408a <memmove+0x7f>
        }
    }
    return dst;
   440b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   440bc:	c9                   	leave  
   440bd:	c3                   	ret    

00000000000440be <memset>:

void* memset(void* v, int c, size_t n) {
   440be:	f3 0f 1e fa          	endbr64 
   440c2:	55                   	push   %rbp
   440c3:	48 89 e5             	mov    %rsp,%rbp
   440c6:	48 83 ec 28          	sub    $0x28,%rsp
   440ca:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   440ce:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   440d1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   440d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   440d9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   440dd:	eb 15                	jmp    440f4 <memset+0x36>
        *p = c;
   440df:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   440e2:	89 c2                	mov    %eax,%edx
   440e4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   440e8:	88 10                	mov    %dl,(%rax)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   440ea:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   440ef:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
   440f4:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   440f9:	75 e4                	jne    440df <memset+0x21>
    }
    return v;
   440fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   440ff:	c9                   	leave  
   44100:	c3                   	ret    

0000000000044101 <strlen>:

size_t strlen(const char* s) {
   44101:	f3 0f 1e fa          	endbr64 
   44105:	55                   	push   %rbp
   44106:	48 89 e5             	mov    %rsp,%rbp
   44109:	48 83 ec 18          	sub    $0x18,%rsp
   4410d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
   44111:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   44118:	00 
   44119:	eb 0a                	jmp    44125 <strlen+0x24>
        ++n;
   4411b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    for (n = 0; *s != '\0'; ++s) {
   44120:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
   44125:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44129:	0f b6 00             	movzbl (%rax),%eax
   4412c:	84 c0                	test   %al,%al
   4412e:	75 eb                	jne    4411b <strlen+0x1a>
    }
    return n;
   44130:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   44134:	c9                   	leave  
   44135:	c3                   	ret    

0000000000044136 <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
   44136:	f3 0f 1e fa          	endbr64 
   4413a:	55                   	push   %rbp
   4413b:	48 89 e5             	mov    %rsp,%rbp
   4413e:	48 83 ec 20          	sub    $0x20,%rsp
   44142:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   44146:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   4414a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   44151:	00 
   44152:	eb 0a                	jmp    4415e <strnlen+0x28>
        ++n;
   44154:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   44159:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
   4415e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44162:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
   44166:	74 0b                	je     44173 <strnlen+0x3d>
   44168:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4416c:	0f b6 00             	movzbl (%rax),%eax
   4416f:	84 c0                	test   %al,%al
   44171:	75 e1                	jne    44154 <strnlen+0x1e>
    }
    return n;
   44173:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   44177:	c9                   	leave  
   44178:	c3                   	ret    

0000000000044179 <strcpy>:

char* strcpy(char* dst, const char* src) {
   44179:	f3 0f 1e fa          	endbr64 
   4417d:	55                   	push   %rbp
   4417e:	48 89 e5             	mov    %rsp,%rbp
   44181:	48 83 ec 20          	sub    $0x20,%rsp
   44185:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   44189:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    char* d = dst;
   4418d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44191:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    do {
        *d++ = *src++;
   44195:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   44199:	48 8d 42 01          	lea    0x1(%rdx),%rax
   4419d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
   441a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   441a5:	48 8d 48 01          	lea    0x1(%rax),%rcx
   441a9:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
   441ad:	0f b6 12             	movzbl (%rdx),%edx
   441b0:	88 10                	mov    %dl,(%rax)
    } while (d[-1]);
   441b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   441b6:	48 83 e8 01          	sub    $0x1,%rax
   441ba:	0f b6 00             	movzbl (%rax),%eax
   441bd:	84 c0                	test   %al,%al
   441bf:	75 d4                	jne    44195 <strcpy+0x1c>
    return dst;
   441c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   441c5:	c9                   	leave  
   441c6:	c3                   	ret    

00000000000441c7 <strcmp>:

int strcmp(const char* a, const char* b) {
   441c7:	f3 0f 1e fa          	endbr64 
   441cb:	55                   	push   %rbp
   441cc:	48 89 e5             	mov    %rsp,%rbp
   441cf:	48 83 ec 10          	sub    $0x10,%rsp
   441d3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   441d7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    while (*a && *b && *a == *b) {
   441db:	eb 0a                	jmp    441e7 <strcmp+0x20>
        ++a, ++b;
   441dd:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   441e2:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    while (*a && *b && *a == *b) {
   441e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   441eb:	0f b6 00             	movzbl (%rax),%eax
   441ee:	84 c0                	test   %al,%al
   441f0:	74 1d                	je     4420f <strcmp+0x48>
   441f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   441f6:	0f b6 00             	movzbl (%rax),%eax
   441f9:	84 c0                	test   %al,%al
   441fb:	74 12                	je     4420f <strcmp+0x48>
   441fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44201:	0f b6 10             	movzbl (%rax),%edx
   44204:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44208:	0f b6 00             	movzbl (%rax),%eax
   4420b:	38 c2                	cmp    %al,%dl
   4420d:	74 ce                	je     441dd <strcmp+0x16>
    }
    return ((unsigned char) *a > (unsigned char) *b)
   4420f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44213:	0f b6 00             	movzbl (%rax),%eax
   44216:	89 c2                	mov    %eax,%edx
   44218:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4421c:	0f b6 00             	movzbl (%rax),%eax
   4421f:	38 c2                	cmp    %al,%dl
   44221:	0f 97 c0             	seta   %al
   44224:	0f b6 d0             	movzbl %al,%edx
        - ((unsigned char) *a < (unsigned char) *b);
   44227:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4422b:	0f b6 00             	movzbl (%rax),%eax
   4422e:	89 c1                	mov    %eax,%ecx
   44230:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44234:	0f b6 00             	movzbl (%rax),%eax
   44237:	38 c1                	cmp    %al,%cl
   44239:	0f 92 c0             	setb   %al
   4423c:	0f b6 c8             	movzbl %al,%ecx
   4423f:	89 d0                	mov    %edx,%eax
   44241:	29 c8                	sub    %ecx,%eax
}
   44243:	c9                   	leave  
   44244:	c3                   	ret    

0000000000044245 <strchr>:

char* strchr(const char* s, int c) {
   44245:	f3 0f 1e fa          	endbr64 
   44249:	55                   	push   %rbp
   4424a:	48 89 e5             	mov    %rsp,%rbp
   4424d:	48 83 ec 10          	sub    $0x10,%rsp
   44251:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   44255:	89 75 f4             	mov    %esi,-0xc(%rbp)
    while (*s && *s != (char) c) {
   44258:	eb 05                	jmp    4425f <strchr+0x1a>
        ++s;
   4425a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    while (*s && *s != (char) c) {
   4425f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44263:	0f b6 00             	movzbl (%rax),%eax
   44266:	84 c0                	test   %al,%al
   44268:	74 0e                	je     44278 <strchr+0x33>
   4426a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4426e:	0f b6 00             	movzbl (%rax),%eax
   44271:	8b 55 f4             	mov    -0xc(%rbp),%edx
   44274:	38 d0                	cmp    %dl,%al
   44276:	75 e2                	jne    4425a <strchr+0x15>
    }
    if (*s == (char) c) {
   44278:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4427c:	0f b6 00             	movzbl (%rax),%eax
   4427f:	8b 55 f4             	mov    -0xc(%rbp),%edx
   44282:	38 d0                	cmp    %dl,%al
   44284:	75 06                	jne    4428c <strchr+0x47>
        return (char*) s;
   44286:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4428a:	eb 05                	jmp    44291 <strchr+0x4c>
    } else {
        return NULL;
   4428c:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   44291:	c9                   	leave  
   44292:	c3                   	ret    

0000000000044293 <rand>:
// rand, srand

static int rand_seed_set;
static unsigned rand_seed;

int rand(void) {
   44293:	f3 0f 1e fa          	endbr64 
   44297:	55                   	push   %rbp
   44298:	48 89 e5             	mov    %rsp,%rbp
    if (!rand_seed_set) {
   4429b:	8b 05 5f 6d 01 00    	mov    0x16d5f(%rip),%eax        # 5b000 <rand_seed_set>
   442a1:	85 c0                	test   %eax,%eax
   442a3:	75 0a                	jne    442af <rand+0x1c>
        srand(819234718U);
   442a5:	bf 9e 87 d4 30       	mov    $0x30d4879e,%edi
   442aa:	e8 24 00 00 00       	call   442d3 <srand>
    }
    rand_seed = rand_seed * 1664525U + 1013904223U;
   442af:	8b 05 4f 6d 01 00    	mov    0x16d4f(%rip),%eax        # 5b004 <rand_seed>
   442b5:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
   442bb:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
   442c0:	89 05 3e 6d 01 00    	mov    %eax,0x16d3e(%rip)        # 5b004 <rand_seed>
    return rand_seed & RAND_MAX;
   442c6:	8b 05 38 6d 01 00    	mov    0x16d38(%rip),%eax        # 5b004 <rand_seed>
   442cc:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
   442d1:	5d                   	pop    %rbp
   442d2:	c3                   	ret    

00000000000442d3 <srand>:

void srand(unsigned seed) {
   442d3:	f3 0f 1e fa          	endbr64 
   442d7:	55                   	push   %rbp
   442d8:	48 89 e5             	mov    %rsp,%rbp
   442db:	48 83 ec 08          	sub    $0x8,%rsp
   442df:	89 7d fc             	mov    %edi,-0x4(%rbp)
    rand_seed = seed;
   442e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
   442e5:	89 05 19 6d 01 00    	mov    %eax,0x16d19(%rip)        # 5b004 <rand_seed>
    rand_seed_set = 1;
   442eb:	c7 05 0b 6d 01 00 01 	movl   $0x1,0x16d0b(%rip)        # 5b000 <rand_seed_set>
   442f2:	00 00 00 
}
   442f5:	90                   	nop
   442f6:	c9                   	leave  
   442f7:	c3                   	ret    

00000000000442f8 <fill_numbuf>:
//    Print a message onto the console, starting at the given cursor position.

// snprintf, vsnprintf
//    Format a string into a buffer.

static char* fill_numbuf(char* numbuf_end, unsigned long val, int base) {
   442f8:	f3 0f 1e fa          	endbr64 
   442fc:	55                   	push   %rbp
   442fd:	48 89 e5             	mov    %rsp,%rbp
   44300:	48 83 ec 28          	sub    $0x28,%rsp
   44304:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   44308:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
   4430c:	89 55 dc             	mov    %edx,-0x24(%rbp)
    static const char upper_digits[] = "0123456789ABCDEF";
    static const char lower_digits[] = "0123456789abcdef";

    const char* digits = upper_digits;
   4430f:	48 8d 05 5a 19 00 00 	lea    0x195a(%rip),%rax        # 45c70 <upper_digits.1>
   44316:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (base < 0) {
   4431a:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   4431e:	79 0e                	jns    4432e <fill_numbuf+0x36>
        digits = lower_digits;
   44320:	48 8d 05 69 19 00 00 	lea    0x1969(%rip),%rax        # 45c90 <lower_digits.0>
   44327:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        base = -base;
   4432b:	f7 5d dc             	negl   -0x24(%rbp)
    }

    *--numbuf_end = '\0';
   4432e:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
   44333:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44337:	c6 00 00             	movb   $0x0,(%rax)
    do {
        *--numbuf_end = digits[val % base];
   4433a:	8b 45 dc             	mov    -0x24(%rbp),%eax
   4433d:	48 63 c8             	movslq %eax,%rcx
   44340:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   44344:	ba 00 00 00 00       	mov    $0x0,%edx
   44349:	48 f7 f1             	div    %rcx
   4434c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44350:	48 01 d0             	add    %rdx,%rax
   44353:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
   44358:	0f b6 10             	movzbl (%rax),%edx
   4435b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4435f:	88 10                	mov    %dl,(%rax)
        val /= base;
   44361:	8b 45 dc             	mov    -0x24(%rbp),%eax
   44364:	48 63 f0             	movslq %eax,%rsi
   44367:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4436b:	ba 00 00 00 00       	mov    $0x0,%edx
   44370:	48 f7 f6             	div    %rsi
   44373:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    } while (val != 0);
   44377:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   4437c:	75 bc                	jne    4433a <fill_numbuf+0x42>
    return numbuf_end;
   4437e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   44382:	c9                   	leave  
   44383:	c3                   	ret    

0000000000044384 <printer_vprintf>:
#define FLAG_NUMERIC            (1<<5)
#define FLAG_SIGNED             (1<<6)
#define FLAG_NEGATIVE           (1<<7)
#define FLAG_ALT2               (1<<8)

void printer_vprintf(printer* p, int color, const char* format, va_list val) {
   44384:	f3 0f 1e fa          	endbr64 
   44388:	55                   	push   %rbp
   44389:	48 89 e5             	mov    %rsp,%rbp
   4438c:	53                   	push   %rbx
   4438d:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   44394:	48 89 bd 78 ff ff ff 	mov    %rdi,-0x88(%rbp)
   4439b:	89 b5 74 ff ff ff    	mov    %esi,-0x8c(%rbp)
   443a1:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   443a8:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
#define NUMBUFSIZ 24
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
   443af:	e9 bd 09 00 00       	jmp    44d71 <printer_vprintf+0x9ed>
        if (*format != '%') {
   443b4:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   443bb:	0f b6 00             	movzbl (%rax),%eax
   443be:	3c 25                	cmp    $0x25,%al
   443c0:	74 31                	je     443f3 <printer_vprintf+0x6f>
            p->putc(p, *format, color);
   443c2:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   443c9:	4c 8b 00             	mov    (%rax),%r8
   443cc:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   443d3:	0f b6 00             	movzbl (%rax),%eax
   443d6:	0f b6 c8             	movzbl %al,%ecx
   443d9:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   443df:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   443e6:	89 ce                	mov    %ecx,%esi
   443e8:	48 89 c7             	mov    %rax,%rdi
   443eb:	41 ff d0             	call   *%r8
            continue;
   443ee:	e9 76 09 00 00       	jmp    44d69 <printer_vprintf+0x9e5>
        }

        // process flags
        int flags = 0;
   443f3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
        for (++format; *format; ++format) {
   443fa:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   44401:	01 
   44402:	eb 4d                	jmp    44451 <printer_vprintf+0xcd>
            const char* flagc = strchr(flag_chars, *format);
   44404:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   4440b:	0f b6 00             	movzbl (%rax),%eax
   4440e:	0f be c0             	movsbl %al,%eax
   44411:	89 c6                	mov    %eax,%esi
   44413:	48 8d 05 56 17 00 00 	lea    0x1756(%rip),%rax        # 45b70 <flag_chars>
   4441a:	48 89 c7             	mov    %rax,%rdi
   4441d:	e8 23 fe ff ff       	call   44245 <strchr>
   44422:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
            if (flagc) {
   44426:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   4442b:	74 34                	je     44461 <printer_vprintf+0xdd>
                flags |= 1 << (flagc - flag_chars);
   4442d:	48 8d 15 3c 17 00 00 	lea    0x173c(%rip),%rdx        # 45b70 <flag_chars>
   44434:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   44438:	48 29 d0             	sub    %rdx,%rax
   4443b:	ba 01 00 00 00       	mov    $0x1,%edx
   44440:	89 c1                	mov    %eax,%ecx
   44442:	d3 e2                	shl    %cl,%edx
   44444:	89 d0                	mov    %edx,%eax
   44446:	09 45 ec             	or     %eax,-0x14(%rbp)
        for (++format; *format; ++format) {
   44449:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   44450:	01 
   44451:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44458:	0f b6 00             	movzbl (%rax),%eax
   4445b:	84 c0                	test   %al,%al
   4445d:	75 a5                	jne    44404 <printer_vprintf+0x80>
   4445f:	eb 01                	jmp    44462 <printer_vprintf+0xde>
            } else {
                break;
   44461:	90                   	nop
            }
        }

        // process width
        int width = -1;
   44462:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%rbp)
        if (*format >= '1' && *format <= '9') {
   44469:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44470:	0f b6 00             	movzbl (%rax),%eax
   44473:	3c 30                	cmp    $0x30,%al
   44475:	7e 67                	jle    444de <printer_vprintf+0x15a>
   44477:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   4447e:	0f b6 00             	movzbl (%rax),%eax
   44481:	3c 39                	cmp    $0x39,%al
   44483:	7f 59                	jg     444de <printer_vprintf+0x15a>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   44485:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
   4448c:	eb 2e                	jmp    444bc <printer_vprintf+0x138>
                width = 10 * width + *format++ - '0';
   4448e:	8b 55 e8             	mov    -0x18(%rbp),%edx
   44491:	89 d0                	mov    %edx,%eax
   44493:	c1 e0 02             	shl    $0x2,%eax
   44496:	01 d0                	add    %edx,%eax
   44498:	01 c0                	add    %eax,%eax
   4449a:	89 c1                	mov    %eax,%ecx
   4449c:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   444a3:	48 8d 50 01          	lea    0x1(%rax),%rdx
   444a7:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   444ae:	0f b6 00             	movzbl (%rax),%eax
   444b1:	0f be c0             	movsbl %al,%eax
   444b4:	01 c8                	add    %ecx,%eax
   444b6:	83 e8 30             	sub    $0x30,%eax
   444b9:	89 45 e8             	mov    %eax,-0x18(%rbp)
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   444bc:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   444c3:	0f b6 00             	movzbl (%rax),%eax
   444c6:	3c 2f                	cmp    $0x2f,%al
   444c8:	0f 8e 85 00 00 00    	jle    44553 <printer_vprintf+0x1cf>
   444ce:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   444d5:	0f b6 00             	movzbl (%rax),%eax
   444d8:	3c 39                	cmp    $0x39,%al
   444da:	7e b2                	jle    4448e <printer_vprintf+0x10a>
        if (*format >= '1' && *format <= '9') {
   444dc:	eb 75                	jmp    44553 <printer_vprintf+0x1cf>
            }
        } else if (*format == '*') {
   444de:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   444e5:	0f b6 00             	movzbl (%rax),%eax
   444e8:	3c 2a                	cmp    $0x2a,%al
   444ea:	75 68                	jne    44554 <printer_vprintf+0x1d0>
            width = va_arg(val, int);
   444ec:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   444f3:	8b 00                	mov    (%rax),%eax
   444f5:	83 f8 2f             	cmp    $0x2f,%eax
   444f8:	77 30                	ja     4452a <printer_vprintf+0x1a6>
   444fa:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44501:	48 8b 50 10          	mov    0x10(%rax),%rdx
   44505:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4450c:	8b 00                	mov    (%rax),%eax
   4450e:	89 c0                	mov    %eax,%eax
   44510:	48 01 d0             	add    %rdx,%rax
   44513:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4451a:	8b 12                	mov    (%rdx),%edx
   4451c:	8d 4a 08             	lea    0x8(%rdx),%ecx
   4451f:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44526:	89 0a                	mov    %ecx,(%rdx)
   44528:	eb 1a                	jmp    44544 <printer_vprintf+0x1c0>
   4452a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44531:	48 8b 40 08          	mov    0x8(%rax),%rax
   44535:	48 8d 48 08          	lea    0x8(%rax),%rcx
   44539:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44540:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44544:	8b 00                	mov    (%rax),%eax
   44546:	89 45 e8             	mov    %eax,-0x18(%rbp)
            ++format;
   44549:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   44550:	01 
   44551:	eb 01                	jmp    44554 <printer_vprintf+0x1d0>
        if (*format >= '1' && *format <= '9') {
   44553:	90                   	nop
        }

        // process precision
        int precision = -1;
   44554:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
        if (*format == '.') {
   4455b:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44562:	0f b6 00             	movzbl (%rax),%eax
   44565:	3c 2e                	cmp    $0x2e,%al
   44567:	0f 85 00 01 00 00    	jne    4466d <printer_vprintf+0x2e9>
            ++format;
   4456d:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   44574:	01 
            if (*format >= '0' && *format <= '9') {
   44575:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   4457c:	0f b6 00             	movzbl (%rax),%eax
   4457f:	3c 2f                	cmp    $0x2f,%al
   44581:	7e 67                	jle    445ea <printer_vprintf+0x266>
   44583:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   4458a:	0f b6 00             	movzbl (%rax),%eax
   4458d:	3c 39                	cmp    $0x39,%al
   4458f:	7f 59                	jg     445ea <printer_vprintf+0x266>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   44591:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
   44598:	eb 2e                	jmp    445c8 <printer_vprintf+0x244>
                    precision = 10 * precision + *format++ - '0';
   4459a:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   4459d:	89 d0                	mov    %edx,%eax
   4459f:	c1 e0 02             	shl    $0x2,%eax
   445a2:	01 d0                	add    %edx,%eax
   445a4:	01 c0                	add    %eax,%eax
   445a6:	89 c1                	mov    %eax,%ecx
   445a8:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   445af:	48 8d 50 01          	lea    0x1(%rax),%rdx
   445b3:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   445ba:	0f b6 00             	movzbl (%rax),%eax
   445bd:	0f be c0             	movsbl %al,%eax
   445c0:	01 c8                	add    %ecx,%eax
   445c2:	83 e8 30             	sub    $0x30,%eax
   445c5:	89 45 e4             	mov    %eax,-0x1c(%rbp)
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   445c8:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   445cf:	0f b6 00             	movzbl (%rax),%eax
   445d2:	3c 2f                	cmp    $0x2f,%al
   445d4:	0f 8e 85 00 00 00    	jle    4465f <printer_vprintf+0x2db>
   445da:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   445e1:	0f b6 00             	movzbl (%rax),%eax
   445e4:	3c 39                	cmp    $0x39,%al
   445e6:	7e b2                	jle    4459a <printer_vprintf+0x216>
            if (*format >= '0' && *format <= '9') {
   445e8:	eb 75                	jmp    4465f <printer_vprintf+0x2db>
                }
            } else if (*format == '*') {
   445ea:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   445f1:	0f b6 00             	movzbl (%rax),%eax
   445f4:	3c 2a                	cmp    $0x2a,%al
   445f6:	75 68                	jne    44660 <printer_vprintf+0x2dc>
                precision = va_arg(val, int);
   445f8:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   445ff:	8b 00                	mov    (%rax),%eax
   44601:	83 f8 2f             	cmp    $0x2f,%eax
   44604:	77 30                	ja     44636 <printer_vprintf+0x2b2>
   44606:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4460d:	48 8b 50 10          	mov    0x10(%rax),%rdx
   44611:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44618:	8b 00                	mov    (%rax),%eax
   4461a:	89 c0                	mov    %eax,%eax
   4461c:	48 01 d0             	add    %rdx,%rax
   4461f:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44626:	8b 12                	mov    (%rdx),%edx
   44628:	8d 4a 08             	lea    0x8(%rdx),%ecx
   4462b:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44632:	89 0a                	mov    %ecx,(%rdx)
   44634:	eb 1a                	jmp    44650 <printer_vprintf+0x2cc>
   44636:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4463d:	48 8b 40 08          	mov    0x8(%rax),%rax
   44641:	48 8d 48 08          	lea    0x8(%rax),%rcx
   44645:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4464c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44650:	8b 00                	mov    (%rax),%eax
   44652:	89 45 e4             	mov    %eax,-0x1c(%rbp)
                ++format;
   44655:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   4465c:	01 
   4465d:	eb 01                	jmp    44660 <printer_vprintf+0x2dc>
            if (*format >= '0' && *format <= '9') {
   4465f:	90                   	nop
            }
            if (precision < 0) {
   44660:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
   44664:	79 07                	jns    4466d <printer_vprintf+0x2e9>
                precision = 0;
   44666:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
            }
        }

        // process main conversion character
        int base = 10;
   4466d:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%rbp)
        unsigned long num = 0;
   44674:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
   4467b:	00 
        int length = 0;
   4467c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
        char* data = "";
   44683:	48 8d 05 ec 14 00 00 	lea    0x14ec(%rip),%rax        # 45b76 <flag_chars+0x6>
   4468a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    again:
        switch (*format) {
   4468e:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44695:	0f b6 00             	movzbl (%rax),%eax
   44698:	0f be c0             	movsbl %al,%eax
   4469b:	83 e8 43             	sub    $0x43,%eax
   4469e:	83 f8 37             	cmp    $0x37,%eax
   446a1:	0f 87 b6 03 00 00    	ja     44a5d <printer_vprintf+0x6d9>
   446a7:	89 c0                	mov    %eax,%eax
   446a9:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
   446b0:	00 
   446b1:	48 8d 05 cc 14 00 00 	lea    0x14cc(%rip),%rax        # 45b84 <flag_chars+0x14>
   446b8:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   446bb:	48 98                	cltq   
   446bd:	48 8d 15 c0 14 00 00 	lea    0x14c0(%rip),%rdx        # 45b84 <flag_chars+0x14>
   446c4:	48 01 d0             	add    %rdx,%rax
   446c7:	3e ff e0             	notrack jmp *%rax
        case 'l':
        case 'z':
            length = 1;
   446ca:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
            ++format;
   446d1:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   446d8:	01 
            goto again;
   446d9:	eb b3                	jmp    4468e <printer_vprintf+0x30a>
        case 'd':
        case 'i': {
            long x = length ? va_arg(val, long) : va_arg(val, int);
   446db:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   446df:	74 5d                	je     4473e <printer_vprintf+0x3ba>
   446e1:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   446e8:	8b 00                	mov    (%rax),%eax
   446ea:	83 f8 2f             	cmp    $0x2f,%eax
   446ed:	77 30                	ja     4471f <printer_vprintf+0x39b>
   446ef:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   446f6:	48 8b 50 10          	mov    0x10(%rax),%rdx
   446fa:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44701:	8b 00                	mov    (%rax),%eax
   44703:	89 c0                	mov    %eax,%eax
   44705:	48 01 d0             	add    %rdx,%rax
   44708:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4470f:	8b 12                	mov    (%rdx),%edx
   44711:	8d 4a 08             	lea    0x8(%rdx),%ecx
   44714:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4471b:	89 0a                	mov    %ecx,(%rdx)
   4471d:	eb 1a                	jmp    44739 <printer_vprintf+0x3b5>
   4471f:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44726:	48 8b 40 08          	mov    0x8(%rax),%rax
   4472a:	48 8d 48 08          	lea    0x8(%rax),%rcx
   4472e:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44735:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44739:	48 8b 00             	mov    (%rax),%rax
   4473c:	eb 5c                	jmp    4479a <printer_vprintf+0x416>
   4473e:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44745:	8b 00                	mov    (%rax),%eax
   44747:	83 f8 2f             	cmp    $0x2f,%eax
   4474a:	77 30                	ja     4477c <printer_vprintf+0x3f8>
   4474c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44753:	48 8b 50 10          	mov    0x10(%rax),%rdx
   44757:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4475e:	8b 00                	mov    (%rax),%eax
   44760:	89 c0                	mov    %eax,%eax
   44762:	48 01 d0             	add    %rdx,%rax
   44765:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4476c:	8b 12                	mov    (%rdx),%edx
   4476e:	8d 4a 08             	lea    0x8(%rdx),%ecx
   44771:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44778:	89 0a                	mov    %ecx,(%rdx)
   4477a:	eb 1a                	jmp    44796 <printer_vprintf+0x412>
   4477c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44783:	48 8b 40 08          	mov    0x8(%rax),%rax
   44787:	48 8d 48 08          	lea    0x8(%rax),%rcx
   4478b:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44792:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44796:	8b 00                	mov    (%rax),%eax
   44798:	48 98                	cltq   
   4479a:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
   4479e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   447a2:	48 c1 f8 38          	sar    $0x38,%rax
   447a6:	25 80 00 00 00       	and    $0x80,%eax
   447ab:	89 45 a4             	mov    %eax,-0x5c(%rbp)
            num = negative ? -x : x;
   447ae:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
   447b2:	74 09                	je     447bd <printer_vprintf+0x439>
   447b4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   447b8:	48 f7 d8             	neg    %rax
   447bb:	eb 04                	jmp    447c1 <printer_vprintf+0x43d>
   447bd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   447c1:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
   447c5:	8b 45 a4             	mov    -0x5c(%rbp),%eax
   447c8:	83 c8 60             	or     $0x60,%eax
   447cb:	09 45 ec             	or     %eax,-0x14(%rbp)
            break;
   447ce:	e9 cf 02 00 00       	jmp    44aa2 <printer_vprintf+0x71e>
        }
        case 'u':
        format_unsigned:
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   447d3:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   447d7:	74 5d                	je     44836 <printer_vprintf+0x4b2>
   447d9:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   447e0:	8b 00                	mov    (%rax),%eax
   447e2:	83 f8 2f             	cmp    $0x2f,%eax
   447e5:	77 30                	ja     44817 <printer_vprintf+0x493>
   447e7:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   447ee:	48 8b 50 10          	mov    0x10(%rax),%rdx
   447f2:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   447f9:	8b 00                	mov    (%rax),%eax
   447fb:	89 c0                	mov    %eax,%eax
   447fd:	48 01 d0             	add    %rdx,%rax
   44800:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44807:	8b 12                	mov    (%rdx),%edx
   44809:	8d 4a 08             	lea    0x8(%rdx),%ecx
   4480c:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44813:	89 0a                	mov    %ecx,(%rdx)
   44815:	eb 1a                	jmp    44831 <printer_vprintf+0x4ad>
   44817:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4481e:	48 8b 40 08          	mov    0x8(%rax),%rax
   44822:	48 8d 48 08          	lea    0x8(%rax),%rcx
   44826:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4482d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44831:	48 8b 00             	mov    (%rax),%rax
   44834:	eb 5c                	jmp    44892 <printer_vprintf+0x50e>
   44836:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4483d:	8b 00                	mov    (%rax),%eax
   4483f:	83 f8 2f             	cmp    $0x2f,%eax
   44842:	77 30                	ja     44874 <printer_vprintf+0x4f0>
   44844:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4484b:	48 8b 50 10          	mov    0x10(%rax),%rdx
   4484f:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44856:	8b 00                	mov    (%rax),%eax
   44858:	89 c0                	mov    %eax,%eax
   4485a:	48 01 d0             	add    %rdx,%rax
   4485d:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44864:	8b 12                	mov    (%rdx),%edx
   44866:	8d 4a 08             	lea    0x8(%rdx),%ecx
   44869:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44870:	89 0a                	mov    %ecx,(%rdx)
   44872:	eb 1a                	jmp    4488e <printer_vprintf+0x50a>
   44874:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4487b:	48 8b 40 08          	mov    0x8(%rax),%rax
   4487f:	48 8d 48 08          	lea    0x8(%rax),%rcx
   44883:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4488a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   4488e:	8b 00                	mov    (%rax),%eax
   44890:	89 c0                	mov    %eax,%eax
   44892:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            flags |= FLAG_NUMERIC;
   44896:	83 4d ec 20          	orl    $0x20,-0x14(%rbp)
            break;
   4489a:	e9 03 02 00 00       	jmp    44aa2 <printer_vprintf+0x71e>
        case 'x':
            base = -16;
   4489f:	c7 45 e0 f0 ff ff ff 	movl   $0xfffffff0,-0x20(%rbp)
            goto format_unsigned;
   448a6:	e9 28 ff ff ff       	jmp    447d3 <printer_vprintf+0x44f>
        case 'X':
            base = 16;
   448ab:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%rbp)
            goto format_unsigned;
   448b2:	e9 1c ff ff ff       	jmp    447d3 <printer_vprintf+0x44f>
        case 'p':
            num = (uintptr_t) va_arg(val, void*);
   448b7:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   448be:	8b 00                	mov    (%rax),%eax
   448c0:	83 f8 2f             	cmp    $0x2f,%eax
   448c3:	77 30                	ja     448f5 <printer_vprintf+0x571>
   448c5:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   448cc:	48 8b 50 10          	mov    0x10(%rax),%rdx
   448d0:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   448d7:	8b 00                	mov    (%rax),%eax
   448d9:	89 c0                	mov    %eax,%eax
   448db:	48 01 d0             	add    %rdx,%rax
   448de:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   448e5:	8b 12                	mov    (%rdx),%edx
   448e7:	8d 4a 08             	lea    0x8(%rdx),%ecx
   448ea:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   448f1:	89 0a                	mov    %ecx,(%rdx)
   448f3:	eb 1a                	jmp    4490f <printer_vprintf+0x58b>
   448f5:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   448fc:	48 8b 40 08          	mov    0x8(%rax),%rax
   44900:	48 8d 48 08          	lea    0x8(%rax),%rcx
   44904:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4490b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   4490f:	48 8b 00             	mov    (%rax),%rax
   44912:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            base = -16;
   44916:	c7 45 e0 f0 ff ff ff 	movl   $0xfffffff0,-0x20(%rbp)
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
   4491d:	81 4d ec 21 01 00 00 	orl    $0x121,-0x14(%rbp)
            break;
   44924:	e9 79 01 00 00       	jmp    44aa2 <printer_vprintf+0x71e>
        case 's':
            data = va_arg(val, char*);
   44929:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44930:	8b 00                	mov    (%rax),%eax
   44932:	83 f8 2f             	cmp    $0x2f,%eax
   44935:	77 30                	ja     44967 <printer_vprintf+0x5e3>
   44937:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4493e:	48 8b 50 10          	mov    0x10(%rax),%rdx
   44942:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44949:	8b 00                	mov    (%rax),%eax
   4494b:	89 c0                	mov    %eax,%eax
   4494d:	48 01 d0             	add    %rdx,%rax
   44950:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44957:	8b 12                	mov    (%rdx),%edx
   44959:	8d 4a 08             	lea    0x8(%rdx),%ecx
   4495c:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44963:	89 0a                	mov    %ecx,(%rdx)
   44965:	eb 1a                	jmp    44981 <printer_vprintf+0x5fd>
   44967:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4496e:	48 8b 40 08          	mov    0x8(%rax),%rax
   44972:	48 8d 48 08          	lea    0x8(%rax),%rcx
   44976:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4497d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44981:	48 8b 00             	mov    (%rax),%rax
   44984:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            break;
   44988:	e9 15 01 00 00       	jmp    44aa2 <printer_vprintf+0x71e>
        case 'C':
            color = va_arg(val, int);
   4498d:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44994:	8b 00                	mov    (%rax),%eax
   44996:	83 f8 2f             	cmp    $0x2f,%eax
   44999:	77 30                	ja     449cb <printer_vprintf+0x647>
   4499b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   449a2:	48 8b 50 10          	mov    0x10(%rax),%rdx
   449a6:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   449ad:	8b 00                	mov    (%rax),%eax
   449af:	89 c0                	mov    %eax,%eax
   449b1:	48 01 d0             	add    %rdx,%rax
   449b4:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   449bb:	8b 12                	mov    (%rdx),%edx
   449bd:	8d 4a 08             	lea    0x8(%rdx),%ecx
   449c0:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   449c7:	89 0a                	mov    %ecx,(%rdx)
   449c9:	eb 1a                	jmp    449e5 <printer_vprintf+0x661>
   449cb:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   449d2:	48 8b 40 08          	mov    0x8(%rax),%rax
   449d6:	48 8d 48 08          	lea    0x8(%rax),%rcx
   449da:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   449e1:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   449e5:	8b 00                	mov    (%rax),%eax
   449e7:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
            goto done;
   449ed:	e9 77 03 00 00       	jmp    44d69 <printer_vprintf+0x9e5>
        case 'c':
            data = numbuf;
   449f2:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
   449f6:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            numbuf[0] = va_arg(val, int);
   449fa:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44a01:	8b 00                	mov    (%rax),%eax
   44a03:	83 f8 2f             	cmp    $0x2f,%eax
   44a06:	77 30                	ja     44a38 <printer_vprintf+0x6b4>
   44a08:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44a0f:	48 8b 50 10          	mov    0x10(%rax),%rdx
   44a13:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44a1a:	8b 00                	mov    (%rax),%eax
   44a1c:	89 c0                	mov    %eax,%eax
   44a1e:	48 01 d0             	add    %rdx,%rax
   44a21:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44a28:	8b 12                	mov    (%rdx),%edx
   44a2a:	8d 4a 08             	lea    0x8(%rdx),%ecx
   44a2d:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44a34:	89 0a                	mov    %ecx,(%rdx)
   44a36:	eb 1a                	jmp    44a52 <printer_vprintf+0x6ce>
   44a38:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44a3f:	48 8b 40 08          	mov    0x8(%rax),%rax
   44a43:	48 8d 48 08          	lea    0x8(%rax),%rcx
   44a47:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44a4e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44a52:	8b 00                	mov    (%rax),%eax
   44a54:	88 45 8c             	mov    %al,-0x74(%rbp)
            numbuf[1] = '\0';
   44a57:	c6 45 8d 00          	movb   $0x0,-0x73(%rbp)
            break;
   44a5b:	eb 45                	jmp    44aa2 <printer_vprintf+0x71e>
        default:
            data = numbuf;
   44a5d:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
   44a61:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            numbuf[0] = (*format ? *format : '%');
   44a65:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44a6c:	0f b6 00             	movzbl (%rax),%eax
   44a6f:	84 c0                	test   %al,%al
   44a71:	74 0c                	je     44a7f <printer_vprintf+0x6fb>
   44a73:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44a7a:	0f b6 00             	movzbl (%rax),%eax
   44a7d:	eb 05                	jmp    44a84 <printer_vprintf+0x700>
   44a7f:	b8 25 00 00 00       	mov    $0x25,%eax
   44a84:	88 45 8c             	mov    %al,-0x74(%rbp)
            numbuf[1] = '\0';
   44a87:	c6 45 8d 00          	movb   $0x0,-0x73(%rbp)
            if (!*format) {
   44a8b:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44a92:	0f b6 00             	movzbl (%rax),%eax
   44a95:	84 c0                	test   %al,%al
   44a97:	75 08                	jne    44aa1 <printer_vprintf+0x71d>
                format--;
   44a99:	48 83 ad 68 ff ff ff 	subq   $0x1,-0x98(%rbp)
   44aa0:	01 
            }
            break;
   44aa1:	90                   	nop
        }

        if (flags & FLAG_NUMERIC) {
   44aa2:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44aa5:	83 e0 20             	and    $0x20,%eax
   44aa8:	85 c0                	test   %eax,%eax
   44aaa:	74 1e                	je     44aca <printer_vprintf+0x746>
            data = fill_numbuf(numbuf + NUMBUFSIZ, num, base);
   44aac:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
   44ab0:	48 83 c0 18          	add    $0x18,%rax
   44ab4:	8b 55 e0             	mov    -0x20(%rbp),%edx
   44ab7:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
   44abb:	48 89 ce             	mov    %rcx,%rsi
   44abe:	48 89 c7             	mov    %rax,%rdi
   44ac1:	e8 32 f8 ff ff       	call   442f8 <fill_numbuf>
   44ac6:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
        }

        const char* prefix = "";
   44aca:	48 8d 05 a5 10 00 00 	lea    0x10a5(%rip),%rax        # 45b76 <flag_chars+0x6>
   44ad1:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
   44ad5:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44ad8:	83 e0 20             	and    $0x20,%eax
   44adb:	85 c0                	test   %eax,%eax
   44add:	74 51                	je     44b30 <printer_vprintf+0x7ac>
   44adf:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44ae2:	83 e0 40             	and    $0x40,%eax
   44ae5:	85 c0                	test   %eax,%eax
   44ae7:	74 47                	je     44b30 <printer_vprintf+0x7ac>
            if (flags & FLAG_NEGATIVE) {
   44ae9:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44aec:	25 80 00 00 00       	and    $0x80,%eax
   44af1:	85 c0                	test   %eax,%eax
   44af3:	74 0d                	je     44b02 <printer_vprintf+0x77e>
                prefix = "-";
   44af5:	48 8d 05 7b 10 00 00 	lea    0x107b(%rip),%rax        # 45b77 <flag_chars+0x7>
   44afc:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
   44b00:	eb 7d                	jmp    44b7f <printer_vprintf+0x7fb>
            } else if (flags & FLAG_PLUSPOSITIVE) {
   44b02:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44b05:	83 e0 10             	and    $0x10,%eax
   44b08:	85 c0                	test   %eax,%eax
   44b0a:	74 0d                	je     44b19 <printer_vprintf+0x795>
                prefix = "+";
   44b0c:	48 8d 05 66 10 00 00 	lea    0x1066(%rip),%rax        # 45b79 <flag_chars+0x9>
   44b13:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
   44b17:	eb 66                	jmp    44b7f <printer_vprintf+0x7fb>
            } else if (flags & FLAG_SPACEPOSITIVE) {
   44b19:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44b1c:	83 e0 08             	and    $0x8,%eax
   44b1f:	85 c0                	test   %eax,%eax
   44b21:	74 5c                	je     44b7f <printer_vprintf+0x7fb>
                prefix = " ";
   44b23:	48 8d 05 51 10 00 00 	lea    0x1051(%rip),%rax        # 45b7b <flag_chars+0xb>
   44b2a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
   44b2e:	eb 4f                	jmp    44b7f <printer_vprintf+0x7fb>
            }
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   44b30:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44b33:	83 e0 20             	and    $0x20,%eax
   44b36:	85 c0                	test   %eax,%eax
   44b38:	74 46                	je     44b80 <printer_vprintf+0x7fc>
   44b3a:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44b3d:	83 e0 01             	and    $0x1,%eax
   44b40:	85 c0                	test   %eax,%eax
   44b42:	74 3c                	je     44b80 <printer_vprintf+0x7fc>
                   && (base == 16 || base == -16)
   44b44:	83 7d e0 10          	cmpl   $0x10,-0x20(%rbp)
   44b48:	74 06                	je     44b50 <printer_vprintf+0x7cc>
   44b4a:	83 7d e0 f0          	cmpl   $0xfffffff0,-0x20(%rbp)
   44b4e:	75 30                	jne    44b80 <printer_vprintf+0x7fc>
                   && (num || (flags & FLAG_ALT2))) {
   44b50:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   44b55:	75 0c                	jne    44b63 <printer_vprintf+0x7df>
   44b57:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44b5a:	25 00 01 00 00       	and    $0x100,%eax
   44b5f:	85 c0                	test   %eax,%eax
   44b61:	74 1d                	je     44b80 <printer_vprintf+0x7fc>
            prefix = (base == -16 ? "0x" : "0X");
   44b63:	83 7d e0 f0          	cmpl   $0xfffffff0,-0x20(%rbp)
   44b67:	75 09                	jne    44b72 <printer_vprintf+0x7ee>
   44b69:	48 8d 05 0d 10 00 00 	lea    0x100d(%rip),%rax        # 45b7d <flag_chars+0xd>
   44b70:	eb 07                	jmp    44b79 <printer_vprintf+0x7f5>
   44b72:	48 8d 05 07 10 00 00 	lea    0x1007(%rip),%rax        # 45b80 <flag_chars+0x10>
   44b79:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   44b7d:	eb 01                	jmp    44b80 <printer_vprintf+0x7fc>
            if (flags & FLAG_NEGATIVE) {
   44b7f:	90                   	nop
        }

        int len;
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
   44b80:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
   44b84:	78 24                	js     44baa <printer_vprintf+0x826>
   44b86:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44b89:	83 e0 20             	and    $0x20,%eax
   44b8c:	85 c0                	test   %eax,%eax
   44b8e:	75 1a                	jne    44baa <printer_vprintf+0x826>
            len = strnlen(data, precision);
   44b90:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   44b93:	48 63 d0             	movslq %eax,%rdx
   44b96:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   44b9a:	48 89 d6             	mov    %rdx,%rsi
   44b9d:	48 89 c7             	mov    %rax,%rdi
   44ba0:	e8 91 f5 ff ff       	call   44136 <strnlen>
   44ba5:	89 45 bc             	mov    %eax,-0x44(%rbp)
   44ba8:	eb 0f                	jmp    44bb9 <printer_vprintf+0x835>
        } else {
            len = strlen(data);
   44baa:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   44bae:	48 89 c7             	mov    %rax,%rdi
   44bb1:	e8 4b f5 ff ff       	call   44101 <strlen>
   44bb6:	89 45 bc             	mov    %eax,-0x44(%rbp)
        }
        int zeros;
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
   44bb9:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44bbc:	83 e0 20             	and    $0x20,%eax
   44bbf:	85 c0                	test   %eax,%eax
   44bc1:	74 20                	je     44be3 <printer_vprintf+0x85f>
   44bc3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
   44bc7:	78 1a                	js     44be3 <printer_vprintf+0x85f>
            zeros = precision > len ? precision - len : 0;
   44bc9:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   44bcc:	3b 45 bc             	cmp    -0x44(%rbp),%eax
   44bcf:	7e 08                	jle    44bd9 <printer_vprintf+0x855>
   44bd1:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   44bd4:	2b 45 bc             	sub    -0x44(%rbp),%eax
   44bd7:	eb 05                	jmp    44bde <printer_vprintf+0x85a>
   44bd9:	b8 00 00 00 00       	mov    $0x0,%eax
   44bde:	89 45 b8             	mov    %eax,-0x48(%rbp)
   44be1:	eb 5c                	jmp    44c3f <printer_vprintf+0x8bb>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
   44be3:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44be6:	83 e0 20             	and    $0x20,%eax
   44be9:	85 c0                	test   %eax,%eax
   44beb:	74 4b                	je     44c38 <printer_vprintf+0x8b4>
   44bed:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44bf0:	83 e0 02             	and    $0x2,%eax
   44bf3:	85 c0                	test   %eax,%eax
   44bf5:	74 41                	je     44c38 <printer_vprintf+0x8b4>
                   && !(flags & FLAG_LEFTJUSTIFY)
   44bf7:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44bfa:	83 e0 04             	and    $0x4,%eax
   44bfd:	85 c0                	test   %eax,%eax
   44bff:	75 37                	jne    44c38 <printer_vprintf+0x8b4>
                   && len + (int) strlen(prefix) < width) {
   44c01:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   44c05:	48 89 c7             	mov    %rax,%rdi
   44c08:	e8 f4 f4 ff ff       	call   44101 <strlen>
   44c0d:	89 c2                	mov    %eax,%edx
   44c0f:	8b 45 bc             	mov    -0x44(%rbp),%eax
   44c12:	01 d0                	add    %edx,%eax
   44c14:	39 45 e8             	cmp    %eax,-0x18(%rbp)
   44c17:	7e 1f                	jle    44c38 <printer_vprintf+0x8b4>
            zeros = width - len - strlen(prefix);
   44c19:	8b 45 e8             	mov    -0x18(%rbp),%eax
   44c1c:	2b 45 bc             	sub    -0x44(%rbp),%eax
   44c1f:	89 c3                	mov    %eax,%ebx
   44c21:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   44c25:	48 89 c7             	mov    %rax,%rdi
   44c28:	e8 d4 f4 ff ff       	call   44101 <strlen>
   44c2d:	89 c2                	mov    %eax,%edx
   44c2f:	89 d8                	mov    %ebx,%eax
   44c31:	29 d0                	sub    %edx,%eax
   44c33:	89 45 b8             	mov    %eax,-0x48(%rbp)
   44c36:	eb 07                	jmp    44c3f <printer_vprintf+0x8bb>
        } else {
            zeros = 0;
   44c38:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%rbp)
        }
        width -= len + zeros + strlen(prefix);
   44c3f:	8b 55 bc             	mov    -0x44(%rbp),%edx
   44c42:	8b 45 b8             	mov    -0x48(%rbp),%eax
   44c45:	01 d0                	add    %edx,%eax
   44c47:	48 63 d8             	movslq %eax,%rbx
   44c4a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   44c4e:	48 89 c7             	mov    %rax,%rdi
   44c51:	e8 ab f4 ff ff       	call   44101 <strlen>
   44c56:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
   44c5a:	8b 45 e8             	mov    -0x18(%rbp),%eax
   44c5d:	29 d0                	sub    %edx,%eax
   44c5f:	89 45 e8             	mov    %eax,-0x18(%rbp)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   44c62:	eb 25                	jmp    44c89 <printer_vprintf+0x905>
            p->putc(p, ' ', color);
   44c64:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44c6b:	48 8b 08             	mov    (%rax),%rcx
   44c6e:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   44c74:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44c7b:	be 20 00 00 00       	mov    $0x20,%esi
   44c80:	48 89 c7             	mov    %rax,%rdi
   44c83:	ff d1                	call   *%rcx
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   44c85:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
   44c89:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44c8c:	83 e0 04             	and    $0x4,%eax
   44c8f:	85 c0                	test   %eax,%eax
   44c91:	75 36                	jne    44cc9 <printer_vprintf+0x945>
   44c93:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
   44c97:	7f cb                	jg     44c64 <printer_vprintf+0x8e0>
        }
        for (; *prefix; ++prefix) {
   44c99:	eb 2e                	jmp    44cc9 <printer_vprintf+0x945>
            p->putc(p, *prefix, color);
   44c9b:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44ca2:	4c 8b 00             	mov    (%rax),%r8
   44ca5:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   44ca9:	0f b6 00             	movzbl (%rax),%eax
   44cac:	0f b6 c8             	movzbl %al,%ecx
   44caf:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   44cb5:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44cbc:	89 ce                	mov    %ecx,%esi
   44cbe:	48 89 c7             	mov    %rax,%rdi
   44cc1:	41 ff d0             	call   *%r8
        for (; *prefix; ++prefix) {
   44cc4:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
   44cc9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   44ccd:	0f b6 00             	movzbl (%rax),%eax
   44cd0:	84 c0                	test   %al,%al
   44cd2:	75 c7                	jne    44c9b <printer_vprintf+0x917>
        }
        for (; zeros > 0; --zeros) {
   44cd4:	eb 25                	jmp    44cfb <printer_vprintf+0x977>
            p->putc(p, '0', color);
   44cd6:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44cdd:	48 8b 08             	mov    (%rax),%rcx
   44ce0:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   44ce6:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44ced:	be 30 00 00 00       	mov    $0x30,%esi
   44cf2:	48 89 c7             	mov    %rax,%rdi
   44cf5:	ff d1                	call   *%rcx
        for (; zeros > 0; --zeros) {
   44cf7:	83 6d b8 01          	subl   $0x1,-0x48(%rbp)
   44cfb:	83 7d b8 00          	cmpl   $0x0,-0x48(%rbp)
   44cff:	7f d5                	jg     44cd6 <printer_vprintf+0x952>
        }
        for (; len > 0; ++data, --len) {
   44d01:	eb 32                	jmp    44d35 <printer_vprintf+0x9b1>
            p->putc(p, *data, color);
   44d03:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44d0a:	4c 8b 00             	mov    (%rax),%r8
   44d0d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   44d11:	0f b6 00             	movzbl (%rax),%eax
   44d14:	0f b6 c8             	movzbl %al,%ecx
   44d17:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   44d1d:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44d24:	89 ce                	mov    %ecx,%esi
   44d26:	48 89 c7             	mov    %rax,%rdi
   44d29:	41 ff d0             	call   *%r8
        for (; len > 0; ++data, --len) {
   44d2c:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
   44d31:	83 6d bc 01          	subl   $0x1,-0x44(%rbp)
   44d35:	83 7d bc 00          	cmpl   $0x0,-0x44(%rbp)
   44d39:	7f c8                	jg     44d03 <printer_vprintf+0x97f>
        }
        for (; width > 0; --width) {
   44d3b:	eb 25                	jmp    44d62 <printer_vprintf+0x9de>
            p->putc(p, ' ', color);
   44d3d:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44d44:	48 8b 08             	mov    (%rax),%rcx
   44d47:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   44d4d:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44d54:	be 20 00 00 00       	mov    $0x20,%esi
   44d59:	48 89 c7             	mov    %rax,%rdi
   44d5c:	ff d1                	call   *%rcx
        for (; width > 0; --width) {
   44d5e:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
   44d62:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
   44d66:	7f d5                	jg     44d3d <printer_vprintf+0x9b9>
        }
    done: ;
   44d68:	90                   	nop
    for (; *format; ++format) {
   44d69:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   44d70:	01 
   44d71:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44d78:	0f b6 00             	movzbl (%rax),%eax
   44d7b:	84 c0                	test   %al,%al
   44d7d:	0f 85 31 f6 ff ff    	jne    443b4 <printer_vprintf+0x30>
    }
}
   44d83:	90                   	nop
   44d84:	90                   	nop
   44d85:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   44d89:	c9                   	leave  
   44d8a:	c3                   	ret    

0000000000044d8b <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
   44d8b:	f3 0f 1e fa          	endbr64 
   44d8f:	55                   	push   %rbp
   44d90:	48 89 e5             	mov    %rsp,%rbp
   44d93:	48 83 ec 20          	sub    $0x20,%rsp
   44d97:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   44d9b:	89 f0                	mov    %esi,%eax
   44d9d:	89 55 e0             	mov    %edx,-0x20(%rbp)
   44da0:	88 45 e4             	mov    %al,-0x1c(%rbp)
    console_printer* cp = (console_printer*) p;
   44da3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44da7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   44dab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44daf:	48 8b 40 08          	mov    0x8(%rax),%rax
   44db3:	48 8d 15 e6 41 07 00 	lea    0x741e6(%rip),%rdx        # b8fa0 <console+0xfa0>
   44dba:	48 39 d0             	cmp    %rdx,%rax
   44dbd:	72 0f                	jb     44dce <console_putc+0x43>
        cp->cursor = console;
   44dbf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44dc3:	48 8d 15 36 32 07 00 	lea    0x73236(%rip),%rdx        # b8000 <console>
   44dca:	48 89 50 08          	mov    %rdx,0x8(%rax)
    }
    if (c == '\n') {
   44dce:	80 7d e4 0a          	cmpb   $0xa,-0x1c(%rbp)
   44dd2:	0f 85 82 00 00 00    	jne    44e5a <console_putc+0xcf>
        int pos = (cp->cursor - console) % 80;
   44dd8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44ddc:	48 8b 40 08          	mov    0x8(%rax),%rax
   44de0:	48 8d 15 19 32 07 00 	lea    0x73219(%rip),%rdx        # b8000 <console>
   44de7:	48 29 d0             	sub    %rdx,%rax
   44dea:	48 d1 f8             	sar    %rax
   44ded:	48 89 c1             	mov    %rax,%rcx
   44df0:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   44df7:	66 66 66 
   44dfa:	48 89 c8             	mov    %rcx,%rax
   44dfd:	48 f7 ea             	imul   %rdx
   44e00:	48 89 d0             	mov    %rdx,%rax
   44e03:	48 c1 f8 05          	sar    $0x5,%rax
   44e07:	48 89 ce             	mov    %rcx,%rsi
   44e0a:	48 c1 fe 3f          	sar    $0x3f,%rsi
   44e0e:	48 29 f0             	sub    %rsi,%rax
   44e11:	48 89 c2             	mov    %rax,%rdx
   44e14:	48 89 d0             	mov    %rdx,%rax
   44e17:	48 c1 e0 02          	shl    $0x2,%rax
   44e1b:	48 01 d0             	add    %rdx,%rax
   44e1e:	48 c1 e0 04          	shl    $0x4,%rax
   44e22:	48 29 c1             	sub    %rax,%rcx
   44e25:	48 89 ca             	mov    %rcx,%rdx
   44e28:	89 55 fc             	mov    %edx,-0x4(%rbp)
        for (; pos != 80; pos++) {
   44e2b:	eb 25                	jmp    44e52 <console_putc+0xc7>
            *cp->cursor++ = ' ' | color;
   44e2d:	8b 45 e0             	mov    -0x20(%rbp),%eax
   44e30:	83 c8 20             	or     $0x20,%eax
   44e33:	89 c6                	mov    %eax,%esi
   44e35:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44e39:	48 8b 40 08          	mov    0x8(%rax),%rax
   44e3d:	48 8d 48 02          	lea    0x2(%rax),%rcx
   44e41:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   44e45:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44e49:	89 f2                	mov    %esi,%edx
   44e4b:	66 89 10             	mov    %dx,(%rax)
        for (; pos != 80; pos++) {
   44e4e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   44e52:	83 7d fc 50          	cmpl   $0x50,-0x4(%rbp)
   44e56:	75 d5                	jne    44e2d <console_putc+0xa2>
        }
    } else {
        *cp->cursor++ = c | color;
    }
}
   44e58:	eb 24                	jmp    44e7e <console_putc+0xf3>
        *cp->cursor++ = c | color;
   44e5a:	0f b6 55 e4          	movzbl -0x1c(%rbp),%edx
   44e5e:	8b 45 e0             	mov    -0x20(%rbp),%eax
   44e61:	89 d6                	mov    %edx,%esi
   44e63:	09 c6                	or     %eax,%esi
   44e65:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44e69:	48 8b 40 08          	mov    0x8(%rax),%rax
   44e6d:	48 8d 48 02          	lea    0x2(%rax),%rcx
   44e71:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   44e75:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44e79:	89 f2                	mov    %esi,%edx
   44e7b:	66 89 10             	mov    %dx,(%rax)
}
   44e7e:	90                   	nop
   44e7f:	c9                   	leave  
   44e80:	c3                   	ret    

0000000000044e81 <console_vprintf>:

int console_vprintf(int cpos, int color, const char* format, va_list val) {
   44e81:	f3 0f 1e fa          	endbr64 
   44e85:	55                   	push   %rbp
   44e86:	48 89 e5             	mov    %rsp,%rbp
   44e89:	48 83 ec 30          	sub    $0x30,%rsp
   44e8d:	89 7d ec             	mov    %edi,-0x14(%rbp)
   44e90:	89 75 e8             	mov    %esi,-0x18(%rbp)
   44e93:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   44e97:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    struct console_printer cp;
    cp.p.putc = console_putc;
   44e9b:	48 8d 05 e9 fe ff ff 	lea    -0x117(%rip),%rax        # 44d8b <console_putc>
   44ea2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (cpos < 0 || cpos >= CONSOLE_ROWS * CONSOLE_COLUMNS) {
   44ea6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
   44eaa:	78 09                	js     44eb5 <console_vprintf+0x34>
   44eac:	81 7d ec cf 07 00 00 	cmpl   $0x7cf,-0x14(%rbp)
   44eb3:	7e 07                	jle    44ebc <console_vprintf+0x3b>
        cpos = 0;
   44eb5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    }
    cp.cursor = console + cpos;
   44ebc:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44ebf:	48 98                	cltq   
   44ec1:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   44ec5:	48 8d 05 34 31 07 00 	lea    0x73134(%rip),%rax        # b8000 <console>
   44ecc:	48 01 d0             	add    %rdx,%rax
   44ecf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&cp.p, color, format, val);
   44ed3:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
   44ed7:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   44edb:	8b 75 e8             	mov    -0x18(%rbp),%esi
   44ede:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
   44ee2:	48 89 c7             	mov    %rax,%rdi
   44ee5:	e8 9a f4 ff ff       	call   44384 <printer_vprintf>
    return cp.cursor - console;
   44eea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44eee:	48 8d 15 0b 31 07 00 	lea    0x7310b(%rip),%rdx        # b8000 <console>
   44ef5:	48 29 d0             	sub    %rdx,%rax
   44ef8:	48 d1 f8             	sar    %rax
}
   44efb:	c9                   	leave  
   44efc:	c3                   	ret    

0000000000044efd <console_printf>:

int console_printf(int cpos, int color, const char* format, ...) {
   44efd:	f3 0f 1e fa          	endbr64 
   44f01:	55                   	push   %rbp
   44f02:	48 89 e5             	mov    %rsp,%rbp
   44f05:	48 83 ec 60          	sub    $0x60,%rsp
   44f09:	89 7d ac             	mov    %edi,-0x54(%rbp)
   44f0c:	89 75 a8             	mov    %esi,-0x58(%rbp)
   44f0f:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   44f13:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   44f17:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   44f1b:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   44f1f:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   44f26:	48 8d 45 10          	lea    0x10(%rbp),%rax
   44f2a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   44f2e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   44f32:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
   44f36:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   44f3a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   44f3e:	8b 75 a8             	mov    -0x58(%rbp),%esi
   44f41:	8b 45 ac             	mov    -0x54(%rbp),%eax
   44f44:	89 c7                	mov    %eax,%edi
   44f46:	e8 36 ff ff ff       	call   44e81 <console_vprintf>
   44f4b:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   44f4e:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   44f51:	c9                   	leave  
   44f52:	c3                   	ret    

0000000000044f53 <string_putc>:
    printer p;
    char* s;
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
   44f53:	f3 0f 1e fa          	endbr64 
   44f57:	55                   	push   %rbp
   44f58:	48 89 e5             	mov    %rsp,%rbp
   44f5b:	48 83 ec 20          	sub    $0x20,%rsp
   44f5f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   44f63:	89 f0                	mov    %esi,%eax
   44f65:	89 55 e0             	mov    %edx,-0x20(%rbp)
   44f68:	88 45 e4             	mov    %al,-0x1c(%rbp)
    string_printer* sp = (string_printer*) p;
   44f6b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44f6f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (sp->s < sp->end) {
   44f73:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44f77:	48 8b 50 08          	mov    0x8(%rax),%rdx
   44f7b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44f7f:	48 8b 40 10          	mov    0x10(%rax),%rax
   44f83:	48 39 c2             	cmp    %rax,%rdx
   44f86:	73 1a                	jae    44fa2 <string_putc+0x4f>
        *sp->s++ = c;
   44f88:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44f8c:	48 8b 40 08          	mov    0x8(%rax),%rax
   44f90:	48 8d 48 01          	lea    0x1(%rax),%rcx
   44f94:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   44f98:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44f9c:	0f b6 55 e4          	movzbl -0x1c(%rbp),%edx
   44fa0:	88 10                	mov    %dl,(%rax)
    }
    (void) color;
}
   44fa2:	90                   	nop
   44fa3:	c9                   	leave  
   44fa4:	c3                   	ret    

0000000000044fa5 <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
   44fa5:	f3 0f 1e fa          	endbr64 
   44fa9:	55                   	push   %rbp
   44faa:	48 89 e5             	mov    %rsp,%rbp
   44fad:	48 83 ec 40          	sub    $0x40,%rsp
   44fb1:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   44fb5:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   44fb9:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   44fbd:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    string_printer sp;
    sp.p.putc = string_putc;
   44fc1:	48 8d 05 8b ff ff ff 	lea    -0x75(%rip),%rax        # 44f53 <string_putc>
   44fc8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    sp.s = s;
   44fcc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   44fd0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (size) {
   44fd4:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
   44fd9:	74 33                	je     4500e <vsnprintf+0x69>
        sp.end = s + size - 1;
   44fdb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   44fdf:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
   44fe3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   44fe7:	48 01 d0             	add    %rdx,%rax
   44fea:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
   44fee:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   44ff2:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   44ff6:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   44ffa:	be 00 00 00 00       	mov    $0x0,%esi
   44fff:	48 89 c7             	mov    %rax,%rdi
   45002:	e8 7d f3 ff ff       	call   44384 <printer_vprintf>
        *sp.s = 0;
   45007:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4500b:	c6 00 00             	movb   $0x0,(%rax)
    }
    return sp.s - s;
   4500e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   45012:	48 2b 45 d8          	sub    -0x28(%rbp),%rax
}
   45016:	c9                   	leave  
   45017:	c3                   	ret    

0000000000045018 <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
   45018:	f3 0f 1e fa          	endbr64 
   4501c:	55                   	push   %rbp
   4501d:	48 89 e5             	mov    %rsp,%rbp
   45020:	48 83 ec 70          	sub    $0x70,%rsp
   45024:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   45028:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
   4502c:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
   45030:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   45034:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   45038:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   4503c:	c7 45 b0 18 00 00 00 	movl   $0x18,-0x50(%rbp)
   45043:	48 8d 45 10          	lea    0x10(%rbp),%rax
   45047:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   4504b:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4504f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    int n = vsnprintf(s, size, format, val);
   45053:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   45057:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
   4505b:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
   4505f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   45063:	48 89 c7             	mov    %rax,%rdi
   45066:	e8 3a ff ff ff       	call   44fa5 <vsnprintf>
   4506b:	89 45 cc             	mov    %eax,-0x34(%rbp)
    va_end(val);
    return n;
   4506e:	8b 45 cc             	mov    -0x34(%rbp),%eax
}
   45071:	c9                   	leave  
   45072:	c3                   	ret    

0000000000045073 <console_clear>:


// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
   45073:	f3 0f 1e fa          	endbr64 
   45077:	55                   	push   %rbp
   45078:	48 89 e5             	mov    %rsp,%rbp
   4507b:	48 83 ec 10          	sub    $0x10,%rsp
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   4507f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   45086:	eb 1a                	jmp    450a2 <console_clear+0x2f>
        console[i] = ' ' | 0x0700;
   45088:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4508b:	48 98                	cltq   
   4508d:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   45091:	48 8d 05 68 2f 07 00 	lea    0x72f68(%rip),%rax        # b8000 <console>
   45098:	66 c7 04 02 20 07    	movw   $0x720,(%rdx,%rax,1)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   4509e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   450a2:	81 7d fc cf 07 00 00 	cmpl   $0x7cf,-0x4(%rbp)
   450a9:	7e dd                	jle    45088 <console_clear+0x15>
    }
    cursorpos = 0;
   450ab:	c7 05 47 3f 07 00 00 	movl   $0x0,0x73f47(%rip)        # b8ffc <cursorpos>
   450b2:	00 00 00 
}
   450b5:	90                   	nop
   450b6:	c9                   	leave  
   450b7:	c3                   	ret    
