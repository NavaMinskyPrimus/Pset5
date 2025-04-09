
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
   400be:	e8 92 0c 00 00       	call   40d55 <exception>

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
   40177:	e8 f2 27 00 00       	call   4296e <hardware_init>
    pageinfo_init();
   4017c:	e8 6d 1c 00 00       	call   41dee <pageinfo_init>
    console_clear();
   40181:	e8 7f 56 00 00       	call   45805 <console_clear>
    timer_init(HZ);
   40186:	bf 64 00 00 00       	mov    $0x64,%edi
   4018b:	e8 46 2d 00 00       	call   42ed6 <timer_init>

    // Set up process descriptors
    memset(processes, 0, sizeof(processes));
   40190:	ba 00 0e 00 00       	mov    $0xe00,%edx
   40195:	be 00 00 00 00       	mov    $0x0,%esi
   4019a:	48 8d 05 7f 2e 01 00 	lea    0x12e7f(%rip),%rax        # 53020 <processes>
   401a1:	48 89 c7             	mov    %rax,%rdi
   401a4:	e8 a7 46 00 00       	call   44850 <memset>
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
   401c9:	48 8d 15 50 2e 01 00 	lea    0x12e50(%rip),%rdx        # 53020 <processes>
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
   401ed:	48 8d 05 f4 2e 01 00 	lea    0x12ef4(%rip),%rax        # 530e8 <processes+0xc8>
   401f4:	c7 04 02 00 00 00 00 	movl   $0x0,(%rdx,%rax,1)
    for (pid_t i = 0; i < NPROC; i++)
   401fb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   401ff:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   40203:	7e ad                	jle    401b2 <kernel+0x4b>
    }
    // Not sure if the second thing is right, the physical address.
    virtual_memory_map(kernel_pagetable, (uintptr_t)0, (uintptr_t)0, PROC_START_ADDR, PTE_P | PTE_W);
   40205:	48 8b 05 f4 5d 01 00 	mov    0x15df4(%rip),%rax        # 56000 <kernel_pagetable>
   4020c:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   40212:	b9 00 00 10 00       	mov    $0x100000,%ecx
   40217:	ba 00 00 00 00       	mov    $0x0,%edx
   4021c:	be 00 00 00 00       	mov    $0x0,%esi
   40221:	48 89 c7             	mov    %rax,%rdi
   40224:	e8 1a 3b 00 00       	call   43d43 <virtual_memory_map>
    virtual_memory_map(kernel_pagetable, (uintptr_t)CONSOLE_ADDR, (uintptr_t)CONSOLE_ADDR, PAGESIZE, PTE_P | PTE_W | PTE_U);
   40229:	48 8d 15 d0 7d 07 00 	lea    0x77dd0(%rip),%rdx        # b8000 <console>
   40230:	48 8d 35 c9 7d 07 00 	lea    0x77dc9(%rip),%rsi        # b8000 <console>
   40237:	48 8b 05 c2 5d 01 00 	mov    0x15dc2(%rip),%rax        # 56000 <kernel_pagetable>
   4023e:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40244:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40249:	48 89 c7             	mov    %rax,%rdi
   4024c:	e8 f2 3a 00 00       	call   43d43 <virtual_memory_map>
    if (command && strcmp(command, "fork") == 0)
   40251:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40256:	74 2e                	je     40286 <kernel+0x11f>
   40258:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4025c:	48 8d 15 fd 55 00 00 	lea    0x55fd(%rip),%rdx        # 45860 <console_clear+0x5b>
   40263:	48 89 d6             	mov    %rdx,%rsi
   40266:	48 89 c7             	mov    %rax,%rdi
   40269:	e8 eb 46 00 00       	call   44959 <strcmp>
   4026e:	85 c0                	test   %eax,%eax
   40270:	75 14                	jne    40286 <kernel+0x11f>
    {
        process_setup(1, 4);
   40272:	be 04 00 00 00       	mov    $0x4,%esi
   40277:	bf 01 00 00 00       	mov    $0x1,%edi
   4027c:	e8 b6 03 00 00       	call   40637 <process_setup>
   40281:	e9 d1 00 00 00       	jmp    40357 <kernel+0x1f0>
    }
    else if (command && strcmp(command, "forkexit") == 0)
   40286:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   4028b:	74 2e                	je     402bb <kernel+0x154>
   4028d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40291:	48 8d 15 cd 55 00 00 	lea    0x55cd(%rip),%rdx        # 45865 <console_clear+0x60>
   40298:	48 89 d6             	mov    %rdx,%rsi
   4029b:	48 89 c7             	mov    %rax,%rdi
   4029e:	e8 b6 46 00 00       	call   44959 <strcmp>
   402a3:	85 c0                	test   %eax,%eax
   402a5:	75 14                	jne    402bb <kernel+0x154>
    {
        process_setup(1, 5);
   402a7:	be 05 00 00 00       	mov    $0x5,%esi
   402ac:	bf 01 00 00 00       	mov    $0x1,%edi
   402b1:	e8 81 03 00 00       	call   40637 <process_setup>
   402b6:	e9 9c 00 00 00       	jmp    40357 <kernel+0x1f0>
    }
    else if (command && strcmp(command, "test") == 0)
   402bb:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402c0:	74 2b                	je     402ed <kernel+0x186>
   402c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402c6:	48 8d 15 a1 55 00 00 	lea    0x55a1(%rip),%rdx        # 4586e <console_clear+0x69>
   402cd:	48 89 d6             	mov    %rdx,%rsi
   402d0:	48 89 c7             	mov    %rax,%rdi
   402d3:	e8 81 46 00 00       	call   44959 <strcmp>
   402d8:	85 c0                	test   %eax,%eax
   402da:	75 11                	jne    402ed <kernel+0x186>
    {
        process_setup(1, 6);
   402dc:	be 06 00 00 00       	mov    $0x6,%esi
   402e1:	bf 01 00 00 00       	mov    $0x1,%edi
   402e6:	e8 4c 03 00 00       	call   40637 <process_setup>
   402eb:	eb 6a                	jmp    40357 <kernel+0x1f0>
    }
    else if (command && strcmp(command, "test2") == 0)
   402ed:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402f2:	74 3e                	je     40332 <kernel+0x1cb>
   402f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402f8:	48 8d 15 74 55 00 00 	lea    0x5574(%rip),%rdx        # 45873 <console_clear+0x6e>
   402ff:	48 89 d6             	mov    %rdx,%rsi
   40302:	48 89 c7             	mov    %rax,%rdi
   40305:	e8 4f 46 00 00       	call   44959 <strcmp>
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
   40321:	e8 11 03 00 00       	call   40637 <process_setup>
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
   40348:	e8 ea 02 00 00       	call   40637 <process_setup>
        for (pid_t i = 1; i <= 4; ++i)
   4034d:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   40351:	83 7d f4 04          	cmpl   $0x4,-0xc(%rbp)
   40355:	7e e4                	jle    4033b <kernel+0x1d4>
        }
    }

    // Switch to the first process using run()
    run(&processes[1]);
   40357:	48 8d 05 a2 2d 01 00 	lea    0x12da2(%rip),%rax        # 53100 <processes+0xe0>
   4035e:	48 89 c7             	mov    %rax,%rdi
   40361:	e8 1d 1a 00 00       	call   41d83 <run>

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
   40384:	48 8d 05 b6 3a 01 00 	lea    0x13ab6(%rip),%rax        # 53e41 <pageinfo+0x1>
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
   403d6:	48 8d 05 64 3a 01 00 	lea    0x13a64(%rip),%rax        # 53e41 <pageinfo+0x1>
   403dd:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   403e1:	83 c0 01             	add    $0x1,%eax
   403e4:	89 c1                	mov    %eax,%ecx
   403e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
   403e9:	48 98                	cltq   
   403eb:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   403ef:	48 8d 05 4b 3a 01 00 	lea    0x13a4b(%rip),%rax        # 53e41 <pageinfo+0x1>
   403f6:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
    pageinfo[pn].owner = owner;
   403f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
   403fc:	48 98                	cltq   
   403fe:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   40402:	48 8d 15 37 3a 01 00 	lea    0x13a37(%rip),%rdx        # 53e40 <pageinfo>
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
   40433:	48 8d 05 07 3a 01 00 	lea    0x13a07(%rip),%rax        # 53e41 <pageinfo+0x1>
   4043a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4043e:	83 e8 01             	sub    $0x1,%eax
   40441:	89 c1                	mov    %eax,%ecx
   40443:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40446:	48 98                	cltq   
   40448:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4044c:	48 8d 05 ee 39 01 00 	lea    0x139ee(%rip),%rax        # 53e41 <pageinfo+0x1>
   40453:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
    if (pageinfo[pn].refcount == 0)
   40456:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40459:	48 98                	cltq   
   4045b:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4045f:	48 8d 05 db 39 01 00 	lea    0x139db(%rip),%rax        # 53e41 <pageinfo+0x1>
   40466:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4046a:	84 c0                	test   %al,%al
   4046c:	75 16                	jne    40484 <freepage+0x69>
    {
        pageinfo[pn].owner = PO_FREE;
   4046e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40471:	48 98                	cltq   
   40473:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40477:	48 8d 05 c2 39 01 00 	lea    0x139c2(%rip),%rax        # 53e40 <pageinfo>
   4047e:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
        if (pageinfo[pn].owner == current->p_pid)
        {
            pageinfo[pn].owner = PO_KERNEL;
        }
    }
}
   40482:	eb 38                	jmp    404bc <freepage+0xa1>
        if (pageinfo[pn].owner == current->p_pid)
   40484:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40487:	48 98                	cltq   
   40489:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4048d:	48 8d 05 ac 39 01 00 	lea    0x139ac(%rip),%rax        # 53e40 <pageinfo>
   40494:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   40498:	0f be d0             	movsbl %al,%edx
   4049b:	48 8b 05 5e 2b 01 00 	mov    0x12b5e(%rip),%rax        # 53000 <current>
   404a2:	8b 00                	mov    (%rax),%eax
   404a4:	39 c2                	cmp    %eax,%edx
   404a6:	75 14                	jne    404bc <freepage+0xa1>
            pageinfo[pn].owner = PO_KERNEL;
   404a8:	8b 45 fc             	mov    -0x4(%rbp),%eax
   404ab:	48 98                	cltq   
   404ad:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   404b1:	48 8d 05 88 39 01 00 	lea    0x13988(%rip),%rax        # 53e40 <pageinfo>
   404b8:	c6 04 02 fe          	movb   $0xfe,(%rdx,%rax,1)
}
   404bc:	90                   	nop
   404bd:	c9                   	leave  
   404be:	c3                   	ret    

00000000000404bf <cleanupMemVirtual>:

void cleanupMemVirtual(x86_64_pagetable *pagetable)
{
   404bf:	f3 0f 1e fa          	endbr64 
   404c3:	55                   	push   %rbp
   404c4:	48 89 e5             	mov    %rsp,%rbp
   404c7:	48 83 ec 40          	sub    $0x40,%rsp
   404cb:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    for (uintptr_t removeaddr = PROC_START_ADDR; removeaddr < MEMSIZE_VIRTUAL; removeaddr += PAGESIZE)
   404cf:	48 c7 45 f8 00 00 10 	movq   $0x100000,-0x8(%rbp)
   404d6:	00 
   404d7:	e9 49 01 00 00       	jmp    40625 <cleanupMemVirtual+0x166>
    {
        vamapping vam = virtual_memory_lookup(pagetable, removeaddr);
   404dc:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
   404e0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   404e4:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   404e8:	48 89 ce             	mov    %rcx,%rsi
   404eb:	48 89 c7             	mov    %rax,%rdi
   404ee:	e8 94 3c 00 00       	call   44187 <virtual_memory_lookup>

        // If this page is owned by the process and has valid mapping
        if (vam.pn >= 0 && vam.perm & PTE_P)
   404f3:	8b 45 d8             	mov    -0x28(%rbp),%eax
   404f6:	85 c0                	test   %eax,%eax
   404f8:	0f 88 1f 01 00 00    	js     4061d <cleanupMemVirtual+0x15e>
   404fe:	8b 45 e8             	mov    -0x18(%rbp),%eax
   40501:	48 98                	cltq   
   40503:	83 e0 01             	and    $0x1,%eax
   40506:	48 85 c0             	test   %rax,%rax
   40509:	0f 84 0e 01 00 00    	je     4061d <cleanupMemVirtual+0x15e>
        {
            // Decrement reference count
            pageinfo[vam.pn].refcount -= 1;
   4050f:	8b 45 d8             	mov    -0x28(%rbp),%eax
   40512:	48 98                	cltq   
   40514:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40518:	48 8d 05 22 39 01 00 	lea    0x13922(%rip),%rax        # 53e41 <pageinfo+0x1>
   4051f:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   40523:	8d 50 ff             	lea    -0x1(%rax),%edx
   40526:	8b 45 d8             	mov    -0x28(%rbp),%eax
   40529:	89 d1                	mov    %edx,%ecx
   4052b:	48 98                	cltq   
   4052d:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40531:	48 8d 05 09 39 01 00 	lea    0x13909(%rip),%rax        # 53e41 <pageinfo+0x1>
   40538:	88 0c 02             	mov    %cl,(%rdx,%rax,1)

            // If reference count reaches 0, mark the page as free
            if (pageinfo[vam.pn].refcount == 0)
   4053b:	8b 45 d8             	mov    -0x28(%rbp),%eax
   4053e:	48 98                	cltq   
   40540:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40544:	48 8d 05 f6 38 01 00 	lea    0x138f6(%rip),%rax        # 53e41 <pageinfo+0x1>
   4054b:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4054f:	84 c0                	test   %al,%al
   40551:	75 19                	jne    4056c <cleanupMemVirtual+0xad>
            {
                pageinfo[vam.pn].owner = PO_FREE;
   40553:	8b 45 d8             	mov    -0x28(%rbp),%eax
   40556:	48 98                	cltq   
   40558:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4055c:	48 8d 05 dd 38 01 00 	lea    0x138dd(%rip),%rax        # 53e40 <pageinfo>
   40563:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
   40567:	e9 b1 00 00 00       	jmp    4061d <cleanupMemVirtual+0x15e>
            }
            else if (pageinfo[vam.pn].owner == current->p_pid)
   4056c:	8b 45 d8             	mov    -0x28(%rbp),%eax
   4056f:	48 98                	cltq   
   40571:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40575:	48 8d 05 c4 38 01 00 	lea    0x138c4(%rip),%rax        # 53e40 <pageinfo>
   4057c:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   40580:	0f be d0             	movsbl %al,%edx
   40583:	48 8b 05 76 2a 01 00 	mov    0x12a76(%rip),%rax        # 53000 <current>
   4058a:	8b 00                	mov    (%rax),%eax
   4058c:	39 c2                	cmp    %eax,%edx
   4058e:	0f 85 89 00 00 00    	jne    4061d <cleanupMemVirtual+0x15e>
            {
                int new_owner = -1;
   40594:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%rbp)
                for (int i = 1; i < NPROC; i++)
   4059b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%rbp)
   405a2:	eb 3f                	jmp    405e3 <cleanupMemVirtual+0x124>
                {
                    if (i != current->p_pid && processes[i].p_state != P_FREE)
   405a4:	48 8b 05 55 2a 01 00 	mov    0x12a55(%rip),%rax        # 53000 <current>
   405ab:	8b 00                	mov    (%rax),%eax
   405ad:	39 45 f0             	cmp    %eax,-0x10(%rbp)
   405b0:	74 2d                	je     405df <cleanupMemVirtual+0x120>
   405b2:	8b 45 f0             	mov    -0x10(%rbp),%eax
   405b5:	48 63 d0             	movslq %eax,%rdx
   405b8:	48 89 d0             	mov    %rdx,%rax
   405bb:	48 c1 e0 03          	shl    $0x3,%rax
   405bf:	48 29 d0             	sub    %rdx,%rax
   405c2:	48 c1 e0 05          	shl    $0x5,%rax
   405c6:	48 89 c2             	mov    %rax,%rdx
   405c9:	48 8d 05 18 2b 01 00 	lea    0x12b18(%rip),%rax        # 530e8 <processes+0xc8>
   405d0:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   405d3:	85 c0                	test   %eax,%eax
   405d5:	74 08                	je     405df <cleanupMemVirtual+0x120>
                    {
                        new_owner = i;
   405d7:	8b 45 f0             	mov    -0x10(%rbp),%eax
   405da:	89 45 f4             	mov    %eax,-0xc(%rbp)
                        break;
   405dd:	eb 0a                	jmp    405e9 <cleanupMemVirtual+0x12a>
                for (int i = 1; i < NPROC; i++)
   405df:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
   405e3:	83 7d f0 0f          	cmpl   $0xf,-0x10(%rbp)
   405e7:	7e bb                	jle    405a4 <cleanupMemVirtual+0xe5>
                    }
                }
                
                if (new_owner != -1)
   405e9:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%rbp)
   405ed:	74 1a                	je     40609 <cleanupMemVirtual+0x14a>
                {
                    pageinfo[vam.pn].owner = new_owner;
   405ef:	8b 45 d8             	mov    -0x28(%rbp),%eax
   405f2:	8b 55 f4             	mov    -0xc(%rbp),%edx
   405f5:	89 d1                	mov    %edx,%ecx
   405f7:	48 98                	cltq   
   405f9:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   405fd:	48 8d 05 3c 38 01 00 	lea    0x1383c(%rip),%rax        # 53e40 <pageinfo>
   40604:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
   40607:	eb 14                	jmp    4061d <cleanupMemVirtual+0x15e>
                }
                else
                {
                    pageinfo[vam.pn].owner = PO_KERNEL;
   40609:	8b 45 d8             	mov    -0x28(%rbp),%eax
   4060c:	48 98                	cltq   
   4060e:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40612:	48 8d 05 27 38 01 00 	lea    0x13827(%rip),%rax        # 53e40 <pageinfo>
   40619:	c6 04 02 fe          	movb   $0xfe,(%rdx,%rax,1)
    for (uintptr_t removeaddr = PROC_START_ADDR; removeaddr < MEMSIZE_VIRTUAL; removeaddr += PAGESIZE)
   4061d:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40624:	00 
   40625:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   4062c:	00 
   4062d:	0f 86 a9 fe ff ff    	jbe    404dc <cleanupMemVirtual+0x1d>
                }
            }
        }
    }
}
   40633:	90                   	nop
   40634:	90                   	nop
   40635:	c9                   	leave  
   40636:	c3                   	ret    

0000000000040637 <process_setup>:
//    Load application program `program_number` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

void process_setup(pid_t pid, int program_number)
{
   40637:	f3 0f 1e fa          	endbr64 
   4063b:	55                   	push   %rbp
   4063c:	48 89 e5             	mov    %rsp,%rbp
   4063f:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
   40646:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
   4064c:	89 b5 68 ff ff ff    	mov    %esi,-0x98(%rbp)
    process_init(&processes[pid], 0);
   40652:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   40658:	48 63 d0             	movslq %eax,%rdx
   4065b:	48 89 d0             	mov    %rdx,%rax
   4065e:	48 c1 e0 03          	shl    $0x3,%rax
   40662:	48 29 d0             	sub    %rdx,%rax
   40665:	48 c1 e0 05          	shl    $0x5,%rax
   40669:	48 8d 15 b0 29 01 00 	lea    0x129b0(%rip),%rdx        # 53020 <processes>
   40670:	48 01 d0             	add    %rdx,%rax
   40673:	be 00 00 00 00       	mov    $0x0,%esi
   40678:	48 89 c7             	mov    %rax,%rdi
   4067b:	e8 09 2b 00 00       	call   43189 <process_init>

    int pt4num = find_free_page();
   40680:	b8 00 00 00 00       	mov    $0x0,%eax
   40685:	e8 dc fc ff ff       	call   40366 <find_free_page>
   4068a:	89 45 f0             	mov    %eax,-0x10(%rbp)
    if (pt4num == -1)
   4068d:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
   40691:	0f 84 6c 04 00 00    	je     40b03 <process_setup+0x4cc>
    {
        //panic("No more physical pages\n"); // figure this out later
        return;
    }
    x86_64_pagetable *pt_L4 = numtopagetable(pt4num, pid);
   40697:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   4069d:	0f be d0             	movsbl %al,%edx
   406a0:	8b 45 f0             	mov    -0x10(%rbp),%eax
   406a3:	89 d6                	mov    %edx,%esi
   406a5:	89 c7                	mov    %eax,%edi
   406a7:	e8 00 fd ff ff       	call   403ac <numtopagetable>
   406ac:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    int pt3num = find_free_page();
   406b0:	b8 00 00 00 00       	mov    $0x0,%eax
   406b5:	e8 ac fc ff ff       	call   40366 <find_free_page>
   406ba:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (pt3num == -1)
   406bd:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%rbp)
   406c1:	75 0f                	jne    406d2 <process_setup+0x9b>
    {
        freepage(pt4num);
   406c3:	8b 45 f0             	mov    -0x10(%rbp),%eax
   406c6:	89 c7                	mov    %eax,%edi
   406c8:	e8 4e fd ff ff       	call   4041b <freepage>
        //panic("No more physical pages\n");
        return;
   406cd:	e9 32 04 00 00       	jmp    40b04 <process_setup+0x4cd>
    }
    x86_64_pagetable *pt_L3 = numtopagetable(pt3num, pid);
   406d2:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   406d8:	0f be d0             	movsbl %al,%edx
   406db:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   406de:	89 d6                	mov    %edx,%esi
   406e0:	89 c7                	mov    %eax,%edi
   406e2:	e8 c5 fc ff ff       	call   403ac <numtopagetable>
   406e7:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    int pt2num = find_free_page();
   406eb:	b8 00 00 00 00       	mov    $0x0,%eax
   406f0:	e8 71 fc ff ff       	call   40366 <find_free_page>
   406f5:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    if (pt2num == -1)
   406f8:	83 7d d4 ff          	cmpl   $0xffffffff,-0x2c(%rbp)
   406fc:	75 19                	jne    40717 <process_setup+0xe0>
    {
        freepage(pt4num);
   406fe:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40701:	89 c7                	mov    %eax,%edi
   40703:	e8 13 fd ff ff       	call   4041b <freepage>
        freepage(pt3num);
   40708:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   4070b:	89 c7                	mov    %eax,%edi
   4070d:	e8 09 fd ff ff       	call   4041b <freepage>
        //panic("No more physical pages\n");
        return;
   40712:	e9 ed 03 00 00       	jmp    40b04 <process_setup+0x4cd>
    }
    x86_64_pagetable *pt_L2 = numtopagetable(pt2num, pid);
   40717:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   4071d:	0f be d0             	movsbl %al,%edx
   40720:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   40723:	89 d6                	mov    %edx,%esi
   40725:	89 c7                	mov    %eax,%edi
   40727:	e8 80 fc ff ff       	call   403ac <numtopagetable>
   4072c:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int pt1_0num = find_free_page();
   40730:	b8 00 00 00 00       	mov    $0x0,%eax
   40735:	e8 2c fc ff ff       	call   40366 <find_free_page>
   4073a:	89 45 c4             	mov    %eax,-0x3c(%rbp)
    if (pt1_0num == -1)
   4073d:	83 7d c4 ff          	cmpl   $0xffffffff,-0x3c(%rbp)
   40741:	75 23                	jne    40766 <process_setup+0x12f>
    {
        freepage(pt4num);
   40743:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40746:	89 c7                	mov    %eax,%edi
   40748:	e8 ce fc ff ff       	call   4041b <freepage>
        freepage(pt3num);
   4074d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40750:	89 c7                	mov    %eax,%edi
   40752:	e8 c4 fc ff ff       	call   4041b <freepage>
        freepage(pt2num);
   40757:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   4075a:	89 c7                	mov    %eax,%edi
   4075c:	e8 ba fc ff ff       	call   4041b <freepage>
       // panic("No more physical pages\n");
        return;
   40761:	e9 9e 03 00 00       	jmp    40b04 <process_setup+0x4cd>
    }
    x86_64_pagetable *pt_L1_0 = numtopagetable(pt1_0num, pid);
   40766:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   4076c:	0f be d0             	movsbl %al,%edx
   4076f:	8b 45 c4             	mov    -0x3c(%rbp),%eax
   40772:	89 d6                	mov    %edx,%esi
   40774:	89 c7                	mov    %eax,%edi
   40776:	e8 31 fc ff ff       	call   403ac <numtopagetable>
   4077b:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    int pt1_1num = find_free_page();
   4077f:	b8 00 00 00 00       	mov    $0x0,%eax
   40784:	e8 dd fb ff ff       	call   40366 <find_free_page>
   40789:	89 45 b4             	mov    %eax,-0x4c(%rbp)
    if (pt1_1num == -1)
   4078c:	83 7d b4 ff          	cmpl   $0xffffffff,-0x4c(%rbp)
   40790:	75 2d                	jne    407bf <process_setup+0x188>
    {
        freepage(pt4num);
   40792:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40795:	89 c7                	mov    %eax,%edi
   40797:	e8 7f fc ff ff       	call   4041b <freepage>
        freepage(pt3num);
   4079c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   4079f:	89 c7                	mov    %eax,%edi
   407a1:	e8 75 fc ff ff       	call   4041b <freepage>
        freepage(pt2num);
   407a6:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   407a9:	89 c7                	mov    %eax,%edi
   407ab:	e8 6b fc ff ff       	call   4041b <freepage>
        freepage(pt1_0num);
   407b0:	8b 45 c4             	mov    -0x3c(%rbp),%eax
   407b3:	89 c7                	mov    %eax,%edi
   407b5:	e8 61 fc ff ff       	call   4041b <freepage>
        //panic("No more physical pages\n");
        return;
   407ba:	e9 45 03 00 00       	jmp    40b04 <process_setup+0x4cd>
    }
    x86_64_pagetable *pt_L1_1 = numtopagetable(pt1_1num, pid);
   407bf:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   407c5:	0f be d0             	movsbl %al,%edx
   407c8:	8b 45 b4             	mov    -0x4c(%rbp),%eax
   407cb:	89 d6                	mov    %edx,%esi
   407cd:	89 c7                	mov    %eax,%edi
   407cf:	e8 d8 fb ff ff       	call   403ac <numtopagetable>
   407d4:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    // set the pages to zero
    memset(pt_L4, 0, PAGESIZE);
   407d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   407dc:	ba 00 10 00 00       	mov    $0x1000,%edx
   407e1:	be 00 00 00 00       	mov    $0x0,%esi
   407e6:	48 89 c7             	mov    %rax,%rdi
   407e9:	e8 62 40 00 00       	call   44850 <memset>
    memset(pt_L3, 0, PAGESIZE);
   407ee:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   407f2:	ba 00 10 00 00       	mov    $0x1000,%edx
   407f7:	be 00 00 00 00       	mov    $0x0,%esi
   407fc:	48 89 c7             	mov    %rax,%rdi
   407ff:	e8 4c 40 00 00       	call   44850 <memset>
    memset(pt_L2, 0, PAGESIZE);
   40804:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40808:	ba 00 10 00 00       	mov    $0x1000,%edx
   4080d:	be 00 00 00 00       	mov    $0x0,%esi
   40812:	48 89 c7             	mov    %rax,%rdi
   40815:	e8 36 40 00 00       	call   44850 <memset>
    memset(pt_L1_0, 0, PAGESIZE);
   4081a:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4081e:	ba 00 10 00 00       	mov    $0x1000,%edx
   40823:	be 00 00 00 00       	mov    $0x0,%esi
   40828:	48 89 c7             	mov    %rax,%rdi
   4082b:	e8 20 40 00 00       	call   44850 <memset>
    memset(pt_L1_1, 0, PAGESIZE);
   40830:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   40834:	ba 00 10 00 00       	mov    $0x1000,%edx
   40839:	be 00 00 00 00       	mov    $0x0,%esi
   4083e:	48 89 c7             	mov    %rax,%rdi
   40841:	e8 0a 40 00 00       	call   44850 <memset>

    // Link the page tables together. Did I do this right?
    pt_L4->entry[0] = (x86_64_pageentry_t)pt_L3 | PTE_P | PTE_W | PTE_U;
   40846:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4084a:	48 83 c8 07          	or     $0x7,%rax
   4084e:	48 89 c2             	mov    %rax,%rdx
   40851:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40855:	48 89 10             	mov    %rdx,(%rax)
    pt_L3->entry[0] = (x86_64_pageentry_t)pt_L2 | PTE_P | PTE_W | PTE_U;
   40858:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4085c:	48 83 c8 07          	or     $0x7,%rax
   40860:	48 89 c2             	mov    %rax,%rdx
   40863:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40867:	48 89 10             	mov    %rdx,(%rax)
    pt_L2->entry[0] = (x86_64_pageentry_t)pt_L1_0 | PTE_P | PTE_W | PTE_U;
   4086a:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4086e:	48 83 c8 07          	or     $0x7,%rax
   40872:	48 89 c2             	mov    %rax,%rdx
   40875:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40879:	48 89 10             	mov    %rdx,(%rax)
    pt_L2->entry[1] = (x86_64_pageentry_t)pt_L1_1 | PTE_P | PTE_W | PTE_U;
   4087c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   40880:	48 83 c8 07          	or     $0x7,%rax
   40884:	48 89 c2             	mov    %rax,%rdx
   40887:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4088b:	48 89 50 08          	mov    %rdx,0x8(%rax)

    // Copy kernel mappings (for addresses below PROC_START_ADDR)
    for (uintptr_t addr = 0; addr < PROC_START_ADDR; addr += PAGESIZE)
   4088f:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   40896:	00 
   40897:	eb 6b                	jmp    40904 <process_setup+0x2cd>
    {                                                                   // we're gonna go page by page I think
        vamapping vmap = virtual_memory_lookup(kernel_pagetable, addr); // get the pagetable page of addr in the kernel
   40899:	48 8b 0d 60 57 01 00 	mov    0x15760(%rip),%rcx        # 56000 <kernel_pagetable>
   408a0:	48 8d 85 78 ff ff ff 	lea    -0x88(%rbp),%rax
   408a7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   408ab:	48 89 ce             	mov    %rcx,%rsi
   408ae:	48 89 c7             	mov    %rax,%rdi
   408b1:	e8 d1 38 00 00       	call   44187 <virtual_memory_lookup>
        if (vmap.pn >= 0)
   408b6:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
   408bc:	85 c0                	test   %eax,%eax
   408be:	78 3c                	js     408fc <process_setup+0x2c5>
        {
            // Copy the mapping, but ensure the console is user-accessible
            int perm = vmap.perm;
   408c0:	8b 45 88             	mov    -0x78(%rbp),%eax
   408c3:	89 45 f4             	mov    %eax,-0xc(%rbp)
            if (addr == CONSOLE_ADDR)
   408c6:	48 8d 05 33 77 07 00 	lea    0x77733(%rip),%rax        # b8000 <console>
   408cd:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   408d1:	75 06                	jne    408d9 <process_setup+0x2a2>
            {
                perm |= PTE_U; // Make console user-accessible
   408d3:	83 4d f4 04          	orl    $0x4,-0xc(%rbp)
   408d7:	eb 04                	jmp    408dd <process_setup+0x2a6>
            }
            else
            {
                perm &= ~PTE_U; // Make sure kernel memory is not user-accessible
   408d9:	83 65 f4 fb          	andl   $0xfffffffb,-0xc(%rbp)
            }
            virtual_memory_map(pt_L4, addr, vmap.pa, PAGESIZE, perm);
   408dd:	48 8b 55 80          	mov    -0x80(%rbp),%rdx
   408e1:	8b 4d f4             	mov    -0xc(%rbp),%ecx
   408e4:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   408e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   408ec:	41 89 c8             	mov    %ecx,%r8d
   408ef:	b9 00 10 00 00       	mov    $0x1000,%ecx
   408f4:	48 89 c7             	mov    %rax,%rdi
   408f7:	e8 47 34 00 00       	call   43d43 <virtual_memory_map>
    for (uintptr_t addr = 0; addr < PROC_START_ADDR; addr += PAGESIZE)
   408fc:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40903:	00 
   40904:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   4090b:	00 
   4090c:	76 8b                	jbe    40899 <process_setup+0x262>
        }
    }

    processes[pid].p_pagetable = pt_L4;
   4090e:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   40914:	48 63 d0             	movslq %eax,%rdx
   40917:	48 89 d0             	mov    %rdx,%rax
   4091a:	48 c1 e0 03          	shl    $0x3,%rax
   4091e:	48 29 d0             	sub    %rdx,%rax
   40921:	48 c1 e0 05          	shl    $0x5,%rax
   40925:	48 89 c1             	mov    %rax,%rcx
   40928:	48 8d 15 c1 27 01 00 	lea    0x127c1(%rip),%rdx        # 530f0 <processes+0xd0>
   4092f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40933:	48 89 04 11          	mov    %rax,(%rcx,%rdx,1)

    int r = program_load(&processes[pid], program_number, NULL);
   40937:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   4093d:	48 63 d0             	movslq %eax,%rdx
   40940:	48 89 d0             	mov    %rdx,%rax
   40943:	48 c1 e0 03          	shl    $0x3,%rax
   40947:	48 29 d0             	sub    %rdx,%rax
   4094a:	48 c1 e0 05          	shl    $0x5,%rax
   4094e:	48 8d 15 cb 26 01 00 	lea    0x126cb(%rip),%rdx        # 53020 <processes>
   40955:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
   40959:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
   4095f:	ba 00 00 00 00       	mov    $0x0,%edx
   40964:	89 c6                	mov    %eax,%esi
   40966:	48 89 cf             	mov    %rcx,%rdi
   40969:	e8 14 39 00 00       	call   44282 <program_load>
   4096e:	89 45 a4             	mov    %eax,-0x5c(%rbp)
    assert(r >= 0);
   40971:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
   40975:	79 1e                	jns    40995 <process_setup+0x35e>
   40977:	48 8d 05 fb 4e 00 00 	lea    0x4efb(%rip),%rax        # 45879 <console_clear+0x74>
   4097e:	48 89 c2             	mov    %rax,%rdx
   40981:	be 2c 01 00 00       	mov    $0x12c,%esi
   40986:	48 8d 05 f3 4e 00 00 	lea    0x4ef3(%rip),%rax        # 45880 <console_clear+0x7b>
   4098d:	48 89 c7             	mov    %rax,%rdi
   40990:	e8 2a 30 00 00       	call   439bf <assert_fail>

    processes[pid].p_registers.reg_rsp = MEMSIZE_VIRTUAL;
   40995:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   4099b:	48 63 d0             	movslq %eax,%rdx
   4099e:	48 89 d0             	mov    %rdx,%rax
   409a1:	48 c1 e0 03          	shl    $0x3,%rax
   409a5:	48 29 d0             	sub    %rdx,%rax
   409a8:	48 c1 e0 05          	shl    $0x5,%rax
   409ac:	48 89 c2             	mov    %rax,%rdx
   409af:	48 8d 05 22 27 01 00 	lea    0x12722(%rip),%rax        # 530d8 <processes+0xb8>
   409b6:	48 c7 04 02 00 00 30 	movq   $0x300000,(%rdx,%rax,1)
   409bd:	00 
    int physpage = find_free_page();
   409be:	b8 00 00 00 00       	mov    $0x0,%eax
   409c3:	e8 9e f9 ff ff       	call   40366 <find_free_page>
   409c8:	89 45 a0             	mov    %eax,-0x60(%rbp)
    if (physpage == -1)
   409cb:	83 7d a0 ff          	cmpl   $0xffffffff,-0x60(%rbp)
   409cf:	75 37                	jne    40a08 <process_setup+0x3d1>
    {
        freepage(pt4num);
   409d1:	8b 45 f0             	mov    -0x10(%rbp),%eax
   409d4:	89 c7                	mov    %eax,%edi
   409d6:	e8 40 fa ff ff       	call   4041b <freepage>
        freepage(pt3num);
   409db:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   409de:	89 c7                	mov    %eax,%edi
   409e0:	e8 36 fa ff ff       	call   4041b <freepage>
        freepage(pt2num);
   409e5:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   409e8:	89 c7                	mov    %eax,%edi
   409ea:	e8 2c fa ff ff       	call   4041b <freepage>
        freepage(pt1_0num);
   409ef:	8b 45 c4             	mov    -0x3c(%rbp),%eax
   409f2:	89 c7                	mov    %eax,%edi
   409f4:	e8 22 fa ff ff       	call   4041b <freepage>
        freepage(pt1_1num);
   409f9:	8b 45 b4             	mov    -0x4c(%rbp),%eax
   409fc:	89 c7                	mov    %eax,%edi
   409fe:	e8 18 fa ff ff       	call   4041b <freepage>
        //panic("No more physical pages\n");
        return;
   40a03:	e9 fc 00 00 00       	jmp    40b04 <process_setup+0x4cd>
    }
    uintptr_t stack_page = processes[pid].p_registers.reg_rsp - PAGESIZE;
   40a08:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   40a0e:	48 63 d0             	movslq %eax,%rdx
   40a11:	48 89 d0             	mov    %rdx,%rax
   40a14:	48 c1 e0 03          	shl    $0x3,%rax
   40a18:	48 29 d0             	sub    %rdx,%rax
   40a1b:	48 c1 e0 05          	shl    $0x5,%rax
   40a1f:	48 89 c2             	mov    %rax,%rdx
   40a22:	48 8d 05 af 26 01 00 	lea    0x126af(%rip),%rax        # 530d8 <processes+0xb8>
   40a29:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   40a2d:	48 2d 00 10 00 00    	sub    $0x1000,%rax
   40a33:	48 89 45 98          	mov    %rax,-0x68(%rbp)
    int val = assign_physical_page(PAGEADDRESS(physpage), pid);
   40a37:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   40a3d:	0f be c0             	movsbl %al,%eax
   40a40:	8b 55 a0             	mov    -0x60(%rbp),%edx
   40a43:	48 63 d2             	movslq %edx,%rdx
   40a46:	48 c1 e2 0c          	shl    $0xc,%rdx
   40a4a:	89 c6                	mov    %eax,%esi
   40a4c:	48 89 d7             	mov    %rdx,%rdi
   40a4f:	e8 b2 00 00 00       	call   40b06 <assign_physical_page>
   40a54:	89 45 94             	mov    %eax,-0x6c(%rbp)
    if (val == -1)
   40a57:	83 7d 94 ff          	cmpl   $0xffffffff,-0x6c(%rbp)
   40a5b:	75 34                	jne    40a91 <process_setup+0x45a>
    {
        freepage(pt4num);
   40a5d:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40a60:	89 c7                	mov    %eax,%edi
   40a62:	e8 b4 f9 ff ff       	call   4041b <freepage>
        freepage(pt3num);
   40a67:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40a6a:	89 c7                	mov    %eax,%edi
   40a6c:	e8 aa f9 ff ff       	call   4041b <freepage>
        freepage(pt2num);
   40a71:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   40a74:	89 c7                	mov    %eax,%edi
   40a76:	e8 a0 f9 ff ff       	call   4041b <freepage>
        freepage(pt1_0num);
   40a7b:	8b 45 c4             	mov    -0x3c(%rbp),%eax
   40a7e:	89 c7                	mov    %eax,%edi
   40a80:	e8 96 f9 ff ff       	call   4041b <freepage>
        freepage(pt1_1num);
   40a85:	8b 45 b4             	mov    -0x4c(%rbp),%eax
   40a88:	89 c7                	mov    %eax,%edi
   40a8a:	e8 8c f9 ff ff       	call   4041b <freepage>
        //panic("no idea");
        return;
   40a8f:	eb 73                	jmp    40b04 <process_setup+0x4cd>
    }
    virtual_memory_map(processes[pid].p_pagetable, stack_page, PAGEADDRESS(physpage), PAGESIZE, PTE_P | PTE_W | PTE_U);
   40a91:	8b 45 a0             	mov    -0x60(%rbp),%eax
   40a94:	48 98                	cltq   
   40a96:	48 c1 e0 0c          	shl    $0xc,%rax
   40a9a:	48 89 c2             	mov    %rax,%rdx
   40a9d:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   40aa3:	48 63 c8             	movslq %eax,%rcx
   40aa6:	48 89 c8             	mov    %rcx,%rax
   40aa9:	48 c1 e0 03          	shl    $0x3,%rax
   40aad:	48 29 c8             	sub    %rcx,%rax
   40ab0:	48 c1 e0 05          	shl    $0x5,%rax
   40ab4:	48 89 c1             	mov    %rax,%rcx
   40ab7:	48 8d 05 32 26 01 00 	lea    0x12632(%rip),%rax        # 530f0 <processes+0xd0>
   40abe:	48 8b 04 01          	mov    (%rcx,%rax,1),%rax
   40ac2:	48 8b 75 98          	mov    -0x68(%rbp),%rsi
   40ac6:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40acc:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40ad1:	48 89 c7             	mov    %rax,%rdi
   40ad4:	e8 6a 32 00 00       	call   43d43 <virtual_memory_map>
    processes[pid].p_state = P_RUNNABLE;
   40ad9:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
   40adf:	48 63 d0             	movslq %eax,%rdx
   40ae2:	48 89 d0             	mov    %rdx,%rax
   40ae5:	48 c1 e0 03          	shl    $0x3,%rax
   40ae9:	48 29 d0             	sub    %rdx,%rax
   40aec:	48 c1 e0 05          	shl    $0x5,%rax
   40af0:	48 89 c2             	mov    %rax,%rdx
   40af3:	48 8d 05 ee 25 01 00 	lea    0x125ee(%rip),%rax        # 530e8 <processes+0xc8>
   40afa:	c7 04 02 01 00 00 00 	movl   $0x1,(%rdx,%rax,1)
   40b01:	eb 01                	jmp    40b04 <process_setup+0x4cd>
        return;
   40b03:	90                   	nop
}
   40b04:	c9                   	leave  
   40b05:	c3                   	ret    

0000000000040b06 <assign_physical_page>:
//    Allocates the page with physical address `addr` to the given owner.
//    Fails if physical page `addr` was already allocated. Returns 0 on
//    success and -1 on failure. Used by the program loader.

int assign_physical_page(uintptr_t addr, int8_t owner)
{
   40b06:	f3 0f 1e fa          	endbr64 
   40b0a:	55                   	push   %rbp
   40b0b:	48 89 e5             	mov    %rsp,%rbp
   40b0e:	48 83 ec 10          	sub    $0x10,%rsp
   40b12:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   40b16:	89 f0                	mov    %esi,%eax
   40b18:	88 45 f4             	mov    %al,-0xc(%rbp)
    if ((addr & 0xFFF) != 0 || addr >= MEMSIZE_PHYSICAL || pageinfo[PAGENUMBER(addr)].refcount != 0)
   40b1b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40b1f:	25 ff 0f 00 00       	and    $0xfff,%eax
   40b24:	48 85 c0             	test   %rax,%rax
   40b27:	75 27                	jne    40b50 <assign_physical_page+0x4a>
   40b29:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   40b30:	00 
   40b31:	77 1d                	ja     40b50 <assign_physical_page+0x4a>
   40b33:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40b37:	48 c1 e8 0c          	shr    $0xc,%rax
   40b3b:	48 98                	cltq   
   40b3d:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40b41:	48 8d 05 f9 32 01 00 	lea    0x132f9(%rip),%rax        # 53e41 <pageinfo+0x1>
   40b48:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   40b4c:	84 c0                	test   %al,%al
   40b4e:	74 07                	je     40b57 <assign_physical_page+0x51>
    {
        return -1;
   40b50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   40b55:	eb 57                	jmp    40bae <assign_physical_page+0xa8>
    }
    else
    {
        pageinfo[PAGENUMBER(addr)].refcount += 1;
   40b57:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40b5b:	48 c1 e8 0c          	shr    $0xc,%rax
   40b5f:	48 98                	cltq   
   40b61:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40b65:	48 8d 05 d5 32 01 00 	lea    0x132d5(%rip),%rax        # 53e41 <pageinfo+0x1>
   40b6c:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   40b70:	8d 50 01             	lea    0x1(%rax),%edx
   40b73:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40b77:	48 c1 e8 0c          	shr    $0xc,%rax
   40b7b:	89 d1                	mov    %edx,%ecx
   40b7d:	48 98                	cltq   
   40b7f:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40b83:	48 8d 05 b7 32 01 00 	lea    0x132b7(%rip),%rax        # 53e41 <pageinfo+0x1>
   40b8a:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
        pageinfo[PAGENUMBER(addr)].owner = owner;
   40b8d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40b91:	48 c1 e8 0c          	shr    $0xc,%rax
   40b95:	48 98                	cltq   
   40b97:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   40b9b:	48 8d 15 9e 32 01 00 	lea    0x1329e(%rip),%rdx        # 53e40 <pageinfo>
   40ba2:	0f b6 45 f4          	movzbl -0xc(%rbp),%eax
   40ba6:	88 04 11             	mov    %al,(%rcx,%rdx,1)
        return 0;
   40ba9:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   40bae:	c9                   	leave  
   40baf:	c3                   	ret    

0000000000040bb0 <syscall_mapping>:

void syscall_mapping(proc *p)
{
   40bb0:	f3 0f 1e fa          	endbr64 
   40bb4:	55                   	push   %rbp
   40bb5:	48 89 e5             	mov    %rsp,%rbp
   40bb8:	48 83 ec 70          	sub    $0x70,%rsp
   40bbc:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)

    uintptr_t mapping_ptr = p->p_registers.reg_rdi;
   40bc0:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40bc4:	48 8b 40 38          	mov    0x38(%rax),%rax
   40bc8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    uintptr_t ptr = p->p_registers.reg_rsi;
   40bcc:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40bd0:	48 8b 40 30          	mov    0x30(%rax),%rax
   40bd4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)

    // convert to physical address so kernel can write to it
    vamapping map = virtual_memory_lookup(p->p_pagetable, mapping_ptr);
   40bd8:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40bdc:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40be3:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   40be7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40beb:	48 89 ce             	mov    %rcx,%rsi
   40bee:	48 89 c7             	mov    %rax,%rdi
   40bf1:	e8 91 35 00 00       	call   44187 <virtual_memory_lookup>

    // check for write access
    if ((map.perm & (PTE_W | PTE_U)) != (PTE_W | PTE_U))
   40bf6:	8b 45 e0             	mov    -0x20(%rbp),%eax
   40bf9:	48 98                	cltq   
   40bfb:	83 e0 06             	and    $0x6,%eax
   40bfe:	48 83 f8 06          	cmp    $0x6,%rax
   40c02:	75 73                	jne    40c77 <syscall_mapping+0xc7>
        return;
    uintptr_t endaddr = mapping_ptr + sizeof(vamapping) - 1;
   40c04:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40c08:	48 83 c0 17          	add    $0x17,%rax
   40c0c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    // check for write access for end address
    vamapping end_map = virtual_memory_lookup(p->p_pagetable, endaddr);
   40c10:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40c14:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40c1b:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
   40c1f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   40c23:	48 89 ce             	mov    %rcx,%rsi
   40c26:	48 89 c7             	mov    %rax,%rdi
   40c29:	e8 59 35 00 00       	call   44187 <virtual_memory_lookup>
    if ((end_map.perm & (PTE_W | PTE_P)) != (PTE_W | PTE_P))
   40c2e:	8b 45 c8             	mov    -0x38(%rbp),%eax
   40c31:	48 98                	cltq   
   40c33:	83 e0 03             	and    $0x3,%eax
   40c36:	48 83 f8 03          	cmp    $0x3,%rax
   40c3a:	75 3e                	jne    40c7a <syscall_mapping+0xca>
        return;
    // find the actual mapping now
    vamapping ptr_lookup = virtual_memory_lookup(p->p_pagetable, ptr);
   40c3c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40c40:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40c47:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40c4b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40c4f:	48 89 ce             	mov    %rcx,%rsi
   40c52:	48 89 c7             	mov    %rax,%rdi
   40c55:	e8 2d 35 00 00       	call   44187 <virtual_memory_lookup>
    memcpy((void *)map.pa, &ptr_lookup, sizeof(vamapping));
   40c5a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40c5e:	48 89 c1             	mov    %rax,%rcx
   40c61:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40c65:	ba 18 00 00 00       	mov    $0x18,%edx
   40c6a:	48 89 c6             	mov    %rax,%rsi
   40c6d:	48 89 cf             	mov    %rcx,%rdi
   40c70:	e8 d5 3a 00 00       	call   4474a <memcpy>
   40c75:	eb 04                	jmp    40c7b <syscall_mapping+0xcb>
        return;
   40c77:	90                   	nop
   40c78:	eb 01                	jmp    40c7b <syscall_mapping+0xcb>
        return;
   40c7a:	90                   	nop
}
   40c7b:	c9                   	leave  
   40c7c:	c3                   	ret    

0000000000040c7d <syscall_mem_tog>:

void syscall_mem_tog(proc *process)
{
   40c7d:	f3 0f 1e fa          	endbr64 
   40c81:	55                   	push   %rbp
   40c82:	48 89 e5             	mov    %rsp,%rbp
   40c85:	48 83 ec 18          	sub    $0x18,%rsp
   40c89:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)

    pid_t p = process->p_registers.reg_rdi;
   40c8d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40c91:	48 8b 40 38          	mov    0x38(%rax),%rax
   40c95:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (p == 0)
   40c98:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40c9c:	75 14                	jne    40cb2 <syscall_mem_tog+0x35>
    {
        disp_global = !disp_global;
   40c9e:	0f b6 05 5b 63 00 00 	movzbl 0x635b(%rip),%eax        # 47000 <disp_global>
   40ca5:	84 c0                	test   %al,%al
   40ca7:	0f 94 c0             	sete   %al
   40caa:	88 05 50 63 00 00    	mov    %al,0x6350(%rip)        # 47000 <disp_global>
   40cb0:	eb 36                	jmp    40ce8 <syscall_mem_tog+0x6b>
    }
    else
    {
        if (p < 0 || p > NPROC || p != process->p_pid)
   40cb2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40cb6:	78 2f                	js     40ce7 <syscall_mem_tog+0x6a>
   40cb8:	83 7d fc 10          	cmpl   $0x10,-0x4(%rbp)
   40cbc:	7f 29                	jg     40ce7 <syscall_mem_tog+0x6a>
   40cbe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40cc2:	8b 00                	mov    (%rax),%eax
   40cc4:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   40cc7:	75 1e                	jne    40ce7 <syscall_mem_tog+0x6a>
            return;
        process->display_status = !(process->display_status);
   40cc9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40ccd:	0f b6 80 d8 00 00 00 	movzbl 0xd8(%rax),%eax
   40cd4:	84 c0                	test   %al,%al
   40cd6:	0f 94 c0             	sete   %al
   40cd9:	89 c2                	mov    %eax,%edx
   40cdb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40cdf:	88 90 d8 00 00 00    	mov    %dl,0xd8(%rax)
   40ce5:	eb 01                	jmp    40ce8 <syscall_mem_tog+0x6b>
            return;
   40ce7:	90                   	nop
    }
}
   40ce8:	c9                   	leave  
   40ce9:	c3                   	ret    

0000000000040cea <find_free_process>:

int find_free_process()
{
   40cea:	f3 0f 1e fa          	endbr64 
   40cee:	55                   	push   %rbp
   40cef:	48 89 e5             	mov    %rsp,%rbp
   40cf2:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
    proc holder;
    for (int i = 1; i < NPROC; i++)
   40cf9:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
   40d00:	eb 46                	jmp    40d48 <find_free_process+0x5e>
    {
        holder = processes[i];
   40d02:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40d05:	48 63 d0             	movslq %eax,%rdx
   40d08:	48 89 d0             	mov    %rdx,%rax
   40d0b:	48 c1 e0 03          	shl    $0x3,%rax
   40d0f:	48 29 d0             	sub    %rdx,%rax
   40d12:	48 c1 e0 05          	shl    $0x5,%rax
   40d16:	48 89 c1             	mov    %rax,%rcx
   40d19:	48 8d 15 00 23 01 00 	lea    0x12300(%rip),%rdx        # 53020 <processes>
   40d20:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
   40d27:	48 01 ca             	add    %rcx,%rdx
   40d2a:	b9 1c 00 00 00       	mov    $0x1c,%ecx
   40d2f:	48 89 c7             	mov    %rax,%rdi
   40d32:	48 89 d6             	mov    %rdx,%rsi
   40d35:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
        if (holder.p_state == P_FREE)
   40d38:	8b 45 e0             	mov    -0x20(%rbp),%eax
   40d3b:	85 c0                	test   %eax,%eax
   40d3d:	75 05                	jne    40d44 <find_free_process+0x5a>
        {
            return i;
   40d3f:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40d42:	eb 0f                	jmp    40d53 <find_free_process+0x69>
    for (int i = 1; i < NPROC; i++)
   40d44:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   40d48:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   40d4c:	7e b4                	jle    40d02 <find_free_process+0x18>
        }
    }
    return -1;
   40d4e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   40d53:	c9                   	leave  
   40d54:	c3                   	ret    

0000000000040d55 <exception>:
//    then calls exception().
//
//    Note that hardware interrupts are disabled whenever the kernel is running.

void exception(x86_64_registers *reg)
{
   40d55:	f3 0f 1e fa          	endbr64 
   40d59:	55                   	push   %rbp
   40d5a:	48 89 e5             	mov    %rsp,%rbp
   40d5d:	48 81 ec 10 02 00 00 	sub    $0x210,%rsp
   40d64:	48 89 bd f8 fd ff ff 	mov    %rdi,-0x208(%rbp)
    // Copy the saved registers into the `current` process descriptor
    // and always use the kernel's page table.
    current->p_registers = *reg;
   40d6b:	48 8b 05 8e 22 01 00 	mov    0x1228e(%rip),%rax        # 53000 <current>
   40d72:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   40d79:	48 83 c0 08          	add    $0x8,%rax
   40d7d:	48 89 d6             	mov    %rdx,%rsi
   40d80:	ba 18 00 00 00       	mov    $0x18,%edx
   40d85:	48 89 c7             	mov    %rax,%rdi
   40d88:	48 89 d1             	mov    %rdx,%rcx
   40d8b:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    set_pagetable(kernel_pagetable);
   40d8e:	48 8b 05 6b 52 01 00 	mov    0x1526b(%rip),%rax        # 56000 <kernel_pagetable>
   40d95:	48 89 c7             	mov    %rax,%rdi
   40d98:	e8 34 2e 00 00       	call   43bd1 <set_pagetable>
    // Events logged this way are stored in the host's `log.txt` file.
    /*log_printf("proc %d: exception %d\n", current->p_pid, reg->reg_intno);*/

    // Show the current cursor location and memory state
    // (unless this is a kernel fault).
    console_show_cursor(cursorpos);
   40d9d:	8b 05 59 82 07 00    	mov    0x78259(%rip),%eax        # b8ffc <cursorpos>
   40da3:	89 c7                	mov    %eax,%edi
   40da5:	e8 ad 24 00 00       	call   43257 <console_show_cursor>
    if ((reg->reg_intno != INT_PAGEFAULT && reg->reg_intno != INT_GPF) // no error due to pagefault or general fault
   40daa:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   40db1:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40db8:	48 83 f8 0e          	cmp    $0xe,%rax
   40dbc:	74 14                	je     40dd2 <exception+0x7d>
   40dbe:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   40dc5:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40dcc:	48 83 f8 0d          	cmp    $0xd,%rax
   40dd0:	75 16                	jne    40de8 <exception+0x93>
        || (reg->reg_err & PFERR_USER))                                // pagefault error in user mode
   40dd2:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   40dd9:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40de0:	83 e0 04             	and    $0x4,%eax
   40de3:	48 85 c0             	test   %rax,%rax
   40de6:	74 1a                	je     40e02 <exception+0xad>
    {
        check_virtual_memory();
   40de8:	e8 2b 14 00 00       	call   42218 <check_virtual_memory>
        if (disp_global)
   40ded:	0f b6 05 0c 62 00 00 	movzbl 0x620c(%rip),%eax        # 47000 <disp_global>
   40df4:	84 c0                	test   %al,%al
   40df6:	74 0a                	je     40e02 <exception+0xad>
        {
            memshow_physical();
   40df8:	e8 69 16 00 00       	call   42466 <memshow_physical>
            memshow_virtual_animate();
   40dfd:	e8 06 1a 00 00       	call   42808 <memshow_virtual_animate>
        }
    }

    // If Control-C was typed, exit the virtual machine.
    check_keyboard();
   40e02:	e8 66 29 00 00       	call   4376d <check_keyboard>

    // Actually handle the exception.
    switch (reg->reg_intno)
   40e07:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   40e0e:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40e15:	48 83 e8 0e          	sub    $0xe,%rax
   40e19:	48 83 f8 2a          	cmp    $0x2a,%rax
   40e1d:	0f 87 a9 0e 00 00    	ja     41ccc <exception+0xf77>
   40e23:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
   40e2a:	00 
   40e2b:	48 8d 05 0e 4b 00 00 	lea    0x4b0e(%rip),%rax        # 45940 <console_clear+0x13b>
   40e32:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   40e35:	48 98                	cltq   
   40e37:	48 8d 15 02 4b 00 00 	lea    0x4b02(%rip),%rdx        # 45940 <console_clear+0x13b>
   40e3e:	48 01 d0             	add    %rdx,%rax
   40e41:	3e ff e0             	notrack jmp *%rax
    {
    case INT_SYS_FORK:
    {
        int val = find_free_process();
   40e44:	b8 00 00 00 00       	mov    $0x0,%eax
   40e49:	e8 9c fe ff ff       	call   40cea <find_free_process>
   40e4e:	89 45 a8             	mov    %eax,-0x58(%rbp)
        if (val == -1)
   40e51:	83 7d a8 ff          	cmpl   $0xffffffff,-0x58(%rbp)
   40e55:	75 19                	jne    40e70 <exception+0x11b>
        {
            current->p_registers.reg_rax = -1;
   40e57:	48 8b 05 a2 21 01 00 	mov    0x121a2(%rip),%rax        # 53000 <current>
   40e5e:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40e65:	ff 
            schedule();
   40e66:	e8 99 0e 00 00       	call   41d04 <schedule>

            break;
   40e6b:	e9 6c 0e 00 00       	jmp    41cdc <exception+0xf87>
        }
        process_init(&processes[val],0);
   40e70:	8b 45 a8             	mov    -0x58(%rbp),%eax
   40e73:	48 63 d0             	movslq %eax,%rdx
   40e76:	48 89 d0             	mov    %rdx,%rax
   40e79:	48 c1 e0 03          	shl    $0x3,%rax
   40e7d:	48 29 d0             	sub    %rdx,%rax
   40e80:	48 c1 e0 05          	shl    $0x5,%rax
   40e84:	48 8d 15 95 21 01 00 	lea    0x12195(%rip),%rdx        # 53020 <processes>
   40e8b:	48 01 d0             	add    %rdx,%rax
   40e8e:	be 00 00 00 00       	mov    $0x0,%esi
   40e93:	48 89 c7             	mov    %rax,%rdi
   40e96:	e8 ee 22 00 00       	call   43189 <process_init>
        // process_init(&processes[val], 0); // not sure we need
        int pt4num = find_free_page();
   40e9b:	b8 00 00 00 00       	mov    $0x0,%eax
   40ea0:	e8 c1 f4 ff ff       	call   40366 <find_free_page>
   40ea5:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        if (pt4num == -1)
   40ea8:	83 7d a4 ff          	cmpl   $0xffffffff,-0x5c(%rbp)
   40eac:	75 19                	jne    40ec7 <exception+0x172>
        {
            current->p_registers.reg_rax = -1;
   40eae:	48 8b 05 4b 21 01 00 	mov    0x1214b(%rip),%rax        # 53000 <current>
   40eb5:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40ebc:	ff 
            schedule();
   40ebd:	e8 42 0e 00 00       	call   41d04 <schedule>

            break;
   40ec2:	e9 15 0e 00 00       	jmp    41cdc <exception+0xf87>
        }
        int pid = processes[val].p_pid; // i think pid is the same as val
   40ec7:	8b 45 a8             	mov    -0x58(%rbp),%eax
   40eca:	48 63 d0             	movslq %eax,%rdx
   40ecd:	48 89 d0             	mov    %rdx,%rax
   40ed0:	48 c1 e0 03          	shl    $0x3,%rax
   40ed4:	48 29 d0             	sub    %rdx,%rax
   40ed7:	48 c1 e0 05          	shl    $0x5,%rax
   40edb:	48 89 c2             	mov    %rax,%rdx
   40ede:	48 8d 05 3b 21 01 00 	lea    0x1213b(%rip),%rax        # 53020 <processes>
   40ee5:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   40ee8:	89 45 a0             	mov    %eax,-0x60(%rbp)
        x86_64_pagetable *pt_L4 = numtopagetable(pt4num, pid);
   40eeb:	8b 45 a0             	mov    -0x60(%rbp),%eax
   40eee:	0f be d0             	movsbl %al,%edx
   40ef1:	8b 45 a4             	mov    -0x5c(%rbp),%eax
   40ef4:	89 d6                	mov    %edx,%esi
   40ef6:	89 c7                	mov    %eax,%edi
   40ef8:	e8 af f4 ff ff       	call   403ac <numtopagetable>
   40efd:	48 89 45 98          	mov    %rax,-0x68(%rbp)
        int pt3num = find_free_page();
   40f01:	b8 00 00 00 00       	mov    $0x0,%eax
   40f06:	e8 5b f4 ff ff       	call   40366 <find_free_page>
   40f0b:	89 45 94             	mov    %eax,-0x6c(%rbp)
        if (pt3num == -1)
   40f0e:	83 7d 94 ff          	cmpl   $0xffffffff,-0x6c(%rbp)
   40f12:	75 23                	jne    40f37 <exception+0x1e2>
        {
            freepage(pt4num);
   40f14:	8b 45 a4             	mov    -0x5c(%rbp),%eax
   40f17:	89 c7                	mov    %eax,%edi
   40f19:	e8 fd f4 ff ff       	call   4041b <freepage>
            current->p_registers.reg_rax = -1;
   40f1e:	48 8b 05 db 20 01 00 	mov    0x120db(%rip),%rax        # 53000 <current>
   40f25:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40f2c:	ff 
            schedule();
   40f2d:	e8 d2 0d 00 00       	call   41d04 <schedule>

            break;
   40f32:	e9 a5 0d 00 00       	jmp    41cdc <exception+0xf87>
        }
        x86_64_pagetable *pt_L3 = numtopagetable(pt3num, pid);
   40f37:	8b 45 a0             	mov    -0x60(%rbp),%eax
   40f3a:	0f be d0             	movsbl %al,%edx
   40f3d:	8b 45 94             	mov    -0x6c(%rbp),%eax
   40f40:	89 d6                	mov    %edx,%esi
   40f42:	89 c7                	mov    %eax,%edi
   40f44:	e8 63 f4 ff ff       	call   403ac <numtopagetable>
   40f49:	48 89 45 88          	mov    %rax,-0x78(%rbp)
        int pt2num = find_free_page();
   40f4d:	b8 00 00 00 00       	mov    $0x0,%eax
   40f52:	e8 0f f4 ff ff       	call   40366 <find_free_page>
   40f57:	89 45 84             	mov    %eax,-0x7c(%rbp)
        if (pt2num == -1)
   40f5a:	83 7d 84 ff          	cmpl   $0xffffffff,-0x7c(%rbp)
   40f5e:	75 2d                	jne    40f8d <exception+0x238>
        {
            freepage(pt4num);
   40f60:	8b 45 a4             	mov    -0x5c(%rbp),%eax
   40f63:	89 c7                	mov    %eax,%edi
   40f65:	e8 b1 f4 ff ff       	call   4041b <freepage>
            freepage(pt3num);
   40f6a:	8b 45 94             	mov    -0x6c(%rbp),%eax
   40f6d:	89 c7                	mov    %eax,%edi
   40f6f:	e8 a7 f4 ff ff       	call   4041b <freepage>
            current->p_registers.reg_rax = -1;
   40f74:	48 8b 05 85 20 01 00 	mov    0x12085(%rip),%rax        # 53000 <current>
   40f7b:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40f82:	ff 
            schedule();
   40f83:	e8 7c 0d 00 00       	call   41d04 <schedule>

            break;
   40f88:	e9 4f 0d 00 00       	jmp    41cdc <exception+0xf87>
        }
        x86_64_pagetable *pt_L2 = numtopagetable(pt2num, pid);
   40f8d:	8b 45 a0             	mov    -0x60(%rbp),%eax
   40f90:	0f be d0             	movsbl %al,%edx
   40f93:	8b 45 84             	mov    -0x7c(%rbp),%eax
   40f96:	89 d6                	mov    %edx,%esi
   40f98:	89 c7                	mov    %eax,%edi
   40f9a:	e8 0d f4 ff ff       	call   403ac <numtopagetable>
   40f9f:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
        int pt1_0num = find_free_page();
   40fa6:	b8 00 00 00 00       	mov    $0x0,%eax
   40fab:	e8 b6 f3 ff ff       	call   40366 <find_free_page>
   40fb0:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
        if (pt1_0num == -1)
   40fb6:	83 bd 74 ff ff ff ff 	cmpl   $0xffffffff,-0x8c(%rbp)
   40fbd:	75 37                	jne    40ff6 <exception+0x2a1>
        {
            freepage(pt4num);
   40fbf:	8b 45 a4             	mov    -0x5c(%rbp),%eax
   40fc2:	89 c7                	mov    %eax,%edi
   40fc4:	e8 52 f4 ff ff       	call   4041b <freepage>
            freepage(pt3num);
   40fc9:	8b 45 94             	mov    -0x6c(%rbp),%eax
   40fcc:	89 c7                	mov    %eax,%edi
   40fce:	e8 48 f4 ff ff       	call   4041b <freepage>
            freepage(pt2num);
   40fd3:	8b 45 84             	mov    -0x7c(%rbp),%eax
   40fd6:	89 c7                	mov    %eax,%edi
   40fd8:	e8 3e f4 ff ff       	call   4041b <freepage>
            current->p_registers.reg_rax = -1;
   40fdd:	48 8b 05 1c 20 01 00 	mov    0x1201c(%rip),%rax        # 53000 <current>
   40fe4:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40feb:	ff 
            schedule();
   40fec:	e8 13 0d 00 00       	call   41d04 <schedule>

            break;
   40ff1:	e9 e6 0c 00 00       	jmp    41cdc <exception+0xf87>
        }
        x86_64_pagetable *pt_L1_0 = numtopagetable(pt1_0num, pid);
   40ff6:	8b 45 a0             	mov    -0x60(%rbp),%eax
   40ff9:	0f be d0             	movsbl %al,%edx
   40ffc:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
   41002:	89 d6                	mov    %edx,%esi
   41004:	89 c7                	mov    %eax,%edi
   41006:	e8 a1 f3 ff ff       	call   403ac <numtopagetable>
   4100b:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
        int pt1_1num = find_free_page();
   41012:	b8 00 00 00 00       	mov    $0x0,%eax
   41017:	e8 4a f3 ff ff       	call   40366 <find_free_page>
   4101c:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%rbp)
        if (pt1_1num == -1)
   41022:	83 bd 64 ff ff ff ff 	cmpl   $0xffffffff,-0x9c(%rbp)
   41029:	75 44                	jne    4106f <exception+0x31a>
        {
            freepage(pt4num);
   4102b:	8b 45 a4             	mov    -0x5c(%rbp),%eax
   4102e:	89 c7                	mov    %eax,%edi
   41030:	e8 e6 f3 ff ff       	call   4041b <freepage>
            freepage(pt3num);
   41035:	8b 45 94             	mov    -0x6c(%rbp),%eax
   41038:	89 c7                	mov    %eax,%edi
   4103a:	e8 dc f3 ff ff       	call   4041b <freepage>
            freepage(pt2num);
   4103f:	8b 45 84             	mov    -0x7c(%rbp),%eax
   41042:	89 c7                	mov    %eax,%edi
   41044:	e8 d2 f3 ff ff       	call   4041b <freepage>
            freepage(pt1_0num);
   41049:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
   4104f:	89 c7                	mov    %eax,%edi
   41051:	e8 c5 f3 ff ff       	call   4041b <freepage>
            current->p_registers.reg_rax = -1;
   41056:	48 8b 05 a3 1f 01 00 	mov    0x11fa3(%rip),%rax        # 53000 <current>
   4105d:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   41064:	ff 
            schedule();
   41065:	e8 9a 0c 00 00       	call   41d04 <schedule>

            break;
   4106a:	e9 6d 0c 00 00       	jmp    41cdc <exception+0xf87>
        }
        x86_64_pagetable *pt_L1_1 = numtopagetable(pt1_1num, pid);
   4106f:	8b 45 a0             	mov    -0x60(%rbp),%eax
   41072:	0f be d0             	movsbl %al,%edx
   41075:	8b 85 64 ff ff ff    	mov    -0x9c(%rbp),%eax
   4107b:	89 d6                	mov    %edx,%esi
   4107d:	89 c7                	mov    %eax,%edi
   4107f:	e8 28 f3 ff ff       	call   403ac <numtopagetable>
   41084:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
        // set the pages to zero
        memset(pt_L4, 0, PAGESIZE);
   4108b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4108f:	ba 00 10 00 00       	mov    $0x1000,%edx
   41094:	be 00 00 00 00       	mov    $0x0,%esi
   41099:	48 89 c7             	mov    %rax,%rdi
   4109c:	e8 af 37 00 00       	call   44850 <memset>
        memset(pt_L3, 0, PAGESIZE);
   410a1:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   410a5:	ba 00 10 00 00       	mov    $0x1000,%edx
   410aa:	be 00 00 00 00       	mov    $0x0,%esi
   410af:	48 89 c7             	mov    %rax,%rdi
   410b2:	e8 99 37 00 00       	call   44850 <memset>
        memset(pt_L2, 0, PAGESIZE);
   410b7:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   410be:	ba 00 10 00 00       	mov    $0x1000,%edx
   410c3:	be 00 00 00 00       	mov    $0x0,%esi
   410c8:	48 89 c7             	mov    %rax,%rdi
   410cb:	e8 80 37 00 00       	call   44850 <memset>
        memset(pt_L1_0, 0, PAGESIZE);
   410d0:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   410d7:	ba 00 10 00 00       	mov    $0x1000,%edx
   410dc:	be 00 00 00 00       	mov    $0x0,%esi
   410e1:	48 89 c7             	mov    %rax,%rdi
   410e4:	e8 67 37 00 00       	call   44850 <memset>
        memset(pt_L1_1, 0, PAGESIZE);
   410e9:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
   410f0:	ba 00 10 00 00       	mov    $0x1000,%edx
   410f5:	be 00 00 00 00       	mov    $0x0,%esi
   410fa:	48 89 c7             	mov    %rax,%rdi
   410fd:	e8 4e 37 00 00       	call   44850 <memset>

        // Link the page tables together. Did I do this right?
        pt_L4->entry[0] = (x86_64_pageentry_t)pt_L3 | PTE_P | PTE_W | PTE_U;
   41102:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   41106:	48 83 c8 07          	or     $0x7,%rax
   4110a:	48 89 c2             	mov    %rax,%rdx
   4110d:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   41111:	48 89 10             	mov    %rdx,(%rax)
        pt_L3->entry[0] = (x86_64_pageentry_t)pt_L2 | PTE_P | PTE_W | PTE_U;
   41114:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   4111b:	48 83 c8 07          	or     $0x7,%rax
   4111f:	48 89 c2             	mov    %rax,%rdx
   41122:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   41126:	48 89 10             	mov    %rdx,(%rax)
        pt_L2->entry[0] = (x86_64_pageentry_t)pt_L1_0 | PTE_P | PTE_W | PTE_U;
   41129:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   41130:	48 83 c8 07          	or     $0x7,%rax
   41134:	48 89 c2             	mov    %rax,%rdx
   41137:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   4113e:	48 89 10             	mov    %rdx,(%rax)
        pt_L2->entry[1] = (x86_64_pageentry_t)pt_L1_1 | PTE_P | PTE_W | PTE_U;
   41141:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
   41148:	48 83 c8 07          	or     $0x7,%rax
   4114c:	48 89 c2             	mov    %rax,%rdx
   4114f:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   41156:	48 89 50 08          	mov    %rdx,0x8(%rax)

        // Copy address space

        for (uintptr_t addr = 0; addr < MEMSIZE_VIRTUAL; addr += PAGESIZE)
   4115a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   41161:	00 
   41162:	e9 c6 02 00 00       	jmp    4142d <exception+0x6d8>
        {                                                                                 // we're gonna go page by page I think
            vamapping parent_mapping = virtual_memory_lookup(current->p_pagetable, addr); // get the pagetable page of addr in the kernel
   41167:	48 8b 05 92 1e 01 00 	mov    0x11e92(%rip),%rax        # 53000 <current>
   4116e:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   41175:	48 8d 85 e8 fe ff ff 	lea    -0x118(%rbp),%rax
   4117c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   41180:	48 89 ce             	mov    %rcx,%rsi
   41183:	48 89 c7             	mov    %rax,%rdi
   41186:	e8 fc 2f 00 00       	call   44187 <virtual_memory_lookup>
            if (parent_mapping.pn >= 0)
   4118b:	8b 85 e8 fe ff ff    	mov    -0x118(%rbp),%eax
   41191:	85 c0                	test   %eax,%eax
   41193:	0f 88 8c 02 00 00    	js     41425 <exception+0x6d0>
            {
                // Copy the mapping. You'll have to deal with accessability
                int perm = parent_mapping.perm;
   41199:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
   4119f:	89 85 54 ff ff ff    	mov    %eax,-0xac(%rbp)
                if (addr == CONSOLE_ADDR)
   411a5:	48 8d 05 54 6e 07 00 	lea    0x76e54(%rip),%rax        # b8000 <console>
   411ac:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   411b0:	75 34                	jne    411e6 <exception+0x491>
                {
                    perm |= PTE_U; // Make console user-accessible
   411b2:	83 8d 54 ff ff ff 04 	orl    $0x4,-0xac(%rbp)
                    virtual_memory_map(pt_L4, CONSOLE_ADDR, CONSOLE_ADDR, PAGESIZE, perm);
   411b9:	48 8d 15 40 6e 07 00 	lea    0x76e40(%rip),%rdx        # b8000 <console>
   411c0:	48 8d 35 39 6e 07 00 	lea    0x76e39(%rip),%rsi        # b8000 <console>
   411c7:	8b 8d 54 ff ff ff    	mov    -0xac(%rbp),%ecx
   411cd:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   411d1:	41 89 c8             	mov    %ecx,%r8d
   411d4:	b9 00 10 00 00       	mov    $0x1000,%ecx
   411d9:	48 89 c7             	mov    %rax,%rdi
   411dc:	e8 62 2b 00 00       	call   43d43 <virtual_memory_map>
                    continue;
   411e1:	e9 3f 02 00 00       	jmp    41425 <exception+0x6d0>
                }
                else if (addr < PROC_START_ADDR)
   411e6:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   411ed:	00 
   411ee:	77 31                	ja     41221 <exception+0x4cc>
                {
                    // Kernel pages - map with non-user access
                    perm &= ~PTE_U;
   411f0:	83 a5 54 ff ff ff fb 	andl   $0xfffffffb,-0xac(%rbp)
                    virtual_memory_map(pt_L4, addr, parent_mapping.pa, PAGESIZE, perm);
   411f7:	48 8b 95 f0 fe ff ff 	mov    -0x110(%rbp),%rdx
   411fe:	8b 8d 54 ff ff ff    	mov    -0xac(%rbp),%ecx
   41204:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   41208:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4120c:	41 89 c8             	mov    %ecx,%r8d
   4120f:	b9 00 10 00 00       	mov    $0x1000,%ecx
   41214:	48 89 c7             	mov    %rax,%rdi
   41217:	e8 27 2b 00 00       	call   43d43 <virtual_memory_map>
                    continue;
   4121c:	e9 04 02 00 00       	jmp    41425 <exception+0x6d0>
                }
                else if (!(perm & PTE_W))
   41221:	8b 85 54 ff ff ff    	mov    -0xac(%rbp),%eax
   41227:	48 98                	cltq   
   41229:	83 e0 02             	and    $0x2,%eax
   4122c:	48 85 c0             	test   %rax,%rax
   4122f:	75 66                	jne    41297 <exception+0x542>
                {
                    // This is a read-only page - share it rather than copying
                    virtual_memory_map(pt_L4, addr, parent_mapping.pa, PAGESIZE, perm);
   41231:	48 8b 95 f0 fe ff ff 	mov    -0x110(%rbp),%rdx
   41238:	8b 8d 54 ff ff ff    	mov    -0xac(%rbp),%ecx
   4123e:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   41242:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   41246:	41 89 c8             	mov    %ecx,%r8d
   41249:	b9 00 10 00 00       	mov    $0x1000,%ecx
   4124e:	48 89 c7             	mov    %rax,%rdi
   41251:	e8 ed 2a 00 00       	call   43d43 <virtual_memory_map>

                    // Increment the reference count for this physical page
                    pageinfo[PAGENUMBER(parent_mapping.pa)].refcount += 1;
   41256:	48 8b 85 f0 fe ff ff 	mov    -0x110(%rbp),%rax
   4125d:	48 c1 e8 0c          	shr    $0xc,%rax
   41261:	48 98                	cltq   
   41263:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41267:	48 8d 05 d3 2b 01 00 	lea    0x12bd3(%rip),%rax        # 53e41 <pageinfo+0x1>
   4126e:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41272:	8d 50 01             	lea    0x1(%rax),%edx
   41275:	48 8b 85 f0 fe ff ff 	mov    -0x110(%rbp),%rax
   4127c:	48 c1 e8 0c          	shr    $0xc,%rax
   41280:	89 d1                	mov    %edx,%ecx
   41282:	48 98                	cltq   
   41284:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41288:	48 8d 05 b2 2b 01 00 	lea    0x12bb2(%rip),%rax        # 53e41 <pageinfo+0x1>
   4128f:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
   41292:	e9 8e 01 00 00       	jmp    41425 <exception+0x6d0>
                }
                else if (perm & PTE_U) // check if you have user access to it. you'll have to make a new page
   41297:	8b 85 54 ff ff ff    	mov    -0xac(%rbp),%eax
   4129d:	48 98                	cltq   
   4129f:	83 e0 04             	and    $0x4,%eax
   412a2:	48 85 c0             	test   %rax,%rax
   412a5:	0f 84 54 01 00 00    	je     413ff <exception+0x6aa>
                {
                    int new_page_physical = find_free_page();
   412ab:	b8 00 00 00 00       	mov    $0x0,%eax
   412b0:	e8 b1 f0 ff ff       	call   40366 <find_free_page>
   412b5:	89 85 50 ff ff ff    	mov    %eax,-0xb0(%rbp)
                    if (new_page_physical == -1)
   412bb:	83 bd 50 ff ff ff ff 	cmpl   $0xffffffff,-0xb0(%rbp)
   412c2:	75 5d                	jne    41321 <exception+0x5cc>
                    {
                        cleanupMemVirtual(pt_L4);
   412c4:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   412c8:	48 89 c7             	mov    %rax,%rdi
   412cb:	e8 ef f1 ff ff       	call   404bf <cleanupMemVirtual>
                        freepage(pt4num);
   412d0:	8b 45 a4             	mov    -0x5c(%rbp),%eax
   412d3:	89 c7                	mov    %eax,%edi
   412d5:	e8 41 f1 ff ff       	call   4041b <freepage>
                        freepage(pt3num);
   412da:	8b 45 94             	mov    -0x6c(%rbp),%eax
   412dd:	89 c7                	mov    %eax,%edi
   412df:	e8 37 f1 ff ff       	call   4041b <freepage>
                        freepage(pt2num);
   412e4:	8b 45 84             	mov    -0x7c(%rbp),%eax
   412e7:	89 c7                	mov    %eax,%edi
   412e9:	e8 2d f1 ff ff       	call   4041b <freepage>
                        freepage(pt1_0num);
   412ee:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
   412f4:	89 c7                	mov    %eax,%edi
   412f6:	e8 20 f1 ff ff       	call   4041b <freepage>
                        freepage(pt1_1num);
   412fb:	8b 85 64 ff ff ff    	mov    -0x9c(%rbp),%eax
   41301:	89 c7                	mov    %eax,%edi
   41303:	e8 13 f1 ff ff       	call   4041b <freepage>
                        current->p_registers.reg_rax = -1; // ERROR? Should this panic?
   41308:	48 8b 05 f1 1c 01 00 	mov    0x11cf1(%rip),%rax        # 53000 <current>
   4130f:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   41316:	ff 
                        schedule();
   41317:	e8 e8 09 00 00       	call   41d04 <schedule>
                        return;
   4131c:	e9 e1 09 00 00       	jmp    41d02 <exception+0xfad>
                    }
                    memcpy((void *)PAGEADDRESS(new_page_physical), (void *)parent_mapping.pa, PAGESIZE);
   41321:	48 8b 85 f0 fe ff ff 	mov    -0x110(%rbp),%rax
   41328:	48 89 c1             	mov    %rax,%rcx
   4132b:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
   41331:	48 98                	cltq   
   41333:	48 c1 e0 0c          	shl    $0xc,%rax
   41337:	ba 00 10 00 00       	mov    $0x1000,%edx
   4133c:	48 89 ce             	mov    %rcx,%rsi
   4133f:	48 89 c7             	mov    %rax,%rdi
   41342:	e8 03 34 00 00       	call   4474a <memcpy>
                    int r = assign_physical_page(PAGEADDRESS(new_page_physical), pid);
   41347:	8b 45 a0             	mov    -0x60(%rbp),%eax
   4134a:	0f be c0             	movsbl %al,%eax
   4134d:	8b 95 50 ff ff ff    	mov    -0xb0(%rbp),%edx
   41353:	48 63 d2             	movslq %edx,%rdx
   41356:	48 c1 e2 0c          	shl    $0xc,%rdx
   4135a:	89 c6                	mov    %eax,%esi
   4135c:	48 89 d7             	mov    %rdx,%rdi
   4135f:	e8 a2 f7 ff ff       	call   40b06 <assign_physical_page>
   41364:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
                    if (r < 0)
   4136a:	83 bd 4c ff ff ff 00 	cmpl   $0x0,-0xb4(%rbp)
   41371:	79 5d                	jns    413d0 <exception+0x67b>
                    {
                        cleanupMemVirtual(pt_L4);
   41373:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   41377:	48 89 c7             	mov    %rax,%rdi
   4137a:	e8 40 f1 ff ff       	call   404bf <cleanupMemVirtual>

                        freepage(pt4num);
   4137f:	8b 45 a4             	mov    -0x5c(%rbp),%eax
   41382:	89 c7                	mov    %eax,%edi
   41384:	e8 92 f0 ff ff       	call   4041b <freepage>
                        freepage(pt3num);
   41389:	8b 45 94             	mov    -0x6c(%rbp),%eax
   4138c:	89 c7                	mov    %eax,%edi
   4138e:	e8 88 f0 ff ff       	call   4041b <freepage>
                        freepage(pt2num);
   41393:	8b 45 84             	mov    -0x7c(%rbp),%eax
   41396:	89 c7                	mov    %eax,%edi
   41398:	e8 7e f0 ff ff       	call   4041b <freepage>
                        freepage(pt1_0num);
   4139d:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
   413a3:	89 c7                	mov    %eax,%edi
   413a5:	e8 71 f0 ff ff       	call   4041b <freepage>
                        freepage(pt1_1num);
   413aa:	8b 85 64 ff ff ff    	mov    -0x9c(%rbp),%eax
   413b0:	89 c7                	mov    %eax,%edi
   413b2:	e8 64 f0 ff ff       	call   4041b <freepage>
                        current->p_registers.reg_rax = -1; // ERROR? Should this panic?
   413b7:	48 8b 05 42 1c 01 00 	mov    0x11c42(%rip),%rax        # 53000 <current>
   413be:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   413c5:	ff 
                        schedule();
   413c6:	e8 39 09 00 00       	call   41d04 <schedule>

                        return;
   413cb:	e9 32 09 00 00       	jmp    41d02 <exception+0xfad>
                    }
                    virtual_memory_map(pt_L4, addr, PAGEADDRESS(new_page_physical), PAGESIZE, perm);
   413d0:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
   413d6:	48 98                	cltq   
   413d8:	48 c1 e0 0c          	shl    $0xc,%rax
   413dc:	48 89 c2             	mov    %rax,%rdx
   413df:	8b 8d 54 ff ff ff    	mov    -0xac(%rbp),%ecx
   413e5:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   413e9:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   413ed:	41 89 c8             	mov    %ecx,%r8d
   413f0:	b9 00 10 00 00       	mov    $0x1000,%ecx
   413f5:	48 89 c7             	mov    %rax,%rdi
   413f8:	e8 46 29 00 00       	call   43d43 <virtual_memory_map>
   413fd:	eb 26                	jmp    41425 <exception+0x6d0>
                }
                else
                {
                    virtual_memory_map(pt_L4, addr, parent_mapping.pa, PAGESIZE, parent_mapping.perm);
   413ff:	8b 8d f8 fe ff ff    	mov    -0x108(%rbp),%ecx
   41405:	48 8b 95 f0 fe ff ff 	mov    -0x110(%rbp),%rdx
   4140c:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   41410:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   41414:	41 89 c8             	mov    %ecx,%r8d
   41417:	b9 00 10 00 00       	mov    $0x1000,%ecx
   4141c:	48 89 c7             	mov    %rax,%rdi
   4141f:	e8 1f 29 00 00       	call   43d43 <virtual_memory_map>
                    continue;
   41424:	90                   	nop
        for (uintptr_t addr = 0; addr < MEMSIZE_VIRTUAL; addr += PAGESIZE)
   41425:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   4142c:	00 
   4142d:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   41434:	00 
   41435:	0f 86 2c fd ff ff    	jbe    41167 <exception+0x412>
                }
            }
        }
        // Set the child's page table
        processes[val].p_pagetable = pt_L4;
   4143b:	8b 45 a8             	mov    -0x58(%rbp),%eax
   4143e:	48 63 d0             	movslq %eax,%rdx
   41441:	48 89 d0             	mov    %rdx,%rax
   41444:	48 c1 e0 03          	shl    $0x3,%rax
   41448:	48 29 d0             	sub    %rdx,%rax
   4144b:	48 c1 e0 05          	shl    $0x5,%rax
   4144f:	48 89 c1             	mov    %rax,%rcx
   41452:	48 8d 15 97 1c 01 00 	lea    0x11c97(%rip),%rdx        # 530f0 <processes+0xd0>
   41459:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   4145d:	48 89 04 11          	mov    %rax,(%rcx,%rdx,1)

        // Copy the parent's registers to the child
        processes[val].p_registers = current->p_registers;
   41461:	48 8b 0d 98 1b 01 00 	mov    0x11b98(%rip),%rcx        # 53000 <current>
   41468:	8b 45 a8             	mov    -0x58(%rbp),%eax
   4146b:	48 63 d0             	movslq %eax,%rdx
   4146e:	48 89 d0             	mov    %rdx,%rax
   41471:	48 c1 e0 03          	shl    $0x3,%rax
   41475:	48 29 d0             	sub    %rdx,%rax
   41478:	48 c1 e0 05          	shl    $0x5,%rax
   4147c:	48 89 c2             	mov    %rax,%rdx
   4147f:	48 8d 05 9a 1b 01 00 	lea    0x11b9a(%rip),%rax        # 53020 <processes>
   41486:	48 01 d0             	add    %rdx,%rax
   41489:	48 83 c0 08          	add    $0x8,%rax
   4148d:	48 8d 51 08          	lea    0x8(%rcx),%rdx
   41491:	b9 18 00 00 00       	mov    $0x18,%ecx
   41496:	48 89 c7             	mov    %rax,%rdi
   41499:	48 89 d6             	mov    %rdx,%rsi
   4149c:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)

        // Set the return values
        // - Child gets 0
        processes[val].p_registers.reg_rax = 0;
   4149f:	8b 45 a8             	mov    -0x58(%rbp),%eax
   414a2:	48 63 d0             	movslq %eax,%rdx
   414a5:	48 89 d0             	mov    %rdx,%rax
   414a8:	48 c1 e0 03          	shl    $0x3,%rax
   414ac:	48 29 d0             	sub    %rdx,%rax
   414af:	48 c1 e0 05          	shl    $0x5,%rax
   414b3:	48 89 c2             	mov    %rax,%rdx
   414b6:	48 8d 05 6b 1b 01 00 	lea    0x11b6b(%rip),%rax        # 53028 <processes+0x8>
   414bd:	48 c7 04 02 00 00 00 	movq   $0x0,(%rdx,%rax,1)
   414c4:	00 
        // - Parent gets child's PID
        current->p_registers.reg_rax = pid;
   414c5:	48 8b 05 34 1b 01 00 	mov    0x11b34(%rip),%rax        # 53000 <current>
   414cc:	8b 55 a0             	mov    -0x60(%rbp),%edx
   414cf:	48 63 d2             	movslq %edx,%rdx
   414d2:	48 89 50 08          	mov    %rdx,0x8(%rax)

        // Mark the child as runnable
        processes[val].p_state = P_RUNNABLE;
   414d6:	8b 45 a8             	mov    -0x58(%rbp),%eax
   414d9:	48 63 d0             	movslq %eax,%rdx
   414dc:	48 89 d0             	mov    %rdx,%rax
   414df:	48 c1 e0 03          	shl    $0x3,%rax
   414e3:	48 29 d0             	sub    %rdx,%rax
   414e6:	48 c1 e0 05          	shl    $0x5,%rax
   414ea:	48 89 c2             	mov    %rax,%rdx
   414ed:	48 8d 05 f4 1b 01 00 	lea    0x11bf4(%rip),%rax        # 530e8 <processes+0xc8>
   414f4:	c7 04 02 01 00 00 00 	movl   $0x1,(%rdx,%rax,1)
        processes[val].display_status = 1;
   414fb:	8b 45 a8             	mov    -0x58(%rbp),%eax
   414fe:	48 63 d0             	movslq %eax,%rdx
   41501:	48 89 d0             	mov    %rdx,%rax
   41504:	48 c1 e0 03          	shl    $0x3,%rax
   41508:	48 29 d0             	sub    %rdx,%rax
   4150b:	48 c1 e0 05          	shl    $0x5,%rax
   4150f:	48 89 c2             	mov    %rax,%rdx
   41512:	48 8d 05 df 1b 01 00 	lea    0x11bdf(%rip),%rax        # 530f8 <processes+0xd8>
   41519:	c6 04 02 01          	movb   $0x1,(%rdx,%rax,1)
        processes[val].p_registers.reg_rsp = MEMSIZE_VIRTUAL;
   4151d:	8b 45 a8             	mov    -0x58(%rbp),%eax
   41520:	48 63 d0             	movslq %eax,%rdx
   41523:	48 89 d0             	mov    %rdx,%rax
   41526:	48 c1 e0 03          	shl    $0x3,%rax
   4152a:	48 29 d0             	sub    %rdx,%rax
   4152d:	48 c1 e0 05          	shl    $0x5,%rax
   41531:	48 89 c2             	mov    %rax,%rdx
   41534:	48 8d 05 9d 1b 01 00 	lea    0x11b9d(%rip),%rax        # 530d8 <processes+0xb8>
   4153b:	48 c7 04 02 00 00 30 	movq   $0x300000,(%rdx,%rax,1)
   41542:	00 

        break;
   41543:	e9 94 07 00 00       	jmp    41cdc <exception+0xf87>
    }
    case INT_SYS_EXIT:
    {
        // First, clean up all process memory mappings
        for (uintptr_t addr = PROC_START_ADDR; addr < MEMSIZE_VIRTUAL; addr += PAGESIZE) {
   41548:	48 c7 45 f0 00 00 10 	movq   $0x100000,-0x10(%rbp)
   4154f:	00 
   41550:	e9 96 01 00 00       	jmp    416eb <exception+0x996>
            vamapping vam = virtual_memory_lookup(current->p_pagetable, addr);
   41555:	48 8b 05 a4 1a 01 00 	mov    0x11aa4(%rip),%rax        # 53000 <current>
   4155c:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   41563:	48 8d 85 d0 fe ff ff 	lea    -0x130(%rbp),%rax
   4156a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   4156e:	48 89 ce             	mov    %rcx,%rsi
   41571:	48 89 c7             	mov    %rax,%rdi
   41574:	e8 0e 2c 00 00       	call   44187 <virtual_memory_lookup>
            if (vam.pn >= 0 && (vam.perm & PTE_P)) {
   41579:	8b 85 d0 fe ff ff    	mov    -0x130(%rbp),%eax
   4157f:	85 c0                	test   %eax,%eax
   41581:	0f 88 5c 01 00 00    	js     416e3 <exception+0x98e>
   41587:	8b 85 e0 fe ff ff    	mov    -0x120(%rbp),%eax
   4158d:	48 98                	cltq   
   4158f:	83 e0 01             	and    $0x1,%eax
   41592:	48 85 c0             	test   %rax,%rax
   41595:	0f 84 48 01 00 00    	je     416e3 <exception+0x98e>
                // Clear this mapping
                virtual_memory_map(current->p_pagetable, addr, 0, PAGESIZE, 0);
   4159b:	48 8b 05 5e 1a 01 00 	mov    0x11a5e(%rip),%rax        # 53000 <current>
   415a2:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   415a9:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   415ad:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   415b3:	b9 00 10 00 00       	mov    $0x1000,%ecx
   415b8:	ba 00 00 00 00       	mov    $0x0,%edx
   415bd:	48 89 c7             	mov    %rax,%rdi
   415c0:	e8 7e 27 00 00       	call   43d43 <virtual_memory_map>
                
                // Decrement reference count for this physical page
                pageinfo[vam.pn].refcount--;
   415c5:	8b 85 d0 fe ff ff    	mov    -0x130(%rbp),%eax
   415cb:	48 63 d0             	movslq %eax,%rdx
   415ce:	48 8d 0c 12          	lea    (%rdx,%rdx,1),%rcx
   415d2:	48 8d 15 68 28 01 00 	lea    0x12868(%rip),%rdx        # 53e41 <pageinfo+0x1>
   415d9:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   415dd:	83 ea 01             	sub    $0x1,%edx
   415e0:	89 d1                	mov    %edx,%ecx
   415e2:	48 98                	cltq   
   415e4:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   415e8:	48 8d 05 52 28 01 00 	lea    0x12852(%rip),%rax        # 53e41 <pageinfo+0x1>
   415ef:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
                
                // If refcount reaches 0, free the page
                if (pageinfo[vam.pn].refcount == 0) {
   415f2:	8b 85 d0 fe ff ff    	mov    -0x130(%rbp),%eax
   415f8:	48 98                	cltq   
   415fa:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   415fe:	48 8d 05 3c 28 01 00 	lea    0x1283c(%rip),%rax        # 53e41 <pageinfo+0x1>
   41605:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41609:	84 c0                	test   %al,%al
   4160b:	75 1c                	jne    41629 <exception+0x8d4>
                    pageinfo[vam.pn].owner = PO_FREE;
   4160d:	8b 85 d0 fe ff ff    	mov    -0x130(%rbp),%eax
   41613:	48 98                	cltq   
   41615:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41619:	48 8d 05 20 28 01 00 	lea    0x12820(%rip),%rax        # 53e40 <pageinfo>
   41620:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
   41624:	e9 ba 00 00 00       	jmp    416e3 <exception+0x98e>
                }
                // If still referenced but owned by current process, transfer ownership
                else if (pageinfo[vam.pn].owner == current->p_pid) {
   41629:	8b 85 d0 fe ff ff    	mov    -0x130(%rbp),%eax
   4162f:	48 98                	cltq   
   41631:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41635:	48 8d 05 04 28 01 00 	lea    0x12804(%rip),%rax        # 53e40 <pageinfo>
   4163c:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41640:	0f be d0             	movsbl %al,%edx
   41643:	48 8b 05 b6 19 01 00 	mov    0x119b6(%rip),%rax        # 53000 <current>
   4164a:	8b 00                	mov    (%rax),%eax
   4164c:	39 c2                	cmp    %eax,%edx
   4164e:	0f 85 8f 00 00 00    	jne    416e3 <exception+0x98e>
                    // Find another process to own this page
                    int new_owner = -1;
   41654:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%rbp)
                    for (int i = 1; i < NPROC; i++) {
   4165b:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%rbp)
   41662:	eb 3f                	jmp    416a3 <exception+0x94e>
                        if (i != current->p_pid && processes[i].p_state != P_FREE) {
   41664:	48 8b 05 95 19 01 00 	mov    0x11995(%rip),%rax        # 53000 <current>
   4166b:	8b 00                	mov    (%rax),%eax
   4166d:	39 45 e8             	cmp    %eax,-0x18(%rbp)
   41670:	74 2d                	je     4169f <exception+0x94a>
   41672:	8b 45 e8             	mov    -0x18(%rbp),%eax
   41675:	48 63 d0             	movslq %eax,%rdx
   41678:	48 89 d0             	mov    %rdx,%rax
   4167b:	48 c1 e0 03          	shl    $0x3,%rax
   4167f:	48 29 d0             	sub    %rdx,%rax
   41682:	48 c1 e0 05          	shl    $0x5,%rax
   41686:	48 89 c2             	mov    %rax,%rdx
   41689:	48 8d 05 58 1a 01 00 	lea    0x11a58(%rip),%rax        # 530e8 <processes+0xc8>
   41690:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   41693:	85 c0                	test   %eax,%eax
   41695:	74 08                	je     4169f <exception+0x94a>
                            new_owner = i;
   41697:	8b 45 e8             	mov    -0x18(%rbp),%eax
   4169a:	89 45 ec             	mov    %eax,-0x14(%rbp)
                            break;
   4169d:	eb 0a                	jmp    416a9 <exception+0x954>
                    for (int i = 1; i < NPROC; i++) {
   4169f:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
   416a3:	83 7d e8 0f          	cmpl   $0xf,-0x18(%rbp)
   416a7:	7e bb                	jle    41664 <exception+0x90f>
                        }
                    }
                    
                    if (new_owner != -1) {
   416a9:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%rbp)
   416ad:	74 1d                	je     416cc <exception+0x977>
                        pageinfo[vam.pn].owner = new_owner;
   416af:	8b 85 d0 fe ff ff    	mov    -0x130(%rbp),%eax
   416b5:	8b 55 ec             	mov    -0x14(%rbp),%edx
   416b8:	89 d1                	mov    %edx,%ecx
   416ba:	48 98                	cltq   
   416bc:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   416c0:	48 8d 05 79 27 01 00 	lea    0x12779(%rip),%rax        # 53e40 <pageinfo>
   416c7:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
   416ca:	eb 17                	jmp    416e3 <exception+0x98e>
                    } else {
                        pageinfo[vam.pn].owner = PO_KERNEL;
   416cc:	8b 85 d0 fe ff ff    	mov    -0x130(%rbp),%eax
   416d2:	48 98                	cltq   
   416d4:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   416d8:	48 8d 05 61 27 01 00 	lea    0x12761(%rip),%rax        # 53e40 <pageinfo>
   416df:	c6 04 02 fe          	movb   $0xfe,(%rdx,%rax,1)
        for (uintptr_t addr = PROC_START_ADDR; addr < MEMSIZE_VIRTUAL; addr += PAGESIZE) {
   416e3:	48 81 45 f0 00 10 00 	addq   $0x1000,-0x10(%rbp)
   416ea:	00 
   416eb:	48 81 7d f0 ff ff 2f 	cmpq   $0x2fffff,-0x10(%rbp)
   416f2:	00 
   416f3:	0f 86 5c fe ff ff    	jbe    41555 <exception+0x800>
                }
            }
        }
        
        // Free the page tables in reverse order (L1 first, then L2, etc.)
        x86_64_pagetable* pt_l4 = current->p_pagetable;
   416f9:	48 8b 05 00 19 01 00 	mov    0x11900(%rip),%rax        # 53000 <current>
   41700:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   41707:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        if (!pt_l4) {
   4170b:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   41710:	75 16                	jne    41728 <exception+0x9d3>
            current->p_state = P_FREE;
   41712:	48 8b 05 e7 18 01 00 	mov    0x118e7(%rip),%rax        # 53000 <current>
   41719:	c7 80 c8 00 00 00 00 	movl   $0x0,0xc8(%rax)
   41720:	00 00 00 
            schedule();
   41723:	e8 dc 05 00 00       	call   41d04 <schedule>
        }
        
        x86_64_pagetable* pt_l3 = (x86_64_pagetable*)PTE_ADDR(pt_l4->entry[0]);
   41728:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4172c:	48 8b 00             	mov    (%rax),%rax
   4172f:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   41735:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        if (!pt_l3) {
   41739:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   4173e:	75 25                	jne    41765 <exception+0xa10>
            freepage(PAGENUMBER(pt_l4));
   41740:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41744:	48 c1 e8 0c          	shr    $0xc,%rax
   41748:	89 c7                	mov    %eax,%edi
   4174a:	e8 cc ec ff ff       	call   4041b <freepage>
            current->p_state = P_FREE;
   4174f:	48 8b 05 aa 18 01 00 	mov    0x118aa(%rip),%rax        # 53000 <current>
   41756:	c7 80 c8 00 00 00 00 	movl   $0x0,0xc8(%rax)
   4175d:	00 00 00 
            schedule();
   41760:	e8 9f 05 00 00       	call   41d04 <schedule>
        }
        
        x86_64_pagetable* pt_l2 = (x86_64_pagetable*)PTE_ADDR(pt_l3->entry[0]);
   41765:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41769:	48 8b 00             	mov    (%rax),%rax
   4176c:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   41772:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        if (!pt_l2) {
   41776:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
   4177b:	75 34                	jne    417b1 <exception+0xa5c>
            freepage(PAGENUMBER(pt_l3));
   4177d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41781:	48 c1 e8 0c          	shr    $0xc,%rax
   41785:	89 c7                	mov    %eax,%edi
   41787:	e8 8f ec ff ff       	call   4041b <freepage>
            freepage(PAGENUMBER(pt_l4));
   4178c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41790:	48 c1 e8 0c          	shr    $0xc,%rax
   41794:	89 c7                	mov    %eax,%edi
   41796:	e8 80 ec ff ff       	call   4041b <freepage>
            current->p_state = P_FREE;
   4179b:	48 8b 05 5e 18 01 00 	mov    0x1185e(%rip),%rax        # 53000 <current>
   417a2:	c7 80 c8 00 00 00 00 	movl   $0x0,0xc8(%rax)
   417a9:	00 00 00 
            schedule();
   417ac:	e8 53 05 00 00       	call   41d04 <schedule>
        }
        
        x86_64_pagetable* pt_l1_0 = (x86_64_pagetable*)PTE_ADDR(pt_l2->entry[0]);
   417b1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   417b5:	48 8b 00             	mov    (%rax),%rax
   417b8:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   417be:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
        x86_64_pagetable* pt_l1_1 = (x86_64_pagetable*)PTE_ADDR(pt_l2->entry[1]);
   417c2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   417c6:	48 8b 40 08          	mov    0x8(%rax),%rax
   417ca:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   417d0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
        
        // Free L1 page tables
        if (pt_l1_0) {
   417d4:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
   417d9:	74 33                	je     4180e <exception+0xab9>
            int pn = PAGENUMBER(pt_l1_0);
   417db:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   417df:	48 c1 e8 0c          	shr    $0xc,%rax
   417e3:	89 45 bc             	mov    %eax,-0x44(%rbp)
            pageinfo[pn].refcount = 0;
   417e6:	8b 45 bc             	mov    -0x44(%rbp),%eax
   417e9:	48 98                	cltq   
   417eb:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   417ef:	48 8d 05 4b 26 01 00 	lea    0x1264b(%rip),%rax        # 53e41 <pageinfo+0x1>
   417f6:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
            pageinfo[pn].owner = PO_FREE;
   417fa:	8b 45 bc             	mov    -0x44(%rbp),%eax
   417fd:	48 98                	cltq   
   417ff:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41803:	48 8d 05 36 26 01 00 	lea    0x12636(%rip),%rax        # 53e40 <pageinfo>
   4180a:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
        }
        
        if (pt_l1_1) {
   4180e:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
   41813:	74 33                	je     41848 <exception+0xaf3>
            int pn = PAGENUMBER(pt_l1_1);
   41815:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   41819:	48 c1 e8 0c          	shr    $0xc,%rax
   4181d:	89 45 b8             	mov    %eax,-0x48(%rbp)
            pageinfo[pn].refcount = 0;
   41820:	8b 45 b8             	mov    -0x48(%rbp),%eax
   41823:	48 98                	cltq   
   41825:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41829:	48 8d 05 11 26 01 00 	lea    0x12611(%rip),%rax        # 53e41 <pageinfo+0x1>
   41830:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
            pageinfo[pn].owner = PO_FREE;
   41834:	8b 45 b8             	mov    -0x48(%rbp),%eax
   41837:	48 98                	cltq   
   41839:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4183d:	48 8d 05 fc 25 01 00 	lea    0x125fc(%rip),%rax        # 53e40 <pageinfo>
   41844:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
        }
        
        // Free L2 page table
        int pn_l2 = PAGENUMBER(pt_l2);
   41848:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4184c:	48 c1 e8 0c          	shr    $0xc,%rax
   41850:	89 45 b4             	mov    %eax,-0x4c(%rbp)
        pageinfo[pn_l2].refcount = 0;
   41853:	8b 45 b4             	mov    -0x4c(%rbp),%eax
   41856:	48 98                	cltq   
   41858:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4185c:	48 8d 05 de 25 01 00 	lea    0x125de(%rip),%rax        # 53e41 <pageinfo+0x1>
   41863:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
        pageinfo[pn_l2].owner = PO_FREE;
   41867:	8b 45 b4             	mov    -0x4c(%rbp),%eax
   4186a:	48 98                	cltq   
   4186c:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41870:	48 8d 05 c9 25 01 00 	lea    0x125c9(%rip),%rax        # 53e40 <pageinfo>
   41877:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
        
        // Free L3 page table
        int pn_l3 = PAGENUMBER(pt_l3);
   4187b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4187f:	48 c1 e8 0c          	shr    $0xc,%rax
   41883:	89 45 b0             	mov    %eax,-0x50(%rbp)
        pageinfo[pn_l3].refcount = 0;
   41886:	8b 45 b0             	mov    -0x50(%rbp),%eax
   41889:	48 98                	cltq   
   4188b:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4188f:	48 8d 05 ab 25 01 00 	lea    0x125ab(%rip),%rax        # 53e41 <pageinfo+0x1>
   41896:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
        pageinfo[pn_l3].owner = PO_FREE;
   4189a:	8b 45 b0             	mov    -0x50(%rbp),%eax
   4189d:	48 98                	cltq   
   4189f:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   418a3:	48 8d 05 96 25 01 00 	lea    0x12596(%rip),%rax        # 53e40 <pageinfo>
   418aa:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
        
        // Free L4 page table
        int pn_l4 = PAGENUMBER(pt_l4);
   418ae:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   418b2:	48 c1 e8 0c          	shr    $0xc,%rax
   418b6:	89 45 ac             	mov    %eax,-0x54(%rbp)
        pageinfo[pn_l4].refcount = 0;
   418b9:	8b 45 ac             	mov    -0x54(%rbp),%eax
   418bc:	48 98                	cltq   
   418be:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   418c2:	48 8d 05 78 25 01 00 	lea    0x12578(%rip),%rax        # 53e41 <pageinfo+0x1>
   418c9:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
        pageinfo[pn_l4].owner = PO_FREE;
   418cd:	8b 45 ac             	mov    -0x54(%rbp),%eax
   418d0:	48 98                	cltq   
   418d2:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   418d6:	48 8d 05 63 25 01 00 	lea    0x12563(%rip),%rax        # 53e40 <pageinfo>
   418dd:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
        
        // Mark process as free
        current->p_state = P_FREE;
   418e1:	48 8b 05 18 17 01 00 	mov    0x11718(%rip),%rax        # 53000 <current>
   418e8:	c7 80 c8 00 00 00 00 	movl   $0x0,0xc8(%rax)
   418ef:	00 00 00 
        schedule();
   418f2:	e8 0d 04 00 00       	call   41d04 <schedule>
        break;
   418f7:	e9 e0 03 00 00       	jmp    41cdc <exception+0xf87>
    }
    case INT_SYS_PANIC:
        // rdi stores pointer for msg string
        {
            char msg[160];
            uintptr_t addr = current->p_registers.reg_rdi;
   418fc:	48 8b 05 fd 16 01 00 	mov    0x116fd(%rip),%rax        # 53000 <current>
   41903:	48 8b 40 38          	mov    0x38(%rax),%rax
   41907:	48 89 85 20 ff ff ff 	mov    %rax,-0xe0(%rbp)
            if ((void *)addr == NULL)
   4190e:	48 83 bd 20 ff ff ff 	cmpq   $0x0,-0xe0(%rbp)
   41915:	00 
   41916:	75 0f                	jne    41927 <exception+0xbd2>
                panic(NULL);
   41918:	bf 00 00 00 00       	mov    $0x0,%edi
   4191d:	b8 00 00 00 00       	mov    $0x0,%eax
   41922:	e8 a8 1f 00 00       	call   438cf <panic>
            vamapping map = virtual_memory_lookup(current->p_pagetable, addr);
   41927:	48 8b 05 d2 16 01 00 	mov    0x116d2(%rip),%rax        # 53000 <current>
   4192e:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   41935:	48 8d 85 b8 fe ff ff 	lea    -0x148(%rbp),%rax
   4193c:	48 8b 95 20 ff ff ff 	mov    -0xe0(%rbp),%rdx
   41943:	48 89 ce             	mov    %rcx,%rsi
   41946:	48 89 c7             	mov    %rax,%rdi
   41949:	e8 39 28 00 00       	call   44187 <virtual_memory_lookup>
            memcpy(msg, (void *)map.pa, 160);
   4194e:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
   41955:	48 89 c1             	mov    %rax,%rcx
   41958:	48 8d 85 00 fe ff ff 	lea    -0x200(%rbp),%rax
   4195f:	ba a0 00 00 00       	mov    $0xa0,%edx
   41964:	48 89 ce             	mov    %rcx,%rsi
   41967:	48 89 c7             	mov    %rax,%rdi
   4196a:	e8 db 2d 00 00       	call   4474a <memcpy>
            panic(msg);
   4196f:	48 8d 85 00 fe ff ff 	lea    -0x200(%rbp),%rax
   41976:	48 89 c7             	mov    %rax,%rdi
   41979:	b8 00 00 00 00       	mov    $0x0,%eax
   4197e:	e8 4c 1f 00 00       	call   438cf <panic>
        }
        panic(NULL);
        break; // will not be reached

    case INT_SYS_GETPID:
        current->p_registers.reg_rax = current->p_pid;
   41983:	48 8b 05 76 16 01 00 	mov    0x11676(%rip),%rax        # 53000 <current>
   4198a:	8b 10                	mov    (%rax),%edx
   4198c:	48 8b 05 6d 16 01 00 	mov    0x1166d(%rip),%rax        # 53000 <current>
   41993:	48 63 d2             	movslq %edx,%rdx
   41996:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   4199a:	e9 3d 03 00 00       	jmp    41cdc <exception+0xf87>

    case INT_SYS_YIELD:
        schedule();
   4199f:	e8 60 03 00 00       	call   41d04 <schedule>
        break; /* will not be reached */
   419a4:	e9 33 03 00 00       	jmp    41cdc <exception+0xf87>

    case INT_SYS_PAGE_ALLOC:
    {
        uintptr_t addr = current->p_registers.reg_rdi;
   419a9:	48 8b 05 50 16 01 00 	mov    0x11650(%rip),%rax        # 53000 <current>
   419b0:	48 8b 40 38          	mov    0x38(%rax),%rax
   419b4:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)

        if ((addr & 0xFFF) != 0)
   419bb:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
   419c2:	25 ff 0f 00 00       	and    $0xfff,%eax
   419c7:	48 85 c0             	test   %rax,%rax
   419ca:	74 14                	je     419e0 <exception+0xc8b>
        { // Check if page-aligned
            current->p_registers.reg_rax = -1;
   419cc:	48 8b 05 2d 16 01 00 	mov    0x1162d(%rip),%rax        # 53000 <current>
   419d3:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   419da:	ff 
            break;
   419db:	e9 fc 02 00 00       	jmp    41cdc <exception+0xf87>
        }
        if (addr < PROC_START_ADDR && addr != CONSOLE_ADDR)
   419e0:	48 81 bd 40 ff ff ff 	cmpq   $0xfffff,-0xc0(%rbp)
   419e7:	ff ff 0f 00 
   419eb:	77 24                	ja     41a11 <exception+0xcbc>
   419ed:	48 8d 05 0c 66 07 00 	lea    0x7660c(%rip),%rax        # b8000 <console>
   419f4:	48 39 85 40 ff ff ff 	cmp    %rax,-0xc0(%rbp)
   419fb:	74 14                	je     41a11 <exception+0xcbc>
        {
            current->p_registers.reg_rax = -1;
   419fd:	48 8b 05 fc 15 01 00 	mov    0x115fc(%rip),%rax        # 53000 <current>
   41a04:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   41a0b:	ff 
            break;
   41a0c:	e9 cb 02 00 00       	jmp    41cdc <exception+0xf87>
        }
        // Check if address is below max virtual memory size
        if (addr >= MEMSIZE_VIRTUAL)
   41a11:	48 81 bd 40 ff ff ff 	cmpq   $0x2fffff,-0xc0(%rbp)
   41a18:	ff ff 2f 00 
   41a1c:	76 14                	jbe    41a32 <exception+0xcdd>
        {
            current->p_registers.reg_rax = -1;
   41a1e:	48 8b 05 db 15 01 00 	mov    0x115db(%rip),%rax        # 53000 <current>
   41a25:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   41a2c:	ff 
            break;
   41a2d:	e9 aa 02 00 00       	jmp    41cdc <exception+0xf87>
        }
        // if the page already exists
        vamapping vam = virtual_memory_lookup(current->p_pagetable, addr);
   41a32:	48 8b 05 c7 15 01 00 	mov    0x115c7(%rip),%rax        # 53000 <current>
   41a39:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   41a40:	48 8d 85 a0 fe ff ff 	lea    -0x160(%rbp),%rax
   41a47:	48 8b 95 40 ff ff ff 	mov    -0xc0(%rbp),%rdx
   41a4e:	48 89 ce             	mov    %rcx,%rsi
   41a51:	48 89 c7             	mov    %rax,%rdi
   41a54:	e8 2e 27 00 00       	call   44187 <virtual_memory_lookup>
        if (vam.pn >= 0)
   41a59:	8b 85 a0 fe ff ff    	mov    -0x160(%rbp),%eax
   41a5f:	85 c0                	test   %eax,%eax
   41a61:	78 14                	js     41a77 <exception+0xd22>
        {
            current->p_registers.reg_rax = -1;
   41a63:	48 8b 05 96 15 01 00 	mov    0x11596(%rip),%rax        # 53000 <current>
   41a6a:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   41a71:	ff 
            break;
   41a72:	e9 65 02 00 00       	jmp    41cdc <exception+0xf87>
        }

        int i = find_free_page();
   41a77:	b8 00 00 00 00       	mov    $0x0,%eax
   41a7c:	e8 e5 e8 ff ff       	call   40366 <find_free_page>
   41a81:	89 85 3c ff ff ff    	mov    %eax,-0xc4(%rbp)
        if (i == -1)
   41a87:	83 bd 3c ff ff ff ff 	cmpl   $0xffffffff,-0xc4(%rbp)
   41a8e:	75 32                	jne    41ac2 <exception+0xd6d>
        {
            current->p_registers.reg_rax = -1;
   41a90:	48 8b 05 69 15 01 00 	mov    0x11569(%rip),%rax        # 53000 <current>
   41a97:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   41a9e:	ff 
            console_printf(CPOS(24, 0), 0x0C00, "Out of physical memory!\n");
   41a9f:	48 8d 05 ea 3d 00 00 	lea    0x3dea(%rip),%rax        # 45890 <console_clear+0x8b>
   41aa6:	48 89 c2             	mov    %rax,%rdx
   41aa9:	be 00 0c 00 00       	mov    $0xc00,%esi
   41aae:	bf 80 07 00 00       	mov    $0x780,%edi
   41ab3:	b8 00 00 00 00       	mov    $0x0,%eax
   41ab8:	e8 d2 3b 00 00       	call   4568f <console_printf>

            // we need to exit or smthn here!
            break;
   41abd:	e9 1a 02 00 00       	jmp    41cdc <exception+0xf87>
        }
        uintptr_t physaddr = PAGEADDRESS(i);
   41ac2:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
   41ac8:	48 98                	cltq   
   41aca:	48 c1 e0 0c          	shl    $0xc,%rax
   41ace:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
        int r = assign_physical_page(physaddr, current->p_pid);
   41ad5:	48 8b 05 24 15 01 00 	mov    0x11524(%rip),%rax        # 53000 <current>
   41adc:	8b 00                	mov    (%rax),%eax
   41ade:	0f be d0             	movsbl %al,%edx
   41ae1:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
   41ae8:	89 d6                	mov    %edx,%esi
   41aea:	48 89 c7             	mov    %rax,%rdi
   41aed:	e8 14 f0 ff ff       	call   40b06 <assign_physical_page>
   41af2:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%rbp)
        if (r >= 0)
   41af8:	83 bd 2c ff ff ff 00 	cmpl   $0x0,-0xd4(%rbp)
   41aff:	78 48                	js     41b49 <exception+0xdf4>
        {
            virtual_memory_map(current->p_pagetable, addr, physaddr,
   41b01:	48 8b 05 f8 14 01 00 	mov    0x114f8(%rip),%rax        # 53000 <current>
   41b08:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   41b0f:	48 8b 95 30 ff ff ff 	mov    -0xd0(%rbp),%rdx
   41b16:	48 8b b5 40 ff ff ff 	mov    -0xc0(%rbp),%rsi
   41b1d:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   41b23:	b9 00 10 00 00       	mov    $0x1000,%ecx
   41b28:	48 89 c7             	mov    %rax,%rdi
   41b2b:	e8 13 22 00 00       	call   43d43 <virtual_memory_map>
                               PAGESIZE, PTE_P | PTE_W | PTE_U);
            current->p_registers.reg_rax = r;
   41b30:	48 8b 05 c9 14 01 00 	mov    0x114c9(%rip),%rax        # 53000 <current>
   41b37:	8b 95 2c ff ff ff    	mov    -0xd4(%rbp),%edx
   41b3d:	48 63 d2             	movslq %edx,%rdx
   41b40:	48 89 50 08          	mov    %rdx,0x8(%rax)
        }
        else
        {
            panic("NOPE");
        }
        break;
   41b44:	e9 93 01 00 00       	jmp    41cdc <exception+0xf87>
            panic("NOPE");
   41b49:	48 8d 05 59 3d 00 00 	lea    0x3d59(%rip),%rax        # 458a9 <console_clear+0xa4>
   41b50:	48 89 c7             	mov    %rax,%rdi
   41b53:	b8 00 00 00 00       	mov    $0x0,%eax
   41b58:	e8 72 1d 00 00       	call   438cf <panic>
    }

    case INT_SYS_MAPPING:
    {
        syscall_mapping(current);
   41b5d:	48 8b 05 9c 14 01 00 	mov    0x1149c(%rip),%rax        # 53000 <current>
   41b64:	48 89 c7             	mov    %rax,%rdi
   41b67:	e8 44 f0 ff ff       	call   40bb0 <syscall_mapping>
        break;
   41b6c:	e9 6b 01 00 00       	jmp    41cdc <exception+0xf87>
    }

    case INT_SYS_MEM_TOG:
    {
        syscall_mem_tog(current);
   41b71:	48 8b 05 88 14 01 00 	mov    0x11488(%rip),%rax        # 53000 <current>
   41b78:	48 89 c7             	mov    %rax,%rdi
   41b7b:	e8 fd f0 ff ff       	call   40c7d <syscall_mem_tog>
        break;
   41b80:	e9 57 01 00 00       	jmp    41cdc <exception+0xf87>
    }

    case INT_TIMER:
        ++ticks;
   41b85:	8b 05 95 22 01 00    	mov    0x12295(%rip),%eax        # 53e20 <ticks>
   41b8b:	83 c0 01             	add    $0x1,%eax
   41b8e:	89 05 8c 22 01 00    	mov    %eax,0x1228c(%rip)        # 53e20 <ticks>
        schedule();
   41b94:	e8 6b 01 00 00       	call   41d04 <schedule>
        break; /* will not be reached */
   41b99:	e9 3e 01 00 00       	jmp    41cdc <exception+0xf87>
    return val;
}

static inline uintptr_t rcr2(void) {
    uintptr_t val;
    asm volatile("movq %%cr2,%0" : "=r" (val));
   41b9e:	0f 20 d0             	mov    %cr2,%rax
   41ba1:	48 89 85 00 ff ff ff 	mov    %rax,-0x100(%rbp)
    return val;
   41ba8:	48 8b 85 00 ff ff ff 	mov    -0x100(%rbp),%rax

    case INT_PAGEFAULT:
    {
        // Analyze faulting address and access type.
        uintptr_t addr = rcr2();
   41baf:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
        const char *operation = reg->reg_err & PFERR_WRITE
   41bb6:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   41bbd:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   41bc4:	83 e0 02             	and    $0x2,%eax
                                    ? "write"
                                    : "read";
   41bc7:	48 85 c0             	test   %rax,%rax
   41bca:	74 09                	je     41bd5 <exception+0xe80>
   41bcc:	48 8d 05 db 3c 00 00 	lea    0x3cdb(%rip),%rax        # 458ae <console_clear+0xa9>
   41bd3:	eb 07                	jmp    41bdc <exception+0xe87>
   41bd5:	48 8d 05 d8 3c 00 00 	lea    0x3cd8(%rip),%rax        # 458b4 <console_clear+0xaf>
        const char *operation = reg->reg_err & PFERR_WRITE
   41bdc:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
        const char *problem = reg->reg_err & PFERR_PRESENT
   41be3:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   41bea:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   41bf1:	83 e0 01             	and    $0x1,%eax
                                  ? "protection problem"
                                  : "missing page";
   41bf4:	48 85 c0             	test   %rax,%rax
   41bf7:	74 09                	je     41c02 <exception+0xead>
   41bf9:	48 8d 05 b9 3c 00 00 	lea    0x3cb9(%rip),%rax        # 458b9 <console_clear+0xb4>
   41c00:	eb 07                	jmp    41c09 <exception+0xeb4>
   41c02:	48 8d 05 c3 3c 00 00 	lea    0x3cc3(%rip),%rax        # 458cc <console_clear+0xc7>
        const char *problem = reg->reg_err & PFERR_PRESENT
   41c09:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)

        if (!(reg->reg_err & PFERR_USER))
   41c10:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   41c17:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   41c1e:	83 e0 04             	and    $0x4,%eax
   41c21:	48 85 c0             	test   %rax,%rax
   41c24:	75 3d                	jne    41c63 <exception+0xf0e>
        {
            panic("Kernel page fault for %p (%s %s, rip=%p)!\n",
   41c26:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   41c2d:	48 8b b0 98 00 00 00 	mov    0x98(%rax),%rsi
   41c34:	48 8b 8d 08 ff ff ff 	mov    -0xf8(%rbp),%rcx
   41c3b:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
   41c42:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
   41c49:	49 89 f0             	mov    %rsi,%r8
   41c4c:	48 89 c6             	mov    %rax,%rsi
   41c4f:	48 8d 05 8a 3c 00 00 	lea    0x3c8a(%rip),%rax        # 458e0 <console_clear+0xdb>
   41c56:	48 89 c7             	mov    %rax,%rdi
   41c59:	b8 00 00 00 00       	mov    $0x0,%eax
   41c5e:	e8 6c 1c 00 00       	call   438cf <panic>
                  addr, operation, problem, reg->reg_rip);
        }
        console_printf(CPOS(24, 0), 0x0C00,
   41c63:	48 8b 85 f8 fd ff ff 	mov    -0x208(%rbp),%rax
   41c6a:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
                       "Process %d page fault for %p (%s %s, rip=%p)!\n",
                       current->p_pid, addr, operation, problem, reg->reg_rip);
   41c71:	48 8b 05 88 13 01 00 	mov    0x11388(%rip),%rax        # 53000 <current>
        console_printf(CPOS(24, 0), 0x0C00,
   41c78:	8b 00                	mov    (%rax),%eax
   41c7a:	48 8b b5 10 ff ff ff 	mov    -0xf0(%rbp),%rsi
   41c81:	48 8b 8d 18 ff ff ff 	mov    -0xe8(%rbp),%rcx
   41c88:	52                   	push   %rdx
   41c89:	ff b5 08 ff ff ff    	push   -0xf8(%rbp)
   41c8f:	49 89 f1             	mov    %rsi,%r9
   41c92:	49 89 c8             	mov    %rcx,%r8
   41c95:	89 c1                	mov    %eax,%ecx
   41c97:	48 8d 05 72 3c 00 00 	lea    0x3c72(%rip),%rax        # 45910 <console_clear+0x10b>
   41c9e:	48 89 c2             	mov    %rax,%rdx
   41ca1:	be 00 0c 00 00       	mov    $0xc00,%esi
   41ca6:	bf 80 07 00 00       	mov    $0x780,%edi
   41cab:	b8 00 00 00 00       	mov    $0x0,%eax
   41cb0:	e8 da 39 00 00       	call   4568f <console_printf>
   41cb5:	48 83 c4 10          	add    $0x10,%rsp
        current->p_state = P_BROKEN;
   41cb9:	48 8b 05 40 13 01 00 	mov    0x11340(%rip),%rax        # 53000 <current>
   41cc0:	c7 80 c8 00 00 00 03 	movl   $0x3,0xc8(%rax)
   41cc7:	00 00 00 
        break;
   41cca:	eb 10                	jmp    41cdc <exception+0xf87>
    }

    default:
        default_exception(current);
   41ccc:	48 8b 05 2d 13 01 00 	mov    0x1132d(%rip),%rax        # 53000 <current>
   41cd3:	48 89 c7             	mov    %rax,%rdi
   41cd6:	e8 1d 1d 00 00       	call   439f8 <default_exception>
        break; /* will not be reached */
   41cdb:	90                   	nop
    }

    // Return to the current process (or run something else).
    if (current->p_state == P_RUNNABLE)
   41cdc:	48 8b 05 1d 13 01 00 	mov    0x1131d(%rip),%rax        # 53000 <current>
   41ce3:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   41ce9:	83 f8 01             	cmp    $0x1,%eax
   41cec:	75 0f                	jne    41cfd <exception+0xfa8>
    {
        run(current);
   41cee:	48 8b 05 0b 13 01 00 	mov    0x1130b(%rip),%rax        # 53000 <current>
   41cf5:	48 89 c7             	mov    %rax,%rdi
   41cf8:	e8 86 00 00 00       	call   41d83 <run>
    }
    else
    {
        schedule();
   41cfd:	e8 02 00 00 00       	call   41d04 <schedule>
    }
}
   41d02:	c9                   	leave  
   41d03:	c3                   	ret    

0000000000041d04 <schedule>:
// schedule
//    Pick the next process to run and then run it.
//    If there are no runnable processes, spins forever.

void schedule(void)
{
   41d04:	f3 0f 1e fa          	endbr64 
   41d08:	55                   	push   %rbp
   41d09:	48 89 e5             	mov    %rsp,%rbp
   41d0c:	48 83 ec 10          	sub    $0x10,%rsp
    pid_t pid = current->p_pid;
   41d10:	48 8b 05 e9 12 01 00 	mov    0x112e9(%rip),%rax        # 53000 <current>
   41d17:	8b 00                	mov    (%rax),%eax
   41d19:	89 45 fc             	mov    %eax,-0x4(%rbp)
    while (1)
    {
        pid = (pid + 1) % NPROC;
   41d1c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41d1f:	83 c0 01             	add    $0x1,%eax
   41d22:	99                   	cltd   
   41d23:	c1 ea 1c             	shr    $0x1c,%edx
   41d26:	01 d0                	add    %edx,%eax
   41d28:	83 e0 0f             	and    $0xf,%eax
   41d2b:	29 d0                	sub    %edx,%eax
   41d2d:	89 45 fc             	mov    %eax,-0x4(%rbp)
        if (processes[pid].p_state == P_RUNNABLE)
   41d30:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41d33:	48 63 d0             	movslq %eax,%rdx
   41d36:	48 89 d0             	mov    %rdx,%rax
   41d39:	48 c1 e0 03          	shl    $0x3,%rax
   41d3d:	48 29 d0             	sub    %rdx,%rax
   41d40:	48 c1 e0 05          	shl    $0x5,%rax
   41d44:	48 89 c2             	mov    %rax,%rdx
   41d47:	48 8d 05 9a 13 01 00 	lea    0x1139a(%rip),%rax        # 530e8 <processes+0xc8>
   41d4e:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   41d51:	83 f8 01             	cmp    $0x1,%eax
   41d54:	75 26                	jne    41d7c <schedule+0x78>
        {
            run(&processes[pid]);
   41d56:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41d59:	48 63 d0             	movslq %eax,%rdx
   41d5c:	48 89 d0             	mov    %rdx,%rax
   41d5f:	48 c1 e0 03          	shl    $0x3,%rax
   41d63:	48 29 d0             	sub    %rdx,%rax
   41d66:	48 c1 e0 05          	shl    $0x5,%rax
   41d6a:	48 8d 15 af 12 01 00 	lea    0x112af(%rip),%rdx        # 53020 <processes>
   41d71:	48 01 d0             	add    %rdx,%rax
   41d74:	48 89 c7             	mov    %rax,%rdi
   41d77:	e8 07 00 00 00       	call   41d83 <run>
        }
        // If Control-C was typed, exit the virtual machine.
        check_keyboard();
   41d7c:	e8 ec 19 00 00       	call   4376d <check_keyboard>
        pid = (pid + 1) % NPROC;
   41d81:	eb 99                	jmp    41d1c <schedule+0x18>

0000000000041d83 <run>:
//    `p->p_registers` using the `popal`, `popl`, and `iret` instructions.
//
//    As a side effect, sets `current = p`.

void run(proc *p)
{
   41d83:	f3 0f 1e fa          	endbr64 
   41d87:	55                   	push   %rbp
   41d88:	48 89 e5             	mov    %rsp,%rbp
   41d8b:	48 83 ec 10          	sub    $0x10,%rsp
   41d8f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    assert(p->p_state == P_RUNNABLE);
   41d93:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41d97:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   41d9d:	83 f8 01             	cmp    $0x1,%eax
   41da0:	74 1e                	je     41dc0 <run+0x3d>
   41da2:	48 8d 05 43 3c 00 00 	lea    0x3c43(%rip),%rax        # 459ec <console_clear+0x1e7>
   41da9:	48 89 c2             	mov    %rax,%rdx
   41dac:	be 60 03 00 00       	mov    $0x360,%esi
   41db1:	48 8d 05 c8 3a 00 00 	lea    0x3ac8(%rip),%rax        # 45880 <console_clear+0x7b>
   41db8:	48 89 c7             	mov    %rax,%rdi
   41dbb:	e8 ff 1b 00 00       	call   439bf <assert_fail>
    current = p;
   41dc0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41dc4:	48 89 05 35 12 01 00 	mov    %rax,0x11235(%rip)        # 53000 <current>

    // Load the process's current pagetable.
    set_pagetable(p->p_pagetable);
   41dcb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41dcf:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   41dd6:	48 89 c7             	mov    %rax,%rdi
   41dd9:	e8 f3 1d 00 00       	call   43bd1 <set_pagetable>

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(&p->p_registers);
   41dde:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41de2:	48 83 c0 08          	add    $0x8,%rax
   41de6:	48 89 c7             	mov    %rax,%rdi
   41de9:	e8 d5 e2 ff ff       	call   400c3 <exception_return>

0000000000041dee <pageinfo_init>:

// pageinfo_init
//    Initialize the `pageinfo[]` array.

void pageinfo_init(void)
{
   41dee:	f3 0f 1e fa          	endbr64 
   41df2:	55                   	push   %rbp
   41df3:	48 89 e5             	mov    %rsp,%rbp
   41df6:	48 83 ec 10          	sub    $0x10,%rsp
    extern char end[];

    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE)
   41dfa:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   41e01:	00 
   41e02:	e9 93 00 00 00       	jmp    41e9a <pageinfo_init+0xac>
    {
        int owner;
        if (physical_memory_isreserved(addr))
   41e07:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41e0b:	48 89 c7             	mov    %rax,%rdi
   41e0e:	e8 94 11 00 00       	call   42fa7 <physical_memory_isreserved>
   41e13:	85 c0                	test   %eax,%eax
   41e15:	74 09                	je     41e20 <pageinfo_init+0x32>
        {
            owner = PO_RESERVED;
   41e17:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%rbp)
   41e1e:	eb 31                	jmp    41e51 <pageinfo_init+0x63>
        }
        else if ((addr >= KERNEL_START_ADDR && addr < (uintptr_t)end) || addr == KERNEL_STACK_TOP - PAGESIZE)
   41e20:	48 81 7d f8 ff ff 03 	cmpq   $0x3ffff,-0x8(%rbp)
   41e27:	00 
   41e28:	76 0d                	jbe    41e37 <pageinfo_init+0x49>
   41e2a:	48 8d 05 d7 a1 01 00 	lea    0x1a1d7(%rip),%rax        # 5c008 <end>
   41e31:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41e35:	72 0a                	jb     41e41 <pageinfo_init+0x53>
   41e37:	48 81 7d f8 00 f0 07 	cmpq   $0x7f000,-0x8(%rbp)
   41e3e:	00 
   41e3f:	75 09                	jne    41e4a <pageinfo_init+0x5c>
        {
            owner = PO_KERNEL;
   41e41:	c7 45 f4 fe ff ff ff 	movl   $0xfffffffe,-0xc(%rbp)
   41e48:	eb 07                	jmp    41e51 <pageinfo_init+0x63>
        }
        else
        {
            owner = PO_FREE;
   41e4a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
        }
        pageinfo[PAGENUMBER(addr)].owner = owner;
   41e51:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41e55:	48 c1 e8 0c          	shr    $0xc,%rax
   41e59:	89 c2                	mov    %eax,%edx
   41e5b:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41e5e:	89 c1                	mov    %eax,%ecx
   41e60:	48 63 c2             	movslq %edx,%rax
   41e63:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41e67:	48 8d 05 d2 1f 01 00 	lea    0x11fd2(%rip),%rax        # 53e40 <pageinfo>
   41e6e:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
        pageinfo[PAGENUMBER(addr)].refcount = (owner != PO_FREE);
   41e71:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   41e75:	0f 95 c2             	setne  %dl
   41e78:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41e7c:	48 c1 e8 0c          	shr    $0xc,%rax
   41e80:	89 d1                	mov    %edx,%ecx
   41e82:	48 98                	cltq   
   41e84:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41e88:	48 8d 05 b2 1f 01 00 	lea    0x11fb2(%rip),%rax        # 53e41 <pageinfo+0x1>
   41e8f:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE)
   41e92:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41e99:	00 
   41e9a:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   41ea1:	00 
   41ea2:	0f 86 5f ff ff ff    	jbe    41e07 <pageinfo_init+0x19>
    }
}
   41ea8:	90                   	nop
   41ea9:	90                   	nop
   41eaa:	c9                   	leave  
   41eab:	c3                   	ret    

0000000000041eac <check_page_table_mappings>:
// check_page_table_mappings
//    Check operating system invariants about kernel mappings for page
//    table `pt`. Panic if any of the invariants are false.

void check_page_table_mappings(x86_64_pagetable *pt)
{
   41eac:	f3 0f 1e fa          	endbr64 
   41eb0:	55                   	push   %rbp
   41eb1:	48 89 e5             	mov    %rsp,%rbp
   41eb4:	48 83 ec 50          	sub    $0x50,%rsp
   41eb8:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    extern char start_data[], end[];
    assert(PTE_ADDR(pt) == (uintptr_t)pt);
   41ebc:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   41ec0:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   41ec6:	48 89 c2             	mov    %rax,%rdx
   41ec9:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   41ecd:	48 39 c2             	cmp    %rax,%rdx
   41ed0:	74 1e                	je     41ef0 <check_page_table_mappings+0x44>
   41ed2:	48 8d 05 2c 3b 00 00 	lea    0x3b2c(%rip),%rax        # 45a05 <console_clear+0x200>
   41ed9:	48 89 c2             	mov    %rax,%rdx
   41edc:	be 90 03 00 00       	mov    $0x390,%esi
   41ee1:	48 8d 05 98 39 00 00 	lea    0x3998(%rip),%rax        # 45880 <console_clear+0x7b>
   41ee8:	48 89 c7             	mov    %rax,%rdi
   41eeb:	e8 cf 1a 00 00       	call   439bf <assert_fail>

    // kernel memory is identity mapped; data is writable
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t)end;
   41ef0:	48 c7 45 f8 00 00 04 	movq   $0x40000,-0x8(%rbp)
   41ef7:	00 
   41ef8:	e9 b5 00 00 00       	jmp    41fb2 <check_page_table_mappings+0x106>
         va += PAGESIZE)
    {
        vamapping vam = virtual_memory_lookup(pt, va);
   41efd:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   41f01:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   41f05:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   41f09:	48 89 ce             	mov    %rcx,%rsi
   41f0c:	48 89 c7             	mov    %rax,%rdi
   41f0f:	e8 73 22 00 00       	call   44187 <virtual_memory_lookup>
        if (vam.pa != va)
   41f14:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41f18:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41f1c:	74 2c                	je     41f4a <check_page_table_mappings+0x9e>
        {
            console_printf(CPOS(22, 0), 0xC000, "%p vs %p\n", va, vam.pa);
   41f1e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   41f22:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41f26:	49 89 d0             	mov    %rdx,%r8
   41f29:	48 89 c1             	mov    %rax,%rcx
   41f2c:	48 8d 05 f0 3a 00 00 	lea    0x3af0(%rip),%rax        # 45a23 <console_clear+0x21e>
   41f33:	48 89 c2             	mov    %rax,%rdx
   41f36:	be 00 c0 00 00       	mov    $0xc000,%esi
   41f3b:	bf e0 06 00 00       	mov    $0x6e0,%edi
   41f40:	b8 00 00 00 00       	mov    $0x0,%eax
   41f45:	e8 45 37 00 00       	call   4568f <console_printf>
        }
        assert(vam.pa == va);
   41f4a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41f4e:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41f52:	74 1e                	je     41f72 <check_page_table_mappings+0xc6>
   41f54:	48 8d 05 d2 3a 00 00 	lea    0x3ad2(%rip),%rax        # 45a2d <console_clear+0x228>
   41f5b:	48 89 c2             	mov    %rax,%rdx
   41f5e:	be 9b 03 00 00       	mov    $0x39b,%esi
   41f63:	48 8d 05 16 39 00 00 	lea    0x3916(%rip),%rax        # 45880 <console_clear+0x7b>
   41f6a:	48 89 c7             	mov    %rax,%rdi
   41f6d:	e8 4d 1a 00 00       	call   439bf <assert_fail>
        if (va >= (uintptr_t)start_data)
   41f72:	48 8d 05 87 50 00 00 	lea    0x5087(%rip),%rax        # 47000 <disp_global>
   41f79:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41f7d:	72 2b                	jb     41faa <check_page_table_mappings+0xfe>
        {
            assert(vam.perm & PTE_W);
   41f7f:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41f82:	48 98                	cltq   
   41f84:	83 e0 02             	and    $0x2,%eax
   41f87:	48 85 c0             	test   %rax,%rax
   41f8a:	75 1e                	jne    41faa <check_page_table_mappings+0xfe>
   41f8c:	48 8d 05 a7 3a 00 00 	lea    0x3aa7(%rip),%rax        # 45a3a <console_clear+0x235>
   41f93:	48 89 c2             	mov    %rax,%rdx
   41f96:	be 9e 03 00 00       	mov    $0x39e,%esi
   41f9b:	48 8d 05 de 38 00 00 	lea    0x38de(%rip),%rax        # 45880 <console_clear+0x7b>
   41fa2:	48 89 c7             	mov    %rax,%rdi
   41fa5:	e8 15 1a 00 00       	call   439bf <assert_fail>
         va += PAGESIZE)
   41faa:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41fb1:	00 
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t)end;
   41fb2:	48 8d 05 4f a0 01 00 	lea    0x1a04f(%rip),%rax        # 5c008 <end>
   41fb9:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41fbd:	0f 82 3a ff ff ff    	jb     41efd <check_page_table_mappings+0x51>
        }
    }

    // kernel stack is identity mapped and writable
    uintptr_t kstack = KERNEL_STACK_TOP - PAGESIZE;
   41fc3:	48 c7 45 f0 00 f0 07 	movq   $0x7f000,-0x10(%rbp)
   41fca:	00 
    vamapping vam = virtual_memory_lookup(pt, kstack);
   41fcb:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
   41fcf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   41fd3:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   41fd7:	48 89 ce             	mov    %rcx,%rsi
   41fda:	48 89 c7             	mov    %rax,%rdi
   41fdd:	e8 a5 21 00 00       	call   44187 <virtual_memory_lookup>
    assert(vam.pa == kstack);
   41fe2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41fe6:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   41fea:	74 1e                	je     4200a <check_page_table_mappings+0x15e>
   41fec:	48 8d 05 58 3a 00 00 	lea    0x3a58(%rip),%rax        # 45a4b <console_clear+0x246>
   41ff3:	48 89 c2             	mov    %rax,%rdx
   41ff6:	be a5 03 00 00       	mov    $0x3a5,%esi
   41ffb:	48 8d 05 7e 38 00 00 	lea    0x387e(%rip),%rax        # 45880 <console_clear+0x7b>
   42002:	48 89 c7             	mov    %rax,%rdi
   42005:	e8 b5 19 00 00       	call   439bf <assert_fail>
    assert(vam.perm & PTE_W);
   4200a:	8b 45 e8             	mov    -0x18(%rbp),%eax
   4200d:	48 98                	cltq   
   4200f:	83 e0 02             	and    $0x2,%eax
   42012:	48 85 c0             	test   %rax,%rax
   42015:	75 1e                	jne    42035 <check_page_table_mappings+0x189>
   42017:	48 8d 05 1c 3a 00 00 	lea    0x3a1c(%rip),%rax        # 45a3a <console_clear+0x235>
   4201e:	48 89 c2             	mov    %rax,%rdx
   42021:	be a6 03 00 00       	mov    $0x3a6,%esi
   42026:	48 8d 05 53 38 00 00 	lea    0x3853(%rip),%rax        # 45880 <console_clear+0x7b>
   4202d:	48 89 c7             	mov    %rax,%rdi
   42030:	e8 8a 19 00 00       	call   439bf <assert_fail>
}
   42035:	90                   	nop
   42036:	c9                   	leave  
   42037:	c3                   	ret    

0000000000042038 <check_page_table_ownership>:

static void check_page_table_ownership_level(x86_64_pagetable *pt, int level,
                                             int owner, int refcount);

void check_page_table_ownership(x86_64_pagetable *pt, pid_t pid)
{
   42038:	f3 0f 1e fa          	endbr64 
   4203c:	55                   	push   %rbp
   4203d:	48 89 e5             	mov    %rsp,%rbp
   42040:	48 83 ec 20          	sub    $0x20,%rsp
   42044:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   42048:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    // calculate expected reference count for page tables
    int owner = pid;
   4204b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   4204e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    int expected_refcount = 1;
   42051:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
    if (pt == kernel_pagetable)
   42058:	48 8b 05 a1 3f 01 00 	mov    0x13fa1(%rip),%rax        # 56000 <kernel_pagetable>
   4205f:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
   42063:	75 71                	jne    420d6 <check_page_table_ownership+0x9e>
    {
        owner = PO_KERNEL;
   42065:	c7 45 fc fe ff ff ff 	movl   $0xfffffffe,-0x4(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid)
   4206c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   42073:	eb 5b                	jmp    420d0 <check_page_table_ownership+0x98>
        {
            if (processes[xpid].p_state != P_FREE && processes[xpid].p_pagetable == kernel_pagetable)
   42075:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42078:	48 63 d0             	movslq %eax,%rdx
   4207b:	48 89 d0             	mov    %rdx,%rax
   4207e:	48 c1 e0 03          	shl    $0x3,%rax
   42082:	48 29 d0             	sub    %rdx,%rax
   42085:	48 c1 e0 05          	shl    $0x5,%rax
   42089:	48 89 c2             	mov    %rax,%rdx
   4208c:	48 8d 05 55 10 01 00 	lea    0x11055(%rip),%rax        # 530e8 <processes+0xc8>
   42093:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   42096:	85 c0                	test   %eax,%eax
   42098:	74 32                	je     420cc <check_page_table_ownership+0x94>
   4209a:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4209d:	48 63 d0             	movslq %eax,%rdx
   420a0:	48 89 d0             	mov    %rdx,%rax
   420a3:	48 c1 e0 03          	shl    $0x3,%rax
   420a7:	48 29 d0             	sub    %rdx,%rax
   420aa:	48 c1 e0 05          	shl    $0x5,%rax
   420ae:	48 89 c2             	mov    %rax,%rdx
   420b1:	48 8d 05 38 10 01 00 	lea    0x11038(%rip),%rax        # 530f0 <processes+0xd0>
   420b8:	48 8b 14 02          	mov    (%rdx,%rax,1),%rdx
   420bc:	48 8b 05 3d 3f 01 00 	mov    0x13f3d(%rip),%rax        # 56000 <kernel_pagetable>
   420c3:	48 39 c2             	cmp    %rax,%rdx
   420c6:	75 04                	jne    420cc <check_page_table_ownership+0x94>
            {
                ++expected_refcount;
   420c8:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid)
   420cc:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   420d0:	83 7d f4 0f          	cmpl   $0xf,-0xc(%rbp)
   420d4:	7e 9f                	jle    42075 <check_page_table_ownership+0x3d>
            }
        }
    }
    check_page_table_ownership_level(pt, 0, owner, expected_refcount);
   420d6:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   420d9:	8b 55 fc             	mov    -0x4(%rbp),%edx
   420dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   420e0:	be 00 00 00 00       	mov    $0x0,%esi
   420e5:	48 89 c7             	mov    %rax,%rdi
   420e8:	e8 03 00 00 00       	call   420f0 <check_page_table_ownership_level>
}
   420ed:	90                   	nop
   420ee:	c9                   	leave  
   420ef:	c3                   	ret    

00000000000420f0 <check_page_table_ownership_level>:

static void check_page_table_ownership_level(x86_64_pagetable *pt, int level,
                                             int owner, int refcount)
{
   420f0:	f3 0f 1e fa          	endbr64 
   420f4:	55                   	push   %rbp
   420f5:	48 89 e5             	mov    %rsp,%rbp
   420f8:	48 83 ec 30          	sub    $0x30,%rsp
   420fc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   42100:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   42103:	89 55 e0             	mov    %edx,-0x20(%rbp)
   42106:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    assert(PAGENUMBER(pt) < NPAGES);
   42109:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4210d:	48 c1 e8 0c          	shr    $0xc,%rax
   42111:	3d ff 01 00 00       	cmp    $0x1ff,%eax
   42116:	7e 1e                	jle    42136 <check_page_table_ownership_level+0x46>
   42118:	48 8d 05 3d 39 00 00 	lea    0x393d(%rip),%rax        # 45a5c <console_clear+0x257>
   4211f:	48 89 c2             	mov    %rax,%rdx
   42122:	be c6 03 00 00       	mov    $0x3c6,%esi
   42127:	48 8d 05 52 37 00 00 	lea    0x3752(%rip),%rax        # 45880 <console_clear+0x7b>
   4212e:	48 89 c7             	mov    %rax,%rdi
   42131:	e8 89 18 00 00       	call   439bf <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].owner == owner);
   42136:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4213a:	48 c1 e8 0c          	shr    $0xc,%rax
   4213e:	48 98                	cltq   
   42140:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   42144:	48 8d 05 f5 1c 01 00 	lea    0x11cf5(%rip),%rax        # 53e40 <pageinfo>
   4214b:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4214f:	0f be c0             	movsbl %al,%eax
   42152:	39 45 e0             	cmp    %eax,-0x20(%rbp)
   42155:	74 1e                	je     42175 <check_page_table_ownership_level+0x85>
   42157:	48 8d 05 1a 39 00 00 	lea    0x391a(%rip),%rax        # 45a78 <console_clear+0x273>
   4215e:	48 89 c2             	mov    %rax,%rdx
   42161:	be c7 03 00 00       	mov    $0x3c7,%esi
   42166:	48 8d 05 13 37 00 00 	lea    0x3713(%rip),%rax        # 45880 <console_clear+0x7b>
   4216d:	48 89 c7             	mov    %rax,%rdi
   42170:	e8 4a 18 00 00       	call   439bf <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].refcount == refcount);
   42175:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42179:	48 c1 e8 0c          	shr    $0xc,%rax
   4217d:	48 98                	cltq   
   4217f:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   42183:	48 8d 05 b7 1c 01 00 	lea    0x11cb7(%rip),%rax        # 53e41 <pageinfo+0x1>
   4218a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4218e:	0f be c0             	movsbl %al,%eax
   42191:	39 45 dc             	cmp    %eax,-0x24(%rbp)
   42194:	74 1e                	je     421b4 <check_page_table_ownership_level+0xc4>
   42196:	48 8d 05 03 39 00 00 	lea    0x3903(%rip),%rax        # 45aa0 <console_clear+0x29b>
   4219d:	48 89 c2             	mov    %rax,%rdx
   421a0:	be c8 03 00 00       	mov    $0x3c8,%esi
   421a5:	48 8d 05 d4 36 00 00 	lea    0x36d4(%rip),%rax        # 45880 <console_clear+0x7b>
   421ac:	48 89 c7             	mov    %rax,%rdi
   421af:	e8 0b 18 00 00       	call   439bf <assert_fail>
    if (level < 3)
   421b4:	83 7d e4 02          	cmpl   $0x2,-0x1c(%rbp)
   421b8:	7f 5b                	jg     42215 <check_page_table_ownership_level+0x125>
    {
        for (int index = 0; index < NPAGETABLEENTRIES; ++index)
   421ba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   421c1:	eb 49                	jmp    4220c <check_page_table_ownership_level+0x11c>
        {
            if (pt->entry[index])
   421c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   421c7:	8b 55 fc             	mov    -0x4(%rbp),%edx
   421ca:	48 63 d2             	movslq %edx,%rdx
   421cd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   421d1:	48 85 c0             	test   %rax,%rax
   421d4:	74 32                	je     42208 <check_page_table_ownership_level+0x118>
            {
                x86_64_pagetable *nextpt =
                    (x86_64_pagetable *)PTE_ADDR(pt->entry[index]);
   421d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   421da:	8b 55 fc             	mov    -0x4(%rbp),%edx
   421dd:	48 63 d2             	movslq %edx,%rdx
   421e0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   421e4:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
                x86_64_pagetable *nextpt =
   421ea:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
                check_page_table_ownership_level(nextpt, level + 1, owner, 1);
   421ee:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   421f1:	8d 70 01             	lea    0x1(%rax),%esi
   421f4:	8b 55 e0             	mov    -0x20(%rbp),%edx
   421f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   421fb:	b9 01 00 00 00       	mov    $0x1,%ecx
   42200:	48 89 c7             	mov    %rax,%rdi
   42203:	e8 e8 fe ff ff       	call   420f0 <check_page_table_ownership_level>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index)
   42208:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4220c:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   42213:	7e ae                	jle    421c3 <check_page_table_ownership_level+0xd3>
            }
        }
    }
}
   42215:	90                   	nop
   42216:	c9                   	leave  
   42217:	c3                   	ret    

0000000000042218 <check_virtual_memory>:
// check_virtual_memory
//    Check operating system invariants about virtual memory. Panic if any
//    of the invariants are false.

void check_virtual_memory(void)
{
   42218:	f3 0f 1e fa          	endbr64 
   4221c:	55                   	push   %rbp
   4221d:	48 89 e5             	mov    %rsp,%rbp
   42220:	48 83 ec 10          	sub    $0x10,%rsp
    // Process 0 must never be used.
    assert(processes[0].p_state == P_FREE);
   42224:	8b 05 be 0e 01 00    	mov    0x10ebe(%rip),%eax        # 530e8 <processes+0xc8>
   4222a:	85 c0                	test   %eax,%eax
   4222c:	74 1e                	je     4224c <check_virtual_memory+0x34>
   4222e:	48 8d 05 9b 38 00 00 	lea    0x389b(%rip),%rax        # 45ad0 <console_clear+0x2cb>
   42235:	48 89 c2             	mov    %rax,%rdx
   42238:	be de 03 00 00       	mov    $0x3de,%esi
   4223d:	48 8d 05 3c 36 00 00 	lea    0x363c(%rip),%rax        # 45880 <console_clear+0x7b>
   42244:	48 89 c7             	mov    %rax,%rdi
   42247:	e8 73 17 00 00       	call   439bf <assert_fail>
    // that don't have their own page tables.
    // Active processes have their own page tables. A process page table
    // should be owned by that process and have reference count 1.
    // All level-2-4 page tables must have reference count 1.

    check_page_table_mappings(kernel_pagetable);
   4224c:	48 8b 05 ad 3d 01 00 	mov    0x13dad(%rip),%rax        # 56000 <kernel_pagetable>
   42253:	48 89 c7             	mov    %rax,%rdi
   42256:	e8 51 fc ff ff       	call   41eac <check_page_table_mappings>
    check_page_table_ownership(kernel_pagetable, -1);
   4225b:	48 8b 05 9e 3d 01 00 	mov    0x13d9e(%rip),%rax        # 56000 <kernel_pagetable>
   42262:	be ff ff ff ff       	mov    $0xffffffff,%esi
   42267:	48 89 c7             	mov    %rax,%rdi
   4226a:	e8 c9 fd ff ff       	call   42038 <check_page_table_ownership>

    for (int pid = 0; pid < NPROC; ++pid)
   4226f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42276:	e9 b4 00 00 00       	jmp    4232f <check_virtual_memory+0x117>
    {
        if (processes[pid].p_state != P_FREE && processes[pid].p_pagetable != kernel_pagetable)
   4227b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4227e:	48 63 d0             	movslq %eax,%rdx
   42281:	48 89 d0             	mov    %rdx,%rax
   42284:	48 c1 e0 03          	shl    $0x3,%rax
   42288:	48 29 d0             	sub    %rdx,%rax
   4228b:	48 c1 e0 05          	shl    $0x5,%rax
   4228f:	48 89 c2             	mov    %rax,%rdx
   42292:	48 8d 05 4f 0e 01 00 	lea    0x10e4f(%rip),%rax        # 530e8 <processes+0xc8>
   42299:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   4229c:	85 c0                	test   %eax,%eax
   4229e:	0f 84 87 00 00 00    	je     4232b <check_virtual_memory+0x113>
   422a4:	8b 45 fc             	mov    -0x4(%rbp),%eax
   422a7:	48 63 d0             	movslq %eax,%rdx
   422aa:	48 89 d0             	mov    %rdx,%rax
   422ad:	48 c1 e0 03          	shl    $0x3,%rax
   422b1:	48 29 d0             	sub    %rdx,%rax
   422b4:	48 c1 e0 05          	shl    $0x5,%rax
   422b8:	48 89 c2             	mov    %rax,%rdx
   422bb:	48 8d 05 2e 0e 01 00 	lea    0x10e2e(%rip),%rax        # 530f0 <processes+0xd0>
   422c2:	48 8b 14 02          	mov    (%rdx,%rax,1),%rdx
   422c6:	48 8b 05 33 3d 01 00 	mov    0x13d33(%rip),%rax        # 56000 <kernel_pagetable>
   422cd:	48 39 c2             	cmp    %rax,%rdx
   422d0:	74 59                	je     4232b <check_virtual_memory+0x113>
        {
            check_page_table_mappings(processes[pid].p_pagetable);
   422d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
   422d5:	48 63 d0             	movslq %eax,%rdx
   422d8:	48 89 d0             	mov    %rdx,%rax
   422db:	48 c1 e0 03          	shl    $0x3,%rax
   422df:	48 29 d0             	sub    %rdx,%rax
   422e2:	48 c1 e0 05          	shl    $0x5,%rax
   422e6:	48 89 c2             	mov    %rax,%rdx
   422e9:	48 8d 05 00 0e 01 00 	lea    0x10e00(%rip),%rax        # 530f0 <processes+0xd0>
   422f0:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   422f4:	48 89 c7             	mov    %rax,%rdi
   422f7:	e8 b0 fb ff ff       	call   41eac <check_page_table_mappings>
            check_page_table_ownership(processes[pid].p_pagetable, pid);
   422fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
   422ff:	48 63 d0             	movslq %eax,%rdx
   42302:	48 89 d0             	mov    %rdx,%rax
   42305:	48 c1 e0 03          	shl    $0x3,%rax
   42309:	48 29 d0             	sub    %rdx,%rax
   4230c:	48 c1 e0 05          	shl    $0x5,%rax
   42310:	48 89 c2             	mov    %rax,%rdx
   42313:	48 8d 05 d6 0d 01 00 	lea    0x10dd6(%rip),%rax        # 530f0 <processes+0xd0>
   4231a:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   4231e:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42321:	89 d6                	mov    %edx,%esi
   42323:	48 89 c7             	mov    %rax,%rdi
   42326:	e8 0d fd ff ff       	call   42038 <check_page_table_ownership>
    for (int pid = 0; pid < NPROC; ++pid)
   4232b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4232f:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   42333:	0f 8e 42 ff ff ff    	jle    4227b <check_virtual_memory+0x63>
        }
    }

    // Check that all referenced pages refer to active processes
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn)
   42339:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   42340:	e9 10 01 00 00       	jmp    42455 <check_virtual_memory+0x23d>
    {
        if (pageinfo[pn].refcount > 0 && pageinfo[pn].owner >= 0)
   42345:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42348:	48 98                	cltq   
   4234a:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4234e:	48 8d 05 ec 1a 01 00 	lea    0x11aec(%rip),%rax        # 53e41 <pageinfo+0x1>
   42355:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   42359:	84 c0                	test   %al,%al
   4235b:	0f 8e f0 00 00 00    	jle    42451 <check_virtual_memory+0x239>
   42361:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42364:	48 98                	cltq   
   42366:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4236a:	48 8d 05 cf 1a 01 00 	lea    0x11acf(%rip),%rax        # 53e40 <pageinfo>
   42371:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   42375:	84 c0                	test   %al,%al
   42377:	0f 88 d4 00 00 00    	js     42451 <check_virtual_memory+0x239>
        {
            if (processes[pageinfo[pn].owner].p_state == P_FREE)
   4237d:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42380:	48 98                	cltq   
   42382:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   42386:	48 8d 05 b3 1a 01 00 	lea    0x11ab3(%rip),%rax        # 53e40 <pageinfo>
   4238d:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   42391:	0f be c0             	movsbl %al,%eax
   42394:	48 63 d0             	movslq %eax,%rdx
   42397:	48 89 d0             	mov    %rdx,%rax
   4239a:	48 c1 e0 03          	shl    $0x3,%rax
   4239e:	48 29 d0             	sub    %rdx,%rax
   423a1:	48 c1 e0 05          	shl    $0x5,%rax
   423a5:	48 89 c2             	mov    %rax,%rdx
   423a8:	48 8d 05 39 0d 01 00 	lea    0x10d39(%rip),%rax        # 530e8 <processes+0xc8>
   423af:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   423b2:	85 c0                	test   %eax,%eax
   423b4:	75 44                	jne    423fa <check_virtual_memory+0x1e2>
            {
                log_printf("%d,%d\n", pageinfo[pn].refcount, pageinfo[pn].owner);
   423b6:	8b 45 f8             	mov    -0x8(%rbp),%eax
   423b9:	48 98                	cltq   
   423bb:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   423bf:	48 8d 05 7a 1a 01 00 	lea    0x11a7a(%rip),%rax        # 53e40 <pageinfo>
   423c6:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   423ca:	0f be d0             	movsbl %al,%edx
   423cd:	8b 45 f8             	mov    -0x8(%rbp),%eax
   423d0:	48 98                	cltq   
   423d2:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   423d6:	48 8d 05 64 1a 01 00 	lea    0x11a64(%rip),%rax        # 53e41 <pageinfo+0x1>
   423dd:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
   423e1:	0f be c0             	movsbl %al,%eax
   423e4:	89 c6                	mov    %eax,%esi
   423e6:	48 8d 05 02 37 00 00 	lea    0x3702(%rip),%rax        # 45aef <console_clear+0x2ea>
   423ed:	48 89 c7             	mov    %rax,%rdi
   423f0:	b8 00 00 00 00       	mov    $0x0,%eax
   423f5:	e8 6a 12 00 00       	call   43664 <log_printf>
            }
            assert(processes[pageinfo[pn].owner].p_state != P_FREE);
   423fa:	8b 45 f8             	mov    -0x8(%rbp),%eax
   423fd:	48 98                	cltq   
   423ff:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   42403:	48 8d 05 36 1a 01 00 	lea    0x11a36(%rip),%rax        # 53e40 <pageinfo>
   4240a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4240e:	0f be c0             	movsbl %al,%eax
   42411:	48 63 d0             	movslq %eax,%rdx
   42414:	48 89 d0             	mov    %rdx,%rax
   42417:	48 c1 e0 03          	shl    $0x3,%rax
   4241b:	48 29 d0             	sub    %rdx,%rax
   4241e:	48 c1 e0 05          	shl    $0x5,%rax
   42422:	48 89 c2             	mov    %rax,%rdx
   42425:	48 8d 05 bc 0c 01 00 	lea    0x10cbc(%rip),%rax        # 530e8 <processes+0xc8>
   4242c:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   4242f:	85 c0                	test   %eax,%eax
   42431:	75 1e                	jne    42451 <check_virtual_memory+0x239>
   42433:	48 8d 05 be 36 00 00 	lea    0x36be(%rip),%rax        # 45af8 <console_clear+0x2f3>
   4243a:	48 89 c2             	mov    %rax,%rdx
   4243d:	be fc 03 00 00       	mov    $0x3fc,%esi
   42442:	48 8d 05 37 34 00 00 	lea    0x3437(%rip),%rax        # 45880 <console_clear+0x7b>
   42449:	48 89 c7             	mov    %rax,%rdi
   4244c:	e8 6e 15 00 00       	call   439bf <assert_fail>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn)
   42451:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   42455:	81 7d f8 ff 01 00 00 	cmpl   $0x1ff,-0x8(%rbp)
   4245c:	0f 8e e3 fe ff ff    	jle    42345 <check_virtual_memory+0x12d>
        }
    }
}
   42462:	90                   	nop
   42463:	90                   	nop
   42464:	c9                   	leave  
   42465:	c3                   	ret    

0000000000042466 <memshow_physical>:
    'E' | 0x0E00, 'F' | 0x0F00, 'S'};
#define SHARED_COLOR memstate_colors[18]
#define SHARED

void memshow_physical(void)
{
   42466:	f3 0f 1e fa          	endbr64 
   4246a:	55                   	push   %rbp
   4246b:	48 89 e5             	mov    %rsp,%rbp
   4246e:	48 83 ec 10          	sub    $0x10,%rsp
    console_printf(CPOS(0, 32), 0x0F00, "PHYSICAL MEMORY");
   42472:	48 8d 05 ed 36 00 00 	lea    0x36ed(%rip),%rax        # 45b66 <memstate_colors+0x26>
   42479:	48 89 c2             	mov    %rax,%rdx
   4247c:	be 00 0f 00 00       	mov    $0xf00,%esi
   42481:	bf 20 00 00 00       	mov    $0x20,%edi
   42486:	b8 00 00 00 00       	mov    $0x0,%eax
   4248b:	e8 ff 31 00 00       	call   4568f <console_printf>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn)
   42490:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42497:	e9 1b 01 00 00       	jmp    425b7 <memshow_physical+0x151>
    {
        if (pn % 64 == 0)
   4249c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4249f:	83 e0 3f             	and    $0x3f,%eax
   424a2:	85 c0                	test   %eax,%eax
   424a4:	75 40                	jne    424e6 <memshow_physical+0x80>
        {
            console_printf(CPOS(1 + pn / 64, 3), 0x0F00, "0x%06X ", pn << 12);
   424a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
   424a9:	c1 e0 0c             	shl    $0xc,%eax
   424ac:	89 c2                	mov    %eax,%edx
   424ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
   424b1:	8d 48 3f             	lea    0x3f(%rax),%ecx
   424b4:	85 c0                	test   %eax,%eax
   424b6:	0f 48 c1             	cmovs  %ecx,%eax
   424b9:	c1 f8 06             	sar    $0x6,%eax
   424bc:	8d 48 01             	lea    0x1(%rax),%ecx
   424bf:	89 c8                	mov    %ecx,%eax
   424c1:	c1 e0 02             	shl    $0x2,%eax
   424c4:	01 c8                	add    %ecx,%eax
   424c6:	c1 e0 04             	shl    $0x4,%eax
   424c9:	83 c0 03             	add    $0x3,%eax
   424cc:	89 d1                	mov    %edx,%ecx
   424ce:	48 8d 15 a1 36 00 00 	lea    0x36a1(%rip),%rdx        # 45b76 <memstate_colors+0x36>
   424d5:	be 00 0f 00 00       	mov    $0xf00,%esi
   424da:	89 c7                	mov    %eax,%edi
   424dc:	b8 00 00 00 00       	mov    $0x0,%eax
   424e1:	e8 a9 31 00 00       	call   4568f <console_printf>
        }

        int owner = pageinfo[pn].owner;
   424e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
   424e9:	48 98                	cltq   
   424eb:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   424ef:	48 8d 05 4a 19 01 00 	lea    0x1194a(%rip),%rax        # 53e40 <pageinfo>
   424f6:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   424fa:	0f be c0             	movsbl %al,%eax
   424fd:	89 45 f8             	mov    %eax,-0x8(%rbp)
        if (pageinfo[pn].refcount == 0)
   42500:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42503:	48 98                	cltq   
   42505:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   42509:	48 8d 05 31 19 01 00 	lea    0x11931(%rip),%rax        # 53e41 <pageinfo+0x1>
   42510:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   42514:	84 c0                	test   %al,%al
   42516:	75 07                	jne    4251f <memshow_physical+0xb9>
        {
            owner = PO_FREE;
   42518:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
        }
        uint16_t color = memstate_colors[owner - PO_KERNEL];
   4251f:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42522:	83 c0 02             	add    $0x2,%eax
   42525:	48 98                	cltq   
   42527:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4252b:	48 8d 05 0e 36 00 00 	lea    0x360e(%rip),%rax        # 45b40 <memstate_colors>
   42532:	0f b7 04 02          	movzwl (%rdx,%rax,1),%eax
   42536:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
        // darker color for shared pages
        if (pageinfo[pn].refcount > 1 && pn != PAGENUMBER(CONSOLE_ADDR))
   4253a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4253d:	48 98                	cltq   
   4253f:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   42543:	48 8d 05 f7 18 01 00 	lea    0x118f7(%rip),%rax        # 53e41 <pageinfo+0x1>
   4254a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4254e:	3c 01                	cmp    $0x1,%al
   42550:	7e 1c                	jle    4256e <memshow_physical+0x108>
   42552:	48 8d 05 a7 5a 07 00 	lea    0x75aa7(%rip),%rax        # b8000 <console>
   42559:	48 c1 e8 0c          	shr    $0xc,%rax
   4255d:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   42560:	74 0c                	je     4256e <memshow_physical+0x108>
        {
#ifdef SHARED
            color = SHARED_COLOR | 0x0F00;
   42562:	b8 53 00 00 00       	mov    $0x53,%eax
   42567:	80 cc 0f             	or     $0xf,%ah
   4256a:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
#else
            color &= 0x77FF;
#endif
        }

        console[CPOS(1 + pn / 64, 12 + pn % 64)] = color;
   4256e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42571:	8d 50 3f             	lea    0x3f(%rax),%edx
   42574:	85 c0                	test   %eax,%eax
   42576:	0f 48 c2             	cmovs  %edx,%eax
   42579:	c1 f8 06             	sar    $0x6,%eax
   4257c:	8d 50 01             	lea    0x1(%rax),%edx
   4257f:	89 d0                	mov    %edx,%eax
   42581:	c1 e0 02             	shl    $0x2,%eax
   42584:	01 d0                	add    %edx,%eax
   42586:	c1 e0 04             	shl    $0x4,%eax
   42589:	89 c1                	mov    %eax,%ecx
   4258b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4258e:	99                   	cltd   
   4258f:	c1 ea 1a             	shr    $0x1a,%edx
   42592:	01 d0                	add    %edx,%eax
   42594:	83 e0 3f             	and    $0x3f,%eax
   42597:	29 d0                	sub    %edx,%eax
   42599:	83 c0 0c             	add    $0xc,%eax
   4259c:	01 c8                	add    %ecx,%eax
   4259e:	48 98                	cltq   
   425a0:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   425a4:	48 8d 15 55 5a 07 00 	lea    0x75a55(%rip),%rdx        # b8000 <console>
   425ab:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   425af:	66 89 04 11          	mov    %ax,(%rcx,%rdx,1)
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn)
   425b3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   425b7:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   425be:	0f 8e d8 fe ff ff    	jle    4249c <memshow_physical+0x36>
    }
}
   425c4:	90                   	nop
   425c5:	90                   	nop
   425c6:	c9                   	leave  
   425c7:	c3                   	ret    

00000000000425c8 <memshow_virtual>:
// memshow_virtual(pagetable, name)
//    Draw a picture of the virtual memory map `pagetable` (named `name`) on
//    the CGA console.

void memshow_virtual(x86_64_pagetable *pagetable, const char *name)
{
   425c8:	f3 0f 1e fa          	endbr64 
   425cc:	55                   	push   %rbp
   425cd:	48 89 e5             	mov    %rsp,%rbp
   425d0:	48 83 ec 40          	sub    $0x40,%rsp
   425d4:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   425d8:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    assert((uintptr_t)pagetable == PTE_ADDR(pagetable));
   425dc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   425e0:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   425e6:	48 89 c2             	mov    %rax,%rdx
   425e9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   425ed:	48 39 c2             	cmp    %rax,%rdx
   425f0:	74 1e                	je     42610 <memshow_virtual+0x48>
   425f2:	48 8d 05 87 35 00 00 	lea    0x3587(%rip),%rax        # 45b80 <memstate_colors+0x40>
   425f9:	48 89 c2             	mov    %rax,%rdx
   425fc:	be 31 04 00 00       	mov    $0x431,%esi
   42601:	48 8d 05 78 32 00 00 	lea    0x3278(%rip),%rax        # 45880 <console_clear+0x7b>
   42608:	48 89 c7             	mov    %rax,%rdi
   4260b:	e8 af 13 00 00       	call   439bf <assert_fail>

    console_printf(CPOS(10, 26), 0x0F00, "VIRTUAL ADDRESS SPACE FOR %s", name);
   42610:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42614:	48 89 c1             	mov    %rax,%rcx
   42617:	48 8d 05 8e 35 00 00 	lea    0x358e(%rip),%rax        # 45bac <memstate_colors+0x6c>
   4261e:	48 89 c2             	mov    %rax,%rdx
   42621:	be 00 0f 00 00       	mov    $0xf00,%esi
   42626:	bf 3a 03 00 00       	mov    $0x33a,%edi
   4262b:	b8 00 00 00 00       	mov    $0x0,%eax
   42630:	e8 5a 30 00 00       	call   4568f <console_printf>
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE)
   42635:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   4263c:	00 
   4263d:	e9 b4 01 00 00       	jmp    427f6 <memshow_virtual+0x22e>
    {
        vamapping vam = virtual_memory_lookup(pagetable, va);
   42642:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42646:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4264a:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   4264e:	48 89 ce             	mov    %rcx,%rsi
   42651:	48 89 c7             	mov    %rax,%rdi
   42654:	e8 2e 1b 00 00       	call   44187 <virtual_memory_lookup>
        uint16_t color;
        if (vam.pn < 0)
   42659:	8b 45 d0             	mov    -0x30(%rbp),%eax
   4265c:	85 c0                	test   %eax,%eax
   4265e:	79 0b                	jns    4266b <memshow_virtual+0xa3>
        {
            color = ' ';
   42660:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%rbp)
   42666:	e9 ff 00 00 00       	jmp    4276a <memshow_virtual+0x1a2>
        }
        else
        {
            assert(vam.pa < MEMSIZE_PHYSICAL);
   4266b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4266f:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   42675:	76 1e                	jbe    42695 <memshow_virtual+0xcd>
   42677:	48 8d 05 4b 35 00 00 	lea    0x354b(%rip),%rax        # 45bc9 <memstate_colors+0x89>
   4267e:	48 89 c2             	mov    %rax,%rdx
   42681:	be 3e 04 00 00       	mov    $0x43e,%esi
   42686:	48 8d 05 f3 31 00 00 	lea    0x31f3(%rip),%rax        # 45880 <console_clear+0x7b>
   4268d:	48 89 c7             	mov    %rax,%rdi
   42690:	e8 2a 13 00 00       	call   439bf <assert_fail>
            int owner = pageinfo[vam.pn].owner;
   42695:	8b 45 d0             	mov    -0x30(%rbp),%eax
   42698:	48 98                	cltq   
   4269a:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4269e:	48 8d 05 9b 17 01 00 	lea    0x1179b(%rip),%rax        # 53e40 <pageinfo>
   426a5:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   426a9:	0f be c0             	movsbl %al,%eax
   426ac:	89 45 f0             	mov    %eax,-0x10(%rbp)
            if (pageinfo[vam.pn].refcount == 0)
   426af:	8b 45 d0             	mov    -0x30(%rbp),%eax
   426b2:	48 98                	cltq   
   426b4:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   426b8:	48 8d 05 82 17 01 00 	lea    0x11782(%rip),%rax        # 53e41 <pageinfo+0x1>
   426bf:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   426c3:	84 c0                	test   %al,%al
   426c5:	75 07                	jne    426ce <memshow_virtual+0x106>
            {
                owner = PO_FREE;
   426c7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
            }
            color = memstate_colors[owner - PO_KERNEL];
   426ce:	8b 45 f0             	mov    -0x10(%rbp),%eax
   426d1:	83 c0 02             	add    $0x2,%eax
   426d4:	48 98                	cltq   
   426d6:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   426da:	48 8d 05 5f 34 00 00 	lea    0x345f(%rip),%rax        # 45b40 <memstate_colors>
   426e1:	0f b7 04 02          	movzwl (%rdx,%rax,1),%eax
   426e5:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            // reverse video for user-accessible pages
            if (vam.perm & PTE_U)
   426e9:	8b 45 e0             	mov    -0x20(%rbp),%eax
   426ec:	48 98                	cltq   
   426ee:	83 e0 04             	and    $0x4,%eax
   426f1:	48 85 c0             	test   %rax,%rax
   426f4:	74 27                	je     4271d <memshow_virtual+0x155>
            {
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4) | (color & 0x00FF);
   426f6:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   426fa:	c1 e0 04             	shl    $0x4,%eax
   426fd:	66 25 00 f0          	and    $0xf000,%ax
   42701:	89 c2                	mov    %eax,%edx
   42703:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   42707:	c1 f8 04             	sar    $0x4,%eax
   4270a:	66 25 00 0f          	and    $0xf00,%ax
   4270e:	09 c2                	or     %eax,%edx
   42710:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   42714:	0f b6 c0             	movzbl %al,%eax
   42717:	09 d0                	or     %edx,%eax
   42719:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            }
            // darker color for shared pages
            if (pageinfo[vam.pn].refcount > 1 && va != CONSOLE_ADDR)
   4271d:	8b 45 d0             	mov    -0x30(%rbp),%eax
   42720:	48 98                	cltq   
   42722:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   42726:	48 8d 05 14 17 01 00 	lea    0x11714(%rip),%rax        # 53e41 <pageinfo+0x1>
   4272d:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   42731:	3c 01                	cmp    $0x1,%al
   42733:	7e 35                	jle    4276a <memshow_virtual+0x1a2>
   42735:	48 8d 05 c4 58 07 00 	lea    0x758c4(%rip),%rax        # b8000 <console>
   4273c:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   42740:	74 28                	je     4276a <memshow_virtual+0x1a2>
            {
#ifdef SHARED
                color = (SHARED_COLOR | (color & 0xF000));
   42742:	b8 53 00 00 00       	mov    $0x53,%eax
   42747:	89 c2                	mov    %eax,%edx
   42749:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   4274d:	66 25 00 f0          	and    $0xf000,%ax
   42751:	09 d0                	or     %edx,%eax
   42753:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
                if (!(vam.perm & PTE_U))
   42757:	8b 45 e0             	mov    -0x20(%rbp),%eax
   4275a:	48 98                	cltq   
   4275c:	83 e0 04             	and    $0x4,%eax
   4275f:	48 85 c0             	test   %rax,%rax
   42762:	75 06                	jne    4276a <memshow_virtual+0x1a2>
                    color = color | 0x0F00;
   42764:	66 81 4d f6 00 0f    	orw    $0xf00,-0xa(%rbp)
#else
                color &= 0x77FF;
#endif
            }
        }
        uint32_t pn = PAGENUMBER(va);
   4276a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4276e:	48 c1 e8 0c          	shr    $0xc,%rax
   42772:	89 45 ec             	mov    %eax,-0x14(%rbp)
        if (pn % 64 == 0)
   42775:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42778:	83 e0 3f             	and    $0x3f,%eax
   4277b:	85 c0                	test   %eax,%eax
   4277d:	75 39                	jne    427b8 <memshow_virtual+0x1f0>
        {
            console_printf(CPOS(11 + pn / 64, 3), 0x0F00, "0x%06X ", va);
   4277f:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42782:	c1 e8 06             	shr    $0x6,%eax
   42785:	89 c2                	mov    %eax,%edx
   42787:	89 d0                	mov    %edx,%eax
   42789:	c1 e0 02             	shl    $0x2,%eax
   4278c:	01 d0                	add    %edx,%eax
   4278e:	c1 e0 04             	shl    $0x4,%eax
   42791:	05 73 03 00 00       	add    $0x373,%eax
   42796:	89 c7                	mov    %eax,%edi
   42798:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4279c:	48 89 c1             	mov    %rax,%rcx
   4279f:	48 8d 05 d0 33 00 00 	lea    0x33d0(%rip),%rax        # 45b76 <memstate_colors+0x36>
   427a6:	48 89 c2             	mov    %rax,%rdx
   427a9:	be 00 0f 00 00       	mov    $0xf00,%esi
   427ae:	b8 00 00 00 00       	mov    $0x0,%eax
   427b3:	e8 d7 2e 00 00       	call   4568f <console_printf>
        }
        console[CPOS(11 + pn / 64, 12 + pn % 64)] = color;
   427b8:	8b 45 ec             	mov    -0x14(%rbp),%eax
   427bb:	c1 e8 06             	shr    $0x6,%eax
   427be:	89 c2                	mov    %eax,%edx
   427c0:	89 d0                	mov    %edx,%eax
   427c2:	c1 e0 02             	shl    $0x2,%eax
   427c5:	01 d0                	add    %edx,%eax
   427c7:	c1 e0 04             	shl    $0x4,%eax
   427ca:	89 c2                	mov    %eax,%edx
   427cc:	8b 45 ec             	mov    -0x14(%rbp),%eax
   427cf:	83 e0 3f             	and    $0x3f,%eax
   427d2:	01 d0                	add    %edx,%eax
   427d4:	05 7c 03 00 00       	add    $0x37c,%eax
   427d9:	89 c0                	mov    %eax,%eax
   427db:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   427df:	48 8d 15 1a 58 07 00 	lea    0x7581a(%rip),%rdx        # b8000 <console>
   427e6:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   427ea:	66 89 04 11          	mov    %ax,(%rcx,%rdx,1)
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE)
   427ee:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   427f5:	00 
   427f6:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   427fd:	00 
   427fe:	0f 86 3e fe ff ff    	jbe    42642 <memshow_virtual+0x7a>
    }
}
   42804:	90                   	nop
   42805:	90                   	nop
   42806:	c9                   	leave  
   42807:	c3                   	ret    

0000000000042808 <memshow_virtual_animate>:
// memshow_virtual_animate
//    Draw a picture of process virtual memory maps on the CGA console.
//    Starts with process 1, then switches to a new process every 0.25 sec.

void memshow_virtual_animate(void)
{
   42808:	f3 0f 1e fa          	endbr64 
   4280c:	55                   	push   %rbp
   4280d:	48 89 e5             	mov    %rsp,%rbp
   42810:	48 83 ec 10          	sub    $0x10,%rsp
    static unsigned last_ticks = 0;
    static int showing = 1;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2)
   42814:	8b 05 26 1a 01 00    	mov    0x11a26(%rip),%eax        # 54240 <last_ticks.1>
   4281a:	85 c0                	test   %eax,%eax
   4281c:	74 13                	je     42831 <memshow_virtual_animate+0x29>
   4281e:	8b 05 fc 15 01 00    	mov    0x115fc(%rip),%eax        # 53e20 <ticks>
   42824:	8b 15 16 1a 01 00    	mov    0x11a16(%rip),%edx        # 54240 <last_ticks.1>
   4282a:	29 d0                	sub    %edx,%eax
   4282c:	83 f8 31             	cmp    $0x31,%eax
   4282f:	76 2c                	jbe    4285d <memshow_virtual_animate+0x55>
    {
        last_ticks = ticks;
   42831:	8b 05 e9 15 01 00    	mov    0x115e9(%rip),%eax        # 53e20 <ticks>
   42837:	89 05 03 1a 01 00    	mov    %eax,0x11a03(%rip)        # 54240 <last_ticks.1>
        ++showing;
   4283d:	8b 05 c1 47 00 00    	mov    0x47c1(%rip),%eax        # 47004 <showing.0>
   42843:	83 c0 01             	add    $0x1,%eax
   42846:	89 05 b8 47 00 00    	mov    %eax,0x47b8(%rip)        # 47004 <showing.0>
    }

    // the current process may have died -- don't display it if so
    while (showing <= 2 * NPROC && (processes[showing % NPROC].p_state == P_FREE || processes[showing % NPROC].display_status == 0))
   4284c:	eb 0f                	jmp    4285d <memshow_virtual_animate+0x55>
    {
        ++showing;
   4284e:	8b 05 b0 47 00 00    	mov    0x47b0(%rip),%eax        # 47004 <showing.0>
   42854:	83 c0 01             	add    $0x1,%eax
   42857:	89 05 a7 47 00 00    	mov    %eax,0x47a7(%rip)        # 47004 <showing.0>
    while (showing <= 2 * NPROC && (processes[showing % NPROC].p_state == P_FREE || processes[showing % NPROC].display_status == 0))
   4285d:	8b 05 a1 47 00 00    	mov    0x47a1(%rip),%eax        # 47004 <showing.0>
   42863:	83 f8 20             	cmp    $0x20,%eax
   42866:	7f 6b                	jg     428d3 <memshow_virtual_animate+0xcb>
   42868:	8b 05 96 47 00 00    	mov    0x4796(%rip),%eax        # 47004 <showing.0>
   4286e:	99                   	cltd   
   4286f:	c1 ea 1c             	shr    $0x1c,%edx
   42872:	01 d0                	add    %edx,%eax
   42874:	83 e0 0f             	and    $0xf,%eax
   42877:	29 d0                	sub    %edx,%eax
   42879:	48 63 d0             	movslq %eax,%rdx
   4287c:	48 89 d0             	mov    %rdx,%rax
   4287f:	48 c1 e0 03          	shl    $0x3,%rax
   42883:	48 29 d0             	sub    %rdx,%rax
   42886:	48 c1 e0 05          	shl    $0x5,%rax
   4288a:	48 89 c2             	mov    %rax,%rdx
   4288d:	48 8d 05 54 08 01 00 	lea    0x10854(%rip),%rax        # 530e8 <processes+0xc8>
   42894:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   42897:	85 c0                	test   %eax,%eax
   42899:	74 b3                	je     4284e <memshow_virtual_animate+0x46>
   4289b:	8b 05 63 47 00 00    	mov    0x4763(%rip),%eax        # 47004 <showing.0>
   428a1:	99                   	cltd   
   428a2:	c1 ea 1c             	shr    $0x1c,%edx
   428a5:	01 d0                	add    %edx,%eax
   428a7:	83 e0 0f             	and    $0xf,%eax
   428aa:	29 d0                	sub    %edx,%eax
   428ac:	48 63 d0             	movslq %eax,%rdx
   428af:	48 89 d0             	mov    %rdx,%rax
   428b2:	48 c1 e0 03          	shl    $0x3,%rax
   428b6:	48 29 d0             	sub    %rdx,%rax
   428b9:	48 c1 e0 05          	shl    $0x5,%rax
   428bd:	48 89 c2             	mov    %rax,%rdx
   428c0:	48 8d 05 31 08 01 00 	lea    0x10831(%rip),%rax        # 530f8 <processes+0xd8>
   428c7:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   428cb:	84 c0                	test   %al,%al
   428cd:	0f 84 7b ff ff ff    	je     4284e <memshow_virtual_animate+0x46>
    }
    showing = showing % NPROC;
   428d3:	8b 05 2b 47 00 00    	mov    0x472b(%rip),%eax        # 47004 <showing.0>
   428d9:	99                   	cltd   
   428da:	c1 ea 1c             	shr    $0x1c,%edx
   428dd:	01 d0                	add    %edx,%eax
   428df:	83 e0 0f             	and    $0xf,%eax
   428e2:	29 d0                	sub    %edx,%eax
   428e4:	89 05 1a 47 00 00    	mov    %eax,0x471a(%rip)        # 47004 <showing.0>

    if (processes[showing].p_state != P_FREE)
   428ea:	8b 05 14 47 00 00    	mov    0x4714(%rip),%eax        # 47004 <showing.0>
   428f0:	48 63 d0             	movslq %eax,%rdx
   428f3:	48 89 d0             	mov    %rdx,%rax
   428f6:	48 c1 e0 03          	shl    $0x3,%rax
   428fa:	48 29 d0             	sub    %rdx,%rax
   428fd:	48 c1 e0 05          	shl    $0x5,%rax
   42901:	48 89 c2             	mov    %rax,%rdx
   42904:	48 8d 05 dd 07 01 00 	lea    0x107dd(%rip),%rax        # 530e8 <processes+0xc8>
   4290b:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   4290e:	85 c0                	test   %eax,%eax
   42910:	74 59                	je     4296b <memshow_virtual_animate+0x163>
    {
        char s[4];
        snprintf(s, 4, "%d ", showing);
   42912:	8b 15 ec 46 00 00    	mov    0x46ec(%rip),%edx        # 47004 <showing.0>
   42918:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
   4291c:	89 d1                	mov    %edx,%ecx
   4291e:	48 8d 15 be 32 00 00 	lea    0x32be(%rip),%rdx        # 45be3 <memstate_colors+0xa3>
   42925:	be 04 00 00 00       	mov    $0x4,%esi
   4292a:	48 89 c7             	mov    %rax,%rdi
   4292d:	b8 00 00 00 00       	mov    $0x0,%eax
   42932:	e8 73 2e 00 00       	call   457aa <snprintf>
        memshow_virtual(processes[showing].p_pagetable, s);
   42937:	8b 05 c7 46 00 00    	mov    0x46c7(%rip),%eax        # 47004 <showing.0>
   4293d:	48 63 d0             	movslq %eax,%rdx
   42940:	48 89 d0             	mov    %rdx,%rax
   42943:	48 c1 e0 03          	shl    $0x3,%rax
   42947:	48 29 d0             	sub    %rdx,%rax
   4294a:	48 c1 e0 05          	shl    $0x5,%rax
   4294e:	48 89 c2             	mov    %rax,%rdx
   42951:	48 8d 05 98 07 01 00 	lea    0x10798(%rip),%rax        # 530f0 <processes+0xd0>
   42958:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   4295c:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
   42960:	48 89 d6             	mov    %rdx,%rsi
   42963:	48 89 c7             	mov    %rax,%rdi
   42966:	e8 5d fc ff ff       	call   425c8 <memshow_virtual>
    }
}
   4296b:	90                   	nop
   4296c:	c9                   	leave  
   4296d:	c3                   	ret    

000000000004296e <hardware_init>:

static void segments_init(void);
static void interrupt_init(void);
extern void virtual_memory_init(void);

void hardware_init(void) {
   4296e:	f3 0f 1e fa          	endbr64 
   42972:	55                   	push   %rbp
   42973:	48 89 e5             	mov    %rsp,%rbp
    segments_init();
   42976:	e8 5f 01 00 00       	call   42ada <segments_init>
    interrupt_init();
   4297b:	e8 44 04 00 00       	call   42dc4 <interrupt_init>
    virtual_memory_init();
   42980:	e8 11 11 00 00       	call   43a96 <virtual_memory_init>
}
   42985:	90                   	nop
   42986:	5d                   	pop    %rbp
   42987:	c3                   	ret    

0000000000042988 <set_app_segment>:
#define SEGSEL_TASKSTATE        0x28            // task state segment

// Segments
static uint64_t segments[7];

static void set_app_segment(uint64_t* segment, uint64_t type, int dpl) {
   42988:	f3 0f 1e fa          	endbr64 
   4298c:	55                   	push   %rbp
   4298d:	48 89 e5             	mov    %rsp,%rbp
   42990:	48 83 ec 18          	sub    $0x18,%rsp
   42994:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42998:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   4299c:	89 55 ec             	mov    %edx,-0x14(%rbp)
    *segment = type
        | X86SEG_S                    // code/data segment
        | ((uint64_t) dpl << 45)
   4299f:	8b 45 ec             	mov    -0x14(%rbp),%eax
   429a2:	48 98                	cltq   
   429a4:	48 c1 e0 2d          	shl    $0x2d,%rax
   429a8:	48 0b 45 f0          	or     -0x10(%rbp),%rax
        | X86SEG_P;                   // segment present
   429ac:	48 ba 00 00 00 00 00 	movabs $0x900000000000,%rdx
   429b3:	90 00 00 
   429b6:	48 09 c2             	or     %rax,%rdx
    *segment = type
   429b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   429bd:	48 89 10             	mov    %rdx,(%rax)
}
   429c0:	90                   	nop
   429c1:	c9                   	leave  
   429c2:	c3                   	ret    

00000000000429c3 <set_sys_segment>:

static void set_sys_segment(uint64_t* segment, uint64_t type, int dpl,
                            uintptr_t addr, size_t size) {
   429c3:	f3 0f 1e fa          	endbr64 
   429c7:	55                   	push   %rbp
   429c8:	48 89 e5             	mov    %rsp,%rbp
   429cb:	48 83 ec 28          	sub    $0x28,%rsp
   429cf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   429d3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   429d7:	89 55 ec             	mov    %edx,-0x14(%rbp)
   429da:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
   429de:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   429e2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   429e6:	48 c1 e0 10          	shl    $0x10,%rax
   429ea:	48 89 c2             	mov    %rax,%rdx
   429ed:	48 b8 00 00 ff ff ff 	movabs $0xffffff0000,%rax
   429f4:	00 00 00 
   429f7:	48 21 c2             	and    %rax,%rdx
        | ((addr & 0x00000000FF000000UL) << 32)
   429fa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   429fe:	48 c1 e0 20          	shl    $0x20,%rax
   42a02:	48 89 c1             	mov    %rax,%rcx
   42a05:	48 b8 00 00 00 00 00 	movabs $0xff00000000000000,%rax
   42a0c:	00 00 ff 
   42a0f:	48 21 c8             	and    %rcx,%rax
   42a12:	48 09 c2             	or     %rax,%rdx
        | ((size - 1) & 0x0FFFFUL)
   42a15:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42a19:	48 83 e8 01          	sub    $0x1,%rax
   42a1d:	0f b7 c0             	movzwl %ax,%eax
        | (((size - 1) & 0xF0000UL) << 48)
   42a20:	48 09 d0             	or     %rdx,%rax
        | type
   42a23:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   42a27:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   42a2a:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42a2d:	48 98                	cltq   
   42a2f:	48 c1 e0 2d          	shl    $0x2d,%rax
   42a33:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P;                   // segment present
   42a36:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
   42a3d:	80 00 00 
   42a40:	48 09 c2             	or     %rax,%rdx
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   42a43:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42a47:	48 89 10             	mov    %rdx,(%rax)
    segment[1] = addr >> 32;
   42a4a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42a4e:	48 83 c0 08          	add    $0x8,%rax
   42a52:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   42a56:	48 c1 ea 20          	shr    $0x20,%rdx
   42a5a:	48 89 10             	mov    %rdx,(%rax)
}
   42a5d:	90                   	nop
   42a5e:	c9                   	leave  
   42a5f:	c3                   	ret    

0000000000042a60 <set_gate>:

// Processor state for taking an interrupt
static x86_64_taskstate kernel_task_descriptor;

static void set_gate(x86_64_gatedescriptor* gate, uint64_t type, int dpl,
                     uintptr_t function) {
   42a60:	f3 0f 1e fa          	endbr64 
   42a64:	55                   	push   %rbp
   42a65:	48 89 e5             	mov    %rsp,%rbp
   42a68:	48 83 ec 20          	sub    $0x20,%rsp
   42a6c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42a70:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   42a74:	89 55 ec             	mov    %edx,-0x14(%rbp)
   42a77:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    gate->gd_low = (function & 0x000000000000FFFFUL)
   42a7b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42a7f:	0f b7 c0             	movzwl %ax,%eax
        | (SEGSEL_KERN_CODE << 16)
        | type
   42a82:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   42a86:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   42a89:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42a8c:	48 98                	cltq   
   42a8e:	48 c1 e0 2d          	shl    $0x2d,%rax
   42a92:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P
        | ((function & 0x00000000FFFF0000UL) << 32);
   42a95:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42a99:	48 c1 e0 20          	shl    $0x20,%rax
   42a9d:	48 89 c1             	mov    %rax,%rcx
   42aa0:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   42aa7:	00 ff ff 
   42aaa:	48 21 c8             	and    %rcx,%rax
   42aad:	48 09 c2             	or     %rax,%rdx
   42ab0:	48 b8 00 00 08 00 00 	movabs $0x800000080000,%rax
   42ab7:	80 00 00 
   42aba:	48 09 c2             	or     %rax,%rdx
    gate->gd_low = (function & 0x000000000000FFFFUL)
   42abd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42ac1:	48 89 10             	mov    %rdx,(%rax)
    gate->gd_high = function >> 32;
   42ac4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42ac8:	48 c1 e8 20          	shr    $0x20,%rax
   42acc:	48 89 c2             	mov    %rax,%rdx
   42acf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42ad3:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
   42ad7:	90                   	nop
   42ad8:	c9                   	leave  
   42ad9:	c3                   	ret    

0000000000042ada <segments_init>:
extern void default_int_handler(void);
extern void gpf_int_handler(void);
extern void pagefault_int_handler(void);
extern void timer_int_handler(void);

void segments_init(void) {
   42ada:	f3 0f 1e fa          	endbr64 
   42ade:	55                   	push   %rbp
   42adf:	48 89 e5             	mov    %rsp,%rbp
   42ae2:	48 83 ec 40          	sub    $0x40,%rsp
    // Segments for kernel & user code & data
    // The privilege level, which can be 0 or 3, differentiates between
    // kernel and user code. (Data segments are unused in WeensyOS.)
    segments[0] = 0;
   42ae6:	48 c7 05 6f 17 01 00 	movq   $0x0,0x1176f(%rip)        # 54260 <segments>
   42aed:	00 00 00 00 
    set_app_segment(&segments[SEGSEL_KERN_CODE >> 3], X86SEG_X | X86SEG_L, 0);
   42af1:	ba 00 00 00 00       	mov    $0x0,%edx
   42af6:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   42afd:	08 20 00 
   42b00:	48 89 c6             	mov    %rax,%rsi
   42b03:	48 8d 05 5e 17 01 00 	lea    0x1175e(%rip),%rax        # 54268 <segments+0x8>
   42b0a:	48 89 c7             	mov    %rax,%rdi
   42b0d:	e8 76 fe ff ff       	call   42988 <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_CODE >> 3], X86SEG_X | X86SEG_L, 3);
   42b12:	ba 03 00 00 00       	mov    $0x3,%edx
   42b17:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   42b1e:	08 20 00 
   42b21:	48 89 c6             	mov    %rax,%rsi
   42b24:	48 8d 05 45 17 01 00 	lea    0x11745(%rip),%rax        # 54270 <segments+0x10>
   42b2b:	48 89 c7             	mov    %rax,%rdi
   42b2e:	e8 55 fe ff ff       	call   42988 <set_app_segment>
    set_app_segment(&segments[SEGSEL_KERN_DATA >> 3], X86SEG_W, 0);
   42b33:	ba 00 00 00 00       	mov    $0x0,%edx
   42b38:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   42b3f:	02 00 00 
   42b42:	48 89 c6             	mov    %rax,%rsi
   42b45:	48 8d 05 2c 17 01 00 	lea    0x1172c(%rip),%rax        # 54278 <segments+0x18>
   42b4c:	48 89 c7             	mov    %rax,%rdi
   42b4f:	e8 34 fe ff ff       	call   42988 <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_DATA >> 3], X86SEG_W, 3);
   42b54:	ba 03 00 00 00       	mov    $0x3,%edx
   42b59:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   42b60:	02 00 00 
   42b63:	48 89 c6             	mov    %rax,%rsi
   42b66:	48 8d 05 13 17 01 00 	lea    0x11713(%rip),%rax        # 54280 <segments+0x20>
   42b6d:	48 89 c7             	mov    %rax,%rdi
   42b70:	e8 13 fe ff ff       	call   42988 <set_app_segment>
    set_sys_segment(&segments[SEGSEL_TASKSTATE >> 3], X86SEG_TSS, 0,
   42b75:	48 8d 05 24 27 01 00 	lea    0x12724(%rip),%rax        # 552a0 <kernel_task_descriptor>
   42b7c:	41 b8 60 00 00 00    	mov    $0x60,%r8d
   42b82:	48 89 c1             	mov    %rax,%rcx
   42b85:	ba 00 00 00 00       	mov    $0x0,%edx
   42b8a:	48 b8 00 00 00 00 00 	movabs $0x90000000000,%rax
   42b91:	09 00 00 
   42b94:	48 89 c6             	mov    %rax,%rsi
   42b97:	48 8d 05 ea 16 01 00 	lea    0x116ea(%rip),%rax        # 54288 <segments+0x28>
   42b9e:	48 89 c7             	mov    %rax,%rdi
   42ba1:	e8 1d fe ff ff       	call   429c3 <set_sys_segment>
                    (uintptr_t) &kernel_task_descriptor,
                    sizeof(kernel_task_descriptor));

    x86_64_pseudodescriptor gdt;
    gdt.pseudod_limit = sizeof(segments) - 1;
   42ba6:	66 c7 45 d6 37 00    	movw   $0x37,-0x2a(%rbp)
    gdt.pseudod_base = (uint64_t) segments;
   42bac:	48 8d 05 ad 16 01 00 	lea    0x116ad(%rip),%rax        # 54260 <segments>
   42bb3:	48 89 45 d8          	mov    %rax,-0x28(%rbp)

    // Kernel task descriptor lets us receive interrupts
    memset(&kernel_task_descriptor, 0, sizeof(kernel_task_descriptor));
   42bb7:	ba 60 00 00 00       	mov    $0x60,%edx
   42bbc:	be 00 00 00 00       	mov    $0x0,%esi
   42bc1:	48 8d 05 d8 26 01 00 	lea    0x126d8(%rip),%rax        # 552a0 <kernel_task_descriptor>
   42bc8:	48 89 c7             	mov    %rax,%rdi
   42bcb:	e8 80 1c 00 00       	call   44850 <memset>
    kernel_task_descriptor.ts_rsp[0] = KERNEL_STACK_TOP;
   42bd0:	48 c7 05 c9 26 01 00 	movq   $0x80000,0x126c9(%rip)        # 552a4 <kernel_task_descriptor+0x4>
   42bd7:	00 00 08 00 

    // Interrupt handler; most interrupts are effectively ignored
    memset(interrupt_descriptors, 0, sizeof(interrupt_descriptors));
   42bdb:	ba 00 10 00 00       	mov    $0x1000,%edx
   42be0:	be 00 00 00 00       	mov    $0x0,%esi
   42be5:	48 8d 05 b4 16 01 00 	lea    0x116b4(%rip),%rax        # 542a0 <interrupt_descriptors>
   42bec:	48 89 c7             	mov    %rax,%rdi
   42bef:	e8 5c 1c 00 00       	call   44850 <memset>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   42bf4:	c7 45 fc 10 00 00 00 	movl   $0x10,-0x4(%rbp)
   42bfb:	eb 3c                	jmp    42c39 <segments_init+0x15f>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 0,
   42bfd:	48 c7 c0 9c 00 04 00 	mov    $0x4009c,%rax
   42c04:	48 89 c2             	mov    %rax,%rdx
   42c07:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42c0a:	48 c1 e0 04          	shl    $0x4,%rax
   42c0e:	48 89 c1             	mov    %rax,%rcx
   42c11:	48 8d 05 88 16 01 00 	lea    0x11688(%rip),%rax        # 542a0 <interrupt_descriptors>
   42c18:	48 01 c8             	add    %rcx,%rax
   42c1b:	48 89 d1             	mov    %rdx,%rcx
   42c1e:	ba 00 00 00 00       	mov    $0x0,%edx
   42c23:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   42c2a:	0e 00 00 
   42c2d:	48 89 c7             	mov    %rax,%rdi
   42c30:	e8 2b fe ff ff       	call   42a60 <set_gate>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   42c35:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   42c39:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
   42c40:	76 bb                	jbe    42bfd <segments_init+0x123>
                 (uint64_t) default_int_handler);
    }

    // Timer interrupt
    set_gate(&interrupt_descriptors[INT_TIMER], X86GATE_INTERRUPT, 0,
   42c42:	48 c7 c0 36 00 04 00 	mov    $0x40036,%rax
   42c49:	48 89 c1             	mov    %rax,%rcx
   42c4c:	ba 00 00 00 00       	mov    $0x0,%edx
   42c51:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   42c58:	0e 00 00 
   42c5b:	48 89 c6             	mov    %rax,%rsi
   42c5e:	48 8d 05 3b 18 01 00 	lea    0x1183b(%rip),%rax        # 544a0 <interrupt_descriptors+0x200>
   42c65:	48 89 c7             	mov    %rax,%rdi
   42c68:	e8 f3 fd ff ff       	call   42a60 <set_gate>
             (uint64_t) timer_int_handler);

    // GPF and page fault
    set_gate(&interrupt_descriptors[INT_GPF], X86GATE_INTERRUPT, 0,
   42c6d:	48 c7 c0 2e 00 04 00 	mov    $0x4002e,%rax
   42c74:	48 89 c1             	mov    %rax,%rcx
   42c77:	ba 00 00 00 00       	mov    $0x0,%edx
   42c7c:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   42c83:	0e 00 00 
   42c86:	48 89 c6             	mov    %rax,%rsi
   42c89:	48 8d 05 e0 16 01 00 	lea    0x116e0(%rip),%rax        # 54370 <interrupt_descriptors+0xd0>
   42c90:	48 89 c7             	mov    %rax,%rdi
   42c93:	e8 c8 fd ff ff       	call   42a60 <set_gate>
             (uint64_t) gpf_int_handler);
    set_gate(&interrupt_descriptors[INT_PAGEFAULT], X86GATE_INTERRUPT, 0,
   42c98:	48 c7 c0 32 00 04 00 	mov    $0x40032,%rax
   42c9f:	48 89 c1             	mov    %rax,%rcx
   42ca2:	ba 00 00 00 00       	mov    $0x0,%edx
   42ca7:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   42cae:	0e 00 00 
   42cb1:	48 89 c6             	mov    %rax,%rsi
   42cb4:	48 8d 05 c5 16 01 00 	lea    0x116c5(%rip),%rax        # 54380 <interrupt_descriptors+0xe0>
   42cbb:	48 89 c7             	mov    %rax,%rdi
   42cbe:	e8 9d fd ff ff       	call   42a60 <set_gate>
             (uint64_t) pagefault_int_handler);

    // System calls get special handling.
    // Note that the last argument is '3'.  This means that unprivileged
    // (level-3) applications may generate these interrupts.
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   42cc3:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%rbp)
   42cca:	eb 50                	jmp    42d1c <segments_init+0x242>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
                 (uint64_t) sys_int_handlers[i - INT_SYS]);
   42ccc:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42ccf:	83 e8 30             	sub    $0x30,%eax
   42cd2:	89 c0                	mov    %eax,%eax
   42cd4:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   42cdb:	00 
   42cdc:	48 8d 05 04 d4 ff ff 	lea    -0x2bfc(%rip),%rax        # 400e7 <sys_int_handlers>
   42ce3:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
   42ce7:	48 89 c2             	mov    %rax,%rdx
   42cea:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42ced:	48 c1 e0 04          	shl    $0x4,%rax
   42cf1:	48 89 c1             	mov    %rax,%rcx
   42cf4:	48 8d 05 a5 15 01 00 	lea    0x115a5(%rip),%rax        # 542a0 <interrupt_descriptors>
   42cfb:	48 01 c8             	add    %rcx,%rax
   42cfe:	48 89 d1             	mov    %rdx,%rcx
   42d01:	ba 03 00 00 00       	mov    $0x3,%edx
   42d06:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   42d0d:	0e 00 00 
   42d10:	48 89 c7             	mov    %rax,%rdi
   42d13:	e8 48 fd ff ff       	call   42a60 <set_gate>
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   42d18:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   42d1c:	83 7d f8 3f          	cmpl   $0x3f,-0x8(%rbp)
   42d20:	76 aa                	jbe    42ccc <segments_init+0x1f2>
    }

    x86_64_pseudodescriptor idt;
    idt.pseudod_limit = sizeof(interrupt_descriptors) - 1;
   42d22:	66 c7 45 cc ff 0f    	movw   $0xfff,-0x34(%rbp)
    idt.pseudod_base = (uint64_t) interrupt_descriptors;
   42d28:	48 8d 05 71 15 01 00 	lea    0x11571(%rip),%rax        # 542a0 <interrupt_descriptors>
   42d2f:	48 89 45 ce          	mov    %rax,-0x32(%rbp)

    // Reload segment pointers
    asm volatile("lgdt %0\n\t"
   42d33:	b8 28 00 00 00       	mov    $0x28,%eax
   42d38:	0f 01 55 d6          	lgdt   -0x2a(%rbp)
   42d3c:	0f 00 d8             	ltr    %ax
   42d3f:	0f 01 5d cc          	lidt   -0x34(%rbp)
    asm volatile("movq %%cr0,%0" : "=r" (val));
   42d43:	0f 20 c0             	mov    %cr0,%rax
   42d46:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    return val;
   42d4a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
                     "r" ((uint16_t) SEGSEL_TASKSTATE),
                     "m" (idt)
                 : "memory");

    // Set up control registers: check alignment
    uint32_t cr0 = rcr0();
   42d4e:	89 45 f4             	mov    %eax,-0xc(%rbp)
    cr0 |= CR0_PE | CR0_PG | CR0_WP | CR0_AM | CR0_MP | CR0_NE;
   42d51:	81 4d f4 23 00 05 80 	orl    $0x80050023,-0xc(%rbp)
   42d58:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42d5b:	89 45 f0             	mov    %eax,-0x10(%rbp)
    uint64_t xval = val;
   42d5e:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42d61:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    asm volatile("movq %0,%%cr0" : : "r" (xval));
   42d65:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42d69:	0f 22 c0             	mov    %rax,%cr0
}
   42d6c:	90                   	nop
    lcr0(cr0);
}
   42d6d:	90                   	nop
   42d6e:	c9                   	leave  
   42d6f:	c3                   	ret    

0000000000042d70 <interrupt_mask>:
#define TIMER_FREQ      1193182
#define TIMER_DIV(x)    ((TIMER_FREQ+(x)/2)/(x))

static uint16_t interrupts_enabled;

static void interrupt_mask(void) {
   42d70:	f3 0f 1e fa          	endbr64 
   42d74:	55                   	push   %rbp
   42d75:	48 89 e5             	mov    %rsp,%rbp
   42d78:	48 83 ec 20          	sub    $0x20,%rsp
    uint16_t masked = ~interrupts_enabled;
   42d7c:	0f b7 05 7d 25 01 00 	movzwl 0x1257d(%rip),%eax        # 55300 <interrupts_enabled>
   42d83:	f7 d0                	not    %eax
   42d85:	66 89 45 fe          	mov    %ax,-0x2(%rbp)
    outb(IO_PIC1+1, masked & 0xFF);
   42d89:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   42d8d:	0f b6 c0             	movzbl %al,%eax
   42d90:	c7 45 f0 21 00 00 00 	movl   $0x21,-0x10(%rbp)
   42d97:	88 45 ef             	mov    %al,-0x11(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42d9a:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   42d9e:	8b 55 f0             	mov    -0x10(%rbp),%edx
   42da1:	ee                   	out    %al,(%dx)
}
   42da2:	90                   	nop
    outb(IO_PIC2+1, (masked >> 8) & 0xFF);
   42da3:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   42da7:	66 c1 e8 08          	shr    $0x8,%ax
   42dab:	0f b6 c0             	movzbl %al,%eax
   42dae:	c7 45 f8 a1 00 00 00 	movl   $0xa1,-0x8(%rbp)
   42db5:	88 45 f7             	mov    %al,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42db8:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   42dbc:	8b 55 f8             	mov    -0x8(%rbp),%edx
   42dbf:	ee                   	out    %al,(%dx)
}
   42dc0:	90                   	nop
}
   42dc1:	90                   	nop
   42dc2:	c9                   	leave  
   42dc3:	c3                   	ret    

0000000000042dc4 <interrupt_init>:

void interrupt_init(void) {
   42dc4:	f3 0f 1e fa          	endbr64 
   42dc8:	55                   	push   %rbp
   42dc9:	48 89 e5             	mov    %rsp,%rbp
   42dcc:	48 83 ec 60          	sub    $0x60,%rsp
    // mask all interrupts
    interrupts_enabled = 0;
   42dd0:	66 c7 05 27 25 01 00 	movw   $0x0,0x12527(%rip)        # 55300 <interrupts_enabled>
   42dd7:	00 00 
    interrupt_mask();
   42dd9:	e8 92 ff ff ff       	call   42d70 <interrupt_mask>
   42dde:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%rbp)
   42de5:	c6 45 a3 11          	movb   $0x11,-0x5d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42de9:	0f b6 45 a3          	movzbl -0x5d(%rbp),%eax
   42ded:	8b 55 a4             	mov    -0x5c(%rbp),%edx
   42df0:	ee                   	out    %al,(%dx)
}
   42df1:	90                   	nop
   42df2:	c7 45 ac 21 00 00 00 	movl   $0x21,-0x54(%rbp)
   42df9:	c6 45 ab 20          	movb   $0x20,-0x55(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42dfd:	0f b6 45 ab          	movzbl -0x55(%rbp),%eax
   42e01:	8b 55 ac             	mov    -0x54(%rbp),%edx
   42e04:	ee                   	out    %al,(%dx)
}
   42e05:	90                   	nop
   42e06:	c7 45 b4 21 00 00 00 	movl   $0x21,-0x4c(%rbp)
   42e0d:	c6 45 b3 04          	movb   $0x4,-0x4d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42e11:	0f b6 45 b3          	movzbl -0x4d(%rbp),%eax
   42e15:	8b 55 b4             	mov    -0x4c(%rbp),%edx
   42e18:	ee                   	out    %al,(%dx)
}
   42e19:	90                   	nop
   42e1a:	c7 45 bc 21 00 00 00 	movl   $0x21,-0x44(%rbp)
   42e21:	c6 45 bb 03          	movb   $0x3,-0x45(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42e25:	0f b6 45 bb          	movzbl -0x45(%rbp),%eax
   42e29:	8b 55 bc             	mov    -0x44(%rbp),%edx
   42e2c:	ee                   	out    %al,(%dx)
}
   42e2d:	90                   	nop
   42e2e:	c7 45 c4 a0 00 00 00 	movl   $0xa0,-0x3c(%rbp)
   42e35:	c6 45 c3 11          	movb   $0x11,-0x3d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42e39:	0f b6 45 c3          	movzbl -0x3d(%rbp),%eax
   42e3d:	8b 55 c4             	mov    -0x3c(%rbp),%edx
   42e40:	ee                   	out    %al,(%dx)
}
   42e41:	90                   	nop
   42e42:	c7 45 cc a1 00 00 00 	movl   $0xa1,-0x34(%rbp)
   42e49:	c6 45 cb 28          	movb   $0x28,-0x35(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42e4d:	0f b6 45 cb          	movzbl -0x35(%rbp),%eax
   42e51:	8b 55 cc             	mov    -0x34(%rbp),%edx
   42e54:	ee                   	out    %al,(%dx)
}
   42e55:	90                   	nop
   42e56:	c7 45 d4 a1 00 00 00 	movl   $0xa1,-0x2c(%rbp)
   42e5d:	c6 45 d3 02          	movb   $0x2,-0x2d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42e61:	0f b6 45 d3          	movzbl -0x2d(%rbp),%eax
   42e65:	8b 55 d4             	mov    -0x2c(%rbp),%edx
   42e68:	ee                   	out    %al,(%dx)
}
   42e69:	90                   	nop
   42e6a:	c7 45 dc a1 00 00 00 	movl   $0xa1,-0x24(%rbp)
   42e71:	c6 45 db 01          	movb   $0x1,-0x25(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42e75:	0f b6 45 db          	movzbl -0x25(%rbp),%eax
   42e79:	8b 55 dc             	mov    -0x24(%rbp),%edx
   42e7c:	ee                   	out    %al,(%dx)
}
   42e7d:	90                   	nop
   42e7e:	c7 45 e4 20 00 00 00 	movl   $0x20,-0x1c(%rbp)
   42e85:	c6 45 e3 68          	movb   $0x68,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42e89:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   42e8d:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   42e90:	ee                   	out    %al,(%dx)
}
   42e91:	90                   	nop
   42e92:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
   42e99:	c6 45 eb 0a          	movb   $0xa,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42e9d:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   42ea1:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42ea4:	ee                   	out    %al,(%dx)
}
   42ea5:	90                   	nop
   42ea6:	c7 45 f4 a0 00 00 00 	movl   $0xa0,-0xc(%rbp)
   42ead:	c6 45 f3 68          	movb   $0x68,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42eb1:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   42eb5:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42eb8:	ee                   	out    %al,(%dx)
}
   42eb9:	90                   	nop
   42eba:	c7 45 fc a0 00 00 00 	movl   $0xa0,-0x4(%rbp)
   42ec1:	c6 45 fb 0a          	movb   $0xa,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42ec5:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42ec9:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42ecc:	ee                   	out    %al,(%dx)
}
   42ecd:	90                   	nop

    outb(IO_PIC2, 0x68);               /* OCW3 */
    outb(IO_PIC2, 0x0a);               /* OCW3 */

    // re-disable interrupts
    interrupt_mask();
   42ece:	e8 9d fe ff ff       	call   42d70 <interrupt_mask>
}
   42ed3:	90                   	nop
   42ed4:	c9                   	leave  
   42ed5:	c3                   	ret    

0000000000042ed6 <timer_init>:

// timer_init(rate)
//    Set the timer interrupt to fire `rate` times a second. Disables the
//    timer interrupt if `rate <= 0`.

void timer_init(int rate) {
   42ed6:	f3 0f 1e fa          	endbr64 
   42eda:	55                   	push   %rbp
   42edb:	48 89 e5             	mov    %rsp,%rbp
   42ede:	48 83 ec 28          	sub    $0x28,%rsp
   42ee2:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (rate > 0) {
   42ee5:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   42ee9:	0f 8e 9f 00 00 00    	jle    42f8e <timer_init+0xb8>
   42eef:	c7 45 ec 43 00 00 00 	movl   $0x43,-0x14(%rbp)
   42ef6:	c6 45 eb 34          	movb   $0x34,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42efa:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   42efe:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42f01:	ee                   	out    %al,(%dx)
}
   42f02:	90                   	nop
        outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
        outb(IO_TIMER1, TIMER_DIV(rate) % 256);
   42f03:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42f06:	89 c2                	mov    %eax,%edx
   42f08:	c1 ea 1f             	shr    $0x1f,%edx
   42f0b:	01 d0                	add    %edx,%eax
   42f0d:	d1 f8                	sar    %eax
   42f0f:	05 de 34 12 00       	add    $0x1234de,%eax
   42f14:	99                   	cltd   
   42f15:	f7 7d dc             	idivl  -0x24(%rbp)
   42f18:	89 c2                	mov    %eax,%edx
   42f1a:	89 d0                	mov    %edx,%eax
   42f1c:	c1 f8 1f             	sar    $0x1f,%eax
   42f1f:	c1 e8 18             	shr    $0x18,%eax
   42f22:	89 c1                	mov    %eax,%ecx
   42f24:	8d 04 0a             	lea    (%rdx,%rcx,1),%eax
   42f27:	0f b6 c0             	movzbl %al,%eax
   42f2a:	29 c8                	sub    %ecx,%eax
   42f2c:	0f b6 c0             	movzbl %al,%eax
   42f2f:	c7 45 f4 40 00 00 00 	movl   $0x40,-0xc(%rbp)
   42f36:	88 45 f3             	mov    %al,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42f39:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   42f3d:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42f40:	ee                   	out    %al,(%dx)
}
   42f41:	90                   	nop
        outb(IO_TIMER1, TIMER_DIV(rate) / 256);
   42f42:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42f45:	89 c2                	mov    %eax,%edx
   42f47:	c1 ea 1f             	shr    $0x1f,%edx
   42f4a:	01 d0                	add    %edx,%eax
   42f4c:	d1 f8                	sar    %eax
   42f4e:	05 de 34 12 00       	add    $0x1234de,%eax
   42f53:	99                   	cltd   
   42f54:	f7 7d dc             	idivl  -0x24(%rbp)
   42f57:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   42f5d:	85 c0                	test   %eax,%eax
   42f5f:	0f 48 c2             	cmovs  %edx,%eax
   42f62:	c1 f8 08             	sar    $0x8,%eax
   42f65:	0f b6 c0             	movzbl %al,%eax
   42f68:	c7 45 fc 40 00 00 00 	movl   $0x40,-0x4(%rbp)
   42f6f:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42f72:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42f76:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42f79:	ee                   	out    %al,(%dx)
}
   42f7a:	90                   	nop
        interrupts_enabled |= 1 << (INT_TIMER - INT_HARDWARE);
   42f7b:	0f b7 05 7e 23 01 00 	movzwl 0x1237e(%rip),%eax        # 55300 <interrupts_enabled>
   42f82:	83 c8 01             	or     $0x1,%eax
   42f85:	66 89 05 74 23 01 00 	mov    %ax,0x12374(%rip)        # 55300 <interrupts_enabled>
   42f8c:	eb 11                	jmp    42f9f <timer_init+0xc9>
    } else {
        interrupts_enabled &= ~(1 << (INT_TIMER - INT_HARDWARE));
   42f8e:	0f b7 05 6b 23 01 00 	movzwl 0x1236b(%rip),%eax        # 55300 <interrupts_enabled>
   42f95:	83 e0 fe             	and    $0xfffffffe,%eax
   42f98:	66 89 05 61 23 01 00 	mov    %ax,0x12361(%rip)        # 55300 <interrupts_enabled>
    }
    interrupt_mask();
   42f9f:	e8 cc fd ff ff       	call   42d70 <interrupt_mask>
}
   42fa4:	90                   	nop
   42fa5:	c9                   	leave  
   42fa6:	c3                   	ret    

0000000000042fa7 <physical_memory_isreserved>:
//    Returns non-zero iff `pa` is a reserved physical address.

#define IOPHYSMEM       0x000A0000
#define EXTPHYSMEM      0x00100000

int physical_memory_isreserved(uintptr_t pa) {
   42fa7:	f3 0f 1e fa          	endbr64 
   42fab:	55                   	push   %rbp
   42fac:	48 89 e5             	mov    %rsp,%rbp
   42faf:	48 83 ec 08          	sub    $0x8,%rsp
   42fb3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return pa == 0 || (pa >= IOPHYSMEM && pa < EXTPHYSMEM);
   42fb7:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   42fbc:	74 14                	je     42fd2 <physical_memory_isreserved+0x2b>
   42fbe:	48 81 7d f8 ff ff 09 	cmpq   $0x9ffff,-0x8(%rbp)
   42fc5:	00 
   42fc6:	76 11                	jbe    42fd9 <physical_memory_isreserved+0x32>
   42fc8:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   42fcf:	00 
   42fd0:	77 07                	ja     42fd9 <physical_memory_isreserved+0x32>
   42fd2:	b8 01 00 00 00       	mov    $0x1,%eax
   42fd7:	eb 05                	jmp    42fde <physical_memory_isreserved+0x37>
   42fd9:	b8 00 00 00 00       	mov    $0x0,%eax
}
   42fde:	c9                   	leave  
   42fdf:	c3                   	ret    

0000000000042fe0 <pci_make_configaddr>:


// pci_make_configaddr(bus, slot, func)
//    Construct a PCI configuration space address from parts.

static int pci_make_configaddr(int bus, int slot, int func) {
   42fe0:	f3 0f 1e fa          	endbr64 
   42fe4:	55                   	push   %rbp
   42fe5:	48 89 e5             	mov    %rsp,%rbp
   42fe8:	48 83 ec 10          	sub    $0x10,%rsp
   42fec:	89 7d fc             	mov    %edi,-0x4(%rbp)
   42fef:	89 75 f8             	mov    %esi,-0x8(%rbp)
   42ff2:	89 55 f4             	mov    %edx,-0xc(%rbp)
    return (bus << 16) | (slot << 11) | (func << 8);
   42ff5:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42ff8:	c1 e0 10             	shl    $0x10,%eax
   42ffb:	89 c2                	mov    %eax,%edx
   42ffd:	8b 45 f8             	mov    -0x8(%rbp),%eax
   43000:	c1 e0 0b             	shl    $0xb,%eax
   43003:	09 c2                	or     %eax,%edx
   43005:	8b 45 f4             	mov    -0xc(%rbp),%eax
   43008:	c1 e0 08             	shl    $0x8,%eax
   4300b:	09 d0                	or     %edx,%eax
}
   4300d:	c9                   	leave  
   4300e:	c3                   	ret    

000000000004300f <pci_config_readl>:
//    Read a 32-bit word in PCI configuration space.

#define PCI_HOST_BRIDGE_CONFIG_ADDR 0xCF8
#define PCI_HOST_BRIDGE_CONFIG_DATA 0xCFC

static uint32_t pci_config_readl(int configaddr, int offset) {
   4300f:	f3 0f 1e fa          	endbr64 
   43013:	55                   	push   %rbp
   43014:	48 89 e5             	mov    %rsp,%rbp
   43017:	48 83 ec 18          	sub    $0x18,%rsp
   4301b:	89 7d ec             	mov    %edi,-0x14(%rbp)
   4301e:	89 75 e8             	mov    %esi,-0x18(%rbp)
    outl(PCI_HOST_BRIDGE_CONFIG_ADDR, 0x80000000 | configaddr | offset);
   43021:	8b 55 ec             	mov    -0x14(%rbp),%edx
   43024:	8b 45 e8             	mov    -0x18(%rbp),%eax
   43027:	09 d0                	or     %edx,%eax
   43029:	0d 00 00 00 80       	or     $0x80000000,%eax
   4302e:	c7 45 f4 f8 0c 00 00 	movl   $0xcf8,-0xc(%rbp)
   43035:	89 45 f0             	mov    %eax,-0x10(%rbp)
    asm volatile("outl %0,%w1" : : "a" (data), "d" (port));
   43038:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4303b:	8b 55 f4             	mov    -0xc(%rbp),%edx
   4303e:	ef                   	out    %eax,(%dx)
}
   4303f:	90                   	nop
   43040:	c7 45 fc fc 0c 00 00 	movl   $0xcfc,-0x4(%rbp)
    asm volatile("inl %w1,%0" : "=a" (data) : "d" (port));
   43047:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4304a:	89 c2                	mov    %eax,%edx
   4304c:	ed                   	in     (%dx),%eax
   4304d:	89 45 f8             	mov    %eax,-0x8(%rbp)
    return data;
   43050:	8b 45 f8             	mov    -0x8(%rbp),%eax
    return inl(PCI_HOST_BRIDGE_CONFIG_DATA);
}
   43053:	c9                   	leave  
   43054:	c3                   	ret    

0000000000043055 <pci_find_device>:

// pci_find_device
//    Search for a PCI device matching `vendor` and `device`. Return
//    the config base address or -1 if no device was found.

static int pci_find_device(int vendor, int device) {
   43055:	f3 0f 1e fa          	endbr64 
   43059:	55                   	push   %rbp
   4305a:	48 89 e5             	mov    %rsp,%rbp
   4305d:	48 83 ec 28          	sub    $0x28,%rsp
   43061:	89 7d dc             	mov    %edi,-0x24(%rbp)
   43064:	89 75 d8             	mov    %esi,-0x28(%rbp)
    for (int bus = 0; bus != 256; ++bus) {
   43067:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4306e:	eb 73                	jmp    430e3 <pci_find_device+0x8e>
        for (int slot = 0; slot != 32; ++slot) {
   43070:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   43077:	eb 60                	jmp    430d9 <pci_find_device+0x84>
            for (int func = 0; func != 8; ++func) {
   43079:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   43080:	eb 4a                	jmp    430cc <pci_find_device+0x77>
                int configaddr = pci_make_configaddr(bus, slot, func);
   43082:	8b 55 f4             	mov    -0xc(%rbp),%edx
   43085:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   43088:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4308b:	89 ce                	mov    %ecx,%esi
   4308d:	89 c7                	mov    %eax,%edi
   4308f:	e8 4c ff ff ff       	call   42fe0 <pci_make_configaddr>
   43094:	89 45 f0             	mov    %eax,-0x10(%rbp)
                uint32_t vendor_device = pci_config_readl(configaddr, 0);
   43097:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4309a:	be 00 00 00 00       	mov    $0x0,%esi
   4309f:	89 c7                	mov    %eax,%edi
   430a1:	e8 69 ff ff ff       	call   4300f <pci_config_readl>
   430a6:	89 45 ec             	mov    %eax,-0x14(%rbp)
                if (vendor_device == (uint32_t) (vendor | (device << 16))) {
   430a9:	8b 45 d8             	mov    -0x28(%rbp),%eax
   430ac:	c1 e0 10             	shl    $0x10,%eax
   430af:	0b 45 dc             	or     -0x24(%rbp),%eax
   430b2:	39 45 ec             	cmp    %eax,-0x14(%rbp)
   430b5:	75 05                	jne    430bc <pci_find_device+0x67>
                    return configaddr;
   430b7:	8b 45 f0             	mov    -0x10(%rbp),%eax
   430ba:	eb 35                	jmp    430f1 <pci_find_device+0x9c>
                } else if (vendor_device == (uint32_t) -1 && func == 0) {
   430bc:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%rbp)
   430c0:	75 06                	jne    430c8 <pci_find_device+0x73>
   430c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   430c6:	74 0c                	je     430d4 <pci_find_device+0x7f>
            for (int func = 0; func != 8; ++func) {
   430c8:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   430cc:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
   430d0:	75 b0                	jne    43082 <pci_find_device+0x2d>
   430d2:	eb 01                	jmp    430d5 <pci_find_device+0x80>
                    break;
   430d4:	90                   	nop
        for (int slot = 0; slot != 32; ++slot) {
   430d5:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   430d9:	83 7d f8 20          	cmpl   $0x20,-0x8(%rbp)
   430dd:	75 9a                	jne    43079 <pci_find_device+0x24>
    for (int bus = 0; bus != 256; ++bus) {
   430df:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   430e3:	81 7d fc 00 01 00 00 	cmpl   $0x100,-0x4(%rbp)
   430ea:	75 84                	jne    43070 <pci_find_device+0x1b>
                }
            }
        }
    }
    return -1;
   430ec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   430f1:	c9                   	leave  
   430f2:	c3                   	ret    

00000000000430f3 <poweroff>:
//    that speaks ACPI; QEMU emulates a PIIX4 Power Management Controller.

#define PCI_VENDOR_ID_INTEL     0x8086
#define PCI_DEVICE_ID_PIIX4     0x7113

void poweroff(void) {
   430f3:	f3 0f 1e fa          	endbr64 
   430f7:	55                   	push   %rbp
   430f8:	48 89 e5             	mov    %rsp,%rbp
   430fb:	48 83 ec 10          	sub    $0x10,%rsp
    int configaddr = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PIIX4);
   430ff:	be 13 71 00 00       	mov    $0x7113,%esi
   43104:	bf 86 80 00 00       	mov    $0x8086,%edi
   43109:	e8 47 ff ff ff       	call   43055 <pci_find_device>
   4310e:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (configaddr >= 0) {
   43111:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   43115:	78 30                	js     43147 <poweroff+0x54>
        // Read I/O base register from controller's PCI configuration space.
        int pm_io_base = pci_config_readl(configaddr, 0x40) & 0xFFC0;
   43117:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4311a:	be 40 00 00 00       	mov    $0x40,%esi
   4311f:	89 c7                	mov    %eax,%edi
   43121:	e8 e9 fe ff ff       	call   4300f <pci_config_readl>
   43126:	25 c0 ff 00 00       	and    $0xffc0,%eax
   4312b:	89 45 f8             	mov    %eax,-0x8(%rbp)
        // Write `suspend enable` to the power management control register.
        outw(pm_io_base + 4, 0x2000);
   4312e:	8b 45 f8             	mov    -0x8(%rbp),%eax
   43131:	83 c0 04             	add    $0x4,%eax
   43134:	89 45 f4             	mov    %eax,-0xc(%rbp)
   43137:	66 c7 45 f2 00 20    	movw   $0x2000,-0xe(%rbp)
    asm volatile("outw %0,%w1" : : "a" (data), "d" (port));
   4313d:	0f b7 45 f2          	movzwl -0xe(%rbp),%eax
   43141:	8b 55 f4             	mov    -0xc(%rbp),%edx
   43144:	66 ef                	out    %ax,(%dx)
}
   43146:	90                   	nop
    }
    // No PIIX4; spin.
    console_printf(CPOS(24, 0), 0xC000, "Cannot power off!\n");
   43147:	48 8d 05 b2 2a 00 00 	lea    0x2ab2(%rip),%rax        # 45c00 <memstate_colors+0xc0>
   4314e:	48 89 c2             	mov    %rax,%rdx
   43151:	be 00 c0 00 00       	mov    $0xc000,%esi
   43156:	bf 80 07 00 00       	mov    $0x780,%edi
   4315b:	b8 00 00 00 00       	mov    $0x0,%eax
   43160:	e8 2a 25 00 00       	call   4568f <console_printf>
 spinloop: goto spinloop;
   43165:	eb fe                	jmp    43165 <poweroff+0x72>

0000000000043167 <reboot>:


// reboot
//    Reboot the virtual machine.

void reboot(void) {
   43167:	f3 0f 1e fa          	endbr64 
   4316b:	55                   	push   %rbp
   4316c:	48 89 e5             	mov    %rsp,%rbp
   4316f:	48 83 ec 10          	sub    $0x10,%rsp
   43173:	c7 45 fc 92 00 00 00 	movl   $0x92,-0x4(%rbp)
   4317a:	c6 45 fb 03          	movb   $0x3,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4317e:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   43182:	8b 55 fc             	mov    -0x4(%rbp),%edx
   43185:	ee                   	out    %al,(%dx)
}
   43186:	90                   	nop
    outb(0x92, 3);
 spinloop: goto spinloop;
   43187:	eb fe                	jmp    43187 <reboot+0x20>

0000000000043189 <process_init>:


// process_init(p, flags)
//    Initialize special-purpose registers for process `p`.

void process_init(proc* p, int flags) {
   43189:	f3 0f 1e fa          	endbr64 
   4318d:	55                   	push   %rbp
   4318e:	48 89 e5             	mov    %rsp,%rbp
   43191:	48 83 ec 10          	sub    $0x10,%rsp
   43195:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   43199:	89 75 f4             	mov    %esi,-0xc(%rbp)
    memset(&p->p_registers, 0, sizeof(p->p_registers));
   4319c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   431a0:	48 83 c0 08          	add    $0x8,%rax
   431a4:	ba c0 00 00 00       	mov    $0xc0,%edx
   431a9:	be 00 00 00 00       	mov    $0x0,%esi
   431ae:	48 89 c7             	mov    %rax,%rdi
   431b1:	e8 9a 16 00 00       	call   44850 <memset>
    p->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
   431b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   431ba:	66 c7 80 a8 00 00 00 	movw   $0x13,0xa8(%rax)
   431c1:	13 00 
    p->p_registers.reg_fs = SEGSEL_APP_DATA | 3;
   431c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   431c7:	48 c7 80 80 00 00 00 	movq   $0x23,0x80(%rax)
   431ce:	23 00 00 00 
    p->p_registers.reg_gs = SEGSEL_APP_DATA | 3;
   431d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   431d6:	48 c7 80 88 00 00 00 	movq   $0x23,0x88(%rax)
   431dd:	23 00 00 00 
    p->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
   431e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   431e5:	66 c7 80 c0 00 00 00 	movw   $0x23,0xc0(%rax)
   431ec:	23 00 
    p->p_registers.reg_rflags = EFLAGS_IF;
   431ee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   431f2:	48 c7 80 b0 00 00 00 	movq   $0x200,0xb0(%rax)
   431f9:	00 02 00 00 
    p->display_status = 1;
   431fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43201:	c6 80 d8 00 00 00 01 	movb   $0x1,0xd8(%rax)

    if (flags & PROCINIT_ALLOW_PROGRAMMED_IO) {
   43208:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4320b:	83 e0 01             	and    $0x1,%eax
   4320e:	85 c0                	test   %eax,%eax
   43210:	74 1c                	je     4322e <process_init+0xa5>
        p->p_registers.reg_rflags |= EFLAGS_IOPL_3;
   43212:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43216:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   4321d:	80 cc 30             	or     $0x30,%ah
   43220:	48 89 c2             	mov    %rax,%rdx
   43223:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43227:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
    if (flags & PROCINIT_DISABLE_INTERRUPTS) {
   4322e:	8b 45 f4             	mov    -0xc(%rbp),%eax
   43231:	83 e0 02             	and    $0x2,%eax
   43234:	85 c0                	test   %eax,%eax
   43236:	74 1c                	je     43254 <process_init+0xcb>
        p->p_registers.reg_rflags &= ~EFLAGS_IF;
   43238:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4323c:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   43243:	80 e4 fd             	and    $0xfd,%ah
   43246:	48 89 c2             	mov    %rax,%rdx
   43249:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4324d:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
}
   43254:	90                   	nop
   43255:	c9                   	leave  
   43256:	c3                   	ret    

0000000000043257 <console_show_cursor>:

// console_show_cursor(cpos)
//    Move the console cursor to position `cpos`, which should be between 0
//    and 80 * 25.

void console_show_cursor(int cpos) {
   43257:	f3 0f 1e fa          	endbr64 
   4325b:	55                   	push   %rbp
   4325c:	48 89 e5             	mov    %rsp,%rbp
   4325f:	48 83 ec 28          	sub    $0x28,%rsp
   43263:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (cpos < 0 || cpos > CONSOLE_ROWS * CONSOLE_COLUMNS) {
   43266:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   4326a:	78 09                	js     43275 <console_show_cursor+0x1e>
   4326c:	81 7d dc d0 07 00 00 	cmpl   $0x7d0,-0x24(%rbp)
   43273:	7e 07                	jle    4327c <console_show_cursor+0x25>
        cpos = 0;
   43275:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
   4327c:	c7 45 e4 d4 03 00 00 	movl   $0x3d4,-0x1c(%rbp)
   43283:	c6 45 e3 0e          	movb   $0xe,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   43287:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   4328b:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   4328e:	ee                   	out    %al,(%dx)
}
   4328f:	90                   	nop
    }
    outb(0x3D4, 14);
    outb(0x3D5, cpos / 256);
   43290:	8b 45 dc             	mov    -0x24(%rbp),%eax
   43293:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   43299:	85 c0                	test   %eax,%eax
   4329b:	0f 48 c2             	cmovs  %edx,%eax
   4329e:	c1 f8 08             	sar    $0x8,%eax
   432a1:	0f b6 c0             	movzbl %al,%eax
   432a4:	c7 45 ec d5 03 00 00 	movl   $0x3d5,-0x14(%rbp)
   432ab:	88 45 eb             	mov    %al,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   432ae:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   432b2:	8b 55 ec             	mov    -0x14(%rbp),%edx
   432b5:	ee                   	out    %al,(%dx)
}
   432b6:	90                   	nop
   432b7:	c7 45 f4 d4 03 00 00 	movl   $0x3d4,-0xc(%rbp)
   432be:	c6 45 f3 0f          	movb   $0xf,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   432c2:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   432c6:	8b 55 f4             	mov    -0xc(%rbp),%edx
   432c9:	ee                   	out    %al,(%dx)
}
   432ca:	90                   	nop
    outb(0x3D4, 15);
    outb(0x3D5, cpos % 256);
   432cb:	8b 45 dc             	mov    -0x24(%rbp),%eax
   432ce:	99                   	cltd   
   432cf:	c1 ea 18             	shr    $0x18,%edx
   432d2:	01 d0                	add    %edx,%eax
   432d4:	0f b6 c0             	movzbl %al,%eax
   432d7:	29 d0                	sub    %edx,%eax
   432d9:	0f b6 c0             	movzbl %al,%eax
   432dc:	c7 45 fc d5 03 00 00 	movl   $0x3d5,-0x4(%rbp)
   432e3:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   432e6:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   432ea:	8b 55 fc             	mov    -0x4(%rbp),%edx
   432ed:	ee                   	out    %al,(%dx)
}
   432ee:	90                   	nop
}
   432ef:	90                   	nop
   432f0:	c9                   	leave  
   432f1:	c3                   	ret    

00000000000432f2 <keyboard_readc>:
    /*CKEY(16)*/ {{'\'', '"', 0, 0}},  /*CKEY(17)*/ {{'`', '~', 0, 0}},
    /*CKEY(18)*/ {{'\\', '|', 034, 0}},  /*CKEY(19)*/ {{',', '<', 0, 0}},
    /*CKEY(20)*/ {{'.', '>', 0, 0}},  /*CKEY(21)*/ {{'/', '?', 0, 0}}
};

int keyboard_readc(void) {
   432f2:	f3 0f 1e fa          	endbr64 
   432f6:	55                   	push   %rbp
   432f7:	48 89 e5             	mov    %rsp,%rbp
   432fa:	48 83 ec 20          	sub    $0x20,%rsp
   432fe:	c7 45 f0 64 00 00 00 	movl   $0x64,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   43305:	8b 45 f0             	mov    -0x10(%rbp),%eax
   43308:	89 c2                	mov    %eax,%edx
   4330a:	ec                   	in     (%dx),%al
   4330b:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   4330e:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    static uint8_t modifiers;
    static uint8_t last_escape;

    if ((inb(KEYBOARD_STATUSREG) & KEYBOARD_STATUS_READY) == 0) {
   43312:	0f b6 c0             	movzbl %al,%eax
   43315:	83 e0 01             	and    $0x1,%eax
   43318:	85 c0                	test   %eax,%eax
   4331a:	75 0a                	jne    43326 <keyboard_readc+0x34>
        return -1;
   4331c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43321:	e9 fd 01 00 00       	jmp    43523 <keyboard_readc+0x231>
   43326:	c7 45 e8 60 00 00 00 	movl   $0x60,-0x18(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   4332d:	8b 45 e8             	mov    -0x18(%rbp),%eax
   43330:	89 c2                	mov    %eax,%edx
   43332:	ec                   	in     (%dx),%al
   43333:	88 45 e7             	mov    %al,-0x19(%rbp)
    return data;
   43336:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
    }

    uint8_t data = inb(KEYBOARD_DATAREG);
   4333a:	88 45 fb             	mov    %al,-0x5(%rbp)
    uint8_t escape = last_escape;
   4333d:	0f b6 05 be 1f 01 00 	movzbl 0x11fbe(%rip),%eax        # 55302 <last_escape.2>
   43344:	88 45 fa             	mov    %al,-0x6(%rbp)
    last_escape = 0;
   43347:	c6 05 b4 1f 01 00 00 	movb   $0x0,0x11fb4(%rip)        # 55302 <last_escape.2>

    if (data == 0xE0) {         // mode shift
   4334e:	80 7d fb e0          	cmpb   $0xe0,-0x5(%rbp)
   43352:	75 11                	jne    43365 <keyboard_readc+0x73>
        last_escape = 0x80;
   43354:	c6 05 a7 1f 01 00 80 	movb   $0x80,0x11fa7(%rip)        # 55302 <last_escape.2>
        return 0;
   4335b:	b8 00 00 00 00       	mov    $0x0,%eax
   43360:	e9 be 01 00 00       	jmp    43523 <keyboard_readc+0x231>
    } else if (data & 0x80) {   // key release: matters only for modifier keys
   43365:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   43369:	84 c0                	test   %al,%al
   4336b:	79 64                	jns    433d1 <keyboard_readc+0xdf>
        int ch = keymap[(data & 0x7F) | escape];
   4336d:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   43371:	83 e0 7f             	and    $0x7f,%eax
   43374:	89 c2                	mov    %eax,%edx
   43376:	0f b6 45 fa          	movzbl -0x6(%rbp),%eax
   4337a:	09 d0                	or     %edx,%eax
   4337c:	48 98                	cltq   
   4337e:	48 8d 15 9b 28 00 00 	lea    0x289b(%rip),%rdx        # 45c20 <keymap>
   43385:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
   43389:	0f b6 c0             	movzbl %al,%eax
   4338c:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   4338f:	81 7d f4 f9 00 00 00 	cmpl   $0xf9,-0xc(%rbp)
   43396:	7e 2f                	jle    433c7 <keyboard_readc+0xd5>
   43398:	81 7d f4 fc 00 00 00 	cmpl   $0xfc,-0xc(%rbp)
   4339f:	7f 26                	jg     433c7 <keyboard_readc+0xd5>
            modifiers &= ~(1 << (ch - KEY_SHIFT));
   433a1:	8b 45 f4             	mov    -0xc(%rbp),%eax
   433a4:	2d fa 00 00 00       	sub    $0xfa,%eax
   433a9:	ba 01 00 00 00       	mov    $0x1,%edx
   433ae:	89 c1                	mov    %eax,%ecx
   433b0:	d3 e2                	shl    %cl,%edx
   433b2:	89 d0                	mov    %edx,%eax
   433b4:	f7 d0                	not    %eax
   433b6:	89 c2                	mov    %eax,%edx
   433b8:	0f b6 05 44 1f 01 00 	movzbl 0x11f44(%rip),%eax        # 55303 <modifiers.1>
   433bf:	21 d0                	and    %edx,%eax
   433c1:	88 05 3c 1f 01 00    	mov    %al,0x11f3c(%rip)        # 55303 <modifiers.1>
        }
        return 0;
   433c7:	b8 00 00 00 00       	mov    $0x0,%eax
   433cc:	e9 52 01 00 00       	jmp    43523 <keyboard_readc+0x231>
    }

    int ch = (unsigned char) keymap[data | escape];
   433d1:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   433d5:	0a 45 fa             	or     -0x6(%rbp),%al
   433d8:	0f b6 c0             	movzbl %al,%eax
   433db:	48 98                	cltq   
   433dd:	48 8d 15 3c 28 00 00 	lea    0x283c(%rip),%rdx        # 45c20 <keymap>
   433e4:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
   433e8:	0f b6 c0             	movzbl %al,%eax
   433eb:	89 45 fc             	mov    %eax,-0x4(%rbp)

    if (ch >= 'a' && ch <= 'z') {
   433ee:	83 7d fc 60          	cmpl   $0x60,-0x4(%rbp)
   433f2:	7e 57                	jle    4344b <keyboard_readc+0x159>
   433f4:	83 7d fc 7a          	cmpl   $0x7a,-0x4(%rbp)
   433f8:	7f 51                	jg     4344b <keyboard_readc+0x159>
        if (modifiers & MOD_CONTROL) {
   433fa:	0f b6 05 02 1f 01 00 	movzbl 0x11f02(%rip),%eax        # 55303 <modifiers.1>
   43401:	0f b6 c0             	movzbl %al,%eax
   43404:	83 e0 02             	and    $0x2,%eax
   43407:	85 c0                	test   %eax,%eax
   43409:	74 09                	je     43414 <keyboard_readc+0x122>
            ch -= 0x60;
   4340b:	83 6d fc 60          	subl   $0x60,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   4340f:	e9 0b 01 00 00       	jmp    4351f <keyboard_readc+0x22d>
        } else if (!(modifiers & MOD_SHIFT) != !(modifiers & MOD_CAPSLOCK)) {
   43414:	0f b6 05 e8 1e 01 00 	movzbl 0x11ee8(%rip),%eax        # 55303 <modifiers.1>
   4341b:	0f b6 c0             	movzbl %al,%eax
   4341e:	83 e0 01             	and    $0x1,%eax
   43421:	85 c0                	test   %eax,%eax
   43423:	0f 94 c2             	sete   %dl
   43426:	0f b6 05 d6 1e 01 00 	movzbl 0x11ed6(%rip),%eax        # 55303 <modifiers.1>
   4342d:	0f b6 c0             	movzbl %al,%eax
   43430:	83 e0 08             	and    $0x8,%eax
   43433:	85 c0                	test   %eax,%eax
   43435:	0f 94 c0             	sete   %al
   43438:	31 d0                	xor    %edx,%eax
   4343a:	84 c0                	test   %al,%al
   4343c:	0f 84 dd 00 00 00    	je     4351f <keyboard_readc+0x22d>
            ch -= 0x20;
   43442:	83 6d fc 20          	subl   $0x20,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   43446:	e9 d4 00 00 00       	jmp    4351f <keyboard_readc+0x22d>
        }
    } else if (ch >= KEY_CAPSLOCK) {
   4344b:	81 7d fc fc 00 00 00 	cmpl   $0xfc,-0x4(%rbp)
   43452:	7e 30                	jle    43484 <keyboard_readc+0x192>
        modifiers ^= 1 << (ch - KEY_SHIFT);
   43454:	8b 45 fc             	mov    -0x4(%rbp),%eax
   43457:	2d fa 00 00 00       	sub    $0xfa,%eax
   4345c:	ba 01 00 00 00       	mov    $0x1,%edx
   43461:	89 c1                	mov    %eax,%ecx
   43463:	d3 e2                	shl    %cl,%edx
   43465:	89 d0                	mov    %edx,%eax
   43467:	89 c2                	mov    %eax,%edx
   43469:	0f b6 05 93 1e 01 00 	movzbl 0x11e93(%rip),%eax        # 55303 <modifiers.1>
   43470:	31 d0                	xor    %edx,%eax
   43472:	88 05 8b 1e 01 00    	mov    %al,0x11e8b(%rip)        # 55303 <modifiers.1>
        ch = 0;
   43478:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4347f:	e9 9c 00 00 00       	jmp    43520 <keyboard_readc+0x22e>
    } else if (ch >= KEY_SHIFT) {
   43484:	81 7d fc f9 00 00 00 	cmpl   $0xf9,-0x4(%rbp)
   4348b:	7e 2d                	jle    434ba <keyboard_readc+0x1c8>
        modifiers |= 1 << (ch - KEY_SHIFT);
   4348d:	8b 45 fc             	mov    -0x4(%rbp),%eax
   43490:	2d fa 00 00 00       	sub    $0xfa,%eax
   43495:	ba 01 00 00 00       	mov    $0x1,%edx
   4349a:	89 c1                	mov    %eax,%ecx
   4349c:	d3 e2                	shl    %cl,%edx
   4349e:	89 d0                	mov    %edx,%eax
   434a0:	89 c2                	mov    %eax,%edx
   434a2:	0f b6 05 5a 1e 01 00 	movzbl 0x11e5a(%rip),%eax        # 55303 <modifiers.1>
   434a9:	09 d0                	or     %edx,%eax
   434ab:	88 05 52 1e 01 00    	mov    %al,0x11e52(%rip)        # 55303 <modifiers.1>
        ch = 0;
   434b1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   434b8:	eb 66                	jmp    43520 <keyboard_readc+0x22e>
    } else if (ch >= CKEY(0) && ch <= CKEY(21)) {
   434ba:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   434be:	7e 3f                	jle    434ff <keyboard_readc+0x20d>
   434c0:	81 7d fc 95 00 00 00 	cmpl   $0x95,-0x4(%rbp)
   434c7:	7f 36                	jg     434ff <keyboard_readc+0x20d>
        ch = complex_keymap[ch - CKEY(0)].map[modifiers & 3];
   434c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
   434cc:	8d 50 80             	lea    -0x80(%rax),%edx
   434cf:	0f b6 05 2d 1e 01 00 	movzbl 0x11e2d(%rip),%eax        # 55303 <modifiers.1>
   434d6:	0f b6 c0             	movzbl %al,%eax
   434d9:	83 e0 03             	and    $0x3,%eax
   434dc:	48 63 c8             	movslq %eax,%rcx
   434df:	48 63 c2             	movslq %edx,%rax
   434e2:	48 c1 e0 02          	shl    $0x2,%rax
   434e6:	48 8d 14 08          	lea    (%rax,%rcx,1),%rdx
   434ea:	48 8d 05 2f 28 00 00 	lea    0x282f(%rip),%rax        # 45d20 <complex_keymap>
   434f1:	48 01 d0             	add    %rdx,%rax
   434f4:	0f b6 00             	movzbl (%rax),%eax
   434f7:	0f b6 c0             	movzbl %al,%eax
   434fa:	89 45 fc             	mov    %eax,-0x4(%rbp)
   434fd:	eb 21                	jmp    43520 <keyboard_readc+0x22e>
    } else if (ch < 0x80 && (modifiers & MOD_CONTROL)) {
   434ff:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   43503:	7f 1b                	jg     43520 <keyboard_readc+0x22e>
   43505:	0f b6 05 f7 1d 01 00 	movzbl 0x11df7(%rip),%eax        # 55303 <modifiers.1>
   4350c:	0f b6 c0             	movzbl %al,%eax
   4350f:	83 e0 02             	and    $0x2,%eax
   43512:	85 c0                	test   %eax,%eax
   43514:	74 0a                	je     43520 <keyboard_readc+0x22e>
        ch = 0;
   43516:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4351d:	eb 01                	jmp    43520 <keyboard_readc+0x22e>
        if (modifiers & MOD_CONTROL) {
   4351f:	90                   	nop
    }

    return ch;
   43520:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
   43523:	c9                   	leave  
   43524:	c3                   	ret    

0000000000043525 <delay>:
#define IO_PARALLEL1_CONTROL    0x37A
# define IO_PARALLEL_CONTROL_SELECT     0x08
# define IO_PARALLEL_CONTROL_INIT       0x04
# define IO_PARALLEL_CONTROL_STROBE     0x01

static void delay(void) {
   43525:	f3 0f 1e fa          	endbr64 
   43529:	55                   	push   %rbp
   4352a:	48 89 e5             	mov    %rsp,%rbp
   4352d:	48 83 ec 20          	sub    $0x20,%rsp
   43531:	c7 45 e4 84 00 00 00 	movl   $0x84,-0x1c(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   43538:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   4353b:	89 c2                	mov    %eax,%edx
   4353d:	ec                   	in     (%dx),%al
   4353e:	88 45 e3             	mov    %al,-0x1d(%rbp)
   43541:	c7 45 ec 84 00 00 00 	movl   $0x84,-0x14(%rbp)
   43548:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4354b:	89 c2                	mov    %eax,%edx
   4354d:	ec                   	in     (%dx),%al
   4354e:	88 45 eb             	mov    %al,-0x15(%rbp)
   43551:	c7 45 f4 84 00 00 00 	movl   $0x84,-0xc(%rbp)
   43558:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4355b:	89 c2                	mov    %eax,%edx
   4355d:	ec                   	in     (%dx),%al
   4355e:	88 45 f3             	mov    %al,-0xd(%rbp)
   43561:	c7 45 fc 84 00 00 00 	movl   $0x84,-0x4(%rbp)
   43568:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4356b:	89 c2                	mov    %eax,%edx
   4356d:	ec                   	in     (%dx),%al
   4356e:	88 45 fb             	mov    %al,-0x5(%rbp)
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
}
   43571:	90                   	nop
   43572:	c9                   	leave  
   43573:	c3                   	ret    

0000000000043574 <parallel_port_putc>:

static void parallel_port_putc(printer* p, unsigned char c, int color) {
   43574:	f3 0f 1e fa          	endbr64 
   43578:	55                   	push   %rbp
   43579:	48 89 e5             	mov    %rsp,%rbp
   4357c:	48 83 ec 40          	sub    $0x40,%rsp
   43580:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   43584:	89 f0                	mov    %esi,%eax
   43586:	89 55 c0             	mov    %edx,-0x40(%rbp)
   43589:	88 45 c4             	mov    %al,-0x3c(%rbp)
    static int initialized;
    (void) p, (void) color;
    if (!initialized) {
   4358c:	8b 05 72 1d 01 00    	mov    0x11d72(%rip),%eax        # 55304 <initialized.0>
   43592:	85 c0                	test   %eax,%eax
   43594:	75 1e                	jne    435b4 <parallel_port_putc+0x40>
   43596:	c7 45 f8 7a 03 00 00 	movl   $0x37a,-0x8(%rbp)
   4359d:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   435a1:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   435a5:	8b 55 f8             	mov    -0x8(%rbp),%edx
   435a8:	ee                   	out    %al,(%dx)
}
   435a9:	90                   	nop
        outb(IO_PARALLEL1_CONTROL, 0);
        initialized = 1;
   435aa:	c7 05 50 1d 01 00 01 	movl   $0x1,0x11d50(%rip)        # 55304 <initialized.0>
   435b1:	00 00 00 
    }

    for (int i = 0;
   435b4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   435bb:	eb 09                	jmp    435c6 <parallel_port_putc+0x52>
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
         ++i) {
        delay();
   435bd:	e8 63 ff ff ff       	call   43525 <delay>
         ++i) {
   435c2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
   435c6:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%rbp)
   435cd:	7f 18                	jg     435e7 <parallel_port_putc+0x73>
   435cf:	c7 45 f0 79 03 00 00 	movl   $0x379,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   435d6:	8b 45 f0             	mov    -0x10(%rbp),%eax
   435d9:	89 c2                	mov    %eax,%edx
   435db:	ec                   	in     (%dx),%al
   435dc:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   435df:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   435e3:	84 c0                	test   %al,%al
   435e5:	79 d6                	jns    435bd <parallel_port_putc+0x49>
    }
    outb(IO_PARALLEL1_DATA, c);
   435e7:	0f b6 45 c4          	movzbl -0x3c(%rbp),%eax
   435eb:	c7 45 d8 78 03 00 00 	movl   $0x378,-0x28(%rbp)
   435f2:	88 45 d7             	mov    %al,-0x29(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   435f5:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
   435f9:	8b 55 d8             	mov    -0x28(%rbp),%edx
   435fc:	ee                   	out    %al,(%dx)
}
   435fd:	90                   	nop
   435fe:	c7 45 e0 7a 03 00 00 	movl   $0x37a,-0x20(%rbp)
   43605:	c6 45 df 0d          	movb   $0xd,-0x21(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   43609:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
   4360d:	8b 55 e0             	mov    -0x20(%rbp),%edx
   43610:	ee                   	out    %al,(%dx)
}
   43611:	90                   	nop
   43612:	c7 45 e8 7a 03 00 00 	movl   $0x37a,-0x18(%rbp)
   43619:	c6 45 e7 0c          	movb   $0xc,-0x19(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4361d:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
   43621:	8b 55 e8             	mov    -0x18(%rbp),%edx
   43624:	ee                   	out    %al,(%dx)
}
   43625:	90                   	nop
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT | IO_PARALLEL_CONTROL_STROBE);
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT);
}
   43626:	90                   	nop
   43627:	c9                   	leave  
   43628:	c3                   	ret    

0000000000043629 <log_vprintf>:

void log_vprintf(const char* format, va_list val) {
   43629:	f3 0f 1e fa          	endbr64 
   4362d:	55                   	push   %rbp
   4362e:	48 89 e5             	mov    %rsp,%rbp
   43631:	48 83 ec 20          	sub    $0x20,%rsp
   43635:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   43639:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    printer p;
    p.putc = parallel_port_putc;
   4363d:	48 8d 05 30 ff ff ff 	lea    -0xd0(%rip),%rax        # 43574 <parallel_port_putc>
   43644:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&p, 0, format, val);
   43648:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
   4364c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   43650:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
   43654:	be 00 00 00 00       	mov    $0x0,%esi
   43659:	48 89 c7             	mov    %rax,%rdi
   4365c:	e8 b5 14 00 00       	call   44b16 <printer_vprintf>
}
   43661:	90                   	nop
   43662:	c9                   	leave  
   43663:	c3                   	ret    

0000000000043664 <log_printf>:

void log_printf(const char* format, ...) {
   43664:	f3 0f 1e fa          	endbr64 
   43668:	55                   	push   %rbp
   43669:	48 89 e5             	mov    %rsp,%rbp
   4366c:	48 83 ec 60          	sub    $0x60,%rsp
   43670:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   43674:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   43678:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   4367c:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   43680:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   43684:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   43688:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   4368f:	48 8d 45 10          	lea    0x10(%rbp),%rax
   43693:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   43697:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4369b:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    log_vprintf(format, val);
   4369f:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
   436a3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   436a7:	48 89 d6             	mov    %rdx,%rsi
   436aa:	48 89 c7             	mov    %rax,%rdi
   436ad:	e8 77 ff ff ff       	call   43629 <log_vprintf>
    va_end(val);
}
   436b2:	90                   	nop
   436b3:	c9                   	leave  
   436b4:	c3                   	ret    

00000000000436b5 <error_vprintf>:

// error_printf, error_vprintf
//    Print debugging messages to the console and to the host's
//    `log.txt` file via `log_printf`.

int error_vprintf(int cpos, int color, const char* format, va_list val) {
   436b5:	f3 0f 1e fa          	endbr64 
   436b9:	55                   	push   %rbp
   436ba:	48 89 e5             	mov    %rsp,%rbp
   436bd:	48 83 ec 40          	sub    $0x40,%rsp
   436c1:	89 7d dc             	mov    %edi,-0x24(%rbp)
   436c4:	89 75 d8             	mov    %esi,-0x28(%rbp)
   436c7:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   436cb:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    va_list val2;
    __builtin_va_copy(val2, val);
   436cf:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   436d3:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   436d7:	48 8b 0a             	mov    (%rdx),%rcx
   436da:	48 89 08             	mov    %rcx,(%rax)
   436dd:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   436e1:	48 89 48 08          	mov    %rcx,0x8(%rax)
   436e5:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   436e9:	48 89 50 10          	mov    %rdx,0x10(%rax)
    log_vprintf(format, val2);
   436ed:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
   436f1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   436f5:	48 89 d6             	mov    %rdx,%rsi
   436f8:	48 89 c7             	mov    %rax,%rdi
   436fb:	e8 29 ff ff ff       	call   43629 <log_vprintf>
    va_end(val2);
    return console_vprintf(cpos, color, format, val);
   43700:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   43704:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   43708:	8b 75 d8             	mov    -0x28(%rbp),%esi
   4370b:	8b 45 dc             	mov    -0x24(%rbp),%eax
   4370e:	89 c7                	mov    %eax,%edi
   43710:	e8 fe 1e 00 00       	call   45613 <console_vprintf>
}
   43715:	c9                   	leave  
   43716:	c3                   	ret    

0000000000043717 <error_printf>:

int error_printf(int cpos, int color, const char* format, ...) {
   43717:	f3 0f 1e fa          	endbr64 
   4371b:	55                   	push   %rbp
   4371c:	48 89 e5             	mov    %rsp,%rbp
   4371f:	48 83 ec 60          	sub    $0x60,%rsp
   43723:	89 7d ac             	mov    %edi,-0x54(%rbp)
   43726:	89 75 a8             	mov    %esi,-0x58(%rbp)
   43729:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   4372d:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   43731:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   43735:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   43739:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   43740:	48 8d 45 10          	lea    0x10(%rbp),%rax
   43744:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   43748:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4374c:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = error_vprintf(cpos, color, format, val);
   43750:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   43754:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   43758:	8b 75 a8             	mov    -0x58(%rbp),%esi
   4375b:	8b 45 ac             	mov    -0x54(%rbp),%eax
   4375e:	89 c7                	mov    %eax,%edi
   43760:	e8 50 ff ff ff       	call   436b5 <error_vprintf>
   43765:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   43768:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   4376b:	c9                   	leave  
   4376c:	c3                   	ret    

000000000004376d <check_keyboard>:
//    Check for the user typing a control key. 'a', 'f', and 'e' cause a soft
//    reboot where the kernel runs the allocator programs, "fork", or
//    "forkexit", respectively. Control-C or 'q' exit the virtual machine.
//    Returns key typed or -1 for no key.

int check_keyboard(void) {
   4376d:	f3 0f 1e fa          	endbr64 
   43771:	55                   	push   %rbp
   43772:	48 89 e5             	mov    %rsp,%rbp
   43775:	53                   	push   %rbx
   43776:	48 83 ec 48          	sub    $0x48,%rsp
    int c = keyboard_readc();
   4377a:	e8 73 fb ff ff       	call   432f2 <keyboard_readc>
   4377f:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   43782:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   43786:	74 1c                	je     437a4 <check_keyboard+0x37>
   43788:	83 7d e4 66          	cmpl   $0x66,-0x1c(%rbp)
   4378c:	74 16                	je     437a4 <check_keyboard+0x37>
   4378e:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   43792:	74 10                	je     437a4 <check_keyboard+0x37>
   43794:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   43798:	74 0a                	je     437a4 <check_keyboard+0x37>
   4379a:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   4379e:	0f 85 02 01 00 00    	jne    438a6 <check_keyboard+0x139>
        // Install a temporary page table to carry us through the
        // process of reinitializing memory. This replicates work the
        // bootloader does.
        x86_64_pagetable* pt = (x86_64_pagetable*) 0x8000;
   437a4:	48 c7 45 d8 00 80 00 	movq   $0x8000,-0x28(%rbp)
   437ab:	00 
        memset(pt, 0, PAGESIZE * 3);
   437ac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   437b0:	ba 00 30 00 00       	mov    $0x3000,%edx
   437b5:	be 00 00 00 00       	mov    $0x0,%esi
   437ba:	48 89 c7             	mov    %rax,%rdi
   437bd:	e8 8e 10 00 00       	call   44850 <memset>
        pt[0].entry[0] = 0x9000 | PTE_P | PTE_W | PTE_U;
   437c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   437c6:	48 c7 00 07 90 00 00 	movq   $0x9007,(%rax)
        pt[1].entry[0] = 0xA000 | PTE_P | PTE_W | PTE_U;
   437cd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   437d1:	48 05 00 10 00 00    	add    $0x1000,%rax
   437d7:	48 c7 00 07 a0 00 00 	movq   $0xa007,(%rax)
        pt[2].entry[0] = PTE_P | PTE_W | PTE_U | PTE_PS;
   437de:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   437e2:	48 05 00 20 00 00    	add    $0x2000,%rax
   437e8:	48 c7 00 87 00 00 00 	movq   $0x87,(%rax)
        lcr3((uintptr_t) pt);
   437ef:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   437f3:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
}

static inline void lcr3(uintptr_t val) {
    asm volatile("" : : : "memory");
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   437f7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   437fb:	0f 22 d8             	mov    %rax,%cr3
}
   437fe:	90                   	nop
        // The soft reboot process doesn't modify memory, so it's
        // safe to pass `multiboot_info` on the kernel stack, even
        // though it will get overwritten as the kernel runs.
        uint32_t multiboot_info[5];
        multiboot_info[0] = 4;
   437ff:	c7 45 b4 04 00 00 00 	movl   $0x4,-0x4c(%rbp)
        const char* argument = "fork";
   43806:	48 8d 05 6b 25 00 00 	lea    0x256b(%rip),%rax        # 45d78 <complex_keymap+0x58>
   4380d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        if (c == 'a') {
   43811:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   43815:	75 0d                	jne    43824 <check_keyboard+0xb7>
            argument = "allocator";
   43817:	48 8d 05 5f 25 00 00 	lea    0x255f(%rip),%rax        # 45d7d <complex_keymap+0x5d>
   4381e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   43822:	eb 37                	jmp    4385b <check_keyboard+0xee>
        } else if (c == 'e') {
   43824:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   43828:	75 0d                	jne    43837 <check_keyboard+0xca>
            argument = "forkexit";
   4382a:	48 8d 05 56 25 00 00 	lea    0x2556(%rip),%rax        # 45d87 <complex_keymap+0x67>
   43831:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   43835:	eb 24                	jmp    4385b <check_keyboard+0xee>
        }
        else if (c == 't'){
   43837:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   4383b:	75 0d                	jne    4384a <check_keyboard+0xdd>
            argument = "test";
   4383d:	48 8d 05 4c 25 00 00 	lea    0x254c(%rip),%rax        # 45d90 <complex_keymap+0x70>
   43844:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   43848:	eb 11                	jmp    4385b <check_keyboard+0xee>
        }
        else if(c == '2'){
   4384a:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   4384e:	75 0b                	jne    4385b <check_keyboard+0xee>
            argument = "test2";
   43850:	48 8d 05 3e 25 00 00 	lea    0x253e(%rip),%rax        # 45d95 <complex_keymap+0x75>
   43857:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        }
        uintptr_t argument_ptr = (uintptr_t) argument;
   4385b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4385f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        assert(argument_ptr < 0x100000000L);
   43863:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43868:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
   4386c:	76 1e                	jbe    4388c <check_keyboard+0x11f>
   4386e:	48 8d 05 26 25 00 00 	lea    0x2526(%rip),%rax        # 45d9b <complex_keymap+0x7b>
   43875:	48 89 c2             	mov    %rax,%rdx
   43878:	be 5d 02 00 00       	mov    $0x25d,%esi
   4387d:	48 8d 05 33 25 00 00 	lea    0x2533(%rip),%rax        # 45db7 <complex_keymap+0x97>
   43884:	48 89 c7             	mov    %rax,%rdi
   43887:	e8 33 01 00 00       	call   439bf <assert_fail>
        multiboot_info[4] = (uint32_t) argument_ptr;
   4388c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   43890:	89 45 c4             	mov    %eax,-0x3c(%rbp)
        asm volatile("movl $0x2BADB002, %%eax; jmp entry_from_boot"
   43893:	48 8d 45 b4          	lea    -0x4c(%rbp),%rax
   43897:	48 89 c3             	mov    %rax,%rbx
   4389a:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
   4389f:	e9 5c c7 ff ff       	jmp    40000 <entry_from_boot>
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   438a4:	eb 11                	jmp    438b7 <check_keyboard+0x14a>
                     : : "b" (multiboot_info) : "memory");
    } else if (c == 0x03 || c == 'q') {
   438a6:	83 7d e4 03          	cmpl   $0x3,-0x1c(%rbp)
   438aa:	74 06                	je     438b2 <check_keyboard+0x145>
   438ac:	83 7d e4 71          	cmpl   $0x71,-0x1c(%rbp)
   438b0:	75 05                	jne    438b7 <check_keyboard+0x14a>
        poweroff();
   438b2:	e8 3c f8 ff ff       	call   430f3 <poweroff>
    }
    return c;
   438b7:	8b 45 e4             	mov    -0x1c(%rbp),%eax
}
   438ba:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   438be:	c9                   	leave  
   438bf:	c3                   	ret    

00000000000438c0 <fail>:

// fail
//    Loop until user presses Control-C, then poweroff.

static void fail(void) __attribute__((noreturn));
static void fail(void) {
   438c0:	f3 0f 1e fa          	endbr64 
   438c4:	55                   	push   %rbp
   438c5:	48 89 e5             	mov    %rsp,%rbp
    while (1) {
        check_keyboard();
   438c8:	e8 a0 fe ff ff       	call   4376d <check_keyboard>
   438cd:	eb f9                	jmp    438c8 <fail+0x8>

00000000000438cf <panic>:

// panic, assert_fail
//    Use console_printf() to print a failure message and then wait for
//    control-C. Also write the failure message to the log.

void panic(const char* format, ...) {
   438cf:	f3 0f 1e fa          	endbr64 
   438d3:	55                   	push   %rbp
   438d4:	48 89 e5             	mov    %rsp,%rbp
   438d7:	48 83 ec 60          	sub    $0x60,%rsp
   438db:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   438df:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   438e3:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   438e7:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   438eb:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   438ef:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   438f3:	c7 45 b0 08 00 00 00 	movl   $0x8,-0x50(%rbp)
   438fa:	48 8d 45 10          	lea    0x10(%rbp),%rax
   438fe:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   43902:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   43906:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

    if (format) {
   4390a:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
   4390f:	0f 84 87 00 00 00    	je     4399c <panic+0xcd>
        // Print panic message to both the screen and the log
        int cpos = error_printf(CPOS(23, 0), 0xC000, "PANIC: ");
   43915:	48 8d 05 af 24 00 00 	lea    0x24af(%rip),%rax        # 45dcb <complex_keymap+0xab>
   4391c:	48 89 c2             	mov    %rax,%rdx
   4391f:	be 00 c0 00 00       	mov    $0xc000,%esi
   43924:	bf 30 07 00 00       	mov    $0x730,%edi
   43929:	b8 00 00 00 00       	mov    $0x0,%eax
   4392e:	e8 e4 fd ff ff       	call   43717 <error_printf>
   43933:	89 45 cc             	mov    %eax,-0x34(%rbp)
        cpos = error_vprintf(cpos, 0xC000, format, val);
   43936:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   4393a:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   4393e:	8b 45 cc             	mov    -0x34(%rbp),%eax
   43941:	be 00 c0 00 00       	mov    $0xc000,%esi
   43946:	89 c7                	mov    %eax,%edi
   43948:	e8 68 fd ff ff       	call   436b5 <error_vprintf>
   4394d:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (CCOL(cpos)) {
   43950:	8b 4d cc             	mov    -0x34(%rbp),%ecx
   43953:	48 63 c1             	movslq %ecx,%rax
   43956:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   4395d:	48 c1 e8 20          	shr    $0x20,%rax
   43961:	c1 f8 05             	sar    $0x5,%eax
   43964:	89 ce                	mov    %ecx,%esi
   43966:	c1 fe 1f             	sar    $0x1f,%esi
   43969:	29 f0                	sub    %esi,%eax
   4396b:	89 c2                	mov    %eax,%edx
   4396d:	89 d0                	mov    %edx,%eax
   4396f:	c1 e0 02             	shl    $0x2,%eax
   43972:	01 d0                	add    %edx,%eax
   43974:	c1 e0 04             	shl    $0x4,%eax
   43977:	29 c1                	sub    %eax,%ecx
   43979:	89 ca                	mov    %ecx,%edx
   4397b:	85 d2                	test   %edx,%edx
   4397d:	74 3b                	je     439ba <panic+0xeb>
            error_printf(cpos, 0xC000, "\n");
   4397f:	8b 45 cc             	mov    -0x34(%rbp),%eax
   43982:	48 8d 15 4a 24 00 00 	lea    0x244a(%rip),%rdx        # 45dd3 <complex_keymap+0xb3>
   43989:	be 00 c0 00 00       	mov    $0xc000,%esi
   4398e:	89 c7                	mov    %eax,%edi
   43990:	b8 00 00 00 00       	mov    $0x0,%eax
   43995:	e8 7d fd ff ff       	call   43717 <error_printf>
   4399a:	eb 1e                	jmp    439ba <panic+0xeb>
        }
    } else {
        error_printf(CPOS(23, 0), 0xC000, "PANIC");
   4399c:	48 8d 05 32 24 00 00 	lea    0x2432(%rip),%rax        # 45dd5 <complex_keymap+0xb5>
   439a3:	48 89 c2             	mov    %rax,%rdx
   439a6:	be 00 c0 00 00       	mov    $0xc000,%esi
   439ab:	bf 30 07 00 00       	mov    $0x730,%edi
   439b0:	b8 00 00 00 00       	mov    $0x0,%eax
   439b5:	e8 5d fd ff ff       	call   43717 <error_printf>
    }

    va_end(val);
    fail();
   439ba:	e8 01 ff ff ff       	call   438c0 <fail>

00000000000439bf <assert_fail>:
}

void assert_fail(const char* file, int line, const char* msg) {
   439bf:	f3 0f 1e fa          	endbr64 
   439c3:	55                   	push   %rbp
   439c4:	48 89 e5             	mov    %rsp,%rbp
   439c7:	48 83 ec 20          	sub    $0x20,%rsp
   439cb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   439cf:	89 75 f4             	mov    %esi,-0xc(%rbp)
   439d2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    panic("%s:%d: assertion '%s' failed\n", file, line, msg);
   439d6:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
   439da:	8b 55 f4             	mov    -0xc(%rbp),%edx
   439dd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   439e1:	48 89 c6             	mov    %rax,%rsi
   439e4:	48 8d 05 f0 23 00 00 	lea    0x23f0(%rip),%rax        # 45ddb <complex_keymap+0xbb>
   439eb:	48 89 c7             	mov    %rax,%rdi
   439ee:	b8 00 00 00 00       	mov    $0x0,%eax
   439f3:	e8 d7 fe ff ff       	call   438cf <panic>

00000000000439f8 <default_exception>:
}

void default_exception(proc* p){
   439f8:	f3 0f 1e fa          	endbr64 
   439fc:	55                   	push   %rbp
   439fd:	48 89 e5             	mov    %rsp,%rbp
   43a00:	48 83 ec 20          	sub    $0x20,%rsp
   43a04:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    x86_64_registers * reg = &(p->p_registers);
   43a08:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43a0c:	48 83 c0 08          	add    $0x8,%rax
   43a10:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    panic("Unexpected exception %d!\n", reg->reg_intno);
   43a14:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43a18:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   43a1f:	48 89 c6             	mov    %rax,%rsi
   43a22:	48 8d 05 d0 23 00 00 	lea    0x23d0(%rip),%rax        # 45df9 <complex_keymap+0xd9>
   43a29:	48 89 c7             	mov    %rax,%rdi
   43a2c:	b8 00 00 00 00       	mov    $0x0,%eax
   43a31:	e8 99 fe ff ff       	call   438cf <panic>

0000000000043a36 <pageindex>:
static inline int pageindex(uintptr_t addr, int level) {
   43a36:	55                   	push   %rbp
   43a37:	48 89 e5             	mov    %rsp,%rbp
   43a3a:	48 83 ec 10          	sub    $0x10,%rsp
   43a3e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   43a42:	89 75 f4             	mov    %esi,-0xc(%rbp)
    assert(level >= 0 && level <= 3);
   43a45:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   43a49:	78 06                	js     43a51 <pageindex+0x1b>
   43a4b:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
   43a4f:	7e 1e                	jle    43a6f <pageindex+0x39>
   43a51:	48 8d 05 c0 23 00 00 	lea    0x23c0(%rip),%rax        # 45e18 <complex_keymap+0xf8>
   43a58:	48 89 c2             	mov    %rax,%rdx
   43a5b:	be 1e 00 00 00       	mov    $0x1e,%esi
   43a60:	48 8d 05 ca 23 00 00 	lea    0x23ca(%rip),%rax        # 45e31 <complex_keymap+0x111>
   43a67:	48 89 c7             	mov    %rax,%rdi
   43a6a:	e8 50 ff ff ff       	call   439bf <assert_fail>
    return (int) (addr >> (PAGEOFFBITS + (3 - level) * PAGEINDEXBITS)) & 0x1FF;
   43a6f:	b8 03 00 00 00       	mov    $0x3,%eax
   43a74:	2b 45 f4             	sub    -0xc(%rbp),%eax
   43a77:	89 c2                	mov    %eax,%edx
   43a79:	89 d0                	mov    %edx,%eax
   43a7b:	c1 e0 03             	shl    $0x3,%eax
   43a7e:	01 d0                	add    %edx,%eax
   43a80:	83 c0 0c             	add    $0xc,%eax
   43a83:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43a87:	89 c1                	mov    %eax,%ecx
   43a89:	48 d3 ea             	shr    %cl,%rdx
   43a8c:	48 89 d0             	mov    %rdx,%rax
   43a8f:	25 ff 01 00 00       	and    $0x1ff,%eax
}
   43a94:	c9                   	leave  
   43a95:	c3                   	ret    

0000000000043a96 <virtual_memory_init>:

static x86_64_pagetable kernel_pagetables[5];
x86_64_pagetable *kernel_pagetable;

void virtual_memory_init(void)
{
   43a96:	f3 0f 1e fa          	endbr64 
   43a9a:	55                   	push   %rbp
   43a9b:	48 89 e5             	mov    %rsp,%rbp
   43a9e:	48 83 ec 20          	sub    $0x20,%rsp
    kernel_pagetable = &kernel_pagetables[0];
   43aa2:	48 8d 05 57 35 01 00 	lea    0x13557(%rip),%rax        # 57000 <kernel_pagetables>
   43aa9:	48 89 05 50 25 01 00 	mov    %rax,0x12550(%rip)        # 56000 <kernel_pagetable>
    memset(kernel_pagetables, 0, sizeof(kernel_pagetables));
   43ab0:	ba 00 50 00 00       	mov    $0x5000,%edx
   43ab5:	be 00 00 00 00       	mov    $0x0,%esi
   43aba:	48 8d 05 3f 35 01 00 	lea    0x1353f(%rip),%rax        # 57000 <kernel_pagetables>
   43ac1:	48 89 c7             	mov    %rax,%rdi
   43ac4:	e8 87 0d 00 00       	call   44850 <memset>

    // connect the pagetable pages
    kernel_pagetables[0].entry[0] =
        (x86_64_pageentry_t)&kernel_pagetables[1] | PTE_P | PTE_W | PTE_U;
   43ac9:	48 8d 05 30 45 01 00 	lea    0x14530(%rip),%rax        # 58000 <kernel_pagetables+0x1000>
   43ad0:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[0].entry[0] =
   43ad4:	48 89 05 25 35 01 00 	mov    %rax,0x13525(%rip)        # 57000 <kernel_pagetables>
    kernel_pagetables[1].entry[0] =
        (x86_64_pageentry_t)&kernel_pagetables[2] | PTE_P | PTE_W | PTE_U;
   43adb:	48 8d 05 1e 55 01 00 	lea    0x1551e(%rip),%rax        # 59000 <kernel_pagetables+0x2000>
   43ae2:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[1].entry[0] =
   43ae6:	48 89 05 13 45 01 00 	mov    %rax,0x14513(%rip)        # 58000 <kernel_pagetables+0x1000>
    kernel_pagetables[2].entry[0] =
        (x86_64_pageentry_t)&kernel_pagetables[3] | PTE_P | PTE_W | PTE_U;
   43aed:	48 8d 05 0c 65 01 00 	lea    0x1650c(%rip),%rax        # 5a000 <kernel_pagetables+0x3000>
   43af4:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[0] =
   43af8:	48 89 05 01 55 01 00 	mov    %rax,0x15501(%rip)        # 59000 <kernel_pagetables+0x2000>
    kernel_pagetables[2].entry[1] =
        (x86_64_pageentry_t)&kernel_pagetables[4] | PTE_P | PTE_W | PTE_U;
   43aff:	48 8d 05 fa 74 01 00 	lea    0x174fa(%rip),%rax        # 5b000 <kernel_pagetables+0x4000>
   43b06:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[1] =
   43b0a:	48 89 05 f7 54 01 00 	mov    %rax,0x154f7(%rip)        # 59008 <kernel_pagetables+0x2008>

    // identity map the page table
    virtual_memory_map(kernel_pagetable, (uintptr_t)0, (uintptr_t)0,
   43b11:	48 8b 05 e8 24 01 00 	mov    0x124e8(%rip),%rax        # 56000 <kernel_pagetable>
   43b18:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   43b1e:	b9 00 00 20 00       	mov    $0x200000,%ecx
   43b23:	ba 00 00 00 00       	mov    $0x0,%edx
   43b28:	be 00 00 00 00       	mov    $0x0,%esi
   43b2d:	48 89 c7             	mov    %rax,%rdi
   43b30:	e8 0e 02 00 00       	call   43d43 <virtual_memory_map>
                       MEMSIZE_PHYSICAL, PTE_P | PTE_W | PTE_U);

    // check if kernel is identity mapped
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE)
   43b35:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   43b3c:	00 
   43b3d:	eb 76                	jmp    43bb5 <virtual_memory_init+0x11f>
    {
        vamapping vmap = virtual_memory_lookup(kernel_pagetable, addr);
   43b3f:	48 8b 0d ba 24 01 00 	mov    0x124ba(%rip),%rcx        # 56000 <kernel_pagetable>
   43b46:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   43b4a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43b4e:	48 89 ce             	mov    %rcx,%rsi
   43b51:	48 89 c7             	mov    %rax,%rdi
   43b54:	e8 2e 06 00 00       	call   44187 <virtual_memory_lookup>
        // this assert will probably fail initially!
        // have you implemented virtual_memory_map and lookup_l1pagetable ?
        assert(vmap.pa == addr);
   43b59:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43b5d:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   43b61:	74 1e                	je     43b81 <virtual_memory_init+0xeb>
   43b63:	48 8d 05 db 22 00 00 	lea    0x22db(%rip),%rax        # 45e45 <complex_keymap+0x125>
   43b6a:	48 89 c2             	mov    %rax,%rdx
   43b6d:	be 2e 00 00 00       	mov    $0x2e,%esi
   43b72:	48 8d 05 dc 22 00 00 	lea    0x22dc(%rip),%rax        # 45e55 <complex_keymap+0x135>
   43b79:	48 89 c7             	mov    %rax,%rdi
   43b7c:	e8 3e fe ff ff       	call   439bf <assert_fail>
        assert((vmap.perm & (PTE_P | PTE_W)) == (PTE_P | PTE_W));
   43b81:	8b 45 f0             	mov    -0x10(%rbp),%eax
   43b84:	48 98                	cltq   
   43b86:	83 e0 03             	and    $0x3,%eax
   43b89:	48 83 f8 03          	cmp    $0x3,%rax
   43b8d:	74 1e                	je     43bad <virtual_memory_init+0x117>
   43b8f:	48 8d 05 d2 22 00 00 	lea    0x22d2(%rip),%rax        # 45e68 <complex_keymap+0x148>
   43b96:	48 89 c2             	mov    %rax,%rdx
   43b99:	be 2f 00 00 00       	mov    $0x2f,%esi
   43b9e:	48 8d 05 b0 22 00 00 	lea    0x22b0(%rip),%rax        # 45e55 <complex_keymap+0x135>
   43ba5:	48 89 c7             	mov    %rax,%rdi
   43ba8:	e8 12 fe ff ff       	call   439bf <assert_fail>
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE)
   43bad:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   43bb4:	00 
   43bb5:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   43bbc:	00 
   43bbd:	76 80                	jbe    43b3f <virtual_memory_init+0xa9>
    }

    // set pointer to this pagetable in the CR3 register
    // set_pagetable also does several checks for a valid pagetable
    set_pagetable(kernel_pagetable);
   43bbf:	48 8b 05 3a 24 01 00 	mov    0x1243a(%rip),%rax        # 56000 <kernel_pagetable>
   43bc6:	48 89 c7             	mov    %rax,%rdi
   43bc9:	e8 03 00 00 00       	call   43bd1 <set_pagetable>
}
   43bce:	90                   	nop
   43bcf:	c9                   	leave  
   43bd0:	c3                   	ret    

0000000000043bd1 <set_pagetable>:
//    Change page directory. lcr3() is the hardware instruction;
//    set_pagetable() additionally checks that important kernel procedures are
//    mappable in `pagetable`, and calls panic() if they aren't.

void set_pagetable(x86_64_pagetable *pagetable)
{
   43bd1:	f3 0f 1e fa          	endbr64 
   43bd5:	55                   	push   %rbp
   43bd6:	48 89 e5             	mov    %rsp,%rbp
   43bd9:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   43bdd:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
    assert(PAGEOFFSET(pagetable) == 0); // must be page aligned
   43be1:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   43be5:	25 ff 0f 00 00       	and    $0xfff,%eax
   43bea:	48 85 c0             	test   %rax,%rax
   43bed:	74 1e                	je     43c0d <set_pagetable+0x3c>
   43bef:	48 8d 05 a3 22 00 00 	lea    0x22a3(%rip),%rax        # 45e99 <complex_keymap+0x179>
   43bf6:	48 89 c2             	mov    %rax,%rdx
   43bf9:	be 3e 00 00 00       	mov    $0x3e,%esi
   43bfe:	48 8d 05 50 22 00 00 	lea    0x2250(%rip),%rax        # 45e55 <complex_keymap+0x135>
   43c05:	48 89 c7             	mov    %rax,%rdi
   43c08:	e8 b2 fd ff ff       	call   439bf <assert_fail>
    // check for kernel space being mapped in pagetable
    assert(virtual_memory_lookup(pagetable, (uintptr_t)default_int_handler).pa == (uintptr_t)default_int_handler);
   43c0d:	48 c7 c0 9c 00 04 00 	mov    $0x4009c,%rax
   43c14:	48 89 c2             	mov    %rax,%rdx
   43c17:	48 8d 45 98          	lea    -0x68(%rbp),%rax
   43c1b:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   43c1f:	48 89 ce             	mov    %rcx,%rsi
   43c22:	48 89 c7             	mov    %rax,%rdi
   43c25:	e8 5d 05 00 00       	call   44187 <virtual_memory_lookup>
   43c2a:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   43c2e:	48 c7 c2 9c 00 04 00 	mov    $0x4009c,%rdx
   43c35:	48 39 d0             	cmp    %rdx,%rax
   43c38:	74 1e                	je     43c58 <set_pagetable+0x87>
   43c3a:	48 8d 05 77 22 00 00 	lea    0x2277(%rip),%rax        # 45eb8 <complex_keymap+0x198>
   43c41:	48 89 c2             	mov    %rax,%rdx
   43c44:	be 40 00 00 00       	mov    $0x40,%esi
   43c49:	48 8d 05 05 22 00 00 	lea    0x2205(%rip),%rax        # 45e55 <complex_keymap+0x135>
   43c50:	48 89 c7             	mov    %rax,%rdi
   43c53:	e8 67 fd ff ff       	call   439bf <assert_fail>
    assert(virtual_memory_lookup(kernel_pagetable, (uintptr_t)pagetable).pa == (uintptr_t)pagetable);
   43c58:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
   43c5c:	48 8b 0d 9d 23 01 00 	mov    0x1239d(%rip),%rcx        # 56000 <kernel_pagetable>
   43c63:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
   43c67:	48 89 ce             	mov    %rcx,%rsi
   43c6a:	48 89 c7             	mov    %rax,%rdi
   43c6d:	e8 15 05 00 00       	call   44187 <virtual_memory_lookup>
   43c72:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   43c76:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   43c7a:	48 39 c2             	cmp    %rax,%rdx
   43c7d:	74 1e                	je     43c9d <set_pagetable+0xcc>
   43c7f:	48 8d 05 9a 22 00 00 	lea    0x229a(%rip),%rax        # 45f20 <complex_keymap+0x200>
   43c86:	48 89 c2             	mov    %rax,%rdx
   43c89:	be 41 00 00 00       	mov    $0x41,%esi
   43c8e:	48 8d 05 c0 21 00 00 	lea    0x21c0(%rip),%rax        # 45e55 <complex_keymap+0x135>
   43c95:	48 89 c7             	mov    %rax,%rdi
   43c98:	e8 22 fd ff ff       	call   439bf <assert_fail>
    assert(virtual_memory_lookup(pagetable, (uintptr_t)kernel_pagetable).pa == (uintptr_t)kernel_pagetable);
   43c9d:	48 8b 05 5c 23 01 00 	mov    0x1235c(%rip),%rax        # 56000 <kernel_pagetable>
   43ca4:	48 89 c2             	mov    %rax,%rdx
   43ca7:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
   43cab:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   43caf:	48 89 ce             	mov    %rcx,%rsi
   43cb2:	48 89 c7             	mov    %rax,%rdi
   43cb5:	e8 cd 04 00 00       	call   44187 <virtual_memory_lookup>
   43cba:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   43cbe:	48 8b 15 3b 23 01 00 	mov    0x1233b(%rip),%rdx        # 56000 <kernel_pagetable>
   43cc5:	48 39 d0             	cmp    %rdx,%rax
   43cc8:	74 1e                	je     43ce8 <set_pagetable+0x117>
   43cca:	48 8d 05 af 22 00 00 	lea    0x22af(%rip),%rax        # 45f80 <complex_keymap+0x260>
   43cd1:	48 89 c2             	mov    %rax,%rdx
   43cd4:	be 42 00 00 00       	mov    $0x42,%esi
   43cd9:	48 8d 05 75 21 00 00 	lea    0x2175(%rip),%rax        # 45e55 <complex_keymap+0x135>
   43ce0:	48 89 c7             	mov    %rax,%rdi
   43ce3:	e8 d7 fc ff ff       	call   439bf <assert_fail>
    assert(virtual_memory_lookup(pagetable, (uintptr_t)virtual_memory_map).pa == (uintptr_t)virtual_memory_map);
   43ce8:	48 8d 15 54 00 00 00 	lea    0x54(%rip),%rdx        # 43d43 <virtual_memory_map>
   43cef:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   43cf3:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   43cf7:	48 89 ce             	mov    %rcx,%rsi
   43cfa:	48 89 c7             	mov    %rax,%rdi
   43cfd:	e8 85 04 00 00       	call   44187 <virtual_memory_lookup>
   43d02:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43d06:	48 8d 15 36 00 00 00 	lea    0x36(%rip),%rdx        # 43d43 <virtual_memory_map>
   43d0d:	48 39 d0             	cmp    %rdx,%rax
   43d10:	74 1e                	je     43d30 <set_pagetable+0x15f>
   43d12:	48 8d 05 c7 22 00 00 	lea    0x22c7(%rip),%rax        # 45fe0 <complex_keymap+0x2c0>
   43d19:	48 89 c2             	mov    %rax,%rdx
   43d1c:	be 43 00 00 00       	mov    $0x43,%esi
   43d21:	48 8d 05 2d 21 00 00 	lea    0x212d(%rip),%rax        # 45e55 <complex_keymap+0x135>
   43d28:	48 89 c7             	mov    %rax,%rdi
   43d2b:	e8 8f fc ff ff       	call   439bf <assert_fail>
    lcr3((uintptr_t)pagetable);
   43d30:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   43d34:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   43d38:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43d3c:	0f 22 d8             	mov    %rax,%cr3
}
   43d3f:	90                   	nop
}
   43d40:	90                   	nop
   43d41:	c9                   	leave  
   43d42:	c3                   	ret    

0000000000043d43 <virtual_memory_map>:
static x86_64_pagetable *lookup_l1pagetable(x86_64_pagetable *pagetable,
                                            uintptr_t va, int perm);

int virtual_memory_map(x86_64_pagetable *pagetable, uintptr_t va,
                       uintptr_t pa, size_t sz, int perm)
{
   43d43:	f3 0f 1e fa          	endbr64 
   43d47:	55                   	push   %rbp
   43d48:	48 89 e5             	mov    %rsp,%rbp
   43d4b:	53                   	push   %rbx
   43d4c:	48 83 ec 58          	sub    $0x58,%rsp
   43d50:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   43d54:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   43d58:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
   43d5c:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
   43d60:	44 89 45 ac          	mov    %r8d,-0x54(%rbp)

    // sanity checks for virtual address, size, and permisions
    assert(va % PAGESIZE == 0);            // virtual address is page-aligned
   43d64:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43d68:	25 ff 0f 00 00       	and    $0xfff,%eax
   43d6d:	48 85 c0             	test   %rax,%rax
   43d70:	74 1e                	je     43d90 <virtual_memory_map+0x4d>
   43d72:	48 8d 05 cb 22 00 00 	lea    0x22cb(%rip),%rax        # 46044 <complex_keymap+0x324>
   43d79:	48 89 c2             	mov    %rax,%rdx
   43d7c:	be 64 00 00 00       	mov    $0x64,%esi
   43d81:	48 8d 05 cd 20 00 00 	lea    0x20cd(%rip),%rax        # 45e55 <complex_keymap+0x135>
   43d88:	48 89 c7             	mov    %rax,%rdi
   43d8b:	e8 2f fc ff ff       	call   439bf <assert_fail>
    assert(sz % PAGESIZE == 0);            // size is a multiple of PAGESIZE
   43d90:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   43d94:	25 ff 0f 00 00       	and    $0xfff,%eax
   43d99:	48 85 c0             	test   %rax,%rax
   43d9c:	74 1e                	je     43dbc <virtual_memory_map+0x79>
   43d9e:	48 8d 05 b2 22 00 00 	lea    0x22b2(%rip),%rax        # 46057 <complex_keymap+0x337>
   43da5:	48 89 c2             	mov    %rax,%rdx
   43da8:	be 65 00 00 00       	mov    $0x65,%esi
   43dad:	48 8d 05 a1 20 00 00 	lea    0x20a1(%rip),%rax        # 45e55 <complex_keymap+0x135>
   43db4:	48 89 c7             	mov    %rax,%rdi
   43db7:	e8 03 fc ff ff       	call   439bf <assert_fail>
    assert(va + sz >= va || va + sz == 0); // va range does not wrap
   43dbc:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   43dc0:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   43dc4:	48 01 d0             	add    %rdx,%rax
   43dc7:	48 39 45 c0          	cmp    %rax,-0x40(%rbp)
   43dcb:	76 2e                	jbe    43dfb <virtual_memory_map+0xb8>
   43dcd:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   43dd1:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   43dd5:	48 01 d0             	add    %rdx,%rax
   43dd8:	48 85 c0             	test   %rax,%rax
   43ddb:	74 1e                	je     43dfb <virtual_memory_map+0xb8>
   43ddd:	48 8d 05 86 22 00 00 	lea    0x2286(%rip),%rax        # 4606a <complex_keymap+0x34a>
   43de4:	48 89 c2             	mov    %rax,%rdx
   43de7:	be 66 00 00 00       	mov    $0x66,%esi
   43dec:	48 8d 05 62 20 00 00 	lea    0x2062(%rip),%rax        # 45e55 <complex_keymap+0x135>
   43df3:	48 89 c7             	mov    %rax,%rdi
   43df6:	e8 c4 fb ff ff       	call   439bf <assert_fail>
    if (perm & PTE_P)
   43dfb:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43dfe:	48 98                	cltq   
   43e00:	83 e0 01             	and    $0x1,%eax
   43e03:	48 85 c0             	test   %rax,%rax
   43e06:	0f 84 8c 00 00 00    	je     43e98 <virtual_memory_map+0x155>
    {
        assert(pa % PAGESIZE == 0);          // physical addr is page-aligned
   43e0c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   43e10:	25 ff 0f 00 00       	and    $0xfff,%eax
   43e15:	48 85 c0             	test   %rax,%rax
   43e18:	74 1e                	je     43e38 <virtual_memory_map+0xf5>
   43e1a:	48 8d 05 67 22 00 00 	lea    0x2267(%rip),%rax        # 46088 <complex_keymap+0x368>
   43e21:	48 89 c2             	mov    %rax,%rdx
   43e24:	be 69 00 00 00       	mov    $0x69,%esi
   43e29:	48 8d 05 25 20 00 00 	lea    0x2025(%rip),%rax        # 45e55 <complex_keymap+0x135>
   43e30:	48 89 c7             	mov    %rax,%rdi
   43e33:	e8 87 fb ff ff       	call   439bf <assert_fail>
        assert(pa + sz >= pa);               // physical address range does not wrap
   43e38:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   43e3c:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   43e40:	48 01 d0             	add    %rdx,%rax
   43e43:	48 39 45 b8          	cmp    %rax,-0x48(%rbp)
   43e47:	76 1e                	jbe    43e67 <virtual_memory_map+0x124>
   43e49:	48 8d 05 4b 22 00 00 	lea    0x224b(%rip),%rax        # 4609b <complex_keymap+0x37b>
   43e50:	48 89 c2             	mov    %rax,%rdx
   43e53:	be 6a 00 00 00       	mov    $0x6a,%esi
   43e58:	48 8d 05 f6 1f 00 00 	lea    0x1ff6(%rip),%rax        # 45e55 <complex_keymap+0x135>
   43e5f:	48 89 c7             	mov    %rax,%rdi
   43e62:	e8 58 fb ff ff       	call   439bf <assert_fail>
        assert(pa + sz <= MEMSIZE_PHYSICAL); // physical addresses exist
   43e67:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   43e6b:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   43e6f:	48 01 d0             	add    %rdx,%rax
   43e72:	48 3d 00 00 20 00    	cmp    $0x200000,%rax
   43e78:	76 1e                	jbe    43e98 <virtual_memory_map+0x155>
   43e7a:	48 8d 05 28 22 00 00 	lea    0x2228(%rip),%rax        # 460a9 <complex_keymap+0x389>
   43e81:	48 89 c2             	mov    %rax,%rdx
   43e84:	be 6b 00 00 00       	mov    $0x6b,%esi
   43e89:	48 8d 05 c5 1f 00 00 	lea    0x1fc5(%rip),%rax        # 45e55 <complex_keymap+0x135>
   43e90:	48 89 c7             	mov    %rax,%rdi
   43e93:	e8 27 fb ff ff       	call   439bf <assert_fail>
    }
    assert(perm >= 0 && perm < 0x1000);           // `perm` makes sense (perm can only be 12 bits)
   43e98:	83 7d ac 00          	cmpl   $0x0,-0x54(%rbp)
   43e9c:	78 09                	js     43ea7 <virtual_memory_map+0x164>
   43e9e:	81 7d ac ff 0f 00 00 	cmpl   $0xfff,-0x54(%rbp)
   43ea5:	7e 1e                	jle    43ec5 <virtual_memory_map+0x182>
   43ea7:	48 8d 05 17 22 00 00 	lea    0x2217(%rip),%rax        # 460c5 <complex_keymap+0x3a5>
   43eae:	48 89 c2             	mov    %rax,%rdx
   43eb1:	be 6d 00 00 00       	mov    $0x6d,%esi
   43eb6:	48 8d 05 98 1f 00 00 	lea    0x1f98(%rip),%rax        # 45e55 <complex_keymap+0x135>
   43ebd:	48 89 c7             	mov    %rax,%rdi
   43ec0:	e8 fa fa ff ff       	call   439bf <assert_fail>
    assert((uintptr_t)pagetable % PAGESIZE == 0); // `pagetable` page-aligned
   43ec5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   43ec9:	25 ff 0f 00 00       	and    $0xfff,%eax
   43ece:	48 85 c0             	test   %rax,%rax
   43ed1:	74 1e                	je     43ef1 <virtual_memory_map+0x1ae>
   43ed3:	48 8d 05 06 22 00 00 	lea    0x2206(%rip),%rax        # 460e0 <complex_keymap+0x3c0>
   43eda:	48 89 c2             	mov    %rax,%rdx
   43edd:	be 6e 00 00 00       	mov    $0x6e,%esi
   43ee2:	48 8d 05 6c 1f 00 00 	lea    0x1f6c(%rip),%rax        # 45e55 <complex_keymap+0x135>
   43ee9:	48 89 c7             	mov    %rax,%rdi
   43eec:	e8 ce fa ff ff       	call   439bf <assert_fail>

    int last_index123 = -1;
   43ef1:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%rbp)
    x86_64_pagetable *l1pagetable = NULL;
   43ef8:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
   43eff:	00 

    // for each page-aligned address, set the appropriate page entry
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE)
   43f00:	e9 e6 00 00 00       	jmp    43feb <virtual_memory_map+0x2a8>
    {
        int cur_index123 = (va >> (PAGEOFFBITS + PAGEINDEXBITS));
   43f05:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43f09:	48 c1 e8 15          	shr    $0x15,%rax
   43f0d:	89 45 dc             	mov    %eax,-0x24(%rbp)
        if (cur_index123 != last_index123)
   43f10:	8b 45 dc             	mov    -0x24(%rbp),%eax
   43f13:	3b 45 ec             	cmp    -0x14(%rbp),%eax
   43f16:	74 20                	je     43f38 <virtual_memory_map+0x1f5>
        {
            // TODO
            // find pointer to last level pagetable for current va
            l1pagetable = lookup_l1pagetable(pagetable, va, perm);
   43f18:	8b 55 ac             	mov    -0x54(%rbp),%edx
   43f1b:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   43f1f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   43f23:	48 89 ce             	mov    %rcx,%rsi
   43f26:	48 89 c7             	mov    %rax,%rdi
   43f29:	e8 d3 00 00 00       	call   44001 <lookup_l1pagetable>
   43f2e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            last_index123 = cur_index123;
   43f32:	8b 45 dc             	mov    -0x24(%rbp),%eax
   43f35:	89 45 ec             	mov    %eax,-0x14(%rbp)
        }
        if ((perm & PTE_P) && l1pagetable)
   43f38:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43f3b:	48 98                	cltq   
   43f3d:	83 e0 01             	and    $0x1,%eax
   43f40:	48 85 c0             	test   %rax,%rax
   43f43:	74 34                	je     43f79 <virtual_memory_map+0x236>
   43f45:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   43f4a:	74 2d                	je     43f79 <virtual_memory_map+0x236>
        { // if page is marked present
            l1pagetable->entry[PAGEINDEX(va, 3)] = pa | perm;
   43f4c:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43f4f:	48 63 d8             	movslq %eax,%rbx
   43f52:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43f56:	be 03 00 00 00       	mov    $0x3,%esi
   43f5b:	48 89 c7             	mov    %rax,%rdi
   43f5e:	e8 d3 fa ff ff       	call   43a36 <pageindex>
   43f63:	89 c2                	mov    %eax,%edx
   43f65:	48 0b 5d b8          	or     -0x48(%rbp),%rbx
   43f69:	48 89 d9             	mov    %rbx,%rcx
   43f6c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43f70:	48 63 d2             	movslq %edx,%rdx
   43f73:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   43f77:	eb 5a                	jmp    43fd3 <virtual_memory_map+0x290>
        }
        else if (l1pagetable)
   43f79:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   43f7e:	74 26                	je     43fa6 <virtual_memory_map+0x263>
        { // if page is NOT marked present
            // TODO
            l1pagetable->entry[PAGEINDEX(va, 3)] = perm;
   43f80:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   43f84:	be 03 00 00 00       	mov    $0x3,%esi
   43f89:	48 89 c7             	mov    %rax,%rdi
   43f8c:	e8 a5 fa ff ff       	call   43a36 <pageindex>
   43f91:	89 c2                	mov    %eax,%edx
   43f93:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43f96:	48 63 c8             	movslq %eax,%rcx
   43f99:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43f9d:	48 63 d2             	movslq %edx,%rdx
   43fa0:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   43fa4:	eb 2d                	jmp    43fd3 <virtual_memory_map+0x290>
        }
        else if (perm & PTE_P)
   43fa6:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43fa9:	48 98                	cltq   
   43fab:	83 e0 01             	and    $0x1,%eax
   43fae:	48 85 c0             	test   %rax,%rax
   43fb1:	74 20                	je     43fd3 <virtual_memory_map+0x290>
        {
            // error, no allocated l1 page found for va
            log_printf("[Kern Info] failed to find l1pagetable address at " __FILE__ ": %d\n", __LINE__);
   43fb3:	be 8a 00 00 00       	mov    $0x8a,%esi
   43fb8:	48 8d 05 49 21 00 00 	lea    0x2149(%rip),%rax        # 46108 <complex_keymap+0x3e8>
   43fbf:	48 89 c7             	mov    %rax,%rdi
   43fc2:	b8 00 00 00 00       	mov    $0x0,%eax
   43fc7:	e8 98 f6 ff ff       	call   43664 <log_printf>
            return -1;
   43fcc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43fd1:	eb 28                	jmp    43ffb <virtual_memory_map+0x2b8>
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE)
   43fd3:	48 81 45 c0 00 10 00 	addq   $0x1000,-0x40(%rbp)
   43fda:	00 
   43fdb:	48 81 45 b8 00 10 00 	addq   $0x1000,-0x48(%rbp)
   43fe2:	00 
   43fe3:	48 81 6d b0 00 10 00 	subq   $0x1000,-0x50(%rbp)
   43fea:	00 
   43feb:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   43ff0:	0f 85 0f ff ff ff    	jne    43f05 <virtual_memory_map+0x1c2>
        }
    }
    return 0;
   43ff6:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43ffb:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   43fff:	c9                   	leave  
   44000:	c3                   	ret    

0000000000044001 <lookup_l1pagetable>:
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable *lookup_l1pagetable(x86_64_pagetable *pagetable,
                                            uintptr_t va, int perm)
{
   44001:	f3 0f 1e fa          	endbr64 
   44005:	55                   	push   %rbp
   44006:	48 89 e5             	mov    %rsp,%rbp
   44009:	48 83 ec 40          	sub    $0x40,%rsp
   4400d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   44011:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   44015:	89 55 cc             	mov    %edx,-0x34(%rbp)
    x86_64_pagetable *pt = pagetable;
   44018:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4401c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    // 1. Find index to the next pagetable entry using the `va`
    // 2. Check if this entry has the appropriate requested permissions
    // 3. Repeat the steps till you reach the l1 pagetable (i.e thrice)
    // 4. return the pagetable address

    for (int i = 0; i <= 2; ++i)
   44020:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   44027:	e9 4b 01 00 00       	jmp    44177 <lookup_l1pagetable+0x176>
    {
        // TODO
        // find page entry by finding `ith` level index of va to index pagetable entries of `pt`
        // you should read x86-64.h to understand relevant structs and macros to make this part easier
        x86_64_pageentry_t pe = pt->entry[PAGEINDEX(va, i)]; // replace this
   4402c:	8b 55 f4             	mov    -0xc(%rbp),%edx
   4402f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   44033:	89 d6                	mov    %edx,%esi
   44035:	48 89 c7             	mov    %rax,%rdi
   44038:	e8 f9 f9 ff ff       	call   43a36 <pageindex>
   4403d:	89 c2                	mov    %eax,%edx
   4403f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44043:	48 63 d2             	movslq %edx,%rdx
   44046:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   4404a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

        if (!(pe & PTE_P))
   4404e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44052:	83 e0 01             	and    $0x1,%eax
   44055:	48 85 c0             	test   %rax,%rax
   44058:	75 6d                	jne    440c7 <lookup_l1pagetable+0xc6>
        { // address of next level should be present AND PTE_P should be set, error otherwise
            log_printf("[Kern Info] Error looking up l1pagetable: Pagetable address: 0x%x perm: 0x%x."
   4405a:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4405d:	8d 48 02             	lea    0x2(%rax),%ecx
   44060:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44064:	25 ff 0f 00 00       	and    $0xfff,%eax
   44069:	48 89 c2             	mov    %rax,%rdx
   4406c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44070:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   44076:	48 89 c6             	mov    %rax,%rsi
   44079:	48 8d 05 d0 20 00 00 	lea    0x20d0(%rip),%rax        # 46150 <complex_keymap+0x430>
   44080:	48 89 c7             	mov    %rax,%rdi
   44083:	b8 00 00 00 00       	mov    $0x0,%eax
   44088:	e8 d7 f5 ff ff       	call   43664 <log_printf>
                       " Failed to get level (%d)\n",
                       PTE_ADDR(pe), PTE_FLAGS(pe), (i + 2));
            if (!(perm & PTE_P))
   4408d:	8b 45 cc             	mov    -0x34(%rbp),%eax
   44090:	48 98                	cltq   
   44092:	83 e0 01             	and    $0x1,%eax
   44095:	48 85 c0             	test   %rax,%rax
   44098:	75 0a                	jne    440a4 <lookup_l1pagetable+0xa3>
            {
                return NULL;
   4409a:	b8 00 00 00 00       	mov    $0x0,%eax
   4409f:	e9 e1 00 00 00       	jmp    44185 <lookup_l1pagetable+0x184>
            }
            log_printf("[Kern Info] failed to find pagetable address at " __FILE__ ": %d\n", __LINE__);
   440a4:	be b2 00 00 00       	mov    $0xb2,%esi
   440a9:	48 8d 05 08 21 00 00 	lea    0x2108(%rip),%rax        # 461b8 <complex_keymap+0x498>
   440b0:	48 89 c7             	mov    %rax,%rdi
   440b3:	b8 00 00 00 00       	mov    $0x0,%eax
   440b8:	e8 a7 f5 ff ff       	call   43664 <log_printf>
            return NULL;
   440bd:	b8 00 00 00 00       	mov    $0x0,%eax
   440c2:	e9 be 00 00 00       	jmp    44185 <lookup_l1pagetable+0x184>
        }

        // sanity-check page entry and permissions
        assert(PTE_ADDR(pe) < MEMSIZE_PHYSICAL); // at sensible address
   440c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   440cb:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   440d1:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   440d7:	76 1e                	jbe    440f7 <lookup_l1pagetable+0xf6>
   440d9:	48 8d 05 20 21 00 00 	lea    0x2120(%rip),%rax        # 46200 <complex_keymap+0x4e0>
   440e0:	48 89 c2             	mov    %rax,%rdx
   440e3:	be b7 00 00 00       	mov    $0xb7,%esi
   440e8:	48 8d 05 66 1d 00 00 	lea    0x1d66(%rip),%rax        # 45e55 <complex_keymap+0x135>
   440ef:	48 89 c7             	mov    %rax,%rdi
   440f2:	e8 c8 f8 ff ff       	call   439bf <assert_fail>
        if (perm & PTE_W)
   440f7:	8b 45 cc             	mov    -0x34(%rbp),%eax
   440fa:	48 98                	cltq   
   440fc:	83 e0 02             	and    $0x2,%eax
   440ff:	48 85 c0             	test   %rax,%rax
   44102:	74 2a                	je     4412e <lookup_l1pagetable+0x12d>
        {                       // if requester wants PTE_W,
            assert(pe & PTE_W); //   entry must allow PTE_W
   44104:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44108:	83 e0 02             	and    $0x2,%eax
   4410b:	48 85 c0             	test   %rax,%rax
   4410e:	75 1e                	jne    4412e <lookup_l1pagetable+0x12d>
   44110:	48 8d 05 09 21 00 00 	lea    0x2109(%rip),%rax        # 46220 <complex_keymap+0x500>
   44117:	48 89 c2             	mov    %rax,%rdx
   4411a:	be ba 00 00 00       	mov    $0xba,%esi
   4411f:	48 8d 05 2f 1d 00 00 	lea    0x1d2f(%rip),%rax        # 45e55 <complex_keymap+0x135>
   44126:	48 89 c7             	mov    %rax,%rdi
   44129:	e8 91 f8 ff ff       	call   439bf <assert_fail>
        }
        if (perm & PTE_U)
   4412e:	8b 45 cc             	mov    -0x34(%rbp),%eax
   44131:	48 98                	cltq   
   44133:	83 e0 04             	and    $0x4,%eax
   44136:	48 85 c0             	test   %rax,%rax
   44139:	74 2a                	je     44165 <lookup_l1pagetable+0x164>
        {                       // if requester wants PTE_U,
            assert(pe & PTE_U); //   entry must allow PTE_U
   4413b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4413f:	83 e0 04             	and    $0x4,%eax
   44142:	48 85 c0             	test   %rax,%rax
   44145:	75 1e                	jne    44165 <lookup_l1pagetable+0x164>
   44147:	48 8d 05 dd 20 00 00 	lea    0x20dd(%rip),%rax        # 4622b <complex_keymap+0x50b>
   4414e:	48 89 c2             	mov    %rax,%rdx
   44151:	be be 00 00 00       	mov    $0xbe,%esi
   44156:	48 8d 05 f8 1c 00 00 	lea    0x1cf8(%rip),%rax        # 45e55 <complex_keymap+0x135>
   4415d:	48 89 c7             	mov    %rax,%rdi
   44160:	e8 5a f8 ff ff       	call   439bf <assert_fail>
        }

        // TODO
        // set pt to physical address to next pagetable using `pe`
        pt = (x86_64_pagetable *)PTE_ADDR(pe);
   44165:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44169:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   4416f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 2; ++i)
   44173:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   44177:	83 7d f4 02          	cmpl   $0x2,-0xc(%rbp)
   4417b:	0f 8e ab fe ff ff    	jle    4402c <lookup_l1pagetable+0x2b>
        // replace this
    }
    return pt;
   44181:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   44185:	c9                   	leave  
   44186:	c3                   	ret    

0000000000044187 <virtual_memory_lookup>:
// virtual_memory_lookup(pagetable, va)
//    Returns information about the mapping of the virtual address `va` in
//    `pagetable`. The information is returned as a `vamapping` object.

vamapping virtual_memory_lookup(x86_64_pagetable *pagetable, uintptr_t va)
{
   44187:	f3 0f 1e fa          	endbr64 
   4418b:	55                   	push   %rbp
   4418c:	48 89 e5             	mov    %rsp,%rbp
   4418f:	48 83 ec 50          	sub    $0x50,%rsp
   44193:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   44197:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   4419b:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    x86_64_pagetable *pt = pagetable;
   4419f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   441a3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    x86_64_pageentry_t pe = PTE_W | PTE_U | PTE_P;
   441a7:	48 c7 45 f0 07 00 00 	movq   $0x7,-0x10(%rbp)
   441ae:	00 
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i)
   441af:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
   441b6:	eb 41                	jmp    441f9 <virtual_memory_lookup+0x72>
    {
        pe = pt->entry[PAGEINDEX(va, i)] & ~(pe & (PTE_W | PTE_U));
   441b8:	8b 55 ec             	mov    -0x14(%rbp),%edx
   441bb:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   441bf:	89 d6                	mov    %edx,%esi
   441c1:	48 89 c7             	mov    %rax,%rdi
   441c4:	e8 6d f8 ff ff       	call   43a36 <pageindex>
   441c9:	89 c2                	mov    %eax,%edx
   441cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   441cf:	48 63 d2             	movslq %edx,%rdx
   441d2:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
   441d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   441da:	83 e0 06             	and    $0x6,%eax
   441dd:	48 f7 d0             	not    %rax
   441e0:	48 21 d0             	and    %rdx,%rax
   441e3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        pt = (x86_64_pagetable *)PTE_ADDR(pe);
   441e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   441eb:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   441f1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i)
   441f5:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
   441f9:	83 7d ec 03          	cmpl   $0x3,-0x14(%rbp)
   441fd:	7f 0c                	jg     4420b <virtual_memory_lookup+0x84>
   441ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44203:	83 e0 01             	and    $0x1,%eax
   44206:	48 85 c0             	test   %rax,%rax
   44209:	75 ad                	jne    441b8 <virtual_memory_lookup+0x31>
    }
    vamapping vam = {-1, (uintptr_t)-1, 0};
   4420b:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%rbp)
   44212:	48 c7 45 d8 ff ff ff 	movq   $0xffffffffffffffff,-0x28(%rbp)
   44219:	ff 
   4421a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    if (pe & PTE_P)
   44221:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44225:	83 e0 01             	and    $0x1,%eax
   44228:	48 85 c0             	test   %rax,%rax
   4422b:	74 34                	je     44261 <virtual_memory_lookup+0xda>
    {
        vam.pn = PAGENUMBER(pe);
   4422d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44231:	48 c1 e8 0c          	shr    $0xc,%rax
   44235:	89 45 d0             	mov    %eax,-0x30(%rbp)
        vam.pa = PTE_ADDR(pe) + PAGEOFFSET(va);
   44238:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4423c:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   44242:	48 89 c2             	mov    %rax,%rdx
   44245:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   44249:	25 ff 0f 00 00       	and    $0xfff,%eax
   4424e:	48 09 d0             	or     %rdx,%rax
   44251:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        vam.perm = PTE_FLAGS(pe);
   44255:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44259:	25 ff 0f 00 00       	and    $0xfff,%eax
   4425e:	89 45 e0             	mov    %eax,-0x20(%rbp)
    }
    return vam;
   44261:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   44265:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   44269:	48 89 10             	mov    %rdx,(%rax)
   4426c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   44270:	48 89 50 08          	mov    %rdx,0x8(%rax)
   44274:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   44278:	48 89 50 10          	mov    %rdx,0x10(%rax)
}
   4427c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   44280:	c9                   	leave  
   44281:	c3                   	ret    

0000000000044282 <program_load>:
//    -1 on failure (e.g. out-of-memory). `allocator` is passed to
//    `virtual_memory_map`.

int program_load(proc *p, int programnumber,
                 x86_64_pagetable *(*allocator)(void))
{
   44282:	f3 0f 1e fa          	endbr64 
   44286:	55                   	push   %rbp
   44287:	48 89 e5             	mov    %rsp,%rbp
   4428a:	48 83 ec 40          	sub    $0x40,%rsp
   4428e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   44292:	89 75 d4             	mov    %esi,-0x2c(%rbp)
   44295:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    // is this a valid program?
    int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);
   44299:	c7 45 f8 07 00 00 00 	movl   $0x7,-0x8(%rbp)
    assert(programnumber >= 0 && programnumber < nprograms);
   442a0:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   442a4:	78 08                	js     442ae <program_load+0x2c>
   442a6:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   442a9:	3b 45 f8             	cmp    -0x8(%rbp),%eax
   442ac:	7c 1e                	jl     442cc <program_load+0x4a>
   442ae:	48 8d 05 83 1f 00 00 	lea    0x1f83(%rip),%rax        # 46238 <complex_keymap+0x518>
   442b5:	48 89 c2             	mov    %rax,%rdx
   442b8:	be 38 00 00 00       	mov    $0x38,%esi
   442bd:	48 8d 05 a4 1f 00 00 	lea    0x1fa4(%rip),%rax        # 46268 <complex_keymap+0x548>
   442c4:	48 89 c7             	mov    %rax,%rdi
   442c7:	e8 f3 f6 ff ff       	call   439bf <assert_fail>
    elf_header *eh = (elf_header *)ramimages[programnumber].begin;
   442cc:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   442cf:	48 98                	cltq   
   442d1:	48 c1 e0 04          	shl    $0x4,%rax
   442d5:	48 89 c2             	mov    %rax,%rdx
   442d8:	48 8d 05 41 2d 00 00 	lea    0x2d41(%rip),%rax        # 47020 <ramimages>
   442df:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   442e3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    assert(eh->e_magic == ELF_MAGIC);
   442e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   442eb:	8b 00                	mov    (%rax),%eax
   442ed:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
   442f2:	74 1e                	je     44312 <program_load+0x90>
   442f4:	48 8d 05 7f 1f 00 00 	lea    0x1f7f(%rip),%rax        # 4627a <complex_keymap+0x55a>
   442fb:	48 89 c2             	mov    %rax,%rdx
   442fe:	be 3a 00 00 00       	mov    $0x3a,%esi
   44303:	48 8d 05 5e 1f 00 00 	lea    0x1f5e(%rip),%rax        # 46268 <complex_keymap+0x548>
   4430a:	48 89 c7             	mov    %rax,%rdi
   4430d:	e8 ad f6 ff ff       	call   439bf <assert_fail>

    // load each loadable program segment into memory
    elf_program *ph = (elf_program *)((const uint8_t *)eh + eh->e_phoff);
   44312:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44316:	48 8b 50 20          	mov    0x20(%rax),%rdx
   4431a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4431e:	48 01 d0             	add    %rdx,%rax
   44321:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    for (int i = 0; i < eh->e_phnum; ++i)
   44325:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4432c:	e9 94 00 00 00       	jmp    443c5 <program_load+0x143>
    {
        if (ph[i].p_type == ELF_PTYPE_LOAD)
   44331:	8b 45 fc             	mov    -0x4(%rbp),%eax
   44334:	48 63 d0             	movslq %eax,%rdx
   44337:	48 89 d0             	mov    %rdx,%rax
   4433a:	48 c1 e0 03          	shl    $0x3,%rax
   4433e:	48 29 d0             	sub    %rdx,%rax
   44341:	48 c1 e0 03          	shl    $0x3,%rax
   44345:	48 89 c2             	mov    %rax,%rdx
   44348:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4434c:	48 01 d0             	add    %rdx,%rax
   4434f:	8b 00                	mov    (%rax),%eax
   44351:	83 f8 01             	cmp    $0x1,%eax
   44354:	75 6b                	jne    443c1 <program_load+0x13f>
        {
            const uint8_t *pdata = (const uint8_t *)eh + ph[i].p_offset;
   44356:	8b 45 fc             	mov    -0x4(%rbp),%eax
   44359:	48 63 d0             	movslq %eax,%rdx
   4435c:	48 89 d0             	mov    %rdx,%rax
   4435f:	48 c1 e0 03          	shl    $0x3,%rax
   44363:	48 29 d0             	sub    %rdx,%rax
   44366:	48 c1 e0 03          	shl    $0x3,%rax
   4436a:	48 89 c2             	mov    %rax,%rdx
   4436d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44371:	48 01 d0             	add    %rdx,%rax
   44374:	48 8b 50 08          	mov    0x8(%rax),%rdx
   44378:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4437c:	48 01 d0             	add    %rdx,%rax
   4437f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            if (program_load_segment(p, &ph[i], pdata, allocator) < 0)
   44383:	8b 45 fc             	mov    -0x4(%rbp),%eax
   44386:	48 63 d0             	movslq %eax,%rdx
   44389:	48 89 d0             	mov    %rdx,%rax
   4438c:	48 c1 e0 03          	shl    $0x3,%rax
   44390:	48 29 d0             	sub    %rdx,%rax
   44393:	48 c1 e0 03          	shl    $0x3,%rax
   44397:	48 89 c2             	mov    %rax,%rdx
   4439a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4439e:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   443a2:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   443a6:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   443aa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   443ae:	48 89 c7             	mov    %rax,%rdi
   443b1:	e8 3d 00 00 00       	call   443f3 <program_load_segment>
   443b6:	85 c0                	test   %eax,%eax
   443b8:	79 07                	jns    443c1 <program_load+0x13f>
            {
                return -1;
   443ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   443bf:	eb 30                	jmp    443f1 <program_load+0x16f>
    for (int i = 0; i < eh->e_phnum; ++i)
   443c1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   443c5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   443c9:	0f b7 40 38          	movzwl 0x38(%rax),%eax
   443cd:	0f b7 c0             	movzwl %ax,%eax
   443d0:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   443d3:	0f 8c 58 ff ff ff    	jl     44331 <program_load+0xaf>
            }
        }
    }

    // set the entry point from the ELF header
    p->p_registers.reg_rip = eh->e_entry;
   443d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   443dd:	48 8b 50 18          	mov    0x18(%rax),%rdx
   443e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   443e5:	48 89 90 a0 00 00 00 	mov    %rdx,0xa0(%rax)
    return 0;
   443ec:	b8 00 00 00 00       	mov    $0x0,%eax
}
   443f1:	c9                   	leave  
   443f2:	c3                   	ret    

00000000000443f3 <program_load_segment>:
//    to map them in `p->p_pagetable`. Returns 0 on success and -1 on failure.

static int program_load_segment(proc *p, const elf_program *ph,
                                const uint8_t *src,
                                x86_64_pagetable *(*allocator)(void))
{
   443f3:	f3 0f 1e fa          	endbr64 
   443f7:	55                   	push   %rbp
   443f8:	48 89 e5             	mov    %rsp,%rbp
   443fb:	48 81 ec c0 00 00 00 	sub    $0xc0,%rsp
   44402:	48 89 bd 58 ff ff ff 	mov    %rdi,-0xa8(%rbp)
   44409:	48 89 b5 50 ff ff ff 	mov    %rsi,-0xb0(%rbp)
   44410:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
   44417:	48 89 8d 40 ff ff ff 	mov    %rcx,-0xc0(%rbp)
    uintptr_t va = (uintptr_t)ph->p_va;
   4441e:	48 8b 85 50 ff ff ff 	mov    -0xb0(%rbp),%rax
   44425:	48 8b 40 10          	mov    0x10(%rax),%rax
   44429:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    uintptr_t end_file = va + ph->p_filesz, end_mem = va + ph->p_memsz;
   4442d:	48 8b 85 50 ff ff ff 	mov    -0xb0(%rbp),%rax
   44434:	48 8b 50 20          	mov    0x20(%rax),%rdx
   44438:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4443c:	48 01 d0             	add    %rdx,%rax
   4443f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
   44443:	48 8b 85 50 ff ff ff 	mov    -0xb0(%rbp),%rax
   4444a:	48 8b 50 28          	mov    0x28(%rax),%rdx
   4444e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44452:	48 01 d0             	add    %rdx,%rax
   44455:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    va &= ~(PAGESIZE - 1); // round to page boundary
   44459:	48 81 65 e8 00 f0 ff 	andq   $0xfffffffffffff000,-0x18(%rbp)
   44460:	ff 
    // allocate memory

    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE)
   44461:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44465:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   44469:	e9 ac 01 00 00       	jmp    4461a <program_load_segment+0x227>
    {
        int pn = find_free_page();
   4446e:	b8 00 00 00 00       	mov    $0x0,%eax
   44473:	e8 ee be ff ff       	call   40366 <find_free_page>
   44478:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (pn == -1)
   4447b:	83 7d cc ff          	cmpl   $0xffffffff,-0x34(%rbp)
   4447f:	0f 85 95 00 00 00    	jne    4451a <program_load_segment+0x127>
        {
            console_printf(CPOS(22, 0), 0xC000,
   44485:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
   4448c:	8b 00                	mov    (%rax),%eax
   4448e:	89 c1                	mov    %eax,%ecx
   44490:	48 8d 05 01 1e 00 00 	lea    0x1e01(%rip),%rax        # 46298 <complex_keymap+0x578>
   44497:	48 89 c2             	mov    %rax,%rdx
   4449a:	be 00 c0 00 00       	mov    $0xc000,%esi
   4449f:	bf e0 06 00 00       	mov    $0x6e0,%edi
   444a4:	b8 00 00 00 00       	mov    $0x0,%eax
   444a9:	e8 e1 11 00 00       	call   4568f <console_printf>
                           "program_load_segment(pid %d): out of physical memory\n",
                           p->p_pid);
            for (uintptr_t undo = va; undo < addr; addr += PAGESIZE) // we go through and free all the pages if one of the pages fials.
   444ae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   444b2:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   444b6:	eb 4e                	jmp    44506 <program_load_segment+0x113>
            {
                vamapping vmap = virtual_memory_lookup(p->p_pagetable, addr);
   444b8:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
   444bf:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   444c6:	48 8d 45 98          	lea    -0x68(%rbp),%rax
   444ca:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   444ce:	48 89 ce             	mov    %rcx,%rsi
   444d1:	48 89 c7             	mov    %rax,%rdi
   444d4:	e8 ae fc ff ff       	call   44187 <virtual_memory_lookup>
                if (vmap.pn < 0)
   444d9:	8b 45 98             	mov    -0x68(%rbp),%eax
   444dc:	85 c0                	test   %eax,%eax
   444de:	79 14                	jns    444f4 <program_load_segment+0x101>
                {
                    panic("nope\n");
   444e0:	48 8d 05 e7 1d 00 00 	lea    0x1de7(%rip),%rax        # 462ce <complex_keymap+0x5ae>
   444e7:	48 89 c7             	mov    %rax,%rdi
   444ea:	b8 00 00 00 00       	mov    $0x0,%eax
   444ef:	e8 db f3 ff ff       	call   438cf <panic>
                    return -1;
                }
                else
                {
                    freepage(vmap.pn);
   444f4:	8b 45 98             	mov    -0x68(%rbp),%eax
   444f7:	89 c7                	mov    %eax,%edi
   444f9:	e8 1d bf ff ff       	call   4041b <freepage>
            for (uintptr_t undo = va; undo < addr; addr += PAGESIZE) // we go through and free all the pages if one of the pages fials.
   444fe:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   44505:	00 
   44506:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   4450a:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
   4450e:	72 a8                	jb     444b8 <program_load_segment+0xc5>
                }
            }
            return -1;
   44510:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   44515:	e9 2e 02 00 00       	jmp    44748 <program_load_segment+0x355>
        }
        uintptr_t pa = PAGEADDRESS(pn);
   4451a:	8b 45 cc             	mov    -0x34(%rbp),%eax
   4451d:	48 98                	cltq   
   4451f:	48 c1 e0 0c          	shl    $0xc,%rax
   44523:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
        if (assign_physical_page(pa, p->p_pid) < 0 || virtual_memory_map(p->p_pagetable, addr, pa, PAGESIZE,
   44527:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
   4452e:	8b 00                	mov    (%rax),%eax
   44530:	0f be d0             	movsbl %al,%edx
   44533:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   44537:	89 d6                	mov    %edx,%esi
   44539:	48 89 c7             	mov    %rax,%rdi
   4453c:	e8 c5 c5 ff ff       	call   40b06 <assign_physical_page>
   44541:	85 c0                	test   %eax,%eax
   44543:	78 31                	js     44576 <program_load_segment+0x183>
   44545:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
   4454c:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   44553:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   44557:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   4455b:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   44561:	b9 00 10 00 00       	mov    $0x1000,%ecx
   44566:	48 89 c7             	mov    %rax,%rdi
   44569:	e8 d5 f7 ff ff       	call   43d43 <virtual_memory_map>
   4456e:	85 c0                	test   %eax,%eax
   44570:	0f 89 9c 00 00 00    	jns    44612 <program_load_segment+0x21f>
                                                                         PTE_P | PTE_U | PTE_W) < 0)
        {
            console_printf(CPOS(22, 0), 0xC000, "program_load_segment(pid %d): can't assign address %p\n", p->p_pid, addr);
   44576:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
   4457d:	8b 00                	mov    (%rax),%eax
   4457f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   44583:	49 89 d0             	mov    %rdx,%r8
   44586:	89 c1                	mov    %eax,%ecx
   44588:	48 8d 05 49 1d 00 00 	lea    0x1d49(%rip),%rax        # 462d8 <complex_keymap+0x5b8>
   4458f:	48 89 c2             	mov    %rax,%rdx
   44592:	be 00 c0 00 00       	mov    $0xc000,%esi
   44597:	bf e0 06 00 00       	mov    $0x6e0,%edi
   4459c:	b8 00 00 00 00       	mov    $0x0,%eax
   445a1:	e8 e9 10 00 00       	call   4568f <console_printf>
            for (uintptr_t undo = va; undo < addr; addr += PAGESIZE) // we go through and free all the pages if one of the pages fials.
   445a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   445aa:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   445ae:	eb 4e                	jmp    445fe <program_load_segment+0x20b>
            {
                vamapping vmap = virtual_memory_lookup(p->p_pagetable, addr);
   445b0:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
   445b7:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   445be:	48 8d 45 80          	lea    -0x80(%rbp),%rax
   445c2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   445c6:	48 89 ce             	mov    %rcx,%rsi
   445c9:	48 89 c7             	mov    %rax,%rdi
   445cc:	e8 b6 fb ff ff       	call   44187 <virtual_memory_lookup>
                if (vmap.pn < 0)
   445d1:	8b 45 80             	mov    -0x80(%rbp),%eax
   445d4:	85 c0                	test   %eax,%eax
   445d6:	79 14                	jns    445ec <program_load_segment+0x1f9>
                {
                    panic("nope\n");
   445d8:	48 8d 05 ef 1c 00 00 	lea    0x1cef(%rip),%rax        # 462ce <complex_keymap+0x5ae>
   445df:	48 89 c7             	mov    %rax,%rdi
   445e2:	b8 00 00 00 00       	mov    $0x0,%eax
   445e7:	e8 e3 f2 ff ff       	call   438cf <panic>
                    return -1;
                }
                else
                {
                    freepage(vmap.pn);
   445ec:	8b 45 80             	mov    -0x80(%rbp),%eax
   445ef:	89 c7                	mov    %eax,%edi
   445f1:	e8 25 be ff ff       	call   4041b <freepage>
            for (uintptr_t undo = va; undo < addr; addr += PAGESIZE) // we go through and free all the pages if one of the pages fials.
   445f6:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   445fd:	00 
   445fe:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   44602:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
   44606:	72 a8                	jb     445b0 <program_load_segment+0x1bd>
                }
            }
            return -1;
   44608:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   4460d:	e9 36 01 00 00       	jmp    44748 <program_load_segment+0x355>
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE)
   44612:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   44619:	00 
   4461a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4461e:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
   44622:	0f 82 46 fe ff ff    	jb     4446e <program_load_segment+0x7b>
        }
    }

    // ensure new memory mappings are active
    set_pagetable(p->p_pagetable);
   44628:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
   4462f:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   44636:	48 89 c7             	mov    %rax,%rdi
   44639:	e8 93 f5 ff ff       	call   43bd1 <set_pagetable>

    // copy data from executable image into process memory
    memcpy((uint8_t *)va, src, end_file - va);
   4463e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   44642:	48 2b 45 e8          	sub    -0x18(%rbp),%rax
   44646:	48 89 c2             	mov    %rax,%rdx
   44649:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4464d:	48 8b 8d 48 ff ff ff 	mov    -0xb8(%rbp),%rcx
   44654:	48 89 ce             	mov    %rcx,%rsi
   44657:	48 89 c7             	mov    %rax,%rdi
   4465a:	e8 eb 00 00 00       	call   4474a <memcpy>
    memset((uint8_t *)end_file, 0, end_mem - end_file);
   4465f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   44663:	48 2b 45 e0          	sub    -0x20(%rbp),%rax
   44667:	48 89 c2             	mov    %rax,%rdx
   4466a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4466e:	be 00 00 00 00       	mov    $0x0,%esi
   44673:	48 89 c7             	mov    %rax,%rdi
   44676:	e8 d5 01 00 00       	call   44850 <memset>

    int perm = PTE_P | PTE_U;
   4467b:	c7 45 d4 05 00 00 00 	movl   $0x5,-0x2c(%rbp)
    int read_only = ((ph->p_flags & ELF_PFLAG_WRITE) == 0);
   44682:	48 8b 85 50 ff ff ff 	mov    -0xb0(%rbp),%rax
   44689:	8b 40 04             	mov    0x4(%rax),%eax
   4468c:	83 e0 02             	and    $0x2,%eax
   4468f:	85 c0                	test   %eax,%eax
   44691:	0f 94 c0             	sete   %al
   44694:	0f b6 c0             	movzbl %al,%eax
   44697:	89 45 d0             	mov    %eax,-0x30(%rbp)
    if (read_only)
   4469a:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
   4469e:	0f 84 90 00 00 00    	je     44734 <program_load_segment+0x341>
    {
        for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE)
   446a4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   446a8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
   446ac:	eb 78                	jmp    44726 <program_load_segment+0x333>
        {
            vamapping vmap = virtual_memory_lookup(p->p_pagetable, addr);
   446ae:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
   446b5:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   446bc:	48 8d 85 68 ff ff ff 	lea    -0x98(%rbp),%rax
   446c3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   446c7:	48 89 ce             	mov    %rcx,%rsi
   446ca:	48 89 c7             	mov    %rax,%rdi
   446cd:	e8 b5 fa ff ff       	call   44187 <virtual_memory_lookup>
            if (vmap.pn >= 0)
   446d2:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
   446d8:	85 c0                	test   %eax,%eax
   446da:	78 36                	js     44712 <program_load_segment+0x31f>
            {
                virtual_memory_map(p->p_pagetable, addr, vmap.pa, PAGESIZE, perm);
   446dc:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
   446e3:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
   446ea:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   446f1:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
   446f4:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   446f8:	41 89 c8             	mov    %ecx,%r8d
   446fb:	b9 00 10 00 00       	mov    $0x1000,%ecx
   44700:	48 89 c7             	mov    %rax,%rdi
   44703:	e8 3b f6 ff ff       	call   43d43 <virtual_memory_map>
        for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE)
   44708:	48 81 45 f0 00 10 00 	addq   $0x1000,-0x10(%rbp)
   4470f:	00 
   44710:	eb 14                	jmp    44726 <program_load_segment+0x333>
            }
            else
            {
                panic("nope\n");
   44712:	48 8d 05 b5 1b 00 00 	lea    0x1bb5(%rip),%rax        # 462ce <complex_keymap+0x5ae>
   44719:	48 89 c7             	mov    %rax,%rdi
   4471c:	b8 00 00 00 00       	mov    $0x0,%eax
   44721:	e8 a9 f1 ff ff       	call   438cf <panic>
        for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE)
   44726:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4472a:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
   4472e:	0f 82 7a ff ff ff    	jb     446ae <program_load_segment+0x2bb>
            }
        }
    }
    // restore kernel pagetable
    set_pagetable(kernel_pagetable);
   44734:	48 8b 05 c5 18 01 00 	mov    0x118c5(%rip),%rax        # 56000 <kernel_pagetable>
   4473b:	48 89 c7             	mov    %rax,%rdi
   4473e:	e8 8e f4 ff ff       	call   43bd1 <set_pagetable>
    return 0;
   44743:	b8 00 00 00 00       	mov    $0x0,%eax
}
   44748:	c9                   	leave  
   44749:	c3                   	ret    

000000000004474a <memcpy>:


// memcpy, memmove, memset, strcmp, strlen, strnlen
//    We must provide our own implementations.

void* memcpy(void* dst, const void* src, size_t n) {
   4474a:	f3 0f 1e fa          	endbr64 
   4474e:	55                   	push   %rbp
   4474f:	48 89 e5             	mov    %rsp,%rbp
   44752:	48 83 ec 28          	sub    $0x28,%rsp
   44756:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4475a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
   4475e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    const char* s = (const char*) src;
   44762:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   44766:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   4476a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4476e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
   44772:	eb 1c                	jmp    44790 <memcpy+0x46>
        *d = *s;
   44774:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44778:	0f b6 10             	movzbl (%rax),%edx
   4477b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4477f:	88 10                	mov    %dl,(%rax)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   44781:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
   44786:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   4478b:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
   44790:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   44795:	75 dd                	jne    44774 <memcpy+0x2a>
    }
    return dst;
   44797:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   4479b:	c9                   	leave  
   4479c:	c3                   	ret    

000000000004479d <memmove>:

void* memmove(void* dst, const void* src, size_t n) {
   4479d:	f3 0f 1e fa          	endbr64 
   447a1:	55                   	push   %rbp
   447a2:	48 89 e5             	mov    %rsp,%rbp
   447a5:	48 83 ec 28          	sub    $0x28,%rsp
   447a9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   447ad:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
   447b1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    const char* s = (const char*) src;
   447b5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   447b9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    char* d = (char*) dst;
   447bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   447c1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (s < d && s + n > d) {
   447c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   447c9:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
   447cd:	73 6a                	jae    44839 <memmove+0x9c>
   447cf:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   447d3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   447d7:	48 01 d0             	add    %rdx,%rax
   447da:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   447de:	73 59                	jae    44839 <memmove+0x9c>
        s += n, d += n;
   447e0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   447e4:	48 01 45 f8          	add    %rax,-0x8(%rbp)
   447e8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   447ec:	48 01 45 f0          	add    %rax,-0x10(%rbp)
        while (n-- > 0) {
   447f0:	eb 17                	jmp    44809 <memmove+0x6c>
            *--d = *--s;
   447f2:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
   447f7:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
   447fc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44800:	0f b6 10             	movzbl (%rax),%edx
   44803:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44807:	88 10                	mov    %dl,(%rax)
        while (n-- > 0) {
   44809:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4480d:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
   44811:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
   44815:	48 85 c0             	test   %rax,%rax
   44818:	75 d8                	jne    447f2 <memmove+0x55>
    if (s < d && s + n > d) {
   4481a:	eb 2e                	jmp    4484a <memmove+0xad>
        }
    } else {
        while (n-- > 0) {
            *d++ = *s++;
   4481c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   44820:	48 8d 42 01          	lea    0x1(%rdx),%rax
   44824:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   44828:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4482c:	48 8d 48 01          	lea    0x1(%rax),%rcx
   44830:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
   44834:	0f b6 12             	movzbl (%rdx),%edx
   44837:	88 10                	mov    %dl,(%rax)
        while (n-- > 0) {
   44839:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4483d:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
   44841:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
   44845:	48 85 c0             	test   %rax,%rax
   44848:	75 d2                	jne    4481c <memmove+0x7f>
        }
    }
    return dst;
   4484a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   4484e:	c9                   	leave  
   4484f:	c3                   	ret    

0000000000044850 <memset>:

void* memset(void* v, int c, size_t n) {
   44850:	f3 0f 1e fa          	endbr64 
   44854:	55                   	push   %rbp
   44855:	48 89 e5             	mov    %rsp,%rbp
   44858:	48 83 ec 28          	sub    $0x28,%rsp
   4485c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   44860:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   44863:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   44867:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4486b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   4486f:	eb 15                	jmp    44886 <memset+0x36>
        *p = c;
   44871:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   44874:	89 c2                	mov    %eax,%edx
   44876:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4487a:	88 10                	mov    %dl,(%rax)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   4487c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   44881:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
   44886:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   4488b:	75 e4                	jne    44871 <memset+0x21>
    }
    return v;
   4488d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   44891:	c9                   	leave  
   44892:	c3                   	ret    

0000000000044893 <strlen>:

size_t strlen(const char* s) {
   44893:	f3 0f 1e fa          	endbr64 
   44897:	55                   	push   %rbp
   44898:	48 89 e5             	mov    %rsp,%rbp
   4489b:	48 83 ec 18          	sub    $0x18,%rsp
   4489f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
   448a3:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   448aa:	00 
   448ab:	eb 0a                	jmp    448b7 <strlen+0x24>
        ++n;
   448ad:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    for (n = 0; *s != '\0'; ++s) {
   448b2:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
   448b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   448bb:	0f b6 00             	movzbl (%rax),%eax
   448be:	84 c0                	test   %al,%al
   448c0:	75 eb                	jne    448ad <strlen+0x1a>
    }
    return n;
   448c2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   448c6:	c9                   	leave  
   448c7:	c3                   	ret    

00000000000448c8 <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
   448c8:	f3 0f 1e fa          	endbr64 
   448cc:	55                   	push   %rbp
   448cd:	48 89 e5             	mov    %rsp,%rbp
   448d0:	48 83 ec 20          	sub    $0x20,%rsp
   448d4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   448d8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   448dc:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   448e3:	00 
   448e4:	eb 0a                	jmp    448f0 <strnlen+0x28>
        ++n;
   448e6:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   448eb:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
   448f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   448f4:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
   448f8:	74 0b                	je     44905 <strnlen+0x3d>
   448fa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   448fe:	0f b6 00             	movzbl (%rax),%eax
   44901:	84 c0                	test   %al,%al
   44903:	75 e1                	jne    448e6 <strnlen+0x1e>
    }
    return n;
   44905:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   44909:	c9                   	leave  
   4490a:	c3                   	ret    

000000000004490b <strcpy>:

char* strcpy(char* dst, const char* src) {
   4490b:	f3 0f 1e fa          	endbr64 
   4490f:	55                   	push   %rbp
   44910:	48 89 e5             	mov    %rsp,%rbp
   44913:	48 83 ec 20          	sub    $0x20,%rsp
   44917:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4491b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    char* d = dst;
   4491f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44923:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    do {
        *d++ = *src++;
   44927:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   4492b:	48 8d 42 01          	lea    0x1(%rdx),%rax
   4492f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
   44933:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44937:	48 8d 48 01          	lea    0x1(%rax),%rcx
   4493b:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
   4493f:	0f b6 12             	movzbl (%rdx),%edx
   44942:	88 10                	mov    %dl,(%rax)
    } while (d[-1]);
   44944:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44948:	48 83 e8 01          	sub    $0x1,%rax
   4494c:	0f b6 00             	movzbl (%rax),%eax
   4494f:	84 c0                	test   %al,%al
   44951:	75 d4                	jne    44927 <strcpy+0x1c>
    return dst;
   44953:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   44957:	c9                   	leave  
   44958:	c3                   	ret    

0000000000044959 <strcmp>:

int strcmp(const char* a, const char* b) {
   44959:	f3 0f 1e fa          	endbr64 
   4495d:	55                   	push   %rbp
   4495e:	48 89 e5             	mov    %rsp,%rbp
   44961:	48 83 ec 10          	sub    $0x10,%rsp
   44965:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   44969:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    while (*a && *b && *a == *b) {
   4496d:	eb 0a                	jmp    44979 <strcmp+0x20>
        ++a, ++b;
   4496f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   44974:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    while (*a && *b && *a == *b) {
   44979:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4497d:	0f b6 00             	movzbl (%rax),%eax
   44980:	84 c0                	test   %al,%al
   44982:	74 1d                	je     449a1 <strcmp+0x48>
   44984:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44988:	0f b6 00             	movzbl (%rax),%eax
   4498b:	84 c0                	test   %al,%al
   4498d:	74 12                	je     449a1 <strcmp+0x48>
   4498f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44993:	0f b6 10             	movzbl (%rax),%edx
   44996:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4499a:	0f b6 00             	movzbl (%rax),%eax
   4499d:	38 c2                	cmp    %al,%dl
   4499f:	74 ce                	je     4496f <strcmp+0x16>
    }
    return ((unsigned char) *a > (unsigned char) *b)
   449a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   449a5:	0f b6 00             	movzbl (%rax),%eax
   449a8:	89 c2                	mov    %eax,%edx
   449aa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   449ae:	0f b6 00             	movzbl (%rax),%eax
   449b1:	38 c2                	cmp    %al,%dl
   449b3:	0f 97 c0             	seta   %al
   449b6:	0f b6 d0             	movzbl %al,%edx
        - ((unsigned char) *a < (unsigned char) *b);
   449b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   449bd:	0f b6 00             	movzbl (%rax),%eax
   449c0:	89 c1                	mov    %eax,%ecx
   449c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   449c6:	0f b6 00             	movzbl (%rax),%eax
   449c9:	38 c1                	cmp    %al,%cl
   449cb:	0f 92 c0             	setb   %al
   449ce:	0f b6 c8             	movzbl %al,%ecx
   449d1:	89 d0                	mov    %edx,%eax
   449d3:	29 c8                	sub    %ecx,%eax
}
   449d5:	c9                   	leave  
   449d6:	c3                   	ret    

00000000000449d7 <strchr>:

char* strchr(const char* s, int c) {
   449d7:	f3 0f 1e fa          	endbr64 
   449db:	55                   	push   %rbp
   449dc:	48 89 e5             	mov    %rsp,%rbp
   449df:	48 83 ec 10          	sub    $0x10,%rsp
   449e3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   449e7:	89 75 f4             	mov    %esi,-0xc(%rbp)
    while (*s && *s != (char) c) {
   449ea:	eb 05                	jmp    449f1 <strchr+0x1a>
        ++s;
   449ec:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    while (*s && *s != (char) c) {
   449f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   449f5:	0f b6 00             	movzbl (%rax),%eax
   449f8:	84 c0                	test   %al,%al
   449fa:	74 0e                	je     44a0a <strchr+0x33>
   449fc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44a00:	0f b6 00             	movzbl (%rax),%eax
   44a03:	8b 55 f4             	mov    -0xc(%rbp),%edx
   44a06:	38 d0                	cmp    %dl,%al
   44a08:	75 e2                	jne    449ec <strchr+0x15>
    }
    if (*s == (char) c) {
   44a0a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44a0e:	0f b6 00             	movzbl (%rax),%eax
   44a11:	8b 55 f4             	mov    -0xc(%rbp),%edx
   44a14:	38 d0                	cmp    %dl,%al
   44a16:	75 06                	jne    44a1e <strchr+0x47>
        return (char*) s;
   44a18:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44a1c:	eb 05                	jmp    44a23 <strchr+0x4c>
    } else {
        return NULL;
   44a1e:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   44a23:	c9                   	leave  
   44a24:	c3                   	ret    

0000000000044a25 <rand>:
// rand, srand

static int rand_seed_set;
static unsigned rand_seed;

int rand(void) {
   44a25:	f3 0f 1e fa          	endbr64 
   44a29:	55                   	push   %rbp
   44a2a:	48 89 e5             	mov    %rsp,%rbp
    if (!rand_seed_set) {
   44a2d:	8b 05 cd 75 01 00    	mov    0x175cd(%rip),%eax        # 5c000 <rand_seed_set>
   44a33:	85 c0                	test   %eax,%eax
   44a35:	75 0a                	jne    44a41 <rand+0x1c>
        srand(819234718U);
   44a37:	bf 9e 87 d4 30       	mov    $0x30d4879e,%edi
   44a3c:	e8 24 00 00 00       	call   44a65 <srand>
    }
    rand_seed = rand_seed * 1664525U + 1013904223U;
   44a41:	8b 05 bd 75 01 00    	mov    0x175bd(%rip),%eax        # 5c004 <rand_seed>
   44a47:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
   44a4d:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
   44a52:	89 05 ac 75 01 00    	mov    %eax,0x175ac(%rip)        # 5c004 <rand_seed>
    return rand_seed & RAND_MAX;
   44a58:	8b 05 a6 75 01 00    	mov    0x175a6(%rip),%eax        # 5c004 <rand_seed>
   44a5e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
   44a63:	5d                   	pop    %rbp
   44a64:	c3                   	ret    

0000000000044a65 <srand>:

void srand(unsigned seed) {
   44a65:	f3 0f 1e fa          	endbr64 
   44a69:	55                   	push   %rbp
   44a6a:	48 89 e5             	mov    %rsp,%rbp
   44a6d:	48 83 ec 08          	sub    $0x8,%rsp
   44a71:	89 7d fc             	mov    %edi,-0x4(%rbp)
    rand_seed = seed;
   44a74:	8b 45 fc             	mov    -0x4(%rbp),%eax
   44a77:	89 05 87 75 01 00    	mov    %eax,0x17587(%rip)        # 5c004 <rand_seed>
    rand_seed_set = 1;
   44a7d:	c7 05 79 75 01 00 01 	movl   $0x1,0x17579(%rip)        # 5c000 <rand_seed_set>
   44a84:	00 00 00 
}
   44a87:	90                   	nop
   44a88:	c9                   	leave  
   44a89:	c3                   	ret    

0000000000044a8a <fill_numbuf>:
//    Print a message onto the console, starting at the given cursor position.

// snprintf, vsnprintf
//    Format a string into a buffer.

static char* fill_numbuf(char* numbuf_end, unsigned long val, int base) {
   44a8a:	f3 0f 1e fa          	endbr64 
   44a8e:	55                   	push   %rbp
   44a8f:	48 89 e5             	mov    %rsp,%rbp
   44a92:	48 83 ec 28          	sub    $0x28,%rsp
   44a96:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   44a9a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
   44a9e:	89 55 dc             	mov    %edx,-0x24(%rbp)
    static const char upper_digits[] = "0123456789ABCDEF";
    static const char lower_digits[] = "0123456789abcdef";

    const char* digits = upper_digits;
   44aa1:	48 8d 05 68 19 00 00 	lea    0x1968(%rip),%rax        # 46410 <upper_digits.1>
   44aa8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (base < 0) {
   44aac:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   44ab0:	79 0e                	jns    44ac0 <fill_numbuf+0x36>
        digits = lower_digits;
   44ab2:	48 8d 05 77 19 00 00 	lea    0x1977(%rip),%rax        # 46430 <lower_digits.0>
   44ab9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        base = -base;
   44abd:	f7 5d dc             	negl   -0x24(%rbp)
    }

    *--numbuf_end = '\0';
   44ac0:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
   44ac5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44ac9:	c6 00 00             	movb   $0x0,(%rax)
    do {
        *--numbuf_end = digits[val % base];
   44acc:	8b 45 dc             	mov    -0x24(%rbp),%eax
   44acf:	48 63 c8             	movslq %eax,%rcx
   44ad2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   44ad6:	ba 00 00 00 00       	mov    $0x0,%edx
   44adb:	48 f7 f1             	div    %rcx
   44ade:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44ae2:	48 01 d0             	add    %rdx,%rax
   44ae5:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
   44aea:	0f b6 10             	movzbl (%rax),%edx
   44aed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44af1:	88 10                	mov    %dl,(%rax)
        val /= base;
   44af3:	8b 45 dc             	mov    -0x24(%rbp),%eax
   44af6:	48 63 f0             	movslq %eax,%rsi
   44af9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   44afd:	ba 00 00 00 00       	mov    $0x0,%edx
   44b02:	48 f7 f6             	div    %rsi
   44b05:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    } while (val != 0);
   44b09:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   44b0e:	75 bc                	jne    44acc <fill_numbuf+0x42>
    return numbuf_end;
   44b10:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   44b14:	c9                   	leave  
   44b15:	c3                   	ret    

0000000000044b16 <printer_vprintf>:
#define FLAG_NUMERIC            (1<<5)
#define FLAG_SIGNED             (1<<6)
#define FLAG_NEGATIVE           (1<<7)
#define FLAG_ALT2               (1<<8)

void printer_vprintf(printer* p, int color, const char* format, va_list val) {
   44b16:	f3 0f 1e fa          	endbr64 
   44b1a:	55                   	push   %rbp
   44b1b:	48 89 e5             	mov    %rsp,%rbp
   44b1e:	53                   	push   %rbx
   44b1f:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   44b26:	48 89 bd 78 ff ff ff 	mov    %rdi,-0x88(%rbp)
   44b2d:	89 b5 74 ff ff ff    	mov    %esi,-0x8c(%rbp)
   44b33:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   44b3a:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
#define NUMBUFSIZ 24
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
   44b41:	e9 bd 09 00 00       	jmp    45503 <printer_vprintf+0x9ed>
        if (*format != '%') {
   44b46:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44b4d:	0f b6 00             	movzbl (%rax),%eax
   44b50:	3c 25                	cmp    $0x25,%al
   44b52:	74 31                	je     44b85 <printer_vprintf+0x6f>
            p->putc(p, *format, color);
   44b54:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44b5b:	4c 8b 00             	mov    (%rax),%r8
   44b5e:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44b65:	0f b6 00             	movzbl (%rax),%eax
   44b68:	0f b6 c8             	movzbl %al,%ecx
   44b6b:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   44b71:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44b78:	89 ce                	mov    %ecx,%esi
   44b7a:	48 89 c7             	mov    %rax,%rdi
   44b7d:	41 ff d0             	call   *%r8
            continue;
   44b80:	e9 76 09 00 00       	jmp    454fb <printer_vprintf+0x9e5>
        }

        // process flags
        int flags = 0;
   44b85:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
        for (++format; *format; ++format) {
   44b8c:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   44b93:	01 
   44b94:	eb 4d                	jmp    44be3 <printer_vprintf+0xcd>
            const char* flagc = strchr(flag_chars, *format);
   44b96:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44b9d:	0f b6 00             	movzbl (%rax),%eax
   44ba0:	0f be c0             	movsbl %al,%eax
   44ba3:	89 c6                	mov    %eax,%esi
   44ba5:	48 8d 05 64 17 00 00 	lea    0x1764(%rip),%rax        # 46310 <flag_chars>
   44bac:	48 89 c7             	mov    %rax,%rdi
   44baf:	e8 23 fe ff ff       	call   449d7 <strchr>
   44bb4:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
            if (flagc) {
   44bb8:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   44bbd:	74 34                	je     44bf3 <printer_vprintf+0xdd>
                flags |= 1 << (flagc - flag_chars);
   44bbf:	48 8d 15 4a 17 00 00 	lea    0x174a(%rip),%rdx        # 46310 <flag_chars>
   44bc6:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   44bca:	48 29 d0             	sub    %rdx,%rax
   44bcd:	ba 01 00 00 00       	mov    $0x1,%edx
   44bd2:	89 c1                	mov    %eax,%ecx
   44bd4:	d3 e2                	shl    %cl,%edx
   44bd6:	89 d0                	mov    %edx,%eax
   44bd8:	09 45 ec             	or     %eax,-0x14(%rbp)
        for (++format; *format; ++format) {
   44bdb:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   44be2:	01 
   44be3:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44bea:	0f b6 00             	movzbl (%rax),%eax
   44bed:	84 c0                	test   %al,%al
   44bef:	75 a5                	jne    44b96 <printer_vprintf+0x80>
   44bf1:	eb 01                	jmp    44bf4 <printer_vprintf+0xde>
            } else {
                break;
   44bf3:	90                   	nop
            }
        }

        // process width
        int width = -1;
   44bf4:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%rbp)
        if (*format >= '1' && *format <= '9') {
   44bfb:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44c02:	0f b6 00             	movzbl (%rax),%eax
   44c05:	3c 30                	cmp    $0x30,%al
   44c07:	7e 67                	jle    44c70 <printer_vprintf+0x15a>
   44c09:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44c10:	0f b6 00             	movzbl (%rax),%eax
   44c13:	3c 39                	cmp    $0x39,%al
   44c15:	7f 59                	jg     44c70 <printer_vprintf+0x15a>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   44c17:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
   44c1e:	eb 2e                	jmp    44c4e <printer_vprintf+0x138>
                width = 10 * width + *format++ - '0';
   44c20:	8b 55 e8             	mov    -0x18(%rbp),%edx
   44c23:	89 d0                	mov    %edx,%eax
   44c25:	c1 e0 02             	shl    $0x2,%eax
   44c28:	01 d0                	add    %edx,%eax
   44c2a:	01 c0                	add    %eax,%eax
   44c2c:	89 c1                	mov    %eax,%ecx
   44c2e:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44c35:	48 8d 50 01          	lea    0x1(%rax),%rdx
   44c39:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   44c40:	0f b6 00             	movzbl (%rax),%eax
   44c43:	0f be c0             	movsbl %al,%eax
   44c46:	01 c8                	add    %ecx,%eax
   44c48:	83 e8 30             	sub    $0x30,%eax
   44c4b:	89 45 e8             	mov    %eax,-0x18(%rbp)
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   44c4e:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44c55:	0f b6 00             	movzbl (%rax),%eax
   44c58:	3c 2f                	cmp    $0x2f,%al
   44c5a:	0f 8e 85 00 00 00    	jle    44ce5 <printer_vprintf+0x1cf>
   44c60:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44c67:	0f b6 00             	movzbl (%rax),%eax
   44c6a:	3c 39                	cmp    $0x39,%al
   44c6c:	7e b2                	jle    44c20 <printer_vprintf+0x10a>
        if (*format >= '1' && *format <= '9') {
   44c6e:	eb 75                	jmp    44ce5 <printer_vprintf+0x1cf>
            }
        } else if (*format == '*') {
   44c70:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44c77:	0f b6 00             	movzbl (%rax),%eax
   44c7a:	3c 2a                	cmp    $0x2a,%al
   44c7c:	75 68                	jne    44ce6 <printer_vprintf+0x1d0>
            width = va_arg(val, int);
   44c7e:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44c85:	8b 00                	mov    (%rax),%eax
   44c87:	83 f8 2f             	cmp    $0x2f,%eax
   44c8a:	77 30                	ja     44cbc <printer_vprintf+0x1a6>
   44c8c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44c93:	48 8b 50 10          	mov    0x10(%rax),%rdx
   44c97:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44c9e:	8b 00                	mov    (%rax),%eax
   44ca0:	89 c0                	mov    %eax,%eax
   44ca2:	48 01 d0             	add    %rdx,%rax
   44ca5:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44cac:	8b 12                	mov    (%rdx),%edx
   44cae:	8d 4a 08             	lea    0x8(%rdx),%ecx
   44cb1:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44cb8:	89 0a                	mov    %ecx,(%rdx)
   44cba:	eb 1a                	jmp    44cd6 <printer_vprintf+0x1c0>
   44cbc:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44cc3:	48 8b 40 08          	mov    0x8(%rax),%rax
   44cc7:	48 8d 48 08          	lea    0x8(%rax),%rcx
   44ccb:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44cd2:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44cd6:	8b 00                	mov    (%rax),%eax
   44cd8:	89 45 e8             	mov    %eax,-0x18(%rbp)
            ++format;
   44cdb:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   44ce2:	01 
   44ce3:	eb 01                	jmp    44ce6 <printer_vprintf+0x1d0>
        if (*format >= '1' && *format <= '9') {
   44ce5:	90                   	nop
        }

        // process precision
        int precision = -1;
   44ce6:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
        if (*format == '.') {
   44ced:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44cf4:	0f b6 00             	movzbl (%rax),%eax
   44cf7:	3c 2e                	cmp    $0x2e,%al
   44cf9:	0f 85 00 01 00 00    	jne    44dff <printer_vprintf+0x2e9>
            ++format;
   44cff:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   44d06:	01 
            if (*format >= '0' && *format <= '9') {
   44d07:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44d0e:	0f b6 00             	movzbl (%rax),%eax
   44d11:	3c 2f                	cmp    $0x2f,%al
   44d13:	7e 67                	jle    44d7c <printer_vprintf+0x266>
   44d15:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44d1c:	0f b6 00             	movzbl (%rax),%eax
   44d1f:	3c 39                	cmp    $0x39,%al
   44d21:	7f 59                	jg     44d7c <printer_vprintf+0x266>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   44d23:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
   44d2a:	eb 2e                	jmp    44d5a <printer_vprintf+0x244>
                    precision = 10 * precision + *format++ - '0';
   44d2c:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   44d2f:	89 d0                	mov    %edx,%eax
   44d31:	c1 e0 02             	shl    $0x2,%eax
   44d34:	01 d0                	add    %edx,%eax
   44d36:	01 c0                	add    %eax,%eax
   44d38:	89 c1                	mov    %eax,%ecx
   44d3a:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44d41:	48 8d 50 01          	lea    0x1(%rax),%rdx
   44d45:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   44d4c:	0f b6 00             	movzbl (%rax),%eax
   44d4f:	0f be c0             	movsbl %al,%eax
   44d52:	01 c8                	add    %ecx,%eax
   44d54:	83 e8 30             	sub    $0x30,%eax
   44d57:	89 45 e4             	mov    %eax,-0x1c(%rbp)
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   44d5a:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44d61:	0f b6 00             	movzbl (%rax),%eax
   44d64:	3c 2f                	cmp    $0x2f,%al
   44d66:	0f 8e 85 00 00 00    	jle    44df1 <printer_vprintf+0x2db>
   44d6c:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44d73:	0f b6 00             	movzbl (%rax),%eax
   44d76:	3c 39                	cmp    $0x39,%al
   44d78:	7e b2                	jle    44d2c <printer_vprintf+0x216>
            if (*format >= '0' && *format <= '9') {
   44d7a:	eb 75                	jmp    44df1 <printer_vprintf+0x2db>
                }
            } else if (*format == '*') {
   44d7c:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44d83:	0f b6 00             	movzbl (%rax),%eax
   44d86:	3c 2a                	cmp    $0x2a,%al
   44d88:	75 68                	jne    44df2 <printer_vprintf+0x2dc>
                precision = va_arg(val, int);
   44d8a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44d91:	8b 00                	mov    (%rax),%eax
   44d93:	83 f8 2f             	cmp    $0x2f,%eax
   44d96:	77 30                	ja     44dc8 <printer_vprintf+0x2b2>
   44d98:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44d9f:	48 8b 50 10          	mov    0x10(%rax),%rdx
   44da3:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44daa:	8b 00                	mov    (%rax),%eax
   44dac:	89 c0                	mov    %eax,%eax
   44dae:	48 01 d0             	add    %rdx,%rax
   44db1:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44db8:	8b 12                	mov    (%rdx),%edx
   44dba:	8d 4a 08             	lea    0x8(%rdx),%ecx
   44dbd:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44dc4:	89 0a                	mov    %ecx,(%rdx)
   44dc6:	eb 1a                	jmp    44de2 <printer_vprintf+0x2cc>
   44dc8:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44dcf:	48 8b 40 08          	mov    0x8(%rax),%rax
   44dd3:	48 8d 48 08          	lea    0x8(%rax),%rcx
   44dd7:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44dde:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44de2:	8b 00                	mov    (%rax),%eax
   44de4:	89 45 e4             	mov    %eax,-0x1c(%rbp)
                ++format;
   44de7:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   44dee:	01 
   44def:	eb 01                	jmp    44df2 <printer_vprintf+0x2dc>
            if (*format >= '0' && *format <= '9') {
   44df1:	90                   	nop
            }
            if (precision < 0) {
   44df2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
   44df6:	79 07                	jns    44dff <printer_vprintf+0x2e9>
                precision = 0;
   44df8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
            }
        }

        // process main conversion character
        int base = 10;
   44dff:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%rbp)
        unsigned long num = 0;
   44e06:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
   44e0d:	00 
        int length = 0;
   44e0e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
        char* data = "";
   44e15:	48 8d 05 fa 14 00 00 	lea    0x14fa(%rip),%rax        # 46316 <flag_chars+0x6>
   44e1c:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    again:
        switch (*format) {
   44e20:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44e27:	0f b6 00             	movzbl (%rax),%eax
   44e2a:	0f be c0             	movsbl %al,%eax
   44e2d:	83 e8 43             	sub    $0x43,%eax
   44e30:	83 f8 37             	cmp    $0x37,%eax
   44e33:	0f 87 b6 03 00 00    	ja     451ef <printer_vprintf+0x6d9>
   44e39:	89 c0                	mov    %eax,%eax
   44e3b:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
   44e42:	00 
   44e43:	48 8d 05 da 14 00 00 	lea    0x14da(%rip),%rax        # 46324 <flag_chars+0x14>
   44e4a:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   44e4d:	48 98                	cltq   
   44e4f:	48 8d 15 ce 14 00 00 	lea    0x14ce(%rip),%rdx        # 46324 <flag_chars+0x14>
   44e56:	48 01 d0             	add    %rdx,%rax
   44e59:	3e ff e0             	notrack jmp *%rax
        case 'l':
        case 'z':
            length = 1;
   44e5c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
            ++format;
   44e63:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   44e6a:	01 
            goto again;
   44e6b:	eb b3                	jmp    44e20 <printer_vprintf+0x30a>
        case 'd':
        case 'i': {
            long x = length ? va_arg(val, long) : va_arg(val, int);
   44e6d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   44e71:	74 5d                	je     44ed0 <printer_vprintf+0x3ba>
   44e73:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44e7a:	8b 00                	mov    (%rax),%eax
   44e7c:	83 f8 2f             	cmp    $0x2f,%eax
   44e7f:	77 30                	ja     44eb1 <printer_vprintf+0x39b>
   44e81:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44e88:	48 8b 50 10          	mov    0x10(%rax),%rdx
   44e8c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44e93:	8b 00                	mov    (%rax),%eax
   44e95:	89 c0                	mov    %eax,%eax
   44e97:	48 01 d0             	add    %rdx,%rax
   44e9a:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44ea1:	8b 12                	mov    (%rdx),%edx
   44ea3:	8d 4a 08             	lea    0x8(%rdx),%ecx
   44ea6:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44ead:	89 0a                	mov    %ecx,(%rdx)
   44eaf:	eb 1a                	jmp    44ecb <printer_vprintf+0x3b5>
   44eb1:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44eb8:	48 8b 40 08          	mov    0x8(%rax),%rax
   44ebc:	48 8d 48 08          	lea    0x8(%rax),%rcx
   44ec0:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44ec7:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44ecb:	48 8b 00             	mov    (%rax),%rax
   44ece:	eb 5c                	jmp    44f2c <printer_vprintf+0x416>
   44ed0:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44ed7:	8b 00                	mov    (%rax),%eax
   44ed9:	83 f8 2f             	cmp    $0x2f,%eax
   44edc:	77 30                	ja     44f0e <printer_vprintf+0x3f8>
   44ede:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44ee5:	48 8b 50 10          	mov    0x10(%rax),%rdx
   44ee9:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44ef0:	8b 00                	mov    (%rax),%eax
   44ef2:	89 c0                	mov    %eax,%eax
   44ef4:	48 01 d0             	add    %rdx,%rax
   44ef7:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44efe:	8b 12                	mov    (%rdx),%edx
   44f00:	8d 4a 08             	lea    0x8(%rdx),%ecx
   44f03:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44f0a:	89 0a                	mov    %ecx,(%rdx)
   44f0c:	eb 1a                	jmp    44f28 <printer_vprintf+0x412>
   44f0e:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44f15:	48 8b 40 08          	mov    0x8(%rax),%rax
   44f19:	48 8d 48 08          	lea    0x8(%rax),%rcx
   44f1d:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44f24:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44f28:	8b 00                	mov    (%rax),%eax
   44f2a:	48 98                	cltq   
   44f2c:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
   44f30:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   44f34:	48 c1 f8 38          	sar    $0x38,%rax
   44f38:	25 80 00 00 00       	and    $0x80,%eax
   44f3d:	89 45 a4             	mov    %eax,-0x5c(%rbp)
            num = negative ? -x : x;
   44f40:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
   44f44:	74 09                	je     44f4f <printer_vprintf+0x439>
   44f46:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   44f4a:	48 f7 d8             	neg    %rax
   44f4d:	eb 04                	jmp    44f53 <printer_vprintf+0x43d>
   44f4f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   44f53:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
   44f57:	8b 45 a4             	mov    -0x5c(%rbp),%eax
   44f5a:	83 c8 60             	or     $0x60,%eax
   44f5d:	09 45 ec             	or     %eax,-0x14(%rbp)
            break;
   44f60:	e9 cf 02 00 00       	jmp    45234 <printer_vprintf+0x71e>
        }
        case 'u':
        format_unsigned:
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   44f65:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   44f69:	74 5d                	je     44fc8 <printer_vprintf+0x4b2>
   44f6b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44f72:	8b 00                	mov    (%rax),%eax
   44f74:	83 f8 2f             	cmp    $0x2f,%eax
   44f77:	77 30                	ja     44fa9 <printer_vprintf+0x493>
   44f79:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44f80:	48 8b 50 10          	mov    0x10(%rax),%rdx
   44f84:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44f8b:	8b 00                	mov    (%rax),%eax
   44f8d:	89 c0                	mov    %eax,%eax
   44f8f:	48 01 d0             	add    %rdx,%rax
   44f92:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44f99:	8b 12                	mov    (%rdx),%edx
   44f9b:	8d 4a 08             	lea    0x8(%rdx),%ecx
   44f9e:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44fa5:	89 0a                	mov    %ecx,(%rdx)
   44fa7:	eb 1a                	jmp    44fc3 <printer_vprintf+0x4ad>
   44fa9:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44fb0:	48 8b 40 08          	mov    0x8(%rax),%rax
   44fb4:	48 8d 48 08          	lea    0x8(%rax),%rcx
   44fb8:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44fbf:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44fc3:	48 8b 00             	mov    (%rax),%rax
   44fc6:	eb 5c                	jmp    45024 <printer_vprintf+0x50e>
   44fc8:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44fcf:	8b 00                	mov    (%rax),%eax
   44fd1:	83 f8 2f             	cmp    $0x2f,%eax
   44fd4:	77 30                	ja     45006 <printer_vprintf+0x4f0>
   44fd6:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44fdd:	48 8b 50 10          	mov    0x10(%rax),%rdx
   44fe1:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44fe8:	8b 00                	mov    (%rax),%eax
   44fea:	89 c0                	mov    %eax,%eax
   44fec:	48 01 d0             	add    %rdx,%rax
   44fef:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44ff6:	8b 12                	mov    (%rdx),%edx
   44ff8:	8d 4a 08             	lea    0x8(%rdx),%ecx
   44ffb:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   45002:	89 0a                	mov    %ecx,(%rdx)
   45004:	eb 1a                	jmp    45020 <printer_vprintf+0x50a>
   45006:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4500d:	48 8b 40 08          	mov    0x8(%rax),%rax
   45011:	48 8d 48 08          	lea    0x8(%rax),%rcx
   45015:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4501c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   45020:	8b 00                	mov    (%rax),%eax
   45022:	89 c0                	mov    %eax,%eax
   45024:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            flags |= FLAG_NUMERIC;
   45028:	83 4d ec 20          	orl    $0x20,-0x14(%rbp)
            break;
   4502c:	e9 03 02 00 00       	jmp    45234 <printer_vprintf+0x71e>
        case 'x':
            base = -16;
   45031:	c7 45 e0 f0 ff ff ff 	movl   $0xfffffff0,-0x20(%rbp)
            goto format_unsigned;
   45038:	e9 28 ff ff ff       	jmp    44f65 <printer_vprintf+0x44f>
        case 'X':
            base = 16;
   4503d:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%rbp)
            goto format_unsigned;
   45044:	e9 1c ff ff ff       	jmp    44f65 <printer_vprintf+0x44f>
        case 'p':
            num = (uintptr_t) va_arg(val, void*);
   45049:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   45050:	8b 00                	mov    (%rax),%eax
   45052:	83 f8 2f             	cmp    $0x2f,%eax
   45055:	77 30                	ja     45087 <printer_vprintf+0x571>
   45057:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4505e:	48 8b 50 10          	mov    0x10(%rax),%rdx
   45062:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   45069:	8b 00                	mov    (%rax),%eax
   4506b:	89 c0                	mov    %eax,%eax
   4506d:	48 01 d0             	add    %rdx,%rax
   45070:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   45077:	8b 12                	mov    (%rdx),%edx
   45079:	8d 4a 08             	lea    0x8(%rdx),%ecx
   4507c:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   45083:	89 0a                	mov    %ecx,(%rdx)
   45085:	eb 1a                	jmp    450a1 <printer_vprintf+0x58b>
   45087:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4508e:	48 8b 40 08          	mov    0x8(%rax),%rax
   45092:	48 8d 48 08          	lea    0x8(%rax),%rcx
   45096:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4509d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   450a1:	48 8b 00             	mov    (%rax),%rax
   450a4:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            base = -16;
   450a8:	c7 45 e0 f0 ff ff ff 	movl   $0xfffffff0,-0x20(%rbp)
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
   450af:	81 4d ec 21 01 00 00 	orl    $0x121,-0x14(%rbp)
            break;
   450b6:	e9 79 01 00 00       	jmp    45234 <printer_vprintf+0x71e>
        case 's':
            data = va_arg(val, char*);
   450bb:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   450c2:	8b 00                	mov    (%rax),%eax
   450c4:	83 f8 2f             	cmp    $0x2f,%eax
   450c7:	77 30                	ja     450f9 <printer_vprintf+0x5e3>
   450c9:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   450d0:	48 8b 50 10          	mov    0x10(%rax),%rdx
   450d4:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   450db:	8b 00                	mov    (%rax),%eax
   450dd:	89 c0                	mov    %eax,%eax
   450df:	48 01 d0             	add    %rdx,%rax
   450e2:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   450e9:	8b 12                	mov    (%rdx),%edx
   450eb:	8d 4a 08             	lea    0x8(%rdx),%ecx
   450ee:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   450f5:	89 0a                	mov    %ecx,(%rdx)
   450f7:	eb 1a                	jmp    45113 <printer_vprintf+0x5fd>
   450f9:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   45100:	48 8b 40 08          	mov    0x8(%rax),%rax
   45104:	48 8d 48 08          	lea    0x8(%rax),%rcx
   45108:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4510f:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   45113:	48 8b 00             	mov    (%rax),%rax
   45116:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            break;
   4511a:	e9 15 01 00 00       	jmp    45234 <printer_vprintf+0x71e>
        case 'C':
            color = va_arg(val, int);
   4511f:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   45126:	8b 00                	mov    (%rax),%eax
   45128:	83 f8 2f             	cmp    $0x2f,%eax
   4512b:	77 30                	ja     4515d <printer_vprintf+0x647>
   4512d:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   45134:	48 8b 50 10          	mov    0x10(%rax),%rdx
   45138:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   4513f:	8b 00                	mov    (%rax),%eax
   45141:	89 c0                	mov    %eax,%eax
   45143:	48 01 d0             	add    %rdx,%rax
   45146:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   4514d:	8b 12                	mov    (%rdx),%edx
   4514f:	8d 4a 08             	lea    0x8(%rdx),%ecx
   45152:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   45159:	89 0a                	mov    %ecx,(%rdx)
   4515b:	eb 1a                	jmp    45177 <printer_vprintf+0x661>
   4515d:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   45164:	48 8b 40 08          	mov    0x8(%rax),%rax
   45168:	48 8d 48 08          	lea    0x8(%rax),%rcx
   4516c:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   45173:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   45177:	8b 00                	mov    (%rax),%eax
   45179:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
            goto done;
   4517f:	e9 77 03 00 00       	jmp    454fb <printer_vprintf+0x9e5>
        case 'c':
            data = numbuf;
   45184:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
   45188:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            numbuf[0] = va_arg(val, int);
   4518c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   45193:	8b 00                	mov    (%rax),%eax
   45195:	83 f8 2f             	cmp    $0x2f,%eax
   45198:	77 30                	ja     451ca <printer_vprintf+0x6b4>
   4519a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   451a1:	48 8b 50 10          	mov    0x10(%rax),%rdx
   451a5:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   451ac:	8b 00                	mov    (%rax),%eax
   451ae:	89 c0                	mov    %eax,%eax
   451b0:	48 01 d0             	add    %rdx,%rax
   451b3:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   451ba:	8b 12                	mov    (%rdx),%edx
   451bc:	8d 4a 08             	lea    0x8(%rdx),%ecx
   451bf:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   451c6:	89 0a                	mov    %ecx,(%rdx)
   451c8:	eb 1a                	jmp    451e4 <printer_vprintf+0x6ce>
   451ca:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   451d1:	48 8b 40 08          	mov    0x8(%rax),%rax
   451d5:	48 8d 48 08          	lea    0x8(%rax),%rcx
   451d9:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   451e0:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   451e4:	8b 00                	mov    (%rax),%eax
   451e6:	88 45 8c             	mov    %al,-0x74(%rbp)
            numbuf[1] = '\0';
   451e9:	c6 45 8d 00          	movb   $0x0,-0x73(%rbp)
            break;
   451ed:	eb 45                	jmp    45234 <printer_vprintf+0x71e>
        default:
            data = numbuf;
   451ef:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
   451f3:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            numbuf[0] = (*format ? *format : '%');
   451f7:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   451fe:	0f b6 00             	movzbl (%rax),%eax
   45201:	84 c0                	test   %al,%al
   45203:	74 0c                	je     45211 <printer_vprintf+0x6fb>
   45205:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   4520c:	0f b6 00             	movzbl (%rax),%eax
   4520f:	eb 05                	jmp    45216 <printer_vprintf+0x700>
   45211:	b8 25 00 00 00       	mov    $0x25,%eax
   45216:	88 45 8c             	mov    %al,-0x74(%rbp)
            numbuf[1] = '\0';
   45219:	c6 45 8d 00          	movb   $0x0,-0x73(%rbp)
            if (!*format) {
   4521d:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   45224:	0f b6 00             	movzbl (%rax),%eax
   45227:	84 c0                	test   %al,%al
   45229:	75 08                	jne    45233 <printer_vprintf+0x71d>
                format--;
   4522b:	48 83 ad 68 ff ff ff 	subq   $0x1,-0x98(%rbp)
   45232:	01 
            }
            break;
   45233:	90                   	nop
        }

        if (flags & FLAG_NUMERIC) {
   45234:	8b 45 ec             	mov    -0x14(%rbp),%eax
   45237:	83 e0 20             	and    $0x20,%eax
   4523a:	85 c0                	test   %eax,%eax
   4523c:	74 1e                	je     4525c <printer_vprintf+0x746>
            data = fill_numbuf(numbuf + NUMBUFSIZ, num, base);
   4523e:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
   45242:	48 83 c0 18          	add    $0x18,%rax
   45246:	8b 55 e0             	mov    -0x20(%rbp),%edx
   45249:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
   4524d:	48 89 ce             	mov    %rcx,%rsi
   45250:	48 89 c7             	mov    %rax,%rdi
   45253:	e8 32 f8 ff ff       	call   44a8a <fill_numbuf>
   45258:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
        }

        const char* prefix = "";
   4525c:	48 8d 05 b3 10 00 00 	lea    0x10b3(%rip),%rax        # 46316 <flag_chars+0x6>
   45263:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
   45267:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4526a:	83 e0 20             	and    $0x20,%eax
   4526d:	85 c0                	test   %eax,%eax
   4526f:	74 51                	je     452c2 <printer_vprintf+0x7ac>
   45271:	8b 45 ec             	mov    -0x14(%rbp),%eax
   45274:	83 e0 40             	and    $0x40,%eax
   45277:	85 c0                	test   %eax,%eax
   45279:	74 47                	je     452c2 <printer_vprintf+0x7ac>
            if (flags & FLAG_NEGATIVE) {
   4527b:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4527e:	25 80 00 00 00       	and    $0x80,%eax
   45283:	85 c0                	test   %eax,%eax
   45285:	74 0d                	je     45294 <printer_vprintf+0x77e>
                prefix = "-";
   45287:	48 8d 05 89 10 00 00 	lea    0x1089(%rip),%rax        # 46317 <flag_chars+0x7>
   4528e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
   45292:	eb 7d                	jmp    45311 <printer_vprintf+0x7fb>
            } else if (flags & FLAG_PLUSPOSITIVE) {
   45294:	8b 45 ec             	mov    -0x14(%rbp),%eax
   45297:	83 e0 10             	and    $0x10,%eax
   4529a:	85 c0                	test   %eax,%eax
   4529c:	74 0d                	je     452ab <printer_vprintf+0x795>
                prefix = "+";
   4529e:	48 8d 05 74 10 00 00 	lea    0x1074(%rip),%rax        # 46319 <flag_chars+0x9>
   452a5:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
   452a9:	eb 66                	jmp    45311 <printer_vprintf+0x7fb>
            } else if (flags & FLAG_SPACEPOSITIVE) {
   452ab:	8b 45 ec             	mov    -0x14(%rbp),%eax
   452ae:	83 e0 08             	and    $0x8,%eax
   452b1:	85 c0                	test   %eax,%eax
   452b3:	74 5c                	je     45311 <printer_vprintf+0x7fb>
                prefix = " ";
   452b5:	48 8d 05 5f 10 00 00 	lea    0x105f(%rip),%rax        # 4631b <flag_chars+0xb>
   452bc:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
   452c0:	eb 4f                	jmp    45311 <printer_vprintf+0x7fb>
            }
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   452c2:	8b 45 ec             	mov    -0x14(%rbp),%eax
   452c5:	83 e0 20             	and    $0x20,%eax
   452c8:	85 c0                	test   %eax,%eax
   452ca:	74 46                	je     45312 <printer_vprintf+0x7fc>
   452cc:	8b 45 ec             	mov    -0x14(%rbp),%eax
   452cf:	83 e0 01             	and    $0x1,%eax
   452d2:	85 c0                	test   %eax,%eax
   452d4:	74 3c                	je     45312 <printer_vprintf+0x7fc>
                   && (base == 16 || base == -16)
   452d6:	83 7d e0 10          	cmpl   $0x10,-0x20(%rbp)
   452da:	74 06                	je     452e2 <printer_vprintf+0x7cc>
   452dc:	83 7d e0 f0          	cmpl   $0xfffffff0,-0x20(%rbp)
   452e0:	75 30                	jne    45312 <printer_vprintf+0x7fc>
                   && (num || (flags & FLAG_ALT2))) {
   452e2:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   452e7:	75 0c                	jne    452f5 <printer_vprintf+0x7df>
   452e9:	8b 45 ec             	mov    -0x14(%rbp),%eax
   452ec:	25 00 01 00 00       	and    $0x100,%eax
   452f1:	85 c0                	test   %eax,%eax
   452f3:	74 1d                	je     45312 <printer_vprintf+0x7fc>
            prefix = (base == -16 ? "0x" : "0X");
   452f5:	83 7d e0 f0          	cmpl   $0xfffffff0,-0x20(%rbp)
   452f9:	75 09                	jne    45304 <printer_vprintf+0x7ee>
   452fb:	48 8d 05 1b 10 00 00 	lea    0x101b(%rip),%rax        # 4631d <flag_chars+0xd>
   45302:	eb 07                	jmp    4530b <printer_vprintf+0x7f5>
   45304:	48 8d 05 15 10 00 00 	lea    0x1015(%rip),%rax        # 46320 <flag_chars+0x10>
   4530b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   4530f:	eb 01                	jmp    45312 <printer_vprintf+0x7fc>
            if (flags & FLAG_NEGATIVE) {
   45311:	90                   	nop
        }

        int len;
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
   45312:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
   45316:	78 24                	js     4533c <printer_vprintf+0x826>
   45318:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4531b:	83 e0 20             	and    $0x20,%eax
   4531e:	85 c0                	test   %eax,%eax
   45320:	75 1a                	jne    4533c <printer_vprintf+0x826>
            len = strnlen(data, precision);
   45322:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   45325:	48 63 d0             	movslq %eax,%rdx
   45328:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4532c:	48 89 d6             	mov    %rdx,%rsi
   4532f:	48 89 c7             	mov    %rax,%rdi
   45332:	e8 91 f5 ff ff       	call   448c8 <strnlen>
   45337:	89 45 bc             	mov    %eax,-0x44(%rbp)
   4533a:	eb 0f                	jmp    4534b <printer_vprintf+0x835>
        } else {
            len = strlen(data);
   4533c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   45340:	48 89 c7             	mov    %rax,%rdi
   45343:	e8 4b f5 ff ff       	call   44893 <strlen>
   45348:	89 45 bc             	mov    %eax,-0x44(%rbp)
        }
        int zeros;
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
   4534b:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4534e:	83 e0 20             	and    $0x20,%eax
   45351:	85 c0                	test   %eax,%eax
   45353:	74 20                	je     45375 <printer_vprintf+0x85f>
   45355:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
   45359:	78 1a                	js     45375 <printer_vprintf+0x85f>
            zeros = precision > len ? precision - len : 0;
   4535b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   4535e:	3b 45 bc             	cmp    -0x44(%rbp),%eax
   45361:	7e 08                	jle    4536b <printer_vprintf+0x855>
   45363:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   45366:	2b 45 bc             	sub    -0x44(%rbp),%eax
   45369:	eb 05                	jmp    45370 <printer_vprintf+0x85a>
   4536b:	b8 00 00 00 00       	mov    $0x0,%eax
   45370:	89 45 b8             	mov    %eax,-0x48(%rbp)
   45373:	eb 5c                	jmp    453d1 <printer_vprintf+0x8bb>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
   45375:	8b 45 ec             	mov    -0x14(%rbp),%eax
   45378:	83 e0 20             	and    $0x20,%eax
   4537b:	85 c0                	test   %eax,%eax
   4537d:	74 4b                	je     453ca <printer_vprintf+0x8b4>
   4537f:	8b 45 ec             	mov    -0x14(%rbp),%eax
   45382:	83 e0 02             	and    $0x2,%eax
   45385:	85 c0                	test   %eax,%eax
   45387:	74 41                	je     453ca <printer_vprintf+0x8b4>
                   && !(flags & FLAG_LEFTJUSTIFY)
   45389:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4538c:	83 e0 04             	and    $0x4,%eax
   4538f:	85 c0                	test   %eax,%eax
   45391:	75 37                	jne    453ca <printer_vprintf+0x8b4>
                   && len + (int) strlen(prefix) < width) {
   45393:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   45397:	48 89 c7             	mov    %rax,%rdi
   4539a:	e8 f4 f4 ff ff       	call   44893 <strlen>
   4539f:	89 c2                	mov    %eax,%edx
   453a1:	8b 45 bc             	mov    -0x44(%rbp),%eax
   453a4:	01 d0                	add    %edx,%eax
   453a6:	39 45 e8             	cmp    %eax,-0x18(%rbp)
   453a9:	7e 1f                	jle    453ca <printer_vprintf+0x8b4>
            zeros = width - len - strlen(prefix);
   453ab:	8b 45 e8             	mov    -0x18(%rbp),%eax
   453ae:	2b 45 bc             	sub    -0x44(%rbp),%eax
   453b1:	89 c3                	mov    %eax,%ebx
   453b3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   453b7:	48 89 c7             	mov    %rax,%rdi
   453ba:	e8 d4 f4 ff ff       	call   44893 <strlen>
   453bf:	89 c2                	mov    %eax,%edx
   453c1:	89 d8                	mov    %ebx,%eax
   453c3:	29 d0                	sub    %edx,%eax
   453c5:	89 45 b8             	mov    %eax,-0x48(%rbp)
   453c8:	eb 07                	jmp    453d1 <printer_vprintf+0x8bb>
        } else {
            zeros = 0;
   453ca:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%rbp)
        }
        width -= len + zeros + strlen(prefix);
   453d1:	8b 55 bc             	mov    -0x44(%rbp),%edx
   453d4:	8b 45 b8             	mov    -0x48(%rbp),%eax
   453d7:	01 d0                	add    %edx,%eax
   453d9:	48 63 d8             	movslq %eax,%rbx
   453dc:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   453e0:	48 89 c7             	mov    %rax,%rdi
   453e3:	e8 ab f4 ff ff       	call   44893 <strlen>
   453e8:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
   453ec:	8b 45 e8             	mov    -0x18(%rbp),%eax
   453ef:	29 d0                	sub    %edx,%eax
   453f1:	89 45 e8             	mov    %eax,-0x18(%rbp)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   453f4:	eb 25                	jmp    4541b <printer_vprintf+0x905>
            p->putc(p, ' ', color);
   453f6:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   453fd:	48 8b 08             	mov    (%rax),%rcx
   45400:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   45406:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   4540d:	be 20 00 00 00       	mov    $0x20,%esi
   45412:	48 89 c7             	mov    %rax,%rdi
   45415:	ff d1                	call   *%rcx
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   45417:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
   4541b:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4541e:	83 e0 04             	and    $0x4,%eax
   45421:	85 c0                	test   %eax,%eax
   45423:	75 36                	jne    4545b <printer_vprintf+0x945>
   45425:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
   45429:	7f cb                	jg     453f6 <printer_vprintf+0x8e0>
        }
        for (; *prefix; ++prefix) {
   4542b:	eb 2e                	jmp    4545b <printer_vprintf+0x945>
            p->putc(p, *prefix, color);
   4542d:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   45434:	4c 8b 00             	mov    (%rax),%r8
   45437:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4543b:	0f b6 00             	movzbl (%rax),%eax
   4543e:	0f b6 c8             	movzbl %al,%ecx
   45441:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   45447:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   4544e:	89 ce                	mov    %ecx,%esi
   45450:	48 89 c7             	mov    %rax,%rdi
   45453:	41 ff d0             	call   *%r8
        for (; *prefix; ++prefix) {
   45456:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
   4545b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4545f:	0f b6 00             	movzbl (%rax),%eax
   45462:	84 c0                	test   %al,%al
   45464:	75 c7                	jne    4542d <printer_vprintf+0x917>
        }
        for (; zeros > 0; --zeros) {
   45466:	eb 25                	jmp    4548d <printer_vprintf+0x977>
            p->putc(p, '0', color);
   45468:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   4546f:	48 8b 08             	mov    (%rax),%rcx
   45472:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   45478:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   4547f:	be 30 00 00 00       	mov    $0x30,%esi
   45484:	48 89 c7             	mov    %rax,%rdi
   45487:	ff d1                	call   *%rcx
        for (; zeros > 0; --zeros) {
   45489:	83 6d b8 01          	subl   $0x1,-0x48(%rbp)
   4548d:	83 7d b8 00          	cmpl   $0x0,-0x48(%rbp)
   45491:	7f d5                	jg     45468 <printer_vprintf+0x952>
        }
        for (; len > 0; ++data, --len) {
   45493:	eb 32                	jmp    454c7 <printer_vprintf+0x9b1>
            p->putc(p, *data, color);
   45495:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   4549c:	4c 8b 00             	mov    (%rax),%r8
   4549f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   454a3:	0f b6 00             	movzbl (%rax),%eax
   454a6:	0f b6 c8             	movzbl %al,%ecx
   454a9:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   454af:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   454b6:	89 ce                	mov    %ecx,%esi
   454b8:	48 89 c7             	mov    %rax,%rdi
   454bb:	41 ff d0             	call   *%r8
        for (; len > 0; ++data, --len) {
   454be:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
   454c3:	83 6d bc 01          	subl   $0x1,-0x44(%rbp)
   454c7:	83 7d bc 00          	cmpl   $0x0,-0x44(%rbp)
   454cb:	7f c8                	jg     45495 <printer_vprintf+0x97f>
        }
        for (; width > 0; --width) {
   454cd:	eb 25                	jmp    454f4 <printer_vprintf+0x9de>
            p->putc(p, ' ', color);
   454cf:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   454d6:	48 8b 08             	mov    (%rax),%rcx
   454d9:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   454df:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   454e6:	be 20 00 00 00       	mov    $0x20,%esi
   454eb:	48 89 c7             	mov    %rax,%rdi
   454ee:	ff d1                	call   *%rcx
        for (; width > 0; --width) {
   454f0:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
   454f4:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
   454f8:	7f d5                	jg     454cf <printer_vprintf+0x9b9>
        }
    done: ;
   454fa:	90                   	nop
    for (; *format; ++format) {
   454fb:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   45502:	01 
   45503:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   4550a:	0f b6 00             	movzbl (%rax),%eax
   4550d:	84 c0                	test   %al,%al
   4550f:	0f 85 31 f6 ff ff    	jne    44b46 <printer_vprintf+0x30>
    }
}
   45515:	90                   	nop
   45516:	90                   	nop
   45517:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   4551b:	c9                   	leave  
   4551c:	c3                   	ret    

000000000004551d <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
   4551d:	f3 0f 1e fa          	endbr64 
   45521:	55                   	push   %rbp
   45522:	48 89 e5             	mov    %rsp,%rbp
   45525:	48 83 ec 20          	sub    $0x20,%rsp
   45529:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4552d:	89 f0                	mov    %esi,%eax
   4552f:	89 55 e0             	mov    %edx,-0x20(%rbp)
   45532:	88 45 e4             	mov    %al,-0x1c(%rbp)
    console_printer* cp = (console_printer*) p;
   45535:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   45539:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   4553d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   45541:	48 8b 40 08          	mov    0x8(%rax),%rax
   45545:	48 8d 15 54 3a 07 00 	lea    0x73a54(%rip),%rdx        # b8fa0 <console+0xfa0>
   4554c:	48 39 d0             	cmp    %rdx,%rax
   4554f:	72 0f                	jb     45560 <console_putc+0x43>
        cp->cursor = console;
   45551:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   45555:	48 8d 15 a4 2a 07 00 	lea    0x72aa4(%rip),%rdx        # b8000 <console>
   4555c:	48 89 50 08          	mov    %rdx,0x8(%rax)
    }
    if (c == '\n') {
   45560:	80 7d e4 0a          	cmpb   $0xa,-0x1c(%rbp)
   45564:	0f 85 82 00 00 00    	jne    455ec <console_putc+0xcf>
        int pos = (cp->cursor - console) % 80;
   4556a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4556e:	48 8b 40 08          	mov    0x8(%rax),%rax
   45572:	48 8d 15 87 2a 07 00 	lea    0x72a87(%rip),%rdx        # b8000 <console>
   45579:	48 29 d0             	sub    %rdx,%rax
   4557c:	48 d1 f8             	sar    %rax
   4557f:	48 89 c1             	mov    %rax,%rcx
   45582:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   45589:	66 66 66 
   4558c:	48 89 c8             	mov    %rcx,%rax
   4558f:	48 f7 ea             	imul   %rdx
   45592:	48 89 d0             	mov    %rdx,%rax
   45595:	48 c1 f8 05          	sar    $0x5,%rax
   45599:	48 89 ce             	mov    %rcx,%rsi
   4559c:	48 c1 fe 3f          	sar    $0x3f,%rsi
   455a0:	48 29 f0             	sub    %rsi,%rax
   455a3:	48 89 c2             	mov    %rax,%rdx
   455a6:	48 89 d0             	mov    %rdx,%rax
   455a9:	48 c1 e0 02          	shl    $0x2,%rax
   455ad:	48 01 d0             	add    %rdx,%rax
   455b0:	48 c1 e0 04          	shl    $0x4,%rax
   455b4:	48 29 c1             	sub    %rax,%rcx
   455b7:	48 89 ca             	mov    %rcx,%rdx
   455ba:	89 55 fc             	mov    %edx,-0x4(%rbp)
        for (; pos != 80; pos++) {
   455bd:	eb 25                	jmp    455e4 <console_putc+0xc7>
            *cp->cursor++ = ' ' | color;
   455bf:	8b 45 e0             	mov    -0x20(%rbp),%eax
   455c2:	83 c8 20             	or     $0x20,%eax
   455c5:	89 c6                	mov    %eax,%esi
   455c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   455cb:	48 8b 40 08          	mov    0x8(%rax),%rax
   455cf:	48 8d 48 02          	lea    0x2(%rax),%rcx
   455d3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   455d7:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   455db:	89 f2                	mov    %esi,%edx
   455dd:	66 89 10             	mov    %dx,(%rax)
        for (; pos != 80; pos++) {
   455e0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   455e4:	83 7d fc 50          	cmpl   $0x50,-0x4(%rbp)
   455e8:	75 d5                	jne    455bf <console_putc+0xa2>
        }
    } else {
        *cp->cursor++ = c | color;
    }
}
   455ea:	eb 24                	jmp    45610 <console_putc+0xf3>
        *cp->cursor++ = c | color;
   455ec:	0f b6 55 e4          	movzbl -0x1c(%rbp),%edx
   455f0:	8b 45 e0             	mov    -0x20(%rbp),%eax
   455f3:	89 d6                	mov    %edx,%esi
   455f5:	09 c6                	or     %eax,%esi
   455f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   455fb:	48 8b 40 08          	mov    0x8(%rax),%rax
   455ff:	48 8d 48 02          	lea    0x2(%rax),%rcx
   45603:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   45607:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   4560b:	89 f2                	mov    %esi,%edx
   4560d:	66 89 10             	mov    %dx,(%rax)
}
   45610:	90                   	nop
   45611:	c9                   	leave  
   45612:	c3                   	ret    

0000000000045613 <console_vprintf>:

int console_vprintf(int cpos, int color, const char* format, va_list val) {
   45613:	f3 0f 1e fa          	endbr64 
   45617:	55                   	push   %rbp
   45618:	48 89 e5             	mov    %rsp,%rbp
   4561b:	48 83 ec 30          	sub    $0x30,%rsp
   4561f:	89 7d ec             	mov    %edi,-0x14(%rbp)
   45622:	89 75 e8             	mov    %esi,-0x18(%rbp)
   45625:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   45629:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    struct console_printer cp;
    cp.p.putc = console_putc;
   4562d:	48 8d 05 e9 fe ff ff 	lea    -0x117(%rip),%rax        # 4551d <console_putc>
   45634:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (cpos < 0 || cpos >= CONSOLE_ROWS * CONSOLE_COLUMNS) {
   45638:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
   4563c:	78 09                	js     45647 <console_vprintf+0x34>
   4563e:	81 7d ec cf 07 00 00 	cmpl   $0x7cf,-0x14(%rbp)
   45645:	7e 07                	jle    4564e <console_vprintf+0x3b>
        cpos = 0;
   45647:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    }
    cp.cursor = console + cpos;
   4564e:	8b 45 ec             	mov    -0x14(%rbp),%eax
   45651:	48 98                	cltq   
   45653:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   45657:	48 8d 05 a2 29 07 00 	lea    0x729a2(%rip),%rax        # b8000 <console>
   4565e:	48 01 d0             	add    %rdx,%rax
   45661:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&cp.p, color, format, val);
   45665:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
   45669:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   4566d:	8b 75 e8             	mov    -0x18(%rbp),%esi
   45670:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
   45674:	48 89 c7             	mov    %rax,%rdi
   45677:	e8 9a f4 ff ff       	call   44b16 <printer_vprintf>
    return cp.cursor - console;
   4567c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   45680:	48 8d 15 79 29 07 00 	lea    0x72979(%rip),%rdx        # b8000 <console>
   45687:	48 29 d0             	sub    %rdx,%rax
   4568a:	48 d1 f8             	sar    %rax
}
   4568d:	c9                   	leave  
   4568e:	c3                   	ret    

000000000004568f <console_printf>:

int console_printf(int cpos, int color, const char* format, ...) {
   4568f:	f3 0f 1e fa          	endbr64 
   45693:	55                   	push   %rbp
   45694:	48 89 e5             	mov    %rsp,%rbp
   45697:	48 83 ec 60          	sub    $0x60,%rsp
   4569b:	89 7d ac             	mov    %edi,-0x54(%rbp)
   4569e:	89 75 a8             	mov    %esi,-0x58(%rbp)
   456a1:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   456a5:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   456a9:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   456ad:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   456b1:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   456b8:	48 8d 45 10          	lea    0x10(%rbp),%rax
   456bc:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   456c0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   456c4:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
   456c8:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   456cc:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   456d0:	8b 75 a8             	mov    -0x58(%rbp),%esi
   456d3:	8b 45 ac             	mov    -0x54(%rbp),%eax
   456d6:	89 c7                	mov    %eax,%edi
   456d8:	e8 36 ff ff ff       	call   45613 <console_vprintf>
   456dd:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   456e0:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   456e3:	c9                   	leave  
   456e4:	c3                   	ret    

00000000000456e5 <string_putc>:
    printer p;
    char* s;
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
   456e5:	f3 0f 1e fa          	endbr64 
   456e9:	55                   	push   %rbp
   456ea:	48 89 e5             	mov    %rsp,%rbp
   456ed:	48 83 ec 20          	sub    $0x20,%rsp
   456f1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   456f5:	89 f0                	mov    %esi,%eax
   456f7:	89 55 e0             	mov    %edx,-0x20(%rbp)
   456fa:	88 45 e4             	mov    %al,-0x1c(%rbp)
    string_printer* sp = (string_printer*) p;
   456fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   45701:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (sp->s < sp->end) {
   45705:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   45709:	48 8b 50 08          	mov    0x8(%rax),%rdx
   4570d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   45711:	48 8b 40 10          	mov    0x10(%rax),%rax
   45715:	48 39 c2             	cmp    %rax,%rdx
   45718:	73 1a                	jae    45734 <string_putc+0x4f>
        *sp->s++ = c;
   4571a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4571e:	48 8b 40 08          	mov    0x8(%rax),%rax
   45722:	48 8d 48 01          	lea    0x1(%rax),%rcx
   45726:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4572a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   4572e:	0f b6 55 e4          	movzbl -0x1c(%rbp),%edx
   45732:	88 10                	mov    %dl,(%rax)
    }
    (void) color;
}
   45734:	90                   	nop
   45735:	c9                   	leave  
   45736:	c3                   	ret    

0000000000045737 <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
   45737:	f3 0f 1e fa          	endbr64 
   4573b:	55                   	push   %rbp
   4573c:	48 89 e5             	mov    %rsp,%rbp
   4573f:	48 83 ec 40          	sub    $0x40,%rsp
   45743:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   45747:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   4574b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   4574f:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    string_printer sp;
    sp.p.putc = string_putc;
   45753:	48 8d 05 8b ff ff ff 	lea    -0x75(%rip),%rax        # 456e5 <string_putc>
   4575a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    sp.s = s;
   4575e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   45762:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (size) {
   45766:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
   4576b:	74 33                	je     457a0 <vsnprintf+0x69>
        sp.end = s + size - 1;
   4576d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   45771:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
   45775:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   45779:	48 01 d0             	add    %rdx,%rax
   4577c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
   45780:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   45784:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   45788:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   4578c:	be 00 00 00 00       	mov    $0x0,%esi
   45791:	48 89 c7             	mov    %rax,%rdi
   45794:	e8 7d f3 ff ff       	call   44b16 <printer_vprintf>
        *sp.s = 0;
   45799:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4579d:	c6 00 00             	movb   $0x0,(%rax)
    }
    return sp.s - s;
   457a0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   457a4:	48 2b 45 d8          	sub    -0x28(%rbp),%rax
}
   457a8:	c9                   	leave  
   457a9:	c3                   	ret    

00000000000457aa <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
   457aa:	f3 0f 1e fa          	endbr64 
   457ae:	55                   	push   %rbp
   457af:	48 89 e5             	mov    %rsp,%rbp
   457b2:	48 83 ec 70          	sub    $0x70,%rsp
   457b6:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   457ba:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
   457be:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
   457c2:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   457c6:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   457ca:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   457ce:	c7 45 b0 18 00 00 00 	movl   $0x18,-0x50(%rbp)
   457d5:	48 8d 45 10          	lea    0x10(%rbp),%rax
   457d9:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   457dd:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   457e1:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    int n = vsnprintf(s, size, format, val);
   457e5:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   457e9:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
   457ed:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
   457f1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   457f5:	48 89 c7             	mov    %rax,%rdi
   457f8:	e8 3a ff ff ff       	call   45737 <vsnprintf>
   457fd:	89 45 cc             	mov    %eax,-0x34(%rbp)
    va_end(val);
    return n;
   45800:	8b 45 cc             	mov    -0x34(%rbp),%eax
}
   45803:	c9                   	leave  
   45804:	c3                   	ret    

0000000000045805 <console_clear>:


// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
   45805:	f3 0f 1e fa          	endbr64 
   45809:	55                   	push   %rbp
   4580a:	48 89 e5             	mov    %rsp,%rbp
   4580d:	48 83 ec 10          	sub    $0x10,%rsp
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   45811:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   45818:	eb 1a                	jmp    45834 <console_clear+0x2f>
        console[i] = ' ' | 0x0700;
   4581a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4581d:	48 98                	cltq   
   4581f:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   45823:	48 8d 05 d6 27 07 00 	lea    0x727d6(%rip),%rax        # b8000 <console>
   4582a:	66 c7 04 02 20 07    	movw   $0x720,(%rdx,%rax,1)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   45830:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   45834:	81 7d fc cf 07 00 00 	cmpl   $0x7cf,-0x4(%rbp)
   4583b:	7e dd                	jle    4581a <console_clear+0x15>
    }
    cursorpos = 0;
   4583d:	c7 05 b5 37 07 00 00 	movl   $0x0,0x737b5(%rip)        # b8ffc <cursorpos>
   45844:	00 00 00 
}
   45847:	90                   	nop
   45848:	c9                   	leave  
   45849:	c3                   	ret    
