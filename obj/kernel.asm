
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
   400be:	e8 ab 08 00 00       	call   4096e <exception>

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
   40177:	e8 37 18 00 00       	call   419b3 <hardware_init>
    pageinfo_init();
   4017c:	e8 37 0d 00 00       	call   40eb8 <pageinfo_init>
    console_clear();
   40181:	e8 c2 44 00 00       	call   44648 <console_clear>
    timer_init(HZ);
   40186:	bf 64 00 00 00       	mov    $0x64,%edi
   4018b:	e8 8b 1d 00 00       	call   41f1b <timer_init>

    // Set up process descriptors
    memset(processes, 0, sizeof(processes));
   40190:	ba 00 0e 00 00       	mov    $0xe00,%edx
   40195:	be 00 00 00 00       	mov    $0x0,%esi
   4019a:	48 8d 05 7f 1e 01 00 	lea    0x11e7f(%rip),%rax        # 52020 <processes>
   401a1:	48 89 c7             	mov    %rax,%rdi
   401a4:	e8 ea 34 00 00       	call   43693 <memset>
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
   40224:	e8 5f 2b 00 00       	call   42d88 <virtual_memory_map>
    virtual_memory_map(kernel_pagetable, (uintptr_t)CONSOLE_ADDR, (uintptr_t)CONSOLE_ADDR, PAGESIZE, PTE_P | PTE_W | PTE_U);
   40229:	48 8d 15 d0 7d 07 00 	lea    0x77dd0(%rip),%rdx        # b8000 <console>
   40230:	48 8d 35 c9 7d 07 00 	lea    0x77dc9(%rip),%rsi        # b8000 <console>
   40237:	48 8b 05 c2 4d 01 00 	mov    0x14dc2(%rip),%rax        # 55000 <kernel_pagetable>
   4023e:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40244:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40249:	48 89 c7             	mov    %rax,%rdi
   4024c:	e8 37 2b 00 00       	call   42d88 <virtual_memory_map>
    if (command && strcmp(command, "fork") == 0)
   40251:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40256:	74 2e                	je     40286 <kernel+0x11f>
   40258:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4025c:	48 8d 15 3d 44 00 00 	lea    0x443d(%rip),%rdx        # 446a0 <console_clear+0x58>
   40263:	48 89 d6             	mov    %rdx,%rsi
   40266:	48 89 c7             	mov    %rax,%rdi
   40269:	e8 2e 35 00 00       	call   4379c <strcmp>
   4026e:	85 c0                	test   %eax,%eax
   40270:	75 14                	jne    40286 <kernel+0x11f>
    {
        process_setup(1, 4);
   40272:	be 04 00 00 00       	mov    $0x4,%esi
   40277:	bf 01 00 00 00       	mov    $0x1,%edi
   4027c:	e8 8c 01 00 00       	call   4040d <process_setup>
   40281:	e9 d1 00 00 00       	jmp    40357 <kernel+0x1f0>
    }
    else if (command && strcmp(command, "forkexit") == 0)
   40286:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   4028b:	74 2e                	je     402bb <kernel+0x154>
   4028d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40291:	48 8d 15 0d 44 00 00 	lea    0x440d(%rip),%rdx        # 446a5 <console_clear+0x5d>
   40298:	48 89 d6             	mov    %rdx,%rsi
   4029b:	48 89 c7             	mov    %rax,%rdi
   4029e:	e8 f9 34 00 00       	call   4379c <strcmp>
   402a3:	85 c0                	test   %eax,%eax
   402a5:	75 14                	jne    402bb <kernel+0x154>
    {
        process_setup(1, 5);
   402a7:	be 05 00 00 00       	mov    $0x5,%esi
   402ac:	bf 01 00 00 00       	mov    $0x1,%edi
   402b1:	e8 57 01 00 00       	call   4040d <process_setup>
   402b6:	e9 9c 00 00 00       	jmp    40357 <kernel+0x1f0>
    }
    else if (command && strcmp(command, "test") == 0)
   402bb:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402c0:	74 2b                	je     402ed <kernel+0x186>
   402c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402c6:	48 8d 15 e1 43 00 00 	lea    0x43e1(%rip),%rdx        # 446ae <console_clear+0x66>
   402cd:	48 89 d6             	mov    %rdx,%rsi
   402d0:	48 89 c7             	mov    %rax,%rdi
   402d3:	e8 c4 34 00 00       	call   4379c <strcmp>
   402d8:	85 c0                	test   %eax,%eax
   402da:	75 11                	jne    402ed <kernel+0x186>
    {
        process_setup(1, 6);
   402dc:	be 06 00 00 00       	mov    $0x6,%esi
   402e1:	bf 01 00 00 00       	mov    $0x1,%edi
   402e6:	e8 22 01 00 00       	call   4040d <process_setup>
   402eb:	eb 6a                	jmp    40357 <kernel+0x1f0>
    }
    else if (command && strcmp(command, "test2") == 0)
   402ed:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   402f2:	74 3e                	je     40332 <kernel+0x1cb>
   402f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   402f8:	48 8d 15 b4 43 00 00 	lea    0x43b4(%rip),%rdx        # 446b3 <console_clear+0x6b>
   402ff:	48 89 d6             	mov    %rdx,%rsi
   40302:	48 89 c7             	mov    %rax,%rdi
   40305:	e8 92 34 00 00       	call   4379c <strcmp>
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
   40321:	e8 e7 00 00 00       	call   4040d <process_setup>
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
   40348:	e8 c0 00 00 00       	call   4040d <process_setup>
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
   40361:	e8 e7 0a 00 00       	call   40e4d <run>

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

00000000000403ac <find_free_page_for_table>:

x86_64_pagetable *find_free_page_for_table(int8_t owner)
{
   403ac:	f3 0f 1e fa          	endbr64 
   403b0:	55                   	push   %rbp
   403b1:	48 89 e5             	mov    %rsp,%rbp
   403b4:	48 83 ec 18          	sub    $0x18,%rsp
   403b8:	89 f8                	mov    %edi,%eax
   403ba:	88 45 ec             	mov    %al,-0x14(%rbp)
    int i = find_free_page();
   403bd:	b8 00 00 00 00       	mov    $0x0,%eax
   403c2:	e8 9f ff ff ff       	call   40366 <find_free_page>
   403c7:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (i == -1)
   403ca:	83 7d fc ff          	cmpl   $0xffffffff,-0x4(%rbp)
   403ce:	75 07                	jne    403d7 <find_free_page_for_table+0x2b>
    {
        return NULL;
   403d0:	b8 00 00 00 00       	mov    $0x0,%eax
   403d5:	eb 34                	jmp    4040b <find_free_page_for_table+0x5f>
    }
    pageinfo[i].refcount = 1;
   403d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
   403da:	48 98                	cltq   
   403dc:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   403e0:	48 8d 05 5a 2a 01 00 	lea    0x12a5a(%rip),%rax        # 52e41 <pageinfo+0x1>
   403e7:	c6 04 02 01          	movb   $0x1,(%rdx,%rax,1)
    pageinfo[i].owner = owner;
   403eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
   403ee:	48 98                	cltq   
   403f0:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   403f4:	48 8d 15 45 2a 01 00 	lea    0x12a45(%rip),%rdx        # 52e40 <pageinfo>
   403fb:	0f b6 45 ec          	movzbl -0x14(%rbp),%eax
   403ff:	88 04 11             	mov    %al,(%rcx,%rdx,1)
    return (x86_64_pagetable *)PAGEADDRESS(i);
   40402:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40405:	48 98                	cltq   
   40407:	48 c1 e0 0c          	shl    $0xc,%rax
}
   4040b:	c9                   	leave  
   4040c:	c3                   	ret    

000000000004040d <process_setup>:
//    Load application program `program_number` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

void process_setup(pid_t pid, int program_number)
{
   4040d:	f3 0f 1e fa          	endbr64 
   40411:	55                   	push   %rbp
   40412:	48 89 e5             	mov    %rsp,%rbp
   40415:	48 83 ec 70          	sub    $0x70,%rsp
   40419:	89 7d 9c             	mov    %edi,-0x64(%rbp)
   4041c:	89 75 98             	mov    %esi,-0x68(%rbp)
    process_init(&processes[pid], 0);
   4041f:	8b 45 9c             	mov    -0x64(%rbp),%eax
   40422:	48 63 d0             	movslq %eax,%rdx
   40425:	48 89 d0             	mov    %rdx,%rax
   40428:	48 c1 e0 03          	shl    $0x3,%rax
   4042c:	48 29 d0             	sub    %rdx,%rax
   4042f:	48 c1 e0 05          	shl    $0x5,%rax
   40433:	48 8d 15 e6 1b 01 00 	lea    0x11be6(%rip),%rdx        # 52020 <processes>
   4043a:	48 01 d0             	add    %rdx,%rax
   4043d:	be 00 00 00 00       	mov    $0x0,%esi
   40442:	48 89 c7             	mov    %rax,%rdi
   40445:	e8 84 1d 00 00       	call   421ce <process_init>

    x86_64_pagetable *pt_L4 = find_free_page_for_table(pid);
   4044a:	8b 45 9c             	mov    -0x64(%rbp),%eax
   4044d:	0f be c0             	movsbl %al,%eax
   40450:	89 c7                	mov    %eax,%edi
   40452:	e8 55 ff ff ff       	call   403ac <find_free_page_for_table>
   40457:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    if (!pt_L4)
   4045b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
   40460:	75 14                	jne    40476 <process_setup+0x69>
    {
        panic("No more physical pages\n");
   40462:	48 8d 05 50 42 00 00 	lea    0x4250(%rip),%rax        # 446b9 <console_clear+0x71>
   40469:	48 89 c7             	mov    %rax,%rdi
   4046c:	b8 00 00 00 00       	mov    $0x0,%eax
   40471:	e8 9e 24 00 00       	call   42914 <panic>
    }
    x86_64_pagetable *pt_L3 = find_free_page_for_table(pid);
   40476:	8b 45 9c             	mov    -0x64(%rbp),%eax
   40479:	0f be c0             	movsbl %al,%eax
   4047c:	89 c7                	mov    %eax,%edi
   4047e:	e8 29 ff ff ff       	call   403ac <find_free_page_for_table>
   40483:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    if (!pt_L3)
   40487:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   4048c:	75 14                	jne    404a2 <process_setup+0x95>
    {
        panic("No more physical pages\n");
   4048e:	48 8d 05 24 42 00 00 	lea    0x4224(%rip),%rax        # 446b9 <console_clear+0x71>
   40495:	48 89 c7             	mov    %rax,%rdi
   40498:	b8 00 00 00 00       	mov    $0x0,%eax
   4049d:	e8 72 24 00 00       	call   42914 <panic>
    }
    x86_64_pagetable *pt_L2 = find_free_page_for_table(pid);
   404a2:	8b 45 9c             	mov    -0x64(%rbp),%eax
   404a5:	0f be c0             	movsbl %al,%eax
   404a8:	89 c7                	mov    %eax,%edi
   404aa:	e8 fd fe ff ff       	call   403ac <find_free_page_for_table>
   404af:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    if (!pt_L2)
   404b3:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   404b8:	75 14                	jne    404ce <process_setup+0xc1>
    {
        panic("No more physical pages\n");
   404ba:	48 8d 05 f8 41 00 00 	lea    0x41f8(%rip),%rax        # 446b9 <console_clear+0x71>
   404c1:	48 89 c7             	mov    %rax,%rdi
   404c4:	b8 00 00 00 00       	mov    $0x0,%eax
   404c9:	e8 46 24 00 00       	call   42914 <panic>
    }
    x86_64_pagetable *pt_L1_0 = find_free_page_for_table(pid);
   404ce:	8b 45 9c             	mov    -0x64(%rbp),%eax
   404d1:	0f be c0             	movsbl %al,%eax
   404d4:	89 c7                	mov    %eax,%edi
   404d6:	e8 d1 fe ff ff       	call   403ac <find_free_page_for_table>
   404db:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    if (!pt_L1_0)
   404df:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
   404e4:	75 14                	jne    404fa <process_setup+0xed>
    {
        panic("No more physical pages\n");
   404e6:	48 8d 05 cc 41 00 00 	lea    0x41cc(%rip),%rax        # 446b9 <console_clear+0x71>
   404ed:	48 89 c7             	mov    %rax,%rdi
   404f0:	b8 00 00 00 00       	mov    $0x0,%eax
   404f5:	e8 1a 24 00 00       	call   42914 <panic>
    }
    x86_64_pagetable *pt_L1_1 = find_free_page_for_table(pid);
   404fa:	8b 45 9c             	mov    -0x64(%rbp),%eax
   404fd:	0f be c0             	movsbl %al,%eax
   40500:	89 c7                	mov    %eax,%edi
   40502:	e8 a5 fe ff ff       	call   403ac <find_free_page_for_table>
   40507:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    if (!pt_L1_1)
   4050b:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
   40510:	75 14                	jne    40526 <process_setup+0x119>
    {
        panic("No more physical pages\n"); // Error: should I panic? or use smthn else?
   40512:	48 8d 05 a0 41 00 00 	lea    0x41a0(%rip),%rax        # 446b9 <console_clear+0x71>
   40519:	48 89 c7             	mov    %rax,%rdi
   4051c:	b8 00 00 00 00       	mov    $0x0,%eax
   40521:	e8 ee 23 00 00       	call   42914 <panic>
    }
    // set the pages to zero
    memset(pt_L4, 0, PAGESIZE);
   40526:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4052a:	ba 00 10 00 00       	mov    $0x1000,%edx
   4052f:	be 00 00 00 00       	mov    $0x0,%esi
   40534:	48 89 c7             	mov    %rax,%rdi
   40537:	e8 57 31 00 00       	call   43693 <memset>
    memset(pt_L3, 0, PAGESIZE);
   4053c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40540:	ba 00 10 00 00       	mov    $0x1000,%edx
   40545:	be 00 00 00 00       	mov    $0x0,%esi
   4054a:	48 89 c7             	mov    %rax,%rdi
   4054d:	e8 41 31 00 00       	call   43693 <memset>
    memset(pt_L2, 0, PAGESIZE);
   40552:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40556:	ba 00 10 00 00       	mov    $0x1000,%edx
   4055b:	be 00 00 00 00       	mov    $0x0,%esi
   40560:	48 89 c7             	mov    %rax,%rdi
   40563:	e8 2b 31 00 00       	call   43693 <memset>
    memset(pt_L1_0, 0, PAGESIZE);
   40568:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4056c:	ba 00 10 00 00       	mov    $0x1000,%edx
   40571:	be 00 00 00 00       	mov    $0x0,%esi
   40576:	48 89 c7             	mov    %rax,%rdi
   40579:	e8 15 31 00 00       	call   43693 <memset>
    memset(pt_L1_1, 0, PAGESIZE);
   4057e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40582:	ba 00 10 00 00       	mov    $0x1000,%edx
   40587:	be 00 00 00 00       	mov    $0x0,%esi
   4058c:	48 89 c7             	mov    %rax,%rdi
   4058f:	e8 ff 30 00 00       	call   43693 <memset>

    // Link the page tables together. Did I do this right?
    pt_L4->entry[0] = (x86_64_pageentry_t)pt_L3 | PTE_P | PTE_W | PTE_U;
   40594:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40598:	48 83 c8 07          	or     $0x7,%rax
   4059c:	48 89 c2             	mov    %rax,%rdx
   4059f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   405a3:	48 89 10             	mov    %rdx,(%rax)
    pt_L3->entry[0] = (x86_64_pageentry_t)pt_L2 | PTE_P | PTE_W | PTE_U;
   405a6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   405aa:	48 83 c8 07          	or     $0x7,%rax
   405ae:	48 89 c2             	mov    %rax,%rdx
   405b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   405b5:	48 89 10             	mov    %rdx,(%rax)
    pt_L2->entry[0] = (x86_64_pageentry_t)pt_L1_0 | PTE_P | PTE_W | PTE_U;
   405b8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   405bc:	48 83 c8 07          	or     $0x7,%rax
   405c0:	48 89 c2             	mov    %rax,%rdx
   405c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   405c7:	48 89 10             	mov    %rdx,(%rax)
    pt_L2->entry[1] = (x86_64_pageentry_t)pt_L1_1 | PTE_P | PTE_W | PTE_U;
   405ca:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   405ce:	48 83 c8 07          	or     $0x7,%rax
   405d2:	48 89 c2             	mov    %rax,%rdx
   405d5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   405d9:	48 89 50 08          	mov    %rdx,0x8(%rax)

    // Copy kernel mappings (for addresses below PROC_START_ADDR)
    for (uintptr_t addr = 0; addr < PROC_START_ADDR; addr += PAGESIZE)
   405dd:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   405e4:	00 
   405e5:	eb 65                	jmp    4064c <process_setup+0x23f>
    {                                                                   // we're gonna go page by page I think
        vamapping vmap = virtual_memory_lookup(kernel_pagetable, addr); // get the pagetable page of addr in the kernel
   405e7:	48 8b 0d 12 4a 01 00 	mov    0x14a12(%rip),%rcx        # 55000 <kernel_pagetable>
   405ee:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   405f2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   405f6:	48 89 ce             	mov    %rcx,%rsi
   405f9:	48 89 c7             	mov    %rax,%rdi
   405fc:	e8 cb 2b 00 00       	call   431cc <virtual_memory_lookup>
        if (vmap.pn >= 0)
   40601:	8b 45 a0             	mov    -0x60(%rbp),%eax
   40604:	85 c0                	test   %eax,%eax
   40606:	78 3c                	js     40644 <process_setup+0x237>
        {
            // Copy the mapping, but ensure the console is user-accessible
            int perm = vmap.perm;
   40608:	8b 45 b0             	mov    -0x50(%rbp),%eax
   4060b:	89 45 f4             	mov    %eax,-0xc(%rbp)
            if (addr == CONSOLE_ADDR)
   4060e:	48 8d 05 eb 79 07 00 	lea    0x779eb(%rip),%rax        # b8000 <console>
   40615:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40619:	75 06                	jne    40621 <process_setup+0x214>
            {
                perm |= PTE_U; // Make console user-accessible
   4061b:	83 4d f4 04          	orl    $0x4,-0xc(%rbp)
   4061f:	eb 04                	jmp    40625 <process_setup+0x218>
            }
            else
            {
                perm &= ~PTE_U; // Make sure kernel memory is not user-accessible
   40621:	83 65 f4 fb          	andl   $0xfffffffb,-0xc(%rbp)
            }
            virtual_memory_map(pt_L4, addr, vmap.pa, PAGESIZE, perm);
   40625:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   40629:	8b 4d f4             	mov    -0xc(%rbp),%ecx
   4062c:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   40630:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40634:	41 89 c8             	mov    %ecx,%r8d
   40637:	b9 00 10 00 00       	mov    $0x1000,%ecx
   4063c:	48 89 c7             	mov    %rax,%rdi
   4063f:	e8 44 27 00 00       	call   42d88 <virtual_memory_map>
    for (uintptr_t addr = 0; addr < PROC_START_ADDR; addr += PAGESIZE)
   40644:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   4064b:	00 
   4064c:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   40653:	00 
   40654:	76 91                	jbe    405e7 <process_setup+0x1da>
        }
    }

    processes[pid].p_pagetable = pt_L4;
   40656:	8b 45 9c             	mov    -0x64(%rbp),%eax
   40659:	48 63 d0             	movslq %eax,%rdx
   4065c:	48 89 d0             	mov    %rdx,%rax
   4065f:	48 c1 e0 03          	shl    $0x3,%rax
   40663:	48 29 d0             	sub    %rdx,%rax
   40666:	48 c1 e0 05          	shl    $0x5,%rax
   4066a:	48 89 c1             	mov    %rax,%rcx
   4066d:	48 8d 15 7c 1a 01 00 	lea    0x11a7c(%rip),%rdx        # 520f0 <processes+0xd0>
   40674:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40678:	48 89 04 11          	mov    %rax,(%rcx,%rdx,1)

    int r = program_load(&processes[pid], program_number, NULL);
   4067c:	8b 45 9c             	mov    -0x64(%rbp),%eax
   4067f:	48 63 d0             	movslq %eax,%rdx
   40682:	48 89 d0             	mov    %rdx,%rax
   40685:	48 c1 e0 03          	shl    $0x3,%rax
   40689:	48 29 d0             	sub    %rdx,%rax
   4068c:	48 c1 e0 05          	shl    $0x5,%rax
   40690:	48 8d 15 89 19 01 00 	lea    0x11989(%rip),%rdx        # 52020 <processes>
   40697:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
   4069b:	8b 45 98             	mov    -0x68(%rbp),%eax
   4069e:	ba 00 00 00 00       	mov    $0x0,%edx
   406a3:	89 c6                	mov    %eax,%esi
   406a5:	48 89 cf             	mov    %rcx,%rdi
   406a8:	e8 1a 2c 00 00       	call   432c7 <program_load>
   406ad:	89 45 c4             	mov    %eax,-0x3c(%rbp)
    assert(r >= 0);
   406b0:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
   406b4:	79 1e                	jns    406d4 <process_setup+0x2c7>
   406b6:	48 8d 05 14 40 00 00 	lea    0x4014(%rip),%rax        # 446d1 <console_clear+0x89>
   406bd:	48 89 c2             	mov    %rax,%rdx
   406c0:	be e0 00 00 00       	mov    $0xe0,%esi
   406c5:	48 8d 05 0c 40 00 00 	lea    0x400c(%rip),%rax        # 446d8 <console_clear+0x90>
   406cc:	48 89 c7             	mov    %rax,%rdi
   406cf:	e8 30 23 00 00       	call   42a04 <assert_fail>

    processes[pid].p_registers.reg_rsp = PROC_START_ADDR + PROC_SIZE * pid;
   406d4:	8b 45 9c             	mov    -0x64(%rbp),%eax
   406d7:	83 c0 04             	add    $0x4,%eax
   406da:	c1 e0 12             	shl    $0x12,%eax
   406dd:	48 63 d0             	movslq %eax,%rdx
   406e0:	8b 45 9c             	mov    -0x64(%rbp),%eax
   406e3:	48 63 c8             	movslq %eax,%rcx
   406e6:	48 89 c8             	mov    %rcx,%rax
   406e9:	48 c1 e0 03          	shl    $0x3,%rax
   406ed:	48 29 c8             	sub    %rcx,%rax
   406f0:	48 c1 e0 05          	shl    $0x5,%rax
   406f4:	48 89 c1             	mov    %rax,%rcx
   406f7:	48 8d 05 da 19 01 00 	lea    0x119da(%rip),%rax        # 520d8 <processes+0xb8>
   406fe:	48 89 14 01          	mov    %rdx,(%rcx,%rax,1)
    uintptr_t stack_page = processes[pid].p_registers.reg_rsp - PAGESIZE;
   40702:	8b 45 9c             	mov    -0x64(%rbp),%eax
   40705:	48 63 d0             	movslq %eax,%rdx
   40708:	48 89 d0             	mov    %rdx,%rax
   4070b:	48 c1 e0 03          	shl    $0x3,%rax
   4070f:	48 29 d0             	sub    %rdx,%rax
   40712:	48 c1 e0 05          	shl    $0x5,%rax
   40716:	48 89 c2             	mov    %rax,%rdx
   40719:	48 8d 05 b8 19 01 00 	lea    0x119b8(%rip),%rax        # 520d8 <processes+0xb8>
   40720:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   40724:	48 2d 00 10 00 00    	sub    $0x1000,%rax
   4072a:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    assign_physical_page(stack_page, pid);
   4072e:	8b 45 9c             	mov    -0x64(%rbp),%eax
   40731:	0f be d0             	movsbl %al,%edx
   40734:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40738:	89 d6                	mov    %edx,%esi
   4073a:	48 89 c7             	mov    %rax,%rdi
   4073d:	e8 65 00 00 00       	call   407a7 <assign_physical_page>
    virtual_memory_map(processes[pid].p_pagetable, stack_page, stack_page,
   40742:	8b 45 9c             	mov    -0x64(%rbp),%eax
   40745:	48 63 d0             	movslq %eax,%rdx
   40748:	48 89 d0             	mov    %rdx,%rax
   4074b:	48 c1 e0 03          	shl    $0x3,%rax
   4074f:	48 29 d0             	sub    %rdx,%rax
   40752:	48 c1 e0 05          	shl    $0x5,%rax
   40756:	48 89 c2             	mov    %rax,%rdx
   40759:	48 8d 05 90 19 01 00 	lea    0x11990(%rip),%rax        # 520f0 <processes+0xd0>
   40760:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   40764:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   40768:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
   4076c:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40772:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40777:	48 89 c7             	mov    %rax,%rdi
   4077a:	e8 09 26 00 00       	call   42d88 <virtual_memory_map>
                       PAGESIZE, PTE_P | PTE_W | PTE_U);
    processes[pid].p_state = P_RUNNABLE;
   4077f:	8b 45 9c             	mov    -0x64(%rbp),%eax
   40782:	48 63 d0             	movslq %eax,%rdx
   40785:	48 89 d0             	mov    %rdx,%rax
   40788:	48 c1 e0 03          	shl    $0x3,%rax
   4078c:	48 29 d0             	sub    %rdx,%rax
   4078f:	48 c1 e0 05          	shl    $0x5,%rax
   40793:	48 89 c2             	mov    %rax,%rdx
   40796:	48 8d 05 4b 19 01 00 	lea    0x1194b(%rip),%rax        # 520e8 <processes+0xc8>
   4079d:	c7 04 02 01 00 00 00 	movl   $0x1,(%rdx,%rax,1)
}
   407a4:	90                   	nop
   407a5:	c9                   	leave  
   407a6:	c3                   	ret    

00000000000407a7 <assign_physical_page>:
//    Allocates the page with physical address `addr` to the given owner.
//    Fails if physical page `addr` was already allocated. Returns 0 on
//    success and -1 on failure. Used by the program loader.

int assign_physical_page(uintptr_t addr, int8_t owner)
{
   407a7:	f3 0f 1e fa          	endbr64 
   407ab:	55                   	push   %rbp
   407ac:	48 89 e5             	mov    %rsp,%rbp
   407af:	48 83 ec 10          	sub    $0x10,%rsp
   407b3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   407b7:	89 f0                	mov    %esi,%eax
   407b9:	88 45 f4             	mov    %al,-0xc(%rbp)
    if ((addr & 0xFFF) != 0 || addr >= MEMSIZE_PHYSICAL || pageinfo[PAGENUMBER(addr)].refcount != 0)
   407bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   407c0:	25 ff 0f 00 00       	and    $0xfff,%eax
   407c5:	48 85 c0             	test   %rax,%rax
   407c8:	75 27                	jne    407f1 <assign_physical_page+0x4a>
   407ca:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   407d1:	00 
   407d2:	77 1d                	ja     407f1 <assign_physical_page+0x4a>
   407d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   407d8:	48 c1 e8 0c          	shr    $0xc,%rax
   407dc:	48 98                	cltq   
   407de:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   407e2:	48 8d 05 58 26 01 00 	lea    0x12658(%rip),%rax        # 52e41 <pageinfo+0x1>
   407e9:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   407ed:	84 c0                	test   %al,%al
   407ef:	74 07                	je     407f8 <assign_physical_page+0x51>
    {
        return -1;
   407f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   407f6:	eb 3a                	jmp    40832 <assign_physical_page+0x8b>
    }
    else
    {
        pageinfo[PAGENUMBER(addr)].refcount = 1;
   407f8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   407fc:	48 c1 e8 0c          	shr    $0xc,%rax
   40800:	48 98                	cltq   
   40802:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40806:	48 8d 05 34 26 01 00 	lea    0x12634(%rip),%rax        # 52e41 <pageinfo+0x1>
   4080d:	c6 04 02 01          	movb   $0x1,(%rdx,%rax,1)
        pageinfo[PAGENUMBER(addr)].owner = owner;
   40811:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40815:	48 c1 e8 0c          	shr    $0xc,%rax
   40819:	48 98                	cltq   
   4081b:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   4081f:	48 8d 15 1a 26 01 00 	lea    0x1261a(%rip),%rdx        # 52e40 <pageinfo>
   40826:	0f b6 45 f4          	movzbl -0xc(%rbp),%eax
   4082a:	88 04 11             	mov    %al,(%rcx,%rdx,1)
        return 0;
   4082d:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   40832:	c9                   	leave  
   40833:	c3                   	ret    

0000000000040834 <syscall_mapping>:

void syscall_mapping(proc *p)
{
   40834:	f3 0f 1e fa          	endbr64 
   40838:	55                   	push   %rbp
   40839:	48 89 e5             	mov    %rsp,%rbp
   4083c:	48 83 ec 70          	sub    $0x70,%rsp
   40840:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)

    uintptr_t mapping_ptr = p->p_registers.reg_rdi;
   40844:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40848:	48 8b 40 38          	mov    0x38(%rax),%rax
   4084c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    uintptr_t ptr = p->p_registers.reg_rsi;
   40850:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40854:	48 8b 40 30          	mov    0x30(%rax),%rax
   40858:	48 89 45 f0          	mov    %rax,-0x10(%rbp)

    // convert to physical address so kernel can write to it
    vamapping map = virtual_memory_lookup(p->p_pagetable, mapping_ptr);
   4085c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40860:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40867:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4086b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4086f:	48 89 ce             	mov    %rcx,%rsi
   40872:	48 89 c7             	mov    %rax,%rdi
   40875:	e8 52 29 00 00       	call   431cc <virtual_memory_lookup>

    // check for write access
    if ((map.perm & (PTE_W | PTE_U)) != (PTE_W | PTE_U))
   4087a:	8b 45 e0             	mov    -0x20(%rbp),%eax
   4087d:	48 98                	cltq   
   4087f:	83 e0 06             	and    $0x6,%eax
   40882:	48 83 f8 06          	cmp    $0x6,%rax
   40886:	75 73                	jne    408fb <syscall_mapping+0xc7>
        return;
    uintptr_t endaddr = mapping_ptr + sizeof(vamapping) - 1;
   40888:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4088c:	48 83 c0 17          	add    $0x17,%rax
   40890:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    // check for write access for end address
    vamapping end_map = virtual_memory_lookup(p->p_pagetable, endaddr);
   40894:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   40898:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   4089f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
   408a3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   408a7:	48 89 ce             	mov    %rcx,%rsi
   408aa:	48 89 c7             	mov    %rax,%rdi
   408ad:	e8 1a 29 00 00       	call   431cc <virtual_memory_lookup>
    if ((end_map.perm & (PTE_W | PTE_P)) != (PTE_W | PTE_P))
   408b2:	8b 45 c8             	mov    -0x38(%rbp),%eax
   408b5:	48 98                	cltq   
   408b7:	83 e0 03             	and    $0x3,%eax
   408ba:	48 83 f8 03          	cmp    $0x3,%rax
   408be:	75 3e                	jne    408fe <syscall_mapping+0xca>
        return;
    // find the actual mapping now
    vamapping ptr_lookup = virtual_memory_lookup(p->p_pagetable, ptr);
   408c0:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   408c4:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   408cb:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   408cf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   408d3:	48 89 ce             	mov    %rcx,%rsi
   408d6:	48 89 c7             	mov    %rax,%rdi
   408d9:	e8 ee 28 00 00       	call   431cc <virtual_memory_lookup>
    memcpy((void *)map.pa, &ptr_lookup, sizeof(vamapping));
   408de:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   408e2:	48 89 c1             	mov    %rax,%rcx
   408e5:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   408e9:	ba 18 00 00 00       	mov    $0x18,%edx
   408ee:	48 89 c6             	mov    %rax,%rsi
   408f1:	48 89 cf             	mov    %rcx,%rdi
   408f4:	e8 94 2c 00 00       	call   4358d <memcpy>
   408f9:	eb 04                	jmp    408ff <syscall_mapping+0xcb>
        return;
   408fb:	90                   	nop
   408fc:	eb 01                	jmp    408ff <syscall_mapping+0xcb>
        return;
   408fe:	90                   	nop
}
   408ff:	c9                   	leave  
   40900:	c3                   	ret    

0000000000040901 <syscall_mem_tog>:

void syscall_mem_tog(proc *process)
{
   40901:	f3 0f 1e fa          	endbr64 
   40905:	55                   	push   %rbp
   40906:	48 89 e5             	mov    %rsp,%rbp
   40909:	48 83 ec 18          	sub    $0x18,%rsp
   4090d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)

    pid_t p = process->p_registers.reg_rdi;
   40911:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40915:	48 8b 40 38          	mov    0x38(%rax),%rax
   40919:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (p == 0)
   4091c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   40920:	75 14                	jne    40936 <syscall_mem_tog+0x35>
    {
        disp_global = !disp_global;
   40922:	0f b6 05 d7 56 00 00 	movzbl 0x56d7(%rip),%eax        # 46000 <disp_global>
   40929:	84 c0                	test   %al,%al
   4092b:	0f 94 c0             	sete   %al
   4092e:	88 05 cc 56 00 00    	mov    %al,0x56cc(%rip)        # 46000 <disp_global>
   40934:	eb 36                	jmp    4096c <syscall_mem_tog+0x6b>
    }
    else
    {
        if (p < 0 || p > NPROC || p != process->p_pid)
   40936:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   4093a:	78 2f                	js     4096b <syscall_mem_tog+0x6a>
   4093c:	83 7d fc 10          	cmpl   $0x10,-0x4(%rbp)
   40940:	7f 29                	jg     4096b <syscall_mem_tog+0x6a>
   40942:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40946:	8b 00                	mov    (%rax),%eax
   40948:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   4094b:	75 1e                	jne    4096b <syscall_mem_tog+0x6a>
            return;
        process->display_status = !(process->display_status);
   4094d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40951:	0f b6 80 d8 00 00 00 	movzbl 0xd8(%rax),%eax
   40958:	84 c0                	test   %al,%al
   4095a:	0f 94 c0             	sete   %al
   4095d:	89 c2                	mov    %eax,%edx
   4095f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40963:	88 90 d8 00 00 00    	mov    %dl,0xd8(%rax)
   40969:	eb 01                	jmp    4096c <syscall_mem_tog+0x6b>
            return;
   4096b:	90                   	nop
    }
}
   4096c:	c9                   	leave  
   4096d:	c3                   	ret    

000000000004096e <exception>:
//    then calls exception().
//
//    Note that hardware interrupts are disabled whenever the kernel is running.

void exception(x86_64_registers *reg)
{
   4096e:	f3 0f 1e fa          	endbr64 
   40972:	55                   	push   %rbp
   40973:	48 89 e5             	mov    %rsp,%rbp
   40976:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
   4097d:	48 89 bd d8 fe ff ff 	mov    %rdi,-0x128(%rbp)
    // Copy the saved registers into the `current` process descriptor
    // and always use the kernel's page table.
    current->p_registers = *reg;
   40984:	48 8b 05 75 16 01 00 	mov    0x11675(%rip),%rax        # 52000 <current>
   4098b:	48 8b 95 d8 fe ff ff 	mov    -0x128(%rbp),%rdx
   40992:	48 83 c0 08          	add    $0x8,%rax
   40996:	48 89 d6             	mov    %rdx,%rsi
   40999:	ba 18 00 00 00       	mov    $0x18,%edx
   4099e:	48 89 c7             	mov    %rax,%rdi
   409a1:	48 89 d1             	mov    %rdx,%rcx
   409a4:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    set_pagetable(kernel_pagetable);
   409a7:	48 8b 05 52 46 01 00 	mov    0x14652(%rip),%rax        # 55000 <kernel_pagetable>
   409ae:	48 89 c7             	mov    %rax,%rdi
   409b1:	e8 60 22 00 00       	call   42c16 <set_pagetable>
    // Events logged this way are stored in the host's `log.txt` file.
    /*log_printf("proc %d: exception %d\n", current->p_pid, reg->reg_intno);*/

    // Show the current cursor location and memory state
    // (unless this is a kernel fault).
    console_show_cursor(cursorpos);
   409b6:	8b 05 40 86 07 00    	mov    0x78640(%rip),%eax        # b8ffc <cursorpos>
   409bc:	89 c7                	mov    %eax,%edi
   409be:	e8 d9 18 00 00       	call   4229c <console_show_cursor>
    if ((reg->reg_intno != INT_PAGEFAULT && reg->reg_intno != INT_GPF) // no error due to pagefault or general fault
   409c3:	48 8b 85 d8 fe ff ff 	mov    -0x128(%rbp),%rax
   409ca:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   409d1:	48 83 f8 0e          	cmp    $0xe,%rax
   409d5:	74 14                	je     409eb <exception+0x7d>
   409d7:	48 8b 85 d8 fe ff ff 	mov    -0x128(%rbp),%rax
   409de:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   409e5:	48 83 f8 0d          	cmp    $0xd,%rax
   409e9:	75 16                	jne    40a01 <exception+0x93>
        || (reg->reg_err & PFERR_USER))                                // pagefault error in user mode
   409eb:	48 8b 85 d8 fe ff ff 	mov    -0x128(%rbp),%rax
   409f2:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   409f9:	83 e0 04             	and    $0x4,%eax
   409fc:	48 85 c0             	test   %rax,%rax
   409ff:	74 1a                	je     40a1b <exception+0xad>
    {
        check_virtual_memory();
   40a01:	e8 dc 08 00 00       	call   412e2 <check_virtual_memory>
        if (disp_global)
   40a06:	0f b6 05 f3 55 00 00 	movzbl 0x55f3(%rip),%eax        # 46000 <disp_global>
   40a0d:	84 c0                	test   %al,%al
   40a0f:	74 0a                	je     40a1b <exception+0xad>
        {
            memshow_physical();
   40a11:	e8 95 0a 00 00       	call   414ab <memshow_physical>
            memshow_virtual_animate();
   40a16:	e8 32 0e 00 00       	call   4184d <memshow_virtual_animate>
        }
    }

    // If Control-C was typed, exit the virtual machine.
    check_keyboard();
   40a1b:	e8 92 1d 00 00       	call   427b2 <check_keyboard>

    // Actually handle the exception.
    switch (reg->reg_intno)
   40a20:	48 8b 85 d8 fe ff ff 	mov    -0x128(%rbp),%rax
   40a27:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40a2e:	48 83 e8 0e          	sub    $0xe,%rax
   40a32:	48 83 f8 2a          	cmp    $0x2a,%rax
   40a36:	0f 87 59 03 00 00    	ja     40d95 <exception+0x427>
   40a3c:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
   40a43:	00 
   40a44:	48 8d 05 2d 3d 00 00 	lea    0x3d2d(%rip),%rax        # 44778 <console_clear+0x130>
   40a4b:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   40a4e:	48 98                	cltq   
   40a50:	48 8d 15 21 3d 00 00 	lea    0x3d21(%rip),%rdx        # 44778 <console_clear+0x130>
   40a57:	48 01 d0             	add    %rdx,%rax
   40a5a:	3e ff e0             	notrack jmp *%rax

    case INT_SYS_PANIC:
        // rdi stores pointer for msg string
        {
            char msg[160];
            uintptr_t addr = current->p_registers.reg_rdi;
   40a5d:	48 8b 05 9c 15 01 00 	mov    0x1159c(%rip),%rax        # 52000 <current>
   40a64:	48 8b 40 38          	mov    0x38(%rax),%rax
   40a68:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            if ((void *)addr == NULL)
   40a6c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   40a71:	75 0f                	jne    40a82 <exception+0x114>
                panic(NULL);
   40a73:	bf 00 00 00 00       	mov    $0x0,%edi
   40a78:	b8 00 00 00 00       	mov    $0x0,%eax
   40a7d:	e8 92 1e 00 00       	call   42914 <panic>
            vamapping map = virtual_memory_lookup(current->p_pagetable, addr);
   40a82:	48 8b 05 77 15 01 00 	mov    0x11577(%rip),%rax        # 52000 <current>
   40a89:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40a90:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
   40a94:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   40a98:	48 89 ce             	mov    %rcx,%rsi
   40a9b:	48 89 c7             	mov    %rax,%rdi
   40a9e:	e8 29 27 00 00       	call   431cc <virtual_memory_lookup>
            memcpy(msg, (void *)map.pa, 160);
   40aa3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   40aa7:	48 89 c1             	mov    %rax,%rcx
   40aaa:	48 8d 85 e8 fe ff ff 	lea    -0x118(%rbp),%rax
   40ab1:	ba a0 00 00 00       	mov    $0xa0,%edx
   40ab6:	48 89 ce             	mov    %rcx,%rsi
   40ab9:	48 89 c7             	mov    %rax,%rdi
   40abc:	e8 cc 2a 00 00       	call   4358d <memcpy>
            panic(msg);
   40ac1:	48 8d 85 e8 fe ff ff 	lea    -0x118(%rbp),%rax
   40ac8:	48 89 c7             	mov    %rax,%rdi
   40acb:	b8 00 00 00 00       	mov    $0x0,%eax
   40ad0:	e8 3f 1e 00 00       	call   42914 <panic>
        }
        panic(NULL);
        break; // will not be reached

    case INT_SYS_GETPID:
        current->p_registers.reg_rax = current->p_pid;
   40ad5:	48 8b 05 24 15 01 00 	mov    0x11524(%rip),%rax        # 52000 <current>
   40adc:	8b 10                	mov    (%rax),%edx
   40ade:	48 8b 05 1b 15 01 00 	mov    0x1151b(%rip),%rax        # 52000 <current>
   40ae5:	48 63 d2             	movslq %edx,%rdx
   40ae8:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   40aec:	e9 b4 02 00 00       	jmp    40da5 <exception+0x437>

    case INT_SYS_YIELD:
        schedule();
   40af1:	e8 d8 02 00 00       	call   40dce <schedule>
        break; /* will not be reached */
   40af6:	e9 aa 02 00 00       	jmp    40da5 <exception+0x437>

    case INT_SYS_PAGE_ALLOC:
    {
        uintptr_t addr = current->p_registers.reg_rdi;
   40afb:	48 8b 05 fe 14 01 00 	mov    0x114fe(%rip),%rax        # 52000 <current>
   40b02:	48 8b 40 38          	mov    0x38(%rax),%rax
   40b06:	48 89 45 f8          	mov    %rax,-0x8(%rbp)

        if ((addr & 0xFFF) != 0)
   40b0a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40b0e:	25 ff 0f 00 00       	and    $0xfff,%eax
   40b13:	48 85 c0             	test   %rax,%rax
   40b16:	74 14                	je     40b2c <exception+0x1be>
        { // Check if page-aligned
            current->p_registers.reg_rax = -1;
   40b18:	48 8b 05 e1 14 01 00 	mov    0x114e1(%rip),%rax        # 52000 <current>
   40b1f:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40b26:	ff 
            break;
   40b27:	e9 79 02 00 00       	jmp    40da5 <exception+0x437>
        }
        if (addr < PROC_START_ADDR && addr != CONSOLE_ADDR)
   40b2c:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   40b33:	00 
   40b34:	77 21                	ja     40b57 <exception+0x1e9>
   40b36:	48 8d 05 c3 74 07 00 	lea    0x774c3(%rip),%rax        # b8000 <console>
   40b3d:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40b41:	74 14                	je     40b57 <exception+0x1e9>
        {
            current->p_registers.reg_rax = -1;
   40b43:	48 8b 05 b6 14 01 00 	mov    0x114b6(%rip),%rax        # 52000 <current>
   40b4a:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40b51:	ff 
            break;
   40b52:	e9 4e 02 00 00       	jmp    40da5 <exception+0x437>
        }
        // Check if address is below max virtual memory size
        if (addr >= MEMSIZE_VIRTUAL)
   40b57:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   40b5e:	00 
   40b5f:	76 14                	jbe    40b75 <exception+0x207>
        {
            current->p_registers.reg_rax = -1;
   40b61:	48 8b 05 98 14 01 00 	mov    0x11498(%rip),%rax        # 52000 <current>
   40b68:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40b6f:	ff 
            break;
   40b70:	e9 30 02 00 00       	jmp    40da5 <exception+0x437>
        }
        // if the page already exists
        vamapping vam = virtual_memory_lookup(current->p_pagetable, addr);
   40b75:	48 8b 05 84 14 01 00 	mov    0x11484(%rip),%rax        # 52000 <current>
   40b7c:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   40b83:	48 8d 45 88          	lea    -0x78(%rbp),%rax
   40b87:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40b8b:	48 89 ce             	mov    %rcx,%rsi
   40b8e:	48 89 c7             	mov    %rax,%rdi
   40b91:	e8 36 26 00 00       	call   431cc <virtual_memory_lookup>
        if (vam.pn >= 0)
   40b96:	8b 45 88             	mov    -0x78(%rbp),%eax
   40b99:	85 c0                	test   %eax,%eax
   40b9b:	78 14                	js     40bb1 <exception+0x243>
        {
            current->p_registers.reg_rax = -1;
   40b9d:	48 8b 05 5c 14 01 00 	mov    0x1145c(%rip),%rax        # 52000 <current>
   40ba4:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40bab:	ff 
            break;
   40bac:	e9 f4 01 00 00       	jmp    40da5 <exception+0x437>
        }
        int i = find_free_page();
   40bb1:	b8 00 00 00 00       	mov    $0x0,%eax
   40bb6:	e8 ab f7 ff ff       	call   40366 <find_free_page>
   40bbb:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (i == -1)
   40bbe:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%rbp)
   40bc2:	75 14                	jne    40bd8 <exception+0x26a>
        {
            current->p_registers.reg_rax = -1;
   40bc4:	48 8b 05 35 14 01 00 	mov    0x11435(%rip),%rax        # 52000 <current>
   40bcb:	48 c7 40 08 ff ff ff 	movq   $0xffffffffffffffff,0x8(%rax)
   40bd2:	ff 
            break;
   40bd3:	e9 cd 01 00 00       	jmp    40da5 <exception+0x437>
        }
        uintptr_t physaddr = PAGEADDRESS(i);
   40bd8:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40bdb:	48 98                	cltq   
   40bdd:	48 c1 e0 0c          	shl    $0xc,%rax
   40be1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        int r = assign_physical_page(physaddr, current->p_pid);
   40be5:	48 8b 05 14 14 01 00 	mov    0x11414(%rip),%rax        # 52000 <current>
   40bec:	8b 00                	mov    (%rax),%eax
   40bee:	0f be d0             	movsbl %al,%edx
   40bf1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40bf5:	89 d6                	mov    %edx,%esi
   40bf7:	48 89 c7             	mov    %rax,%rdi
   40bfa:	e8 a8 fb ff ff       	call   407a7 <assign_physical_page>
   40bff:	89 45 e4             	mov    %eax,-0x1c(%rbp)
        if (r >= 0)
   40c02:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
   40c06:	78 29                	js     40c31 <exception+0x2c3>
        {
            virtual_memory_map(current->p_pagetable, addr, physaddr,
   40c08:	48 8b 05 f1 13 01 00 	mov    0x113f1(%rip),%rax        # 52000 <current>
   40c0f:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   40c16:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   40c1a:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   40c1e:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40c24:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40c29:	48 89 c7             	mov    %rax,%rdi
   40c2c:	e8 57 21 00 00       	call   42d88 <virtual_memory_map>
                               PAGESIZE, PTE_P | PTE_W | PTE_U);
        }

        current->p_registers.reg_rax = r;
   40c31:	48 8b 05 c8 13 01 00 	mov    0x113c8(%rip),%rax        # 52000 <current>
   40c38:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   40c3b:	48 63 d2             	movslq %edx,%rdx
   40c3e:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   40c42:	e9 5e 01 00 00       	jmp    40da5 <exception+0x437>
    }

    case INT_SYS_MAPPING:
    {
        syscall_mapping(current);
   40c47:	48 8b 05 b2 13 01 00 	mov    0x113b2(%rip),%rax        # 52000 <current>
   40c4e:	48 89 c7             	mov    %rax,%rdi
   40c51:	e8 de fb ff ff       	call   40834 <syscall_mapping>
        break;
   40c56:	e9 4a 01 00 00       	jmp    40da5 <exception+0x437>
    }

    case INT_SYS_MEM_TOG:
    {
        syscall_mem_tog(current);
   40c5b:	48 8b 05 9e 13 01 00 	mov    0x1139e(%rip),%rax        # 52000 <current>
   40c62:	48 89 c7             	mov    %rax,%rdi
   40c65:	e8 97 fc ff ff       	call   40901 <syscall_mem_tog>
        break;
   40c6a:	e9 36 01 00 00       	jmp    40da5 <exception+0x437>
    }

    case INT_TIMER:
        ++ticks;
   40c6f:	8b 05 ab 21 01 00    	mov    0x121ab(%rip),%eax        # 52e20 <ticks>
   40c75:	83 c0 01             	add    $0x1,%eax
   40c78:	89 05 a2 21 01 00    	mov    %eax,0x121a2(%rip)        # 52e20 <ticks>
        schedule();
   40c7e:	e8 4b 01 00 00       	call   40dce <schedule>
        break; /* will not be reached */
   40c83:	e9 1d 01 00 00       	jmp    40da5 <exception+0x437>
    return val;
}

static inline uintptr_t rcr2(void) {
    uintptr_t val;
    asm volatile("movq %%cr2,%0" : "=r" (val));
   40c88:	0f 20 d0             	mov    %cr2,%rax
   40c8b:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    return val;
   40c8f:	48 8b 45 b8          	mov    -0x48(%rbp),%rax

    case INT_PAGEFAULT:
    {
        // Analyze faulting address and access type.
        uintptr_t addr = rcr2();
   40c93:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        const char *operation = reg->reg_err & PFERR_WRITE
   40c97:	48 8b 85 d8 fe ff ff 	mov    -0x128(%rbp),%rax
   40c9e:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40ca5:	83 e0 02             	and    $0x2,%eax
                                    ? "write"
                                    : "read";
   40ca8:	48 85 c0             	test   %rax,%rax
   40cab:	74 09                	je     40cb6 <exception+0x348>
   40cad:	48 8d 05 34 3a 00 00 	lea    0x3a34(%rip),%rax        # 446e8 <console_clear+0xa0>
   40cb4:	eb 07                	jmp    40cbd <exception+0x34f>
   40cb6:	48 8d 05 31 3a 00 00 	lea    0x3a31(%rip),%rax        # 446ee <console_clear+0xa6>
        const char *operation = reg->reg_err & PFERR_WRITE
   40cbd:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
        const char *problem = reg->reg_err & PFERR_PRESENT
   40cc1:	48 8b 85 d8 fe ff ff 	mov    -0x128(%rbp),%rax
   40cc8:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40ccf:	83 e0 01             	and    $0x1,%eax
                                  ? "protection problem"
                                  : "missing page";
   40cd2:	48 85 c0             	test   %rax,%rax
   40cd5:	74 09                	je     40ce0 <exception+0x372>
   40cd7:	48 8d 05 15 3a 00 00 	lea    0x3a15(%rip),%rax        # 446f3 <console_clear+0xab>
   40cde:	eb 07                	jmp    40ce7 <exception+0x379>
   40ce0:	48 8d 05 1f 3a 00 00 	lea    0x3a1f(%rip),%rax        # 44706 <console_clear+0xbe>
        const char *problem = reg->reg_err & PFERR_PRESENT
   40ce7:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

        if (!(reg->reg_err & PFERR_USER))
   40ceb:	48 8b 85 d8 fe ff ff 	mov    -0x128(%rbp),%rax
   40cf2:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40cf9:	83 e0 04             	and    $0x4,%eax
   40cfc:	48 85 c0             	test   %rax,%rax
   40cff:	75 34                	jne    40d35 <exception+0x3c7>
        {
            panic("Kernel page fault for %p (%s %s, rip=%p)!\n",
   40d01:	48 8b 85 d8 fe ff ff 	mov    -0x128(%rbp),%rax
   40d08:	48 8b b0 98 00 00 00 	mov    0x98(%rax),%rsi
   40d0f:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   40d13:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   40d17:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40d1b:	49 89 f0             	mov    %rsi,%r8
   40d1e:	48 89 c6             	mov    %rax,%rsi
   40d21:	48 8d 05 f0 39 00 00 	lea    0x39f0(%rip),%rax        # 44718 <console_clear+0xd0>
   40d28:	48 89 c7             	mov    %rax,%rdi
   40d2b:	b8 00 00 00 00       	mov    $0x0,%eax
   40d30:	e8 df 1b 00 00       	call   42914 <panic>
                  addr, operation, problem, reg->reg_rip);
        }
        console_printf(CPOS(24, 0), 0x0C00,
   40d35:	48 8b 85 d8 fe ff ff 	mov    -0x128(%rbp),%rax
   40d3c:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
                       "Process %d page fault for %p (%s %s, rip=%p)!\n",
                       current->p_pid, addr, operation, problem, reg->reg_rip);
   40d43:	48 8b 05 b6 12 01 00 	mov    0x112b6(%rip),%rax        # 52000 <current>
        console_printf(CPOS(24, 0), 0x0C00,
   40d4a:	8b 00                	mov    (%rax),%eax
   40d4c:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
   40d50:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
   40d54:	52                   	push   %rdx
   40d55:	ff 75 c0             	push   -0x40(%rbp)
   40d58:	49 89 f1             	mov    %rsi,%r9
   40d5b:	49 89 c8             	mov    %rcx,%r8
   40d5e:	89 c1                	mov    %eax,%ecx
   40d60:	48 8d 05 e1 39 00 00 	lea    0x39e1(%rip),%rax        # 44748 <console_clear+0x100>
   40d67:	48 89 c2             	mov    %rax,%rdx
   40d6a:	be 00 0c 00 00       	mov    $0xc00,%esi
   40d6f:	bf 80 07 00 00       	mov    $0x780,%edi
   40d74:	b8 00 00 00 00       	mov    $0x0,%eax
   40d79:	e8 54 37 00 00       	call   444d2 <console_printf>
   40d7e:	48 83 c4 10          	add    $0x10,%rsp
        current->p_state = P_BROKEN;
   40d82:	48 8b 05 77 12 01 00 	mov    0x11277(%rip),%rax        # 52000 <current>
   40d89:	c7 80 c8 00 00 00 03 	movl   $0x3,0xc8(%rax)
   40d90:	00 00 00 
        break;
   40d93:	eb 10                	jmp    40da5 <exception+0x437>
    }

    default:
        default_exception(current);
   40d95:	48 8b 05 64 12 01 00 	mov    0x11264(%rip),%rax        # 52000 <current>
   40d9c:	48 89 c7             	mov    %rax,%rdi
   40d9f:	e8 99 1c 00 00       	call   42a3d <default_exception>
        break; /* will not be reached */
   40da4:	90                   	nop
    }

    // Return to the current process (or run something else).
    if (current->p_state == P_RUNNABLE)
   40da5:	48 8b 05 54 12 01 00 	mov    0x11254(%rip),%rax        # 52000 <current>
   40dac:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   40db2:	83 f8 01             	cmp    $0x1,%eax
   40db5:	75 0f                	jne    40dc6 <exception+0x458>
    {
        run(current);
   40db7:	48 8b 05 42 12 01 00 	mov    0x11242(%rip),%rax        # 52000 <current>
   40dbe:	48 89 c7             	mov    %rax,%rdi
   40dc1:	e8 87 00 00 00       	call   40e4d <run>
    }
    else
    {
        schedule();
   40dc6:	e8 03 00 00 00       	call   40dce <schedule>
    }
}
   40dcb:	90                   	nop
   40dcc:	c9                   	leave  
   40dcd:	c3                   	ret    

0000000000040dce <schedule>:
// schedule
//    Pick the next process to run and then run it.
//    If there are no runnable processes, spins forever.

void schedule(void)
{
   40dce:	f3 0f 1e fa          	endbr64 
   40dd2:	55                   	push   %rbp
   40dd3:	48 89 e5             	mov    %rsp,%rbp
   40dd6:	48 83 ec 10          	sub    $0x10,%rsp
    pid_t pid = current->p_pid;
   40dda:	48 8b 05 1f 12 01 00 	mov    0x1121f(%rip),%rax        # 52000 <current>
   40de1:	8b 00                	mov    (%rax),%eax
   40de3:	89 45 fc             	mov    %eax,-0x4(%rbp)
    while (1)
    {
        pid = (pid + 1) % NPROC;
   40de6:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40de9:	83 c0 01             	add    $0x1,%eax
   40dec:	99                   	cltd   
   40ded:	c1 ea 1c             	shr    $0x1c,%edx
   40df0:	01 d0                	add    %edx,%eax
   40df2:	83 e0 0f             	and    $0xf,%eax
   40df5:	29 d0                	sub    %edx,%eax
   40df7:	89 45 fc             	mov    %eax,-0x4(%rbp)
        if (processes[pid].p_state == P_RUNNABLE)
   40dfa:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40dfd:	48 63 d0             	movslq %eax,%rdx
   40e00:	48 89 d0             	mov    %rdx,%rax
   40e03:	48 c1 e0 03          	shl    $0x3,%rax
   40e07:	48 29 d0             	sub    %rdx,%rax
   40e0a:	48 c1 e0 05          	shl    $0x5,%rax
   40e0e:	48 89 c2             	mov    %rax,%rdx
   40e11:	48 8d 05 d0 12 01 00 	lea    0x112d0(%rip),%rax        # 520e8 <processes+0xc8>
   40e18:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   40e1b:	83 f8 01             	cmp    $0x1,%eax
   40e1e:	75 26                	jne    40e46 <schedule+0x78>
        {
            run(&processes[pid]);
   40e20:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40e23:	48 63 d0             	movslq %eax,%rdx
   40e26:	48 89 d0             	mov    %rdx,%rax
   40e29:	48 c1 e0 03          	shl    $0x3,%rax
   40e2d:	48 29 d0             	sub    %rdx,%rax
   40e30:	48 c1 e0 05          	shl    $0x5,%rax
   40e34:	48 8d 15 e5 11 01 00 	lea    0x111e5(%rip),%rdx        # 52020 <processes>
   40e3b:	48 01 d0             	add    %rdx,%rax
   40e3e:	48 89 c7             	mov    %rax,%rdi
   40e41:	e8 07 00 00 00       	call   40e4d <run>
        }
        // If Control-C was typed, exit the virtual machine.
        check_keyboard();
   40e46:	e8 67 19 00 00       	call   427b2 <check_keyboard>
        pid = (pid + 1) % NPROC;
   40e4b:	eb 99                	jmp    40de6 <schedule+0x18>

0000000000040e4d <run>:
//    `p->p_registers` using the `popal`, `popl`, and `iret` instructions.
//
//    As a side effect, sets `current = p`.

void run(proc *p)
{
   40e4d:	f3 0f 1e fa          	endbr64 
   40e51:	55                   	push   %rbp
   40e52:	48 89 e5             	mov    %rsp,%rbp
   40e55:	48 83 ec 10          	sub    $0x10,%rsp
   40e59:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    assert(p->p_state == P_RUNNABLE);
   40e5d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40e61:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   40e67:	83 f8 01             	cmp    $0x1,%eax
   40e6a:	74 1e                	je     40e8a <run+0x3d>
   40e6c:	48 8d 05 b1 39 00 00 	lea    0x39b1(%rip),%rax        # 44824 <console_clear+0x1dc>
   40e73:	48 89 c2             	mov    %rax,%rdx
   40e76:	be e3 01 00 00       	mov    $0x1e3,%esi
   40e7b:	48 8d 05 56 38 00 00 	lea    0x3856(%rip),%rax        # 446d8 <console_clear+0x90>
   40e82:	48 89 c7             	mov    %rax,%rdi
   40e85:	e8 7a 1b 00 00       	call   42a04 <assert_fail>
    current = p;
   40e8a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40e8e:	48 89 05 6b 11 01 00 	mov    %rax,0x1116b(%rip)        # 52000 <current>

    // Load the process's current pagetable.
    set_pagetable(p->p_pagetable);
   40e95:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40e99:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   40ea0:	48 89 c7             	mov    %rax,%rdi
   40ea3:	e8 6e 1d 00 00       	call   42c16 <set_pagetable>

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(&p->p_registers);
   40ea8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40eac:	48 83 c0 08          	add    $0x8,%rax
   40eb0:	48 89 c7             	mov    %rax,%rdi
   40eb3:	e8 0b f2 ff ff       	call   400c3 <exception_return>

0000000000040eb8 <pageinfo_init>:

// pageinfo_init
//    Initialize the `pageinfo[]` array.

void pageinfo_init(void)
{
   40eb8:	f3 0f 1e fa          	endbr64 
   40ebc:	55                   	push   %rbp
   40ebd:	48 89 e5             	mov    %rsp,%rbp
   40ec0:	48 83 ec 10          	sub    $0x10,%rsp
    extern char end[];

    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE)
   40ec4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   40ecb:	00 
   40ecc:	e9 93 00 00 00       	jmp    40f64 <pageinfo_init+0xac>
    {
        int owner;
        if (physical_memory_isreserved(addr))
   40ed1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40ed5:	48 89 c7             	mov    %rax,%rdi
   40ed8:	e8 0f 11 00 00       	call   41fec <physical_memory_isreserved>
   40edd:	85 c0                	test   %eax,%eax
   40edf:	74 09                	je     40eea <pageinfo_init+0x32>
        {
            owner = PO_RESERVED;
   40ee1:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%rbp)
   40ee8:	eb 31                	jmp    40f1b <pageinfo_init+0x63>
        }
        else if ((addr >= KERNEL_START_ADDR && addr < (uintptr_t)end) || addr == KERNEL_STACK_TOP - PAGESIZE)
   40eea:	48 81 7d f8 ff ff 03 	cmpq   $0x3ffff,-0x8(%rbp)
   40ef1:	00 
   40ef2:	76 0d                	jbe    40f01 <pageinfo_init+0x49>
   40ef4:	48 8d 05 0d a1 01 00 	lea    0x1a10d(%rip),%rax        # 5b008 <end>
   40efb:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40eff:	72 0a                	jb     40f0b <pageinfo_init+0x53>
   40f01:	48 81 7d f8 00 f0 07 	cmpq   $0x7f000,-0x8(%rbp)
   40f08:	00 
   40f09:	75 09                	jne    40f14 <pageinfo_init+0x5c>
        {
            owner = PO_KERNEL;
   40f0b:	c7 45 f4 fe ff ff ff 	movl   $0xfffffffe,-0xc(%rbp)
   40f12:	eb 07                	jmp    40f1b <pageinfo_init+0x63>
        }
        else
        {
            owner = PO_FREE;
   40f14:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
        }
        pageinfo[PAGENUMBER(addr)].owner = owner;
   40f1b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40f1f:	48 c1 e8 0c          	shr    $0xc,%rax
   40f23:	89 c2                	mov    %eax,%edx
   40f25:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40f28:	89 c1                	mov    %eax,%ecx
   40f2a:	48 63 c2             	movslq %edx,%rax
   40f2d:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40f31:	48 8d 05 08 1f 01 00 	lea    0x11f08(%rip),%rax        # 52e40 <pageinfo>
   40f38:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
        pageinfo[PAGENUMBER(addr)].refcount = (owner != PO_FREE);
   40f3b:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   40f3f:	0f 95 c2             	setne  %dl
   40f42:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40f46:	48 c1 e8 0c          	shr    $0xc,%rax
   40f4a:	89 d1                	mov    %edx,%ecx
   40f4c:	48 98                	cltq   
   40f4e:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40f52:	48 8d 05 e8 1e 01 00 	lea    0x11ee8(%rip),%rax        # 52e41 <pageinfo+0x1>
   40f59:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE)
   40f5c:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40f63:	00 
   40f64:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   40f6b:	00 
   40f6c:	0f 86 5f ff ff ff    	jbe    40ed1 <pageinfo_init+0x19>
    }
}
   40f72:	90                   	nop
   40f73:	90                   	nop
   40f74:	c9                   	leave  
   40f75:	c3                   	ret    

0000000000040f76 <check_page_table_mappings>:
// check_page_table_mappings
//    Check operating system invariants about kernel mappings for page
//    table `pt`. Panic if any of the invariants are false.

void check_page_table_mappings(x86_64_pagetable *pt)
{
   40f76:	f3 0f 1e fa          	endbr64 
   40f7a:	55                   	push   %rbp
   40f7b:	48 89 e5             	mov    %rsp,%rbp
   40f7e:	48 83 ec 50          	sub    $0x50,%rsp
   40f82:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    extern char start_data[], end[];
    assert(PTE_ADDR(pt) == (uintptr_t)pt);
   40f86:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40f8a:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   40f90:	48 89 c2             	mov    %rax,%rdx
   40f93:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40f97:	48 39 c2             	cmp    %rax,%rdx
   40f9a:	74 1e                	je     40fba <check_page_table_mappings+0x44>
   40f9c:	48 8d 05 9a 38 00 00 	lea    0x389a(%rip),%rax        # 4483d <console_clear+0x1f5>
   40fa3:	48 89 c2             	mov    %rax,%rdx
   40fa6:	be 13 02 00 00       	mov    $0x213,%esi
   40fab:	48 8d 05 26 37 00 00 	lea    0x3726(%rip),%rax        # 446d8 <console_clear+0x90>
   40fb2:	48 89 c7             	mov    %rax,%rdi
   40fb5:	e8 4a 1a 00 00       	call   42a04 <assert_fail>

    // kernel memory is identity mapped; data is writable
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t)end;
   40fba:	48 c7 45 f8 00 00 04 	movq   $0x40000,-0x8(%rbp)
   40fc1:	00 
   40fc2:	e9 b5 00 00 00       	jmp    4107c <check_page_table_mappings+0x106>
         va += PAGESIZE)
    {
        vamapping vam = virtual_memory_lookup(pt, va);
   40fc7:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   40fcb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40fcf:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   40fd3:	48 89 ce             	mov    %rcx,%rsi
   40fd6:	48 89 c7             	mov    %rax,%rdi
   40fd9:	e8 ee 21 00 00       	call   431cc <virtual_memory_lookup>
        if (vam.pa != va)
   40fde:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40fe2:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40fe6:	74 2c                	je     41014 <check_page_table_mappings+0x9e>
        {
            console_printf(CPOS(22, 0), 0xC000, "%p vs %p\n", va, vam.pa);
   40fe8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   40fec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40ff0:	49 89 d0             	mov    %rdx,%r8
   40ff3:	48 89 c1             	mov    %rax,%rcx
   40ff6:	48 8d 05 5e 38 00 00 	lea    0x385e(%rip),%rax        # 4485b <console_clear+0x213>
   40ffd:	48 89 c2             	mov    %rax,%rdx
   41000:	be 00 c0 00 00       	mov    $0xc000,%esi
   41005:	bf e0 06 00 00       	mov    $0x6e0,%edi
   4100a:	b8 00 00 00 00       	mov    $0x0,%eax
   4100f:	e8 be 34 00 00       	call   444d2 <console_printf>
        }
        assert(vam.pa == va);
   41014:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41018:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   4101c:	74 1e                	je     4103c <check_page_table_mappings+0xc6>
   4101e:	48 8d 05 40 38 00 00 	lea    0x3840(%rip),%rax        # 44865 <console_clear+0x21d>
   41025:	48 89 c2             	mov    %rax,%rdx
   41028:	be 1e 02 00 00       	mov    $0x21e,%esi
   4102d:	48 8d 05 a4 36 00 00 	lea    0x36a4(%rip),%rax        # 446d8 <console_clear+0x90>
   41034:	48 89 c7             	mov    %rax,%rdi
   41037:	e8 c8 19 00 00       	call   42a04 <assert_fail>
        if (va >= (uintptr_t)start_data)
   4103c:	48 8d 05 bd 4f 00 00 	lea    0x4fbd(%rip),%rax        # 46000 <disp_global>
   41043:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41047:	72 2b                	jb     41074 <check_page_table_mappings+0xfe>
        {
            assert(vam.perm & PTE_W);
   41049:	8b 45 d0             	mov    -0x30(%rbp),%eax
   4104c:	48 98                	cltq   
   4104e:	83 e0 02             	and    $0x2,%eax
   41051:	48 85 c0             	test   %rax,%rax
   41054:	75 1e                	jne    41074 <check_page_table_mappings+0xfe>
   41056:	48 8d 05 15 38 00 00 	lea    0x3815(%rip),%rax        # 44872 <console_clear+0x22a>
   4105d:	48 89 c2             	mov    %rax,%rdx
   41060:	be 21 02 00 00       	mov    $0x221,%esi
   41065:	48 8d 05 6c 36 00 00 	lea    0x366c(%rip),%rax        # 446d8 <console_clear+0x90>
   4106c:	48 89 c7             	mov    %rax,%rdi
   4106f:	e8 90 19 00 00       	call   42a04 <assert_fail>
         va += PAGESIZE)
   41074:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   4107b:	00 
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t)end;
   4107c:	48 8d 05 85 9f 01 00 	lea    0x19f85(%rip),%rax        # 5b008 <end>
   41083:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41087:	0f 82 3a ff ff ff    	jb     40fc7 <check_page_table_mappings+0x51>
        }
    }

    // kernel stack is identity mapped and writable
    uintptr_t kstack = KERNEL_STACK_TOP - PAGESIZE;
   4108d:	48 c7 45 f0 00 f0 07 	movq   $0x7f000,-0x10(%rbp)
   41094:	00 
    vamapping vam = virtual_memory_lookup(pt, kstack);
   41095:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
   41099:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   4109d:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   410a1:	48 89 ce             	mov    %rcx,%rsi
   410a4:	48 89 c7             	mov    %rax,%rdi
   410a7:	e8 20 21 00 00       	call   431cc <virtual_memory_lookup>
    assert(vam.pa == kstack);
   410ac:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   410b0:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   410b4:	74 1e                	je     410d4 <check_page_table_mappings+0x15e>
   410b6:	48 8d 05 c6 37 00 00 	lea    0x37c6(%rip),%rax        # 44883 <console_clear+0x23b>
   410bd:	48 89 c2             	mov    %rax,%rdx
   410c0:	be 28 02 00 00       	mov    $0x228,%esi
   410c5:	48 8d 05 0c 36 00 00 	lea    0x360c(%rip),%rax        # 446d8 <console_clear+0x90>
   410cc:	48 89 c7             	mov    %rax,%rdi
   410cf:	e8 30 19 00 00       	call   42a04 <assert_fail>
    assert(vam.perm & PTE_W);
   410d4:	8b 45 e8             	mov    -0x18(%rbp),%eax
   410d7:	48 98                	cltq   
   410d9:	83 e0 02             	and    $0x2,%eax
   410dc:	48 85 c0             	test   %rax,%rax
   410df:	75 1e                	jne    410ff <check_page_table_mappings+0x189>
   410e1:	48 8d 05 8a 37 00 00 	lea    0x378a(%rip),%rax        # 44872 <console_clear+0x22a>
   410e8:	48 89 c2             	mov    %rax,%rdx
   410eb:	be 29 02 00 00       	mov    $0x229,%esi
   410f0:	48 8d 05 e1 35 00 00 	lea    0x35e1(%rip),%rax        # 446d8 <console_clear+0x90>
   410f7:	48 89 c7             	mov    %rax,%rdi
   410fa:	e8 05 19 00 00       	call   42a04 <assert_fail>
}
   410ff:	90                   	nop
   41100:	c9                   	leave  
   41101:	c3                   	ret    

0000000000041102 <check_page_table_ownership>:

static void check_page_table_ownership_level(x86_64_pagetable *pt, int level,
                                             int owner, int refcount);

void check_page_table_ownership(x86_64_pagetable *pt, pid_t pid)
{
   41102:	f3 0f 1e fa          	endbr64 
   41106:	55                   	push   %rbp
   41107:	48 89 e5             	mov    %rsp,%rbp
   4110a:	48 83 ec 20          	sub    $0x20,%rsp
   4110e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   41112:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    // calculate expected reference count for page tables
    int owner = pid;
   41115:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41118:	89 45 fc             	mov    %eax,-0x4(%rbp)
    int expected_refcount = 1;
   4111b:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
    if (pt == kernel_pagetable)
   41122:	48 8b 05 d7 3e 01 00 	mov    0x13ed7(%rip),%rax        # 55000 <kernel_pagetable>
   41129:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
   4112d:	75 71                	jne    411a0 <check_page_table_ownership+0x9e>
    {
        owner = PO_KERNEL;
   4112f:	c7 45 fc fe ff ff ff 	movl   $0xfffffffe,-0x4(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid)
   41136:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   4113d:	eb 5b                	jmp    4119a <check_page_table_ownership+0x98>
        {
            if (processes[xpid].p_state != P_FREE && processes[xpid].p_pagetable == kernel_pagetable)
   4113f:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41142:	48 63 d0             	movslq %eax,%rdx
   41145:	48 89 d0             	mov    %rdx,%rax
   41148:	48 c1 e0 03          	shl    $0x3,%rax
   4114c:	48 29 d0             	sub    %rdx,%rax
   4114f:	48 c1 e0 05          	shl    $0x5,%rax
   41153:	48 89 c2             	mov    %rax,%rdx
   41156:	48 8d 05 8b 0f 01 00 	lea    0x10f8b(%rip),%rax        # 520e8 <processes+0xc8>
   4115d:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   41160:	85 c0                	test   %eax,%eax
   41162:	74 32                	je     41196 <check_page_table_ownership+0x94>
   41164:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41167:	48 63 d0             	movslq %eax,%rdx
   4116a:	48 89 d0             	mov    %rdx,%rax
   4116d:	48 c1 e0 03          	shl    $0x3,%rax
   41171:	48 29 d0             	sub    %rdx,%rax
   41174:	48 c1 e0 05          	shl    $0x5,%rax
   41178:	48 89 c2             	mov    %rax,%rdx
   4117b:	48 8d 05 6e 0f 01 00 	lea    0x10f6e(%rip),%rax        # 520f0 <processes+0xd0>
   41182:	48 8b 14 02          	mov    (%rdx,%rax,1),%rdx
   41186:	48 8b 05 73 3e 01 00 	mov    0x13e73(%rip),%rax        # 55000 <kernel_pagetable>
   4118d:	48 39 c2             	cmp    %rax,%rdx
   41190:	75 04                	jne    41196 <check_page_table_ownership+0x94>
            {
                ++expected_refcount;
   41192:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid)
   41196:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   4119a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%rbp)
   4119e:	7e 9f                	jle    4113f <check_page_table_ownership+0x3d>
            }
        }
    }
    check_page_table_ownership_level(pt, 0, owner, expected_refcount);
   411a0:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   411a3:	8b 55 fc             	mov    -0x4(%rbp),%edx
   411a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   411aa:	be 00 00 00 00       	mov    $0x0,%esi
   411af:	48 89 c7             	mov    %rax,%rdi
   411b2:	e8 03 00 00 00       	call   411ba <check_page_table_ownership_level>
}
   411b7:	90                   	nop
   411b8:	c9                   	leave  
   411b9:	c3                   	ret    

00000000000411ba <check_page_table_ownership_level>:

static void check_page_table_ownership_level(x86_64_pagetable *pt, int level,
                                             int owner, int refcount)
{
   411ba:	f3 0f 1e fa          	endbr64 
   411be:	55                   	push   %rbp
   411bf:	48 89 e5             	mov    %rsp,%rbp
   411c2:	48 83 ec 30          	sub    $0x30,%rsp
   411c6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   411ca:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   411cd:	89 55 e0             	mov    %edx,-0x20(%rbp)
   411d0:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    assert(PAGENUMBER(pt) < NPAGES);
   411d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   411d7:	48 c1 e8 0c          	shr    $0xc,%rax
   411db:	3d ff 01 00 00       	cmp    $0x1ff,%eax
   411e0:	7e 1e                	jle    41200 <check_page_table_ownership_level+0x46>
   411e2:	48 8d 05 ab 36 00 00 	lea    0x36ab(%rip),%rax        # 44894 <console_clear+0x24c>
   411e9:	48 89 c2             	mov    %rax,%rdx
   411ec:	be 49 02 00 00       	mov    $0x249,%esi
   411f1:	48 8d 05 e0 34 00 00 	lea    0x34e0(%rip),%rax        # 446d8 <console_clear+0x90>
   411f8:	48 89 c7             	mov    %rax,%rdi
   411fb:	e8 04 18 00 00       	call   42a04 <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].owner == owner);
   41200:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41204:	48 c1 e8 0c          	shr    $0xc,%rax
   41208:	48 98                	cltq   
   4120a:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4120e:	48 8d 05 2b 1c 01 00 	lea    0x11c2b(%rip),%rax        # 52e40 <pageinfo>
   41215:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41219:	0f be c0             	movsbl %al,%eax
   4121c:	39 45 e0             	cmp    %eax,-0x20(%rbp)
   4121f:	74 1e                	je     4123f <check_page_table_ownership_level+0x85>
   41221:	48 8d 05 88 36 00 00 	lea    0x3688(%rip),%rax        # 448b0 <console_clear+0x268>
   41228:	48 89 c2             	mov    %rax,%rdx
   4122b:	be 4a 02 00 00       	mov    $0x24a,%esi
   41230:	48 8d 05 a1 34 00 00 	lea    0x34a1(%rip),%rax        # 446d8 <console_clear+0x90>
   41237:	48 89 c7             	mov    %rax,%rdi
   4123a:	e8 c5 17 00 00       	call   42a04 <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].refcount == refcount);
   4123f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41243:	48 c1 e8 0c          	shr    $0xc,%rax
   41247:	48 98                	cltq   
   41249:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4124d:	48 8d 05 ed 1b 01 00 	lea    0x11bed(%rip),%rax        # 52e41 <pageinfo+0x1>
   41254:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41258:	0f be c0             	movsbl %al,%eax
   4125b:	39 45 dc             	cmp    %eax,-0x24(%rbp)
   4125e:	74 1e                	je     4127e <check_page_table_ownership_level+0xc4>
   41260:	48 8d 05 71 36 00 00 	lea    0x3671(%rip),%rax        # 448d8 <console_clear+0x290>
   41267:	48 89 c2             	mov    %rax,%rdx
   4126a:	be 4b 02 00 00       	mov    $0x24b,%esi
   4126f:	48 8d 05 62 34 00 00 	lea    0x3462(%rip),%rax        # 446d8 <console_clear+0x90>
   41276:	48 89 c7             	mov    %rax,%rdi
   41279:	e8 86 17 00 00       	call   42a04 <assert_fail>
    if (level < 3)
   4127e:	83 7d e4 02          	cmpl   $0x2,-0x1c(%rbp)
   41282:	7f 5b                	jg     412df <check_page_table_ownership_level+0x125>
    {
        for (int index = 0; index < NPAGETABLEENTRIES; ++index)
   41284:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4128b:	eb 49                	jmp    412d6 <check_page_table_ownership_level+0x11c>
        {
            if (pt->entry[index])
   4128d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41291:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41294:	48 63 d2             	movslq %edx,%rdx
   41297:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   4129b:	48 85 c0             	test   %rax,%rax
   4129e:	74 32                	je     412d2 <check_page_table_ownership_level+0x118>
            {
                x86_64_pagetable *nextpt =
                    (x86_64_pagetable *)PTE_ADDR(pt->entry[index]);
   412a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   412a4:	8b 55 fc             	mov    -0x4(%rbp),%edx
   412a7:	48 63 d2             	movslq %edx,%rdx
   412aa:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   412ae:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
                x86_64_pagetable *nextpt =
   412b4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
                check_page_table_ownership_level(nextpt, level + 1, owner, 1);
   412b8:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   412bb:	8d 70 01             	lea    0x1(%rax),%esi
   412be:	8b 55 e0             	mov    -0x20(%rbp),%edx
   412c1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   412c5:	b9 01 00 00 00       	mov    $0x1,%ecx
   412ca:	48 89 c7             	mov    %rax,%rdi
   412cd:	e8 e8 fe ff ff       	call   411ba <check_page_table_ownership_level>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index)
   412d2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   412d6:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   412dd:	7e ae                	jle    4128d <check_page_table_ownership_level+0xd3>
            }
        }
    }
}
   412df:	90                   	nop
   412e0:	c9                   	leave  
   412e1:	c3                   	ret    

00000000000412e2 <check_virtual_memory>:
// check_virtual_memory
//    Check operating system invariants about virtual memory. Panic if any
//    of the invariants are false.

void check_virtual_memory(void)
{
   412e2:	f3 0f 1e fa          	endbr64 
   412e6:	55                   	push   %rbp
   412e7:	48 89 e5             	mov    %rsp,%rbp
   412ea:	48 83 ec 10          	sub    $0x10,%rsp
    // Process 0 must never be used.
    assert(processes[0].p_state == P_FREE);
   412ee:	8b 05 f4 0d 01 00    	mov    0x10df4(%rip),%eax        # 520e8 <processes+0xc8>
   412f4:	85 c0                	test   %eax,%eax
   412f6:	74 1e                	je     41316 <check_virtual_memory+0x34>
   412f8:	48 8d 05 09 36 00 00 	lea    0x3609(%rip),%rax        # 44908 <console_clear+0x2c0>
   412ff:	48 89 c2             	mov    %rax,%rdx
   41302:	be 61 02 00 00       	mov    $0x261,%esi
   41307:	48 8d 05 ca 33 00 00 	lea    0x33ca(%rip),%rax        # 446d8 <console_clear+0x90>
   4130e:	48 89 c7             	mov    %rax,%rdi
   41311:	e8 ee 16 00 00       	call   42a04 <assert_fail>
    // that don't have their own page tables.
    // Active processes have their own page tables. A process page table
    // should be owned by that process and have reference count 1.
    // All level-2-4 page tables must have reference count 1.

    check_page_table_mappings(kernel_pagetable);
   41316:	48 8b 05 e3 3c 01 00 	mov    0x13ce3(%rip),%rax        # 55000 <kernel_pagetable>
   4131d:	48 89 c7             	mov    %rax,%rdi
   41320:	e8 51 fc ff ff       	call   40f76 <check_page_table_mappings>
    check_page_table_ownership(kernel_pagetable, -1);
   41325:	48 8b 05 d4 3c 01 00 	mov    0x13cd4(%rip),%rax        # 55000 <kernel_pagetable>
   4132c:	be ff ff ff ff       	mov    $0xffffffff,%esi
   41331:	48 89 c7             	mov    %rax,%rdi
   41334:	e8 c9 fd ff ff       	call   41102 <check_page_table_ownership>

    for (int pid = 0; pid < NPROC; ++pid)
   41339:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41340:	e9 b4 00 00 00       	jmp    413f9 <check_virtual_memory+0x117>
    {
        if (processes[pid].p_state != P_FREE && processes[pid].p_pagetable != kernel_pagetable)
   41345:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41348:	48 63 d0             	movslq %eax,%rdx
   4134b:	48 89 d0             	mov    %rdx,%rax
   4134e:	48 c1 e0 03          	shl    $0x3,%rax
   41352:	48 29 d0             	sub    %rdx,%rax
   41355:	48 c1 e0 05          	shl    $0x5,%rax
   41359:	48 89 c2             	mov    %rax,%rdx
   4135c:	48 8d 05 85 0d 01 00 	lea    0x10d85(%rip),%rax        # 520e8 <processes+0xc8>
   41363:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   41366:	85 c0                	test   %eax,%eax
   41368:	0f 84 87 00 00 00    	je     413f5 <check_virtual_memory+0x113>
   4136e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41371:	48 63 d0             	movslq %eax,%rdx
   41374:	48 89 d0             	mov    %rdx,%rax
   41377:	48 c1 e0 03          	shl    $0x3,%rax
   4137b:	48 29 d0             	sub    %rdx,%rax
   4137e:	48 c1 e0 05          	shl    $0x5,%rax
   41382:	48 89 c2             	mov    %rax,%rdx
   41385:	48 8d 05 64 0d 01 00 	lea    0x10d64(%rip),%rax        # 520f0 <processes+0xd0>
   4138c:	48 8b 14 02          	mov    (%rdx,%rax,1),%rdx
   41390:	48 8b 05 69 3c 01 00 	mov    0x13c69(%rip),%rax        # 55000 <kernel_pagetable>
   41397:	48 39 c2             	cmp    %rax,%rdx
   4139a:	74 59                	je     413f5 <check_virtual_memory+0x113>
        {
            check_page_table_mappings(processes[pid].p_pagetable);
   4139c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4139f:	48 63 d0             	movslq %eax,%rdx
   413a2:	48 89 d0             	mov    %rdx,%rax
   413a5:	48 c1 e0 03          	shl    $0x3,%rax
   413a9:	48 29 d0             	sub    %rdx,%rax
   413ac:	48 c1 e0 05          	shl    $0x5,%rax
   413b0:	48 89 c2             	mov    %rax,%rdx
   413b3:	48 8d 05 36 0d 01 00 	lea    0x10d36(%rip),%rax        # 520f0 <processes+0xd0>
   413ba:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   413be:	48 89 c7             	mov    %rax,%rdi
   413c1:	e8 b0 fb ff ff       	call   40f76 <check_page_table_mappings>
            check_page_table_ownership(processes[pid].p_pagetable, pid);
   413c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
   413c9:	48 63 d0             	movslq %eax,%rdx
   413cc:	48 89 d0             	mov    %rdx,%rax
   413cf:	48 c1 e0 03          	shl    $0x3,%rax
   413d3:	48 29 d0             	sub    %rdx,%rax
   413d6:	48 c1 e0 05          	shl    $0x5,%rax
   413da:	48 89 c2             	mov    %rax,%rdx
   413dd:	48 8d 05 0c 0d 01 00 	lea    0x10d0c(%rip),%rax        # 520f0 <processes+0xd0>
   413e4:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   413e8:	8b 55 fc             	mov    -0x4(%rbp),%edx
   413eb:	89 d6                	mov    %edx,%esi
   413ed:	48 89 c7             	mov    %rax,%rdi
   413f0:	e8 0d fd ff ff       	call   41102 <check_page_table_ownership>
    for (int pid = 0; pid < NPROC; ++pid)
   413f5:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   413f9:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   413fd:	0f 8e 42 ff ff ff    	jle    41345 <check_virtual_memory+0x63>
        }
    }

    // Check that all referenced pages refer to active processes
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn)
   41403:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   4140a:	e9 8b 00 00 00       	jmp    4149a <check_virtual_memory+0x1b8>
    {
        if (pageinfo[pn].refcount > 0 && pageinfo[pn].owner >= 0)
   4140f:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41412:	48 98                	cltq   
   41414:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41418:	48 8d 05 22 1a 01 00 	lea    0x11a22(%rip),%rax        # 52e41 <pageinfo+0x1>
   4141f:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41423:	84 c0                	test   %al,%al
   41425:	7e 6f                	jle    41496 <check_virtual_memory+0x1b4>
   41427:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4142a:	48 98                	cltq   
   4142c:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41430:	48 8d 05 09 1a 01 00 	lea    0x11a09(%rip),%rax        # 52e40 <pageinfo>
   41437:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4143b:	84 c0                	test   %al,%al
   4143d:	78 57                	js     41496 <check_virtual_memory+0x1b4>
        {
            assert(processes[pageinfo[pn].owner].p_state != P_FREE);
   4143f:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41442:	48 98                	cltq   
   41444:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41448:	48 8d 05 f1 19 01 00 	lea    0x119f1(%rip),%rax        # 52e40 <pageinfo>
   4144f:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41453:	0f be c0             	movsbl %al,%eax
   41456:	48 63 d0             	movslq %eax,%rdx
   41459:	48 89 d0             	mov    %rdx,%rax
   4145c:	48 c1 e0 03          	shl    $0x3,%rax
   41460:	48 29 d0             	sub    %rdx,%rax
   41463:	48 c1 e0 05          	shl    $0x5,%rax
   41467:	48 89 c2             	mov    %rax,%rdx
   4146a:	48 8d 05 77 0c 01 00 	lea    0x10c77(%rip),%rax        # 520e8 <processes+0xc8>
   41471:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   41474:	85 c0                	test   %eax,%eax
   41476:	75 1e                	jne    41496 <check_virtual_memory+0x1b4>
   41478:	48 8d 05 a9 34 00 00 	lea    0x34a9(%rip),%rax        # 44928 <console_clear+0x2e0>
   4147f:	48 89 c2             	mov    %rax,%rdx
   41482:	be 7b 02 00 00       	mov    $0x27b,%esi
   41487:	48 8d 05 4a 32 00 00 	lea    0x324a(%rip),%rax        # 446d8 <console_clear+0x90>
   4148e:	48 89 c7             	mov    %rax,%rdi
   41491:	e8 6e 15 00 00       	call   42a04 <assert_fail>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn)
   41496:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   4149a:	81 7d f8 ff 01 00 00 	cmpl   $0x1ff,-0x8(%rbp)
   414a1:	0f 8e 68 ff ff ff    	jle    4140f <check_virtual_memory+0x12d>
        }
    }
}
   414a7:	90                   	nop
   414a8:	90                   	nop
   414a9:	c9                   	leave  
   414aa:	c3                   	ret    

00000000000414ab <memshow_physical>:
    'E' | 0x0E00, 'F' | 0x0F00, 'S'};
#define SHARED_COLOR memstate_colors[18]
#define SHARED

void memshow_physical(void)
{
   414ab:	f3 0f 1e fa          	endbr64 
   414af:	55                   	push   %rbp
   414b0:	48 89 e5             	mov    %rsp,%rbp
   414b3:	48 83 ec 10          	sub    $0x10,%rsp
    console_printf(CPOS(0, 32), 0x0F00, "PHYSICAL MEMORY");
   414b7:	48 8d 05 c8 34 00 00 	lea    0x34c8(%rip),%rax        # 44986 <memstate_colors+0x26>
   414be:	48 89 c2             	mov    %rax,%rdx
   414c1:	be 00 0f 00 00       	mov    $0xf00,%esi
   414c6:	bf 20 00 00 00       	mov    $0x20,%edi
   414cb:	b8 00 00 00 00       	mov    $0x0,%eax
   414d0:	e8 fd 2f 00 00       	call   444d2 <console_printf>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn)
   414d5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   414dc:	e9 1b 01 00 00       	jmp    415fc <memshow_physical+0x151>
    {
        if (pn % 64 == 0)
   414e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
   414e4:	83 e0 3f             	and    $0x3f,%eax
   414e7:	85 c0                	test   %eax,%eax
   414e9:	75 40                	jne    4152b <memshow_physical+0x80>
        {
            console_printf(CPOS(1 + pn / 64, 3), 0x0F00, "0x%06X ", pn << 12);
   414eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
   414ee:	c1 e0 0c             	shl    $0xc,%eax
   414f1:	89 c2                	mov    %eax,%edx
   414f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
   414f6:	8d 48 3f             	lea    0x3f(%rax),%ecx
   414f9:	85 c0                	test   %eax,%eax
   414fb:	0f 48 c1             	cmovs  %ecx,%eax
   414fe:	c1 f8 06             	sar    $0x6,%eax
   41501:	8d 48 01             	lea    0x1(%rax),%ecx
   41504:	89 c8                	mov    %ecx,%eax
   41506:	c1 e0 02             	shl    $0x2,%eax
   41509:	01 c8                	add    %ecx,%eax
   4150b:	c1 e0 04             	shl    $0x4,%eax
   4150e:	83 c0 03             	add    $0x3,%eax
   41511:	89 d1                	mov    %edx,%ecx
   41513:	48 8d 15 7c 34 00 00 	lea    0x347c(%rip),%rdx        # 44996 <memstate_colors+0x36>
   4151a:	be 00 0f 00 00       	mov    $0xf00,%esi
   4151f:	89 c7                	mov    %eax,%edi
   41521:	b8 00 00 00 00       	mov    $0x0,%eax
   41526:	e8 a7 2f 00 00       	call   444d2 <console_printf>
        }

        int owner = pageinfo[pn].owner;
   4152b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4152e:	48 98                	cltq   
   41530:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41534:	48 8d 05 05 19 01 00 	lea    0x11905(%rip),%rax        # 52e40 <pageinfo>
   4153b:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4153f:	0f be c0             	movsbl %al,%eax
   41542:	89 45 f8             	mov    %eax,-0x8(%rbp)
        if (pageinfo[pn].refcount == 0)
   41545:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41548:	48 98                	cltq   
   4154a:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4154e:	48 8d 05 ec 18 01 00 	lea    0x118ec(%rip),%rax        # 52e41 <pageinfo+0x1>
   41555:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41559:	84 c0                	test   %al,%al
   4155b:	75 07                	jne    41564 <memshow_physical+0xb9>
        {
            owner = PO_FREE;
   4155d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
        }
        uint16_t color = memstate_colors[owner - PO_KERNEL];
   41564:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41567:	83 c0 02             	add    $0x2,%eax
   4156a:	48 98                	cltq   
   4156c:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41570:	48 8d 05 e9 33 00 00 	lea    0x33e9(%rip),%rax        # 44960 <memstate_colors>
   41577:	0f b7 04 02          	movzwl (%rdx,%rax,1),%eax
   4157b:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
        // darker color for shared pages
        if (pageinfo[pn].refcount > 1 && pn != PAGENUMBER(CONSOLE_ADDR))
   4157f:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41582:	48 98                	cltq   
   41584:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41588:	48 8d 05 b2 18 01 00 	lea    0x118b2(%rip),%rax        # 52e41 <pageinfo+0x1>
   4158f:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41593:	3c 01                	cmp    $0x1,%al
   41595:	7e 1c                	jle    415b3 <memshow_physical+0x108>
   41597:	48 8d 05 62 6a 07 00 	lea    0x76a62(%rip),%rax        # b8000 <console>
   4159e:	48 c1 e8 0c          	shr    $0xc,%rax
   415a2:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   415a5:	74 0c                	je     415b3 <memshow_physical+0x108>
        {
#ifdef SHARED
            color = SHARED_COLOR | 0x0F00;
   415a7:	b8 53 00 00 00       	mov    $0x53,%eax
   415ac:	80 cc 0f             	or     $0xf,%ah
   415af:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
#else
            color &= 0x77FF;
#endif
        }

        console[CPOS(1 + pn / 64, 12 + pn % 64)] = color;
   415b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
   415b6:	8d 50 3f             	lea    0x3f(%rax),%edx
   415b9:	85 c0                	test   %eax,%eax
   415bb:	0f 48 c2             	cmovs  %edx,%eax
   415be:	c1 f8 06             	sar    $0x6,%eax
   415c1:	8d 50 01             	lea    0x1(%rax),%edx
   415c4:	89 d0                	mov    %edx,%eax
   415c6:	c1 e0 02             	shl    $0x2,%eax
   415c9:	01 d0                	add    %edx,%eax
   415cb:	c1 e0 04             	shl    $0x4,%eax
   415ce:	89 c1                	mov    %eax,%ecx
   415d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
   415d3:	99                   	cltd   
   415d4:	c1 ea 1a             	shr    $0x1a,%edx
   415d7:	01 d0                	add    %edx,%eax
   415d9:	83 e0 3f             	and    $0x3f,%eax
   415dc:	29 d0                	sub    %edx,%eax
   415de:	83 c0 0c             	add    $0xc,%eax
   415e1:	01 c8                	add    %ecx,%eax
   415e3:	48 98                	cltq   
   415e5:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   415e9:	48 8d 15 10 6a 07 00 	lea    0x76a10(%rip),%rdx        # b8000 <console>
   415f0:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   415f4:	66 89 04 11          	mov    %ax,(%rcx,%rdx,1)
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn)
   415f8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   415fc:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   41603:	0f 8e d8 fe ff ff    	jle    414e1 <memshow_physical+0x36>
    }
}
   41609:	90                   	nop
   4160a:	90                   	nop
   4160b:	c9                   	leave  
   4160c:	c3                   	ret    

000000000004160d <memshow_virtual>:
// memshow_virtual(pagetable, name)
//    Draw a picture of the virtual memory map `pagetable` (named `name`) on
//    the CGA console.

void memshow_virtual(x86_64_pagetable *pagetable, const char *name)
{
   4160d:	f3 0f 1e fa          	endbr64 
   41611:	55                   	push   %rbp
   41612:	48 89 e5             	mov    %rsp,%rbp
   41615:	48 83 ec 40          	sub    $0x40,%rsp
   41619:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   4161d:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    assert((uintptr_t)pagetable == PTE_ADDR(pagetable));
   41621:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41625:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   4162b:	48 89 c2             	mov    %rax,%rdx
   4162e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41632:	48 39 c2             	cmp    %rax,%rdx
   41635:	74 1e                	je     41655 <memshow_virtual+0x48>
   41637:	48 8d 05 62 33 00 00 	lea    0x3362(%rip),%rax        # 449a0 <memstate_colors+0x40>
   4163e:	48 89 c2             	mov    %rax,%rdx
   41641:	be b0 02 00 00       	mov    $0x2b0,%esi
   41646:	48 8d 05 8b 30 00 00 	lea    0x308b(%rip),%rax        # 446d8 <console_clear+0x90>
   4164d:	48 89 c7             	mov    %rax,%rdi
   41650:	e8 af 13 00 00       	call   42a04 <assert_fail>

    console_printf(CPOS(10, 26), 0x0F00, "VIRTUAL ADDRESS SPACE FOR %s", name);
   41655:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   41659:	48 89 c1             	mov    %rax,%rcx
   4165c:	48 8d 05 69 33 00 00 	lea    0x3369(%rip),%rax        # 449cc <memstate_colors+0x6c>
   41663:	48 89 c2             	mov    %rax,%rdx
   41666:	be 00 0f 00 00       	mov    $0xf00,%esi
   4166b:	bf 3a 03 00 00       	mov    $0x33a,%edi
   41670:	b8 00 00 00 00       	mov    $0x0,%eax
   41675:	e8 58 2e 00 00       	call   444d2 <console_printf>
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE)
   4167a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   41681:	00 
   41682:	e9 b4 01 00 00       	jmp    4183b <memshow_virtual+0x22e>
    {
        vamapping vam = virtual_memory_lookup(pagetable, va);
   41687:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4168b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4168f:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   41693:	48 89 ce             	mov    %rcx,%rsi
   41696:	48 89 c7             	mov    %rax,%rdi
   41699:	e8 2e 1b 00 00       	call   431cc <virtual_memory_lookup>
        uint16_t color;
        if (vam.pn < 0)
   4169e:	8b 45 d0             	mov    -0x30(%rbp),%eax
   416a1:	85 c0                	test   %eax,%eax
   416a3:	79 0b                	jns    416b0 <memshow_virtual+0xa3>
        {
            color = ' ';
   416a5:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%rbp)
   416ab:	e9 ff 00 00 00       	jmp    417af <memshow_virtual+0x1a2>
        }
        else
        {
            assert(vam.pa < MEMSIZE_PHYSICAL);
   416b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   416b4:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   416ba:	76 1e                	jbe    416da <memshow_virtual+0xcd>
   416bc:	48 8d 05 26 33 00 00 	lea    0x3326(%rip),%rax        # 449e9 <memstate_colors+0x89>
   416c3:	48 89 c2             	mov    %rax,%rdx
   416c6:	be bd 02 00 00       	mov    $0x2bd,%esi
   416cb:	48 8d 05 06 30 00 00 	lea    0x3006(%rip),%rax        # 446d8 <console_clear+0x90>
   416d2:	48 89 c7             	mov    %rax,%rdi
   416d5:	e8 2a 13 00 00       	call   42a04 <assert_fail>
            int owner = pageinfo[vam.pn].owner;
   416da:	8b 45 d0             	mov    -0x30(%rbp),%eax
   416dd:	48 98                	cltq   
   416df:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   416e3:	48 8d 05 56 17 01 00 	lea    0x11756(%rip),%rax        # 52e40 <pageinfo>
   416ea:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   416ee:	0f be c0             	movsbl %al,%eax
   416f1:	89 45 f0             	mov    %eax,-0x10(%rbp)
            if (pageinfo[vam.pn].refcount == 0)
   416f4:	8b 45 d0             	mov    -0x30(%rbp),%eax
   416f7:	48 98                	cltq   
   416f9:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   416fd:	48 8d 05 3d 17 01 00 	lea    0x1173d(%rip),%rax        # 52e41 <pageinfo+0x1>
   41704:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41708:	84 c0                	test   %al,%al
   4170a:	75 07                	jne    41713 <memshow_virtual+0x106>
            {
                owner = PO_FREE;
   4170c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
            }
            color = memstate_colors[owner - PO_KERNEL];
   41713:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41716:	83 c0 02             	add    $0x2,%eax
   41719:	48 98                	cltq   
   4171b:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4171f:	48 8d 05 3a 32 00 00 	lea    0x323a(%rip),%rax        # 44960 <memstate_colors>
   41726:	0f b7 04 02          	movzwl (%rdx,%rax,1),%eax
   4172a:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            // reverse video for user-accessible pages
            if (vam.perm & PTE_U)
   4172e:	8b 45 e0             	mov    -0x20(%rbp),%eax
   41731:	48 98                	cltq   
   41733:	83 e0 04             	and    $0x4,%eax
   41736:	48 85 c0             	test   %rax,%rax
   41739:	74 27                	je     41762 <memshow_virtual+0x155>
            {
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4) | (color & 0x00FF);
   4173b:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   4173f:	c1 e0 04             	shl    $0x4,%eax
   41742:	66 25 00 f0          	and    $0xf000,%ax
   41746:	89 c2                	mov    %eax,%edx
   41748:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   4174c:	c1 f8 04             	sar    $0x4,%eax
   4174f:	66 25 00 0f          	and    $0xf00,%ax
   41753:	09 c2                	or     %eax,%edx
   41755:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41759:	0f b6 c0             	movzbl %al,%eax
   4175c:	09 d0                	or     %edx,%eax
   4175e:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            }
            // darker color for shared pages
            if (pageinfo[vam.pn].refcount > 1 && va != CONSOLE_ADDR)
   41762:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41765:	48 98                	cltq   
   41767:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4176b:	48 8d 05 cf 16 01 00 	lea    0x116cf(%rip),%rax        # 52e41 <pageinfo+0x1>
   41772:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41776:	3c 01                	cmp    $0x1,%al
   41778:	7e 35                	jle    417af <memshow_virtual+0x1a2>
   4177a:	48 8d 05 7f 68 07 00 	lea    0x7687f(%rip),%rax        # b8000 <console>
   41781:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   41785:	74 28                	je     417af <memshow_virtual+0x1a2>
            {
#ifdef SHARED
                color = (SHARED_COLOR | (color & 0xF000));
   41787:	b8 53 00 00 00       	mov    $0x53,%eax
   4178c:	89 c2                	mov    %eax,%edx
   4178e:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41792:	66 25 00 f0          	and    $0xf000,%ax
   41796:	09 d0                	or     %edx,%eax
   41798:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
                if (!(vam.perm & PTE_U))
   4179c:	8b 45 e0             	mov    -0x20(%rbp),%eax
   4179f:	48 98                	cltq   
   417a1:	83 e0 04             	and    $0x4,%eax
   417a4:	48 85 c0             	test   %rax,%rax
   417a7:	75 06                	jne    417af <memshow_virtual+0x1a2>
                    color = color | 0x0F00;
   417a9:	66 81 4d f6 00 0f    	orw    $0xf00,-0xa(%rbp)
#else
                color &= 0x77FF;
#endif
            }
        }
        uint32_t pn = PAGENUMBER(va);
   417af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   417b3:	48 c1 e8 0c          	shr    $0xc,%rax
   417b7:	89 45 ec             	mov    %eax,-0x14(%rbp)
        if (pn % 64 == 0)
   417ba:	8b 45 ec             	mov    -0x14(%rbp),%eax
   417bd:	83 e0 3f             	and    $0x3f,%eax
   417c0:	85 c0                	test   %eax,%eax
   417c2:	75 39                	jne    417fd <memshow_virtual+0x1f0>
        {
            console_printf(CPOS(11 + pn / 64, 3), 0x0F00, "0x%06X ", va);
   417c4:	8b 45 ec             	mov    -0x14(%rbp),%eax
   417c7:	c1 e8 06             	shr    $0x6,%eax
   417ca:	89 c2                	mov    %eax,%edx
   417cc:	89 d0                	mov    %edx,%eax
   417ce:	c1 e0 02             	shl    $0x2,%eax
   417d1:	01 d0                	add    %edx,%eax
   417d3:	c1 e0 04             	shl    $0x4,%eax
   417d6:	05 73 03 00 00       	add    $0x373,%eax
   417db:	89 c7                	mov    %eax,%edi
   417dd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   417e1:	48 89 c1             	mov    %rax,%rcx
   417e4:	48 8d 05 ab 31 00 00 	lea    0x31ab(%rip),%rax        # 44996 <memstate_colors+0x36>
   417eb:	48 89 c2             	mov    %rax,%rdx
   417ee:	be 00 0f 00 00       	mov    $0xf00,%esi
   417f3:	b8 00 00 00 00       	mov    $0x0,%eax
   417f8:	e8 d5 2c 00 00       	call   444d2 <console_printf>
        }
        console[CPOS(11 + pn / 64, 12 + pn % 64)] = color;
   417fd:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41800:	c1 e8 06             	shr    $0x6,%eax
   41803:	89 c2                	mov    %eax,%edx
   41805:	89 d0                	mov    %edx,%eax
   41807:	c1 e0 02             	shl    $0x2,%eax
   4180a:	01 d0                	add    %edx,%eax
   4180c:	c1 e0 04             	shl    $0x4,%eax
   4180f:	89 c2                	mov    %eax,%edx
   41811:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41814:	83 e0 3f             	and    $0x3f,%eax
   41817:	01 d0                	add    %edx,%eax
   41819:	05 7c 03 00 00       	add    $0x37c,%eax
   4181e:	89 c0                	mov    %eax,%eax
   41820:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   41824:	48 8d 15 d5 67 07 00 	lea    0x767d5(%rip),%rdx        # b8000 <console>
   4182b:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   4182f:	66 89 04 11          	mov    %ax,(%rcx,%rdx,1)
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE)
   41833:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   4183a:	00 
   4183b:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   41842:	00 
   41843:	0f 86 3e fe ff ff    	jbe    41687 <memshow_virtual+0x7a>
    }
}
   41849:	90                   	nop
   4184a:	90                   	nop
   4184b:	c9                   	leave  
   4184c:	c3                   	ret    

000000000004184d <memshow_virtual_animate>:
// memshow_virtual_animate
//    Draw a picture of process virtual memory maps on the CGA console.
//    Starts with process 1, then switches to a new process every 0.25 sec.

void memshow_virtual_animate(void)
{
   4184d:	f3 0f 1e fa          	endbr64 
   41851:	55                   	push   %rbp
   41852:	48 89 e5             	mov    %rsp,%rbp
   41855:	48 83 ec 10          	sub    $0x10,%rsp
    static unsigned last_ticks = 0;
    static int showing = 1;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2)
   41859:	8b 05 e1 19 01 00    	mov    0x119e1(%rip),%eax        # 53240 <last_ticks.1>
   4185f:	85 c0                	test   %eax,%eax
   41861:	74 13                	je     41876 <memshow_virtual_animate+0x29>
   41863:	8b 05 b7 15 01 00    	mov    0x115b7(%rip),%eax        # 52e20 <ticks>
   41869:	8b 15 d1 19 01 00    	mov    0x119d1(%rip),%edx        # 53240 <last_ticks.1>
   4186f:	29 d0                	sub    %edx,%eax
   41871:	83 f8 31             	cmp    $0x31,%eax
   41874:	76 2c                	jbe    418a2 <memshow_virtual_animate+0x55>
    {
        last_ticks = ticks;
   41876:	8b 05 a4 15 01 00    	mov    0x115a4(%rip),%eax        # 52e20 <ticks>
   4187c:	89 05 be 19 01 00    	mov    %eax,0x119be(%rip)        # 53240 <last_ticks.1>
        ++showing;
   41882:	8b 05 7c 47 00 00    	mov    0x477c(%rip),%eax        # 46004 <showing.0>
   41888:	83 c0 01             	add    $0x1,%eax
   4188b:	89 05 73 47 00 00    	mov    %eax,0x4773(%rip)        # 46004 <showing.0>
    }

    // the current process may have died -- don't display it if so
    while (showing <= 2 * NPROC && (processes[showing % NPROC].p_state == P_FREE || processes[showing % NPROC].display_status == 0))
   41891:	eb 0f                	jmp    418a2 <memshow_virtual_animate+0x55>
    {
        ++showing;
   41893:	8b 05 6b 47 00 00    	mov    0x476b(%rip),%eax        # 46004 <showing.0>
   41899:	83 c0 01             	add    $0x1,%eax
   4189c:	89 05 62 47 00 00    	mov    %eax,0x4762(%rip)        # 46004 <showing.0>
    while (showing <= 2 * NPROC && (processes[showing % NPROC].p_state == P_FREE || processes[showing % NPROC].display_status == 0))
   418a2:	8b 05 5c 47 00 00    	mov    0x475c(%rip),%eax        # 46004 <showing.0>
   418a8:	83 f8 20             	cmp    $0x20,%eax
   418ab:	7f 6b                	jg     41918 <memshow_virtual_animate+0xcb>
   418ad:	8b 05 51 47 00 00    	mov    0x4751(%rip),%eax        # 46004 <showing.0>
   418b3:	99                   	cltd   
   418b4:	c1 ea 1c             	shr    $0x1c,%edx
   418b7:	01 d0                	add    %edx,%eax
   418b9:	83 e0 0f             	and    $0xf,%eax
   418bc:	29 d0                	sub    %edx,%eax
   418be:	48 63 d0             	movslq %eax,%rdx
   418c1:	48 89 d0             	mov    %rdx,%rax
   418c4:	48 c1 e0 03          	shl    $0x3,%rax
   418c8:	48 29 d0             	sub    %rdx,%rax
   418cb:	48 c1 e0 05          	shl    $0x5,%rax
   418cf:	48 89 c2             	mov    %rax,%rdx
   418d2:	48 8d 05 0f 08 01 00 	lea    0x1080f(%rip),%rax        # 520e8 <processes+0xc8>
   418d9:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   418dc:	85 c0                	test   %eax,%eax
   418de:	74 b3                	je     41893 <memshow_virtual_animate+0x46>
   418e0:	8b 05 1e 47 00 00    	mov    0x471e(%rip),%eax        # 46004 <showing.0>
   418e6:	99                   	cltd   
   418e7:	c1 ea 1c             	shr    $0x1c,%edx
   418ea:	01 d0                	add    %edx,%eax
   418ec:	83 e0 0f             	and    $0xf,%eax
   418ef:	29 d0                	sub    %edx,%eax
   418f1:	48 63 d0             	movslq %eax,%rdx
   418f4:	48 89 d0             	mov    %rdx,%rax
   418f7:	48 c1 e0 03          	shl    $0x3,%rax
   418fb:	48 29 d0             	sub    %rdx,%rax
   418fe:	48 c1 e0 05          	shl    $0x5,%rax
   41902:	48 89 c2             	mov    %rax,%rdx
   41905:	48 8d 05 ec 07 01 00 	lea    0x107ec(%rip),%rax        # 520f8 <processes+0xd8>
   4190c:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41910:	84 c0                	test   %al,%al
   41912:	0f 84 7b ff ff ff    	je     41893 <memshow_virtual_animate+0x46>
    }
    showing = showing % NPROC;
   41918:	8b 05 e6 46 00 00    	mov    0x46e6(%rip),%eax        # 46004 <showing.0>
   4191e:	99                   	cltd   
   4191f:	c1 ea 1c             	shr    $0x1c,%edx
   41922:	01 d0                	add    %edx,%eax
   41924:	83 e0 0f             	and    $0xf,%eax
   41927:	29 d0                	sub    %edx,%eax
   41929:	89 05 d5 46 00 00    	mov    %eax,0x46d5(%rip)        # 46004 <showing.0>

    if (processes[showing].p_state != P_FREE)
   4192f:	8b 05 cf 46 00 00    	mov    0x46cf(%rip),%eax        # 46004 <showing.0>
   41935:	48 63 d0             	movslq %eax,%rdx
   41938:	48 89 d0             	mov    %rdx,%rax
   4193b:	48 c1 e0 03          	shl    $0x3,%rax
   4193f:	48 29 d0             	sub    %rdx,%rax
   41942:	48 c1 e0 05          	shl    $0x5,%rax
   41946:	48 89 c2             	mov    %rax,%rdx
   41949:	48 8d 05 98 07 01 00 	lea    0x10798(%rip),%rax        # 520e8 <processes+0xc8>
   41950:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   41953:	85 c0                	test   %eax,%eax
   41955:	74 59                	je     419b0 <memshow_virtual_animate+0x163>
    {
        char s[4];
        snprintf(s, 4, "%d ", showing);
   41957:	8b 15 a7 46 00 00    	mov    0x46a7(%rip),%edx        # 46004 <showing.0>
   4195d:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
   41961:	89 d1                	mov    %edx,%ecx
   41963:	48 8d 15 99 30 00 00 	lea    0x3099(%rip),%rdx        # 44a03 <memstate_colors+0xa3>
   4196a:	be 04 00 00 00       	mov    $0x4,%esi
   4196f:	48 89 c7             	mov    %rax,%rdi
   41972:	b8 00 00 00 00       	mov    $0x0,%eax
   41977:	e8 71 2c 00 00       	call   445ed <snprintf>
        memshow_virtual(processes[showing].p_pagetable, s);
   4197c:	8b 05 82 46 00 00    	mov    0x4682(%rip),%eax        # 46004 <showing.0>
   41982:	48 63 d0             	movslq %eax,%rdx
   41985:	48 89 d0             	mov    %rdx,%rax
   41988:	48 c1 e0 03          	shl    $0x3,%rax
   4198c:	48 29 d0             	sub    %rdx,%rax
   4198f:	48 c1 e0 05          	shl    $0x5,%rax
   41993:	48 89 c2             	mov    %rax,%rdx
   41996:	48 8d 05 53 07 01 00 	lea    0x10753(%rip),%rax        # 520f0 <processes+0xd0>
   4199d:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   419a1:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
   419a5:	48 89 d6             	mov    %rdx,%rsi
   419a8:	48 89 c7             	mov    %rax,%rdi
   419ab:	e8 5d fc ff ff       	call   4160d <memshow_virtual>
    }
}
   419b0:	90                   	nop
   419b1:	c9                   	leave  
   419b2:	c3                   	ret    

00000000000419b3 <hardware_init>:

static void segments_init(void);
static void interrupt_init(void);
extern void virtual_memory_init(void);

void hardware_init(void) {
   419b3:	f3 0f 1e fa          	endbr64 
   419b7:	55                   	push   %rbp
   419b8:	48 89 e5             	mov    %rsp,%rbp
    segments_init();
   419bb:	e8 5f 01 00 00       	call   41b1f <segments_init>
    interrupt_init();
   419c0:	e8 44 04 00 00       	call   41e09 <interrupt_init>
    virtual_memory_init();
   419c5:	e8 11 11 00 00       	call   42adb <virtual_memory_init>
}
   419ca:	90                   	nop
   419cb:	5d                   	pop    %rbp
   419cc:	c3                   	ret    

00000000000419cd <set_app_segment>:
#define SEGSEL_TASKSTATE        0x28            // task state segment

// Segments
static uint64_t segments[7];

static void set_app_segment(uint64_t* segment, uint64_t type, int dpl) {
   419cd:	f3 0f 1e fa          	endbr64 
   419d1:	55                   	push   %rbp
   419d2:	48 89 e5             	mov    %rsp,%rbp
   419d5:	48 83 ec 18          	sub    $0x18,%rsp
   419d9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   419dd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   419e1:	89 55 ec             	mov    %edx,-0x14(%rbp)
    *segment = type
        | X86SEG_S                    // code/data segment
        | ((uint64_t) dpl << 45)
   419e4:	8b 45 ec             	mov    -0x14(%rbp),%eax
   419e7:	48 98                	cltq   
   419e9:	48 c1 e0 2d          	shl    $0x2d,%rax
   419ed:	48 0b 45 f0          	or     -0x10(%rbp),%rax
        | X86SEG_P;                   // segment present
   419f1:	48 ba 00 00 00 00 00 	movabs $0x900000000000,%rdx
   419f8:	90 00 00 
   419fb:	48 09 c2             	or     %rax,%rdx
    *segment = type
   419fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41a02:	48 89 10             	mov    %rdx,(%rax)
}
   41a05:	90                   	nop
   41a06:	c9                   	leave  
   41a07:	c3                   	ret    

0000000000041a08 <set_sys_segment>:

static void set_sys_segment(uint64_t* segment, uint64_t type, int dpl,
                            uintptr_t addr, size_t size) {
   41a08:	f3 0f 1e fa          	endbr64 
   41a0c:	55                   	push   %rbp
   41a0d:	48 89 e5             	mov    %rsp,%rbp
   41a10:	48 83 ec 28          	sub    $0x28,%rsp
   41a14:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41a18:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   41a1c:	89 55 ec             	mov    %edx,-0x14(%rbp)
   41a1f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
   41a23:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   41a27:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41a2b:	48 c1 e0 10          	shl    $0x10,%rax
   41a2f:	48 89 c2             	mov    %rax,%rdx
   41a32:	48 b8 00 00 ff ff ff 	movabs $0xffffff0000,%rax
   41a39:	00 00 00 
   41a3c:	48 21 c2             	and    %rax,%rdx
        | ((addr & 0x00000000FF000000UL) << 32)
   41a3f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41a43:	48 c1 e0 20          	shl    $0x20,%rax
   41a47:	48 89 c1             	mov    %rax,%rcx
   41a4a:	48 b8 00 00 00 00 00 	movabs $0xff00000000000000,%rax
   41a51:	00 00 ff 
   41a54:	48 21 c8             	and    %rcx,%rax
   41a57:	48 09 c2             	or     %rax,%rdx
        | ((size - 1) & 0x0FFFFUL)
   41a5a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41a5e:	48 83 e8 01          	sub    $0x1,%rax
   41a62:	0f b7 c0             	movzwl %ax,%eax
        | (((size - 1) & 0xF0000UL) << 48)
   41a65:	48 09 d0             	or     %rdx,%rax
        | type
   41a68:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   41a6c:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   41a6f:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41a72:	48 98                	cltq   
   41a74:	48 c1 e0 2d          	shl    $0x2d,%rax
   41a78:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P;                   // segment present
   41a7b:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
   41a82:	80 00 00 
   41a85:	48 09 c2             	or     %rax,%rdx
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   41a88:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41a8c:	48 89 10             	mov    %rdx,(%rax)
    segment[1] = addr >> 32;
   41a8f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41a93:	48 83 c0 08          	add    $0x8,%rax
   41a97:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   41a9b:	48 c1 ea 20          	shr    $0x20,%rdx
   41a9f:	48 89 10             	mov    %rdx,(%rax)
}
   41aa2:	90                   	nop
   41aa3:	c9                   	leave  
   41aa4:	c3                   	ret    

0000000000041aa5 <set_gate>:

// Processor state for taking an interrupt
static x86_64_taskstate kernel_task_descriptor;

static void set_gate(x86_64_gatedescriptor* gate, uint64_t type, int dpl,
                     uintptr_t function) {
   41aa5:	f3 0f 1e fa          	endbr64 
   41aa9:	55                   	push   %rbp
   41aaa:	48 89 e5             	mov    %rsp,%rbp
   41aad:	48 83 ec 20          	sub    $0x20,%rsp
   41ab1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41ab5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   41ab9:	89 55 ec             	mov    %edx,-0x14(%rbp)
   41abc:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    gate->gd_low = (function & 0x000000000000FFFFUL)
   41ac0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41ac4:	0f b7 c0             	movzwl %ax,%eax
        | (SEGSEL_KERN_CODE << 16)
        | type
   41ac7:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   41acb:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   41ace:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41ad1:	48 98                	cltq   
   41ad3:	48 c1 e0 2d          	shl    $0x2d,%rax
   41ad7:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P
        | ((function & 0x00000000FFFF0000UL) << 32);
   41ada:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41ade:	48 c1 e0 20          	shl    $0x20,%rax
   41ae2:	48 89 c1             	mov    %rax,%rcx
   41ae5:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   41aec:	00 ff ff 
   41aef:	48 21 c8             	and    %rcx,%rax
   41af2:	48 09 c2             	or     %rax,%rdx
   41af5:	48 b8 00 00 08 00 00 	movabs $0x800000080000,%rax
   41afc:	80 00 00 
   41aff:	48 09 c2             	or     %rax,%rdx
    gate->gd_low = (function & 0x000000000000FFFFUL)
   41b02:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41b06:	48 89 10             	mov    %rdx,(%rax)
    gate->gd_high = function >> 32;
   41b09:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41b0d:	48 c1 e8 20          	shr    $0x20,%rax
   41b11:	48 89 c2             	mov    %rax,%rdx
   41b14:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41b18:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
   41b1c:	90                   	nop
   41b1d:	c9                   	leave  
   41b1e:	c3                   	ret    

0000000000041b1f <segments_init>:
extern void default_int_handler(void);
extern void gpf_int_handler(void);
extern void pagefault_int_handler(void);
extern void timer_int_handler(void);

void segments_init(void) {
   41b1f:	f3 0f 1e fa          	endbr64 
   41b23:	55                   	push   %rbp
   41b24:	48 89 e5             	mov    %rsp,%rbp
   41b27:	48 83 ec 40          	sub    $0x40,%rsp
    // Segments for kernel & user code & data
    // The privilege level, which can be 0 or 3, differentiates between
    // kernel and user code. (Data segments are unused in WeensyOS.)
    segments[0] = 0;
   41b2b:	48 c7 05 2a 17 01 00 	movq   $0x0,0x1172a(%rip)        # 53260 <segments>
   41b32:	00 00 00 00 
    set_app_segment(&segments[SEGSEL_KERN_CODE >> 3], X86SEG_X | X86SEG_L, 0);
   41b36:	ba 00 00 00 00       	mov    $0x0,%edx
   41b3b:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   41b42:	08 20 00 
   41b45:	48 89 c6             	mov    %rax,%rsi
   41b48:	48 8d 05 19 17 01 00 	lea    0x11719(%rip),%rax        # 53268 <segments+0x8>
   41b4f:	48 89 c7             	mov    %rax,%rdi
   41b52:	e8 76 fe ff ff       	call   419cd <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_CODE >> 3], X86SEG_X | X86SEG_L, 3);
   41b57:	ba 03 00 00 00       	mov    $0x3,%edx
   41b5c:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   41b63:	08 20 00 
   41b66:	48 89 c6             	mov    %rax,%rsi
   41b69:	48 8d 05 00 17 01 00 	lea    0x11700(%rip),%rax        # 53270 <segments+0x10>
   41b70:	48 89 c7             	mov    %rax,%rdi
   41b73:	e8 55 fe ff ff       	call   419cd <set_app_segment>
    set_app_segment(&segments[SEGSEL_KERN_DATA >> 3], X86SEG_W, 0);
   41b78:	ba 00 00 00 00       	mov    $0x0,%edx
   41b7d:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   41b84:	02 00 00 
   41b87:	48 89 c6             	mov    %rax,%rsi
   41b8a:	48 8d 05 e7 16 01 00 	lea    0x116e7(%rip),%rax        # 53278 <segments+0x18>
   41b91:	48 89 c7             	mov    %rax,%rdi
   41b94:	e8 34 fe ff ff       	call   419cd <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_DATA >> 3], X86SEG_W, 3);
   41b99:	ba 03 00 00 00       	mov    $0x3,%edx
   41b9e:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   41ba5:	02 00 00 
   41ba8:	48 89 c6             	mov    %rax,%rsi
   41bab:	48 8d 05 ce 16 01 00 	lea    0x116ce(%rip),%rax        # 53280 <segments+0x20>
   41bb2:	48 89 c7             	mov    %rax,%rdi
   41bb5:	e8 13 fe ff ff       	call   419cd <set_app_segment>
    set_sys_segment(&segments[SEGSEL_TASKSTATE >> 3], X86SEG_TSS, 0,
   41bba:	48 8d 05 df 26 01 00 	lea    0x126df(%rip),%rax        # 542a0 <kernel_task_descriptor>
   41bc1:	41 b8 60 00 00 00    	mov    $0x60,%r8d
   41bc7:	48 89 c1             	mov    %rax,%rcx
   41bca:	ba 00 00 00 00       	mov    $0x0,%edx
   41bcf:	48 b8 00 00 00 00 00 	movabs $0x90000000000,%rax
   41bd6:	09 00 00 
   41bd9:	48 89 c6             	mov    %rax,%rsi
   41bdc:	48 8d 05 a5 16 01 00 	lea    0x116a5(%rip),%rax        # 53288 <segments+0x28>
   41be3:	48 89 c7             	mov    %rax,%rdi
   41be6:	e8 1d fe ff ff       	call   41a08 <set_sys_segment>
                    (uintptr_t) &kernel_task_descriptor,
                    sizeof(kernel_task_descriptor));

    x86_64_pseudodescriptor gdt;
    gdt.pseudod_limit = sizeof(segments) - 1;
   41beb:	66 c7 45 d6 37 00    	movw   $0x37,-0x2a(%rbp)
    gdt.pseudod_base = (uint64_t) segments;
   41bf1:	48 8d 05 68 16 01 00 	lea    0x11668(%rip),%rax        # 53260 <segments>
   41bf8:	48 89 45 d8          	mov    %rax,-0x28(%rbp)

    // Kernel task descriptor lets us receive interrupts
    memset(&kernel_task_descriptor, 0, sizeof(kernel_task_descriptor));
   41bfc:	ba 60 00 00 00       	mov    $0x60,%edx
   41c01:	be 00 00 00 00       	mov    $0x0,%esi
   41c06:	48 8d 05 93 26 01 00 	lea    0x12693(%rip),%rax        # 542a0 <kernel_task_descriptor>
   41c0d:	48 89 c7             	mov    %rax,%rdi
   41c10:	e8 7e 1a 00 00       	call   43693 <memset>
    kernel_task_descriptor.ts_rsp[0] = KERNEL_STACK_TOP;
   41c15:	48 c7 05 84 26 01 00 	movq   $0x80000,0x12684(%rip)        # 542a4 <kernel_task_descriptor+0x4>
   41c1c:	00 00 08 00 

    // Interrupt handler; most interrupts are effectively ignored
    memset(interrupt_descriptors, 0, sizeof(interrupt_descriptors));
   41c20:	ba 00 10 00 00       	mov    $0x1000,%edx
   41c25:	be 00 00 00 00       	mov    $0x0,%esi
   41c2a:	48 8d 05 6f 16 01 00 	lea    0x1166f(%rip),%rax        # 532a0 <interrupt_descriptors>
   41c31:	48 89 c7             	mov    %rax,%rdi
   41c34:	e8 5a 1a 00 00       	call   43693 <memset>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   41c39:	c7 45 fc 10 00 00 00 	movl   $0x10,-0x4(%rbp)
   41c40:	eb 3c                	jmp    41c7e <segments_init+0x15f>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 0,
   41c42:	48 c7 c0 9c 00 04 00 	mov    $0x4009c,%rax
   41c49:	48 89 c2             	mov    %rax,%rdx
   41c4c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41c4f:	48 c1 e0 04          	shl    $0x4,%rax
   41c53:	48 89 c1             	mov    %rax,%rcx
   41c56:	48 8d 05 43 16 01 00 	lea    0x11643(%rip),%rax        # 532a0 <interrupt_descriptors>
   41c5d:	48 01 c8             	add    %rcx,%rax
   41c60:	48 89 d1             	mov    %rdx,%rcx
   41c63:	ba 00 00 00 00       	mov    $0x0,%edx
   41c68:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   41c6f:	0e 00 00 
   41c72:	48 89 c7             	mov    %rax,%rdi
   41c75:	e8 2b fe ff ff       	call   41aa5 <set_gate>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   41c7a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41c7e:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
   41c85:	76 bb                	jbe    41c42 <segments_init+0x123>
                 (uint64_t) default_int_handler);
    }

    // Timer interrupt
    set_gate(&interrupt_descriptors[INT_TIMER], X86GATE_INTERRUPT, 0,
   41c87:	48 c7 c0 36 00 04 00 	mov    $0x40036,%rax
   41c8e:	48 89 c1             	mov    %rax,%rcx
   41c91:	ba 00 00 00 00       	mov    $0x0,%edx
   41c96:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41c9d:	0e 00 00 
   41ca0:	48 89 c6             	mov    %rax,%rsi
   41ca3:	48 8d 05 f6 17 01 00 	lea    0x117f6(%rip),%rax        # 534a0 <interrupt_descriptors+0x200>
   41caa:	48 89 c7             	mov    %rax,%rdi
   41cad:	e8 f3 fd ff ff       	call   41aa5 <set_gate>
             (uint64_t) timer_int_handler);

    // GPF and page fault
    set_gate(&interrupt_descriptors[INT_GPF], X86GATE_INTERRUPT, 0,
   41cb2:	48 c7 c0 2e 00 04 00 	mov    $0x4002e,%rax
   41cb9:	48 89 c1             	mov    %rax,%rcx
   41cbc:	ba 00 00 00 00       	mov    $0x0,%edx
   41cc1:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41cc8:	0e 00 00 
   41ccb:	48 89 c6             	mov    %rax,%rsi
   41cce:	48 8d 05 9b 16 01 00 	lea    0x1169b(%rip),%rax        # 53370 <interrupt_descriptors+0xd0>
   41cd5:	48 89 c7             	mov    %rax,%rdi
   41cd8:	e8 c8 fd ff ff       	call   41aa5 <set_gate>
             (uint64_t) gpf_int_handler);
    set_gate(&interrupt_descriptors[INT_PAGEFAULT], X86GATE_INTERRUPT, 0,
   41cdd:	48 c7 c0 32 00 04 00 	mov    $0x40032,%rax
   41ce4:	48 89 c1             	mov    %rax,%rcx
   41ce7:	ba 00 00 00 00       	mov    $0x0,%edx
   41cec:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   41cf3:	0e 00 00 
   41cf6:	48 89 c6             	mov    %rax,%rsi
   41cf9:	48 8d 05 80 16 01 00 	lea    0x11680(%rip),%rax        # 53380 <interrupt_descriptors+0xe0>
   41d00:	48 89 c7             	mov    %rax,%rdi
   41d03:	e8 9d fd ff ff       	call   41aa5 <set_gate>
             (uint64_t) pagefault_int_handler);

    // System calls get special handling.
    // Note that the last argument is '3'.  This means that unprivileged
    // (level-3) applications may generate these interrupts.
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   41d08:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%rbp)
   41d0f:	eb 50                	jmp    41d61 <segments_init+0x242>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
                 (uint64_t) sys_int_handlers[i - INT_SYS]);
   41d11:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41d14:	83 e8 30             	sub    $0x30,%eax
   41d17:	89 c0                	mov    %eax,%eax
   41d19:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   41d20:	00 
   41d21:	48 8d 05 bf e3 ff ff 	lea    -0x1c41(%rip),%rax        # 400e7 <sys_int_handlers>
   41d28:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
   41d2c:	48 89 c2             	mov    %rax,%rdx
   41d2f:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41d32:	48 c1 e0 04          	shl    $0x4,%rax
   41d36:	48 89 c1             	mov    %rax,%rcx
   41d39:	48 8d 05 60 15 01 00 	lea    0x11560(%rip),%rax        # 532a0 <interrupt_descriptors>
   41d40:	48 01 c8             	add    %rcx,%rax
   41d43:	48 89 d1             	mov    %rdx,%rcx
   41d46:	ba 03 00 00 00       	mov    $0x3,%edx
   41d4b:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   41d52:	0e 00 00 
   41d55:	48 89 c7             	mov    %rax,%rdi
   41d58:	e8 48 fd ff ff       	call   41aa5 <set_gate>
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   41d5d:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   41d61:	83 7d f8 3f          	cmpl   $0x3f,-0x8(%rbp)
   41d65:	76 aa                	jbe    41d11 <segments_init+0x1f2>
    }

    x86_64_pseudodescriptor idt;
    idt.pseudod_limit = sizeof(interrupt_descriptors) - 1;
   41d67:	66 c7 45 cc ff 0f    	movw   $0xfff,-0x34(%rbp)
    idt.pseudod_base = (uint64_t) interrupt_descriptors;
   41d6d:	48 8d 05 2c 15 01 00 	lea    0x1152c(%rip),%rax        # 532a0 <interrupt_descriptors>
   41d74:	48 89 45 ce          	mov    %rax,-0x32(%rbp)

    // Reload segment pointers
    asm volatile("lgdt %0\n\t"
   41d78:	b8 28 00 00 00       	mov    $0x28,%eax
   41d7d:	0f 01 55 d6          	lgdt   -0x2a(%rbp)
   41d81:	0f 00 d8             	ltr    %ax
   41d84:	0f 01 5d cc          	lidt   -0x34(%rbp)
    asm volatile("movq %%cr0,%0" : "=r" (val));
   41d88:	0f 20 c0             	mov    %cr0,%rax
   41d8b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    return val;
   41d8f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
                     "r" ((uint16_t) SEGSEL_TASKSTATE),
                     "m" (idt)
                 : "memory");

    // Set up control registers: check alignment
    uint32_t cr0 = rcr0();
   41d93:	89 45 f4             	mov    %eax,-0xc(%rbp)
    cr0 |= CR0_PE | CR0_PG | CR0_WP | CR0_AM | CR0_MP | CR0_NE;
   41d96:	81 4d f4 23 00 05 80 	orl    $0x80050023,-0xc(%rbp)
   41d9d:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41da0:	89 45 f0             	mov    %eax,-0x10(%rbp)
    uint64_t xval = val;
   41da3:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41da6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    asm volatile("movq %0,%%cr0" : : "r" (xval));
   41daa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41dae:	0f 22 c0             	mov    %rax,%cr0
}
   41db1:	90                   	nop
    lcr0(cr0);
}
   41db2:	90                   	nop
   41db3:	c9                   	leave  
   41db4:	c3                   	ret    

0000000000041db5 <interrupt_mask>:
#define TIMER_FREQ      1193182
#define TIMER_DIV(x)    ((TIMER_FREQ+(x)/2)/(x))

static uint16_t interrupts_enabled;

static void interrupt_mask(void) {
   41db5:	f3 0f 1e fa          	endbr64 
   41db9:	55                   	push   %rbp
   41dba:	48 89 e5             	mov    %rsp,%rbp
   41dbd:	48 83 ec 20          	sub    $0x20,%rsp
    uint16_t masked = ~interrupts_enabled;
   41dc1:	0f b7 05 38 25 01 00 	movzwl 0x12538(%rip),%eax        # 54300 <interrupts_enabled>
   41dc8:	f7 d0                	not    %eax
   41dca:	66 89 45 fe          	mov    %ax,-0x2(%rbp)
    outb(IO_PIC1+1, masked & 0xFF);
   41dce:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   41dd2:	0f b6 c0             	movzbl %al,%eax
   41dd5:	c7 45 f0 21 00 00 00 	movl   $0x21,-0x10(%rbp)
   41ddc:	88 45 ef             	mov    %al,-0x11(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41ddf:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   41de3:	8b 55 f0             	mov    -0x10(%rbp),%edx
   41de6:	ee                   	out    %al,(%dx)
}
   41de7:	90                   	nop
    outb(IO_PIC2+1, (masked >> 8) & 0xFF);
   41de8:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   41dec:	66 c1 e8 08          	shr    $0x8,%ax
   41df0:	0f b6 c0             	movzbl %al,%eax
   41df3:	c7 45 f8 a1 00 00 00 	movl   $0xa1,-0x8(%rbp)
   41dfa:	88 45 f7             	mov    %al,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41dfd:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   41e01:	8b 55 f8             	mov    -0x8(%rbp),%edx
   41e04:	ee                   	out    %al,(%dx)
}
   41e05:	90                   	nop
}
   41e06:	90                   	nop
   41e07:	c9                   	leave  
   41e08:	c3                   	ret    

0000000000041e09 <interrupt_init>:

void interrupt_init(void) {
   41e09:	f3 0f 1e fa          	endbr64 
   41e0d:	55                   	push   %rbp
   41e0e:	48 89 e5             	mov    %rsp,%rbp
   41e11:	48 83 ec 60          	sub    $0x60,%rsp
    // mask all interrupts
    interrupts_enabled = 0;
   41e15:	66 c7 05 e2 24 01 00 	movw   $0x0,0x124e2(%rip)        # 54300 <interrupts_enabled>
   41e1c:	00 00 
    interrupt_mask();
   41e1e:	e8 92 ff ff ff       	call   41db5 <interrupt_mask>
   41e23:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%rbp)
   41e2a:	c6 45 a3 11          	movb   $0x11,-0x5d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41e2e:	0f b6 45 a3          	movzbl -0x5d(%rbp),%eax
   41e32:	8b 55 a4             	mov    -0x5c(%rbp),%edx
   41e35:	ee                   	out    %al,(%dx)
}
   41e36:	90                   	nop
   41e37:	c7 45 ac 21 00 00 00 	movl   $0x21,-0x54(%rbp)
   41e3e:	c6 45 ab 20          	movb   $0x20,-0x55(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41e42:	0f b6 45 ab          	movzbl -0x55(%rbp),%eax
   41e46:	8b 55 ac             	mov    -0x54(%rbp),%edx
   41e49:	ee                   	out    %al,(%dx)
}
   41e4a:	90                   	nop
   41e4b:	c7 45 b4 21 00 00 00 	movl   $0x21,-0x4c(%rbp)
   41e52:	c6 45 b3 04          	movb   $0x4,-0x4d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41e56:	0f b6 45 b3          	movzbl -0x4d(%rbp),%eax
   41e5a:	8b 55 b4             	mov    -0x4c(%rbp),%edx
   41e5d:	ee                   	out    %al,(%dx)
}
   41e5e:	90                   	nop
   41e5f:	c7 45 bc 21 00 00 00 	movl   $0x21,-0x44(%rbp)
   41e66:	c6 45 bb 03          	movb   $0x3,-0x45(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41e6a:	0f b6 45 bb          	movzbl -0x45(%rbp),%eax
   41e6e:	8b 55 bc             	mov    -0x44(%rbp),%edx
   41e71:	ee                   	out    %al,(%dx)
}
   41e72:	90                   	nop
   41e73:	c7 45 c4 a0 00 00 00 	movl   $0xa0,-0x3c(%rbp)
   41e7a:	c6 45 c3 11          	movb   $0x11,-0x3d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41e7e:	0f b6 45 c3          	movzbl -0x3d(%rbp),%eax
   41e82:	8b 55 c4             	mov    -0x3c(%rbp),%edx
   41e85:	ee                   	out    %al,(%dx)
}
   41e86:	90                   	nop
   41e87:	c7 45 cc a1 00 00 00 	movl   $0xa1,-0x34(%rbp)
   41e8e:	c6 45 cb 28          	movb   $0x28,-0x35(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41e92:	0f b6 45 cb          	movzbl -0x35(%rbp),%eax
   41e96:	8b 55 cc             	mov    -0x34(%rbp),%edx
   41e99:	ee                   	out    %al,(%dx)
}
   41e9a:	90                   	nop
   41e9b:	c7 45 d4 a1 00 00 00 	movl   $0xa1,-0x2c(%rbp)
   41ea2:	c6 45 d3 02          	movb   $0x2,-0x2d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41ea6:	0f b6 45 d3          	movzbl -0x2d(%rbp),%eax
   41eaa:	8b 55 d4             	mov    -0x2c(%rbp),%edx
   41ead:	ee                   	out    %al,(%dx)
}
   41eae:	90                   	nop
   41eaf:	c7 45 dc a1 00 00 00 	movl   $0xa1,-0x24(%rbp)
   41eb6:	c6 45 db 01          	movb   $0x1,-0x25(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41eba:	0f b6 45 db          	movzbl -0x25(%rbp),%eax
   41ebe:	8b 55 dc             	mov    -0x24(%rbp),%edx
   41ec1:	ee                   	out    %al,(%dx)
}
   41ec2:	90                   	nop
   41ec3:	c7 45 e4 20 00 00 00 	movl   $0x20,-0x1c(%rbp)
   41eca:	c6 45 e3 68          	movb   $0x68,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41ece:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   41ed2:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   41ed5:	ee                   	out    %al,(%dx)
}
   41ed6:	90                   	nop
   41ed7:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
   41ede:	c6 45 eb 0a          	movb   $0xa,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41ee2:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   41ee6:	8b 55 ec             	mov    -0x14(%rbp),%edx
   41ee9:	ee                   	out    %al,(%dx)
}
   41eea:	90                   	nop
   41eeb:	c7 45 f4 a0 00 00 00 	movl   $0xa0,-0xc(%rbp)
   41ef2:	c6 45 f3 68          	movb   $0x68,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41ef6:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   41efa:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41efd:	ee                   	out    %al,(%dx)
}
   41efe:	90                   	nop
   41eff:	c7 45 fc a0 00 00 00 	movl   $0xa0,-0x4(%rbp)
   41f06:	c6 45 fb 0a          	movb   $0xa,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41f0a:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   41f0e:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41f11:	ee                   	out    %al,(%dx)
}
   41f12:	90                   	nop

    outb(IO_PIC2, 0x68);               /* OCW3 */
    outb(IO_PIC2, 0x0a);               /* OCW3 */

    // re-disable interrupts
    interrupt_mask();
   41f13:	e8 9d fe ff ff       	call   41db5 <interrupt_mask>
}
   41f18:	90                   	nop
   41f19:	c9                   	leave  
   41f1a:	c3                   	ret    

0000000000041f1b <timer_init>:

// timer_init(rate)
//    Set the timer interrupt to fire `rate` times a second. Disables the
//    timer interrupt if `rate <= 0`.

void timer_init(int rate) {
   41f1b:	f3 0f 1e fa          	endbr64 
   41f1f:	55                   	push   %rbp
   41f20:	48 89 e5             	mov    %rsp,%rbp
   41f23:	48 83 ec 28          	sub    $0x28,%rsp
   41f27:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (rate > 0) {
   41f2a:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   41f2e:	0f 8e 9f 00 00 00    	jle    41fd3 <timer_init+0xb8>
   41f34:	c7 45 ec 43 00 00 00 	movl   $0x43,-0x14(%rbp)
   41f3b:	c6 45 eb 34          	movb   $0x34,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41f3f:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   41f43:	8b 55 ec             	mov    -0x14(%rbp),%edx
   41f46:	ee                   	out    %al,(%dx)
}
   41f47:	90                   	nop
        outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
        outb(IO_TIMER1, TIMER_DIV(rate) % 256);
   41f48:	8b 45 dc             	mov    -0x24(%rbp),%eax
   41f4b:	89 c2                	mov    %eax,%edx
   41f4d:	c1 ea 1f             	shr    $0x1f,%edx
   41f50:	01 d0                	add    %edx,%eax
   41f52:	d1 f8                	sar    %eax
   41f54:	05 de 34 12 00       	add    $0x1234de,%eax
   41f59:	99                   	cltd   
   41f5a:	f7 7d dc             	idivl  -0x24(%rbp)
   41f5d:	89 c2                	mov    %eax,%edx
   41f5f:	89 d0                	mov    %edx,%eax
   41f61:	c1 f8 1f             	sar    $0x1f,%eax
   41f64:	c1 e8 18             	shr    $0x18,%eax
   41f67:	89 c1                	mov    %eax,%ecx
   41f69:	8d 04 0a             	lea    (%rdx,%rcx,1),%eax
   41f6c:	0f b6 c0             	movzbl %al,%eax
   41f6f:	29 c8                	sub    %ecx,%eax
   41f71:	0f b6 c0             	movzbl %al,%eax
   41f74:	c7 45 f4 40 00 00 00 	movl   $0x40,-0xc(%rbp)
   41f7b:	88 45 f3             	mov    %al,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41f7e:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   41f82:	8b 55 f4             	mov    -0xc(%rbp),%edx
   41f85:	ee                   	out    %al,(%dx)
}
   41f86:	90                   	nop
        outb(IO_TIMER1, TIMER_DIV(rate) / 256);
   41f87:	8b 45 dc             	mov    -0x24(%rbp),%eax
   41f8a:	89 c2                	mov    %eax,%edx
   41f8c:	c1 ea 1f             	shr    $0x1f,%edx
   41f8f:	01 d0                	add    %edx,%eax
   41f91:	d1 f8                	sar    %eax
   41f93:	05 de 34 12 00       	add    $0x1234de,%eax
   41f98:	99                   	cltd   
   41f99:	f7 7d dc             	idivl  -0x24(%rbp)
   41f9c:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   41fa2:	85 c0                	test   %eax,%eax
   41fa4:	0f 48 c2             	cmovs  %edx,%eax
   41fa7:	c1 f8 08             	sar    $0x8,%eax
   41faa:	0f b6 c0             	movzbl %al,%eax
   41fad:	c7 45 fc 40 00 00 00 	movl   $0x40,-0x4(%rbp)
   41fb4:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   41fb7:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   41fbb:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41fbe:	ee                   	out    %al,(%dx)
}
   41fbf:	90                   	nop
        interrupts_enabled |= 1 << (INT_TIMER - INT_HARDWARE);
   41fc0:	0f b7 05 39 23 01 00 	movzwl 0x12339(%rip),%eax        # 54300 <interrupts_enabled>
   41fc7:	83 c8 01             	or     $0x1,%eax
   41fca:	66 89 05 2f 23 01 00 	mov    %ax,0x1232f(%rip)        # 54300 <interrupts_enabled>
   41fd1:	eb 11                	jmp    41fe4 <timer_init+0xc9>
    } else {
        interrupts_enabled &= ~(1 << (INT_TIMER - INT_HARDWARE));
   41fd3:	0f b7 05 26 23 01 00 	movzwl 0x12326(%rip),%eax        # 54300 <interrupts_enabled>
   41fda:	83 e0 fe             	and    $0xfffffffe,%eax
   41fdd:	66 89 05 1c 23 01 00 	mov    %ax,0x1231c(%rip)        # 54300 <interrupts_enabled>
    }
    interrupt_mask();
   41fe4:	e8 cc fd ff ff       	call   41db5 <interrupt_mask>
}
   41fe9:	90                   	nop
   41fea:	c9                   	leave  
   41feb:	c3                   	ret    

0000000000041fec <physical_memory_isreserved>:
//    Returns non-zero iff `pa` is a reserved physical address.

#define IOPHYSMEM       0x000A0000
#define EXTPHYSMEM      0x00100000

int physical_memory_isreserved(uintptr_t pa) {
   41fec:	f3 0f 1e fa          	endbr64 
   41ff0:	55                   	push   %rbp
   41ff1:	48 89 e5             	mov    %rsp,%rbp
   41ff4:	48 83 ec 08          	sub    $0x8,%rsp
   41ff8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return pa == 0 || (pa >= IOPHYSMEM && pa < EXTPHYSMEM);
   41ffc:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   42001:	74 14                	je     42017 <physical_memory_isreserved+0x2b>
   42003:	48 81 7d f8 ff ff 09 	cmpq   $0x9ffff,-0x8(%rbp)
   4200a:	00 
   4200b:	76 11                	jbe    4201e <physical_memory_isreserved+0x32>
   4200d:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   42014:	00 
   42015:	77 07                	ja     4201e <physical_memory_isreserved+0x32>
   42017:	b8 01 00 00 00       	mov    $0x1,%eax
   4201c:	eb 05                	jmp    42023 <physical_memory_isreserved+0x37>
   4201e:	b8 00 00 00 00       	mov    $0x0,%eax
}
   42023:	c9                   	leave  
   42024:	c3                   	ret    

0000000000042025 <pci_make_configaddr>:


// pci_make_configaddr(bus, slot, func)
//    Construct a PCI configuration space address from parts.

static int pci_make_configaddr(int bus, int slot, int func) {
   42025:	f3 0f 1e fa          	endbr64 
   42029:	55                   	push   %rbp
   4202a:	48 89 e5             	mov    %rsp,%rbp
   4202d:	48 83 ec 10          	sub    $0x10,%rsp
   42031:	89 7d fc             	mov    %edi,-0x4(%rbp)
   42034:	89 75 f8             	mov    %esi,-0x8(%rbp)
   42037:	89 55 f4             	mov    %edx,-0xc(%rbp)
    return (bus << 16) | (slot << 11) | (func << 8);
   4203a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4203d:	c1 e0 10             	shl    $0x10,%eax
   42040:	89 c2                	mov    %eax,%edx
   42042:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42045:	c1 e0 0b             	shl    $0xb,%eax
   42048:	09 c2                	or     %eax,%edx
   4204a:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4204d:	c1 e0 08             	shl    $0x8,%eax
   42050:	09 d0                	or     %edx,%eax
}
   42052:	c9                   	leave  
   42053:	c3                   	ret    

0000000000042054 <pci_config_readl>:
//    Read a 32-bit word in PCI configuration space.

#define PCI_HOST_BRIDGE_CONFIG_ADDR 0xCF8
#define PCI_HOST_BRIDGE_CONFIG_DATA 0xCFC

static uint32_t pci_config_readl(int configaddr, int offset) {
   42054:	f3 0f 1e fa          	endbr64 
   42058:	55                   	push   %rbp
   42059:	48 89 e5             	mov    %rsp,%rbp
   4205c:	48 83 ec 18          	sub    $0x18,%rsp
   42060:	89 7d ec             	mov    %edi,-0x14(%rbp)
   42063:	89 75 e8             	mov    %esi,-0x18(%rbp)
    outl(PCI_HOST_BRIDGE_CONFIG_ADDR, 0x80000000 | configaddr | offset);
   42066:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42069:	8b 45 e8             	mov    -0x18(%rbp),%eax
   4206c:	09 d0                	or     %edx,%eax
   4206e:	0d 00 00 00 80       	or     $0x80000000,%eax
   42073:	c7 45 f4 f8 0c 00 00 	movl   $0xcf8,-0xc(%rbp)
   4207a:	89 45 f0             	mov    %eax,-0x10(%rbp)
    asm volatile("outl %0,%w1" : : "a" (data), "d" (port));
   4207d:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42080:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42083:	ef                   	out    %eax,(%dx)
}
   42084:	90                   	nop
   42085:	c7 45 fc fc 0c 00 00 	movl   $0xcfc,-0x4(%rbp)
    asm volatile("inl %w1,%0" : "=a" (data) : "d" (port));
   4208c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4208f:	89 c2                	mov    %eax,%edx
   42091:	ed                   	in     (%dx),%eax
   42092:	89 45 f8             	mov    %eax,-0x8(%rbp)
    return data;
   42095:	8b 45 f8             	mov    -0x8(%rbp),%eax
    return inl(PCI_HOST_BRIDGE_CONFIG_DATA);
}
   42098:	c9                   	leave  
   42099:	c3                   	ret    

000000000004209a <pci_find_device>:

// pci_find_device
//    Search for a PCI device matching `vendor` and `device`. Return
//    the config base address or -1 if no device was found.

static int pci_find_device(int vendor, int device) {
   4209a:	f3 0f 1e fa          	endbr64 
   4209e:	55                   	push   %rbp
   4209f:	48 89 e5             	mov    %rsp,%rbp
   420a2:	48 83 ec 28          	sub    $0x28,%rsp
   420a6:	89 7d dc             	mov    %edi,-0x24(%rbp)
   420a9:	89 75 d8             	mov    %esi,-0x28(%rbp)
    for (int bus = 0; bus != 256; ++bus) {
   420ac:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   420b3:	eb 73                	jmp    42128 <pci_find_device+0x8e>
        for (int slot = 0; slot != 32; ++slot) {
   420b5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   420bc:	eb 60                	jmp    4211e <pci_find_device+0x84>
            for (int func = 0; func != 8; ++func) {
   420be:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   420c5:	eb 4a                	jmp    42111 <pci_find_device+0x77>
                int configaddr = pci_make_configaddr(bus, slot, func);
   420c7:	8b 55 f4             	mov    -0xc(%rbp),%edx
   420ca:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   420cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
   420d0:	89 ce                	mov    %ecx,%esi
   420d2:	89 c7                	mov    %eax,%edi
   420d4:	e8 4c ff ff ff       	call   42025 <pci_make_configaddr>
   420d9:	89 45 f0             	mov    %eax,-0x10(%rbp)
                uint32_t vendor_device = pci_config_readl(configaddr, 0);
   420dc:	8b 45 f0             	mov    -0x10(%rbp),%eax
   420df:	be 00 00 00 00       	mov    $0x0,%esi
   420e4:	89 c7                	mov    %eax,%edi
   420e6:	e8 69 ff ff ff       	call   42054 <pci_config_readl>
   420eb:	89 45 ec             	mov    %eax,-0x14(%rbp)
                if (vendor_device == (uint32_t) (vendor | (device << 16))) {
   420ee:	8b 45 d8             	mov    -0x28(%rbp),%eax
   420f1:	c1 e0 10             	shl    $0x10,%eax
   420f4:	0b 45 dc             	or     -0x24(%rbp),%eax
   420f7:	39 45 ec             	cmp    %eax,-0x14(%rbp)
   420fa:	75 05                	jne    42101 <pci_find_device+0x67>
                    return configaddr;
   420fc:	8b 45 f0             	mov    -0x10(%rbp),%eax
   420ff:	eb 35                	jmp    42136 <pci_find_device+0x9c>
                } else if (vendor_device == (uint32_t) -1 && func == 0) {
   42101:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%rbp)
   42105:	75 06                	jne    4210d <pci_find_device+0x73>
   42107:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   4210b:	74 0c                	je     42119 <pci_find_device+0x7f>
            for (int func = 0; func != 8; ++func) {
   4210d:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   42111:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
   42115:	75 b0                	jne    420c7 <pci_find_device+0x2d>
   42117:	eb 01                	jmp    4211a <pci_find_device+0x80>
                    break;
   42119:	90                   	nop
        for (int slot = 0; slot != 32; ++slot) {
   4211a:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   4211e:	83 7d f8 20          	cmpl   $0x20,-0x8(%rbp)
   42122:	75 9a                	jne    420be <pci_find_device+0x24>
    for (int bus = 0; bus != 256; ++bus) {
   42124:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   42128:	81 7d fc 00 01 00 00 	cmpl   $0x100,-0x4(%rbp)
   4212f:	75 84                	jne    420b5 <pci_find_device+0x1b>
                }
            }
        }
    }
    return -1;
   42131:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   42136:	c9                   	leave  
   42137:	c3                   	ret    

0000000000042138 <poweroff>:
//    that speaks ACPI; QEMU emulates a PIIX4 Power Management Controller.

#define PCI_VENDOR_ID_INTEL     0x8086
#define PCI_DEVICE_ID_PIIX4     0x7113

void poweroff(void) {
   42138:	f3 0f 1e fa          	endbr64 
   4213c:	55                   	push   %rbp
   4213d:	48 89 e5             	mov    %rsp,%rbp
   42140:	48 83 ec 10          	sub    $0x10,%rsp
    int configaddr = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PIIX4);
   42144:	be 13 71 00 00       	mov    $0x7113,%esi
   42149:	bf 86 80 00 00       	mov    $0x8086,%edi
   4214e:	e8 47 ff ff ff       	call   4209a <pci_find_device>
   42153:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (configaddr >= 0) {
   42156:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   4215a:	78 30                	js     4218c <poweroff+0x54>
        // Read I/O base register from controller's PCI configuration space.
        int pm_io_base = pci_config_readl(configaddr, 0x40) & 0xFFC0;
   4215c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4215f:	be 40 00 00 00       	mov    $0x40,%esi
   42164:	89 c7                	mov    %eax,%edi
   42166:	e8 e9 fe ff ff       	call   42054 <pci_config_readl>
   4216b:	25 c0 ff 00 00       	and    $0xffc0,%eax
   42170:	89 45 f8             	mov    %eax,-0x8(%rbp)
        // Write `suspend enable` to the power management control register.
        outw(pm_io_base + 4, 0x2000);
   42173:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42176:	83 c0 04             	add    $0x4,%eax
   42179:	89 45 f4             	mov    %eax,-0xc(%rbp)
   4217c:	66 c7 45 f2 00 20    	movw   $0x2000,-0xe(%rbp)
    asm volatile("outw %0,%w1" : : "a" (data), "d" (port));
   42182:	0f b7 45 f2          	movzwl -0xe(%rbp),%eax
   42186:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42189:	66 ef                	out    %ax,(%dx)
}
   4218b:	90                   	nop
    }
    // No PIIX4; spin.
    console_printf(CPOS(24, 0), 0xC000, "Cannot power off!\n");
   4218c:	48 8d 05 8d 28 00 00 	lea    0x288d(%rip),%rax        # 44a20 <memstate_colors+0xc0>
   42193:	48 89 c2             	mov    %rax,%rdx
   42196:	be 00 c0 00 00       	mov    $0xc000,%esi
   4219b:	bf 80 07 00 00       	mov    $0x780,%edi
   421a0:	b8 00 00 00 00       	mov    $0x0,%eax
   421a5:	e8 28 23 00 00       	call   444d2 <console_printf>
 spinloop: goto spinloop;
   421aa:	eb fe                	jmp    421aa <poweroff+0x72>

00000000000421ac <reboot>:


// reboot
//    Reboot the virtual machine.

void reboot(void) {
   421ac:	f3 0f 1e fa          	endbr64 
   421b0:	55                   	push   %rbp
   421b1:	48 89 e5             	mov    %rsp,%rbp
   421b4:	48 83 ec 10          	sub    $0x10,%rsp
   421b8:	c7 45 fc 92 00 00 00 	movl   $0x92,-0x4(%rbp)
   421bf:	c6 45 fb 03          	movb   $0x3,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   421c3:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   421c7:	8b 55 fc             	mov    -0x4(%rbp),%edx
   421ca:	ee                   	out    %al,(%dx)
}
   421cb:	90                   	nop
    outb(0x92, 3);
 spinloop: goto spinloop;
   421cc:	eb fe                	jmp    421cc <reboot+0x20>

00000000000421ce <process_init>:


// process_init(p, flags)
//    Initialize special-purpose registers for process `p`.

void process_init(proc* p, int flags) {
   421ce:	f3 0f 1e fa          	endbr64 
   421d2:	55                   	push   %rbp
   421d3:	48 89 e5             	mov    %rsp,%rbp
   421d6:	48 83 ec 10          	sub    $0x10,%rsp
   421da:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   421de:	89 75 f4             	mov    %esi,-0xc(%rbp)
    memset(&p->p_registers, 0, sizeof(p->p_registers));
   421e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   421e5:	48 83 c0 08          	add    $0x8,%rax
   421e9:	ba c0 00 00 00       	mov    $0xc0,%edx
   421ee:	be 00 00 00 00       	mov    $0x0,%esi
   421f3:	48 89 c7             	mov    %rax,%rdi
   421f6:	e8 98 14 00 00       	call   43693 <memset>
    p->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
   421fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   421ff:	66 c7 80 a8 00 00 00 	movw   $0x13,0xa8(%rax)
   42206:	13 00 
    p->p_registers.reg_fs = SEGSEL_APP_DATA | 3;
   42208:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4220c:	48 c7 80 80 00 00 00 	movq   $0x23,0x80(%rax)
   42213:	23 00 00 00 
    p->p_registers.reg_gs = SEGSEL_APP_DATA | 3;
   42217:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4221b:	48 c7 80 88 00 00 00 	movq   $0x23,0x88(%rax)
   42222:	23 00 00 00 
    p->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
   42226:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4222a:	66 c7 80 c0 00 00 00 	movw   $0x23,0xc0(%rax)
   42231:	23 00 
    p->p_registers.reg_rflags = EFLAGS_IF;
   42233:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42237:	48 c7 80 b0 00 00 00 	movq   $0x200,0xb0(%rax)
   4223e:	00 02 00 00 
    p->display_status = 1;
   42242:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42246:	c6 80 d8 00 00 00 01 	movb   $0x1,0xd8(%rax)

    if (flags & PROCINIT_ALLOW_PROGRAMMED_IO) {
   4224d:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42250:	83 e0 01             	and    $0x1,%eax
   42253:	85 c0                	test   %eax,%eax
   42255:	74 1c                	je     42273 <process_init+0xa5>
        p->p_registers.reg_rflags |= EFLAGS_IOPL_3;
   42257:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4225b:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   42262:	80 cc 30             	or     $0x30,%ah
   42265:	48 89 c2             	mov    %rax,%rdx
   42268:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4226c:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
    if (flags & PROCINIT_DISABLE_INTERRUPTS) {
   42273:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42276:	83 e0 02             	and    $0x2,%eax
   42279:	85 c0                	test   %eax,%eax
   4227b:	74 1c                	je     42299 <process_init+0xcb>
        p->p_registers.reg_rflags &= ~EFLAGS_IF;
   4227d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42281:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   42288:	80 e4 fd             	and    $0xfd,%ah
   4228b:	48 89 c2             	mov    %rax,%rdx
   4228e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42292:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
}
   42299:	90                   	nop
   4229a:	c9                   	leave  
   4229b:	c3                   	ret    

000000000004229c <console_show_cursor>:

// console_show_cursor(cpos)
//    Move the console cursor to position `cpos`, which should be between 0
//    and 80 * 25.

void console_show_cursor(int cpos) {
   4229c:	f3 0f 1e fa          	endbr64 
   422a0:	55                   	push   %rbp
   422a1:	48 89 e5             	mov    %rsp,%rbp
   422a4:	48 83 ec 28          	sub    $0x28,%rsp
   422a8:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (cpos < 0 || cpos > CONSOLE_ROWS * CONSOLE_COLUMNS) {
   422ab:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   422af:	78 09                	js     422ba <console_show_cursor+0x1e>
   422b1:	81 7d dc d0 07 00 00 	cmpl   $0x7d0,-0x24(%rbp)
   422b8:	7e 07                	jle    422c1 <console_show_cursor+0x25>
        cpos = 0;
   422ba:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
   422c1:	c7 45 e4 d4 03 00 00 	movl   $0x3d4,-0x1c(%rbp)
   422c8:	c6 45 e3 0e          	movb   $0xe,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   422cc:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   422d0:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   422d3:	ee                   	out    %al,(%dx)
}
   422d4:	90                   	nop
    }
    outb(0x3D4, 14);
    outb(0x3D5, cpos / 256);
   422d5:	8b 45 dc             	mov    -0x24(%rbp),%eax
   422d8:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   422de:	85 c0                	test   %eax,%eax
   422e0:	0f 48 c2             	cmovs  %edx,%eax
   422e3:	c1 f8 08             	sar    $0x8,%eax
   422e6:	0f b6 c0             	movzbl %al,%eax
   422e9:	c7 45 ec d5 03 00 00 	movl   $0x3d5,-0x14(%rbp)
   422f0:	88 45 eb             	mov    %al,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   422f3:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   422f7:	8b 55 ec             	mov    -0x14(%rbp),%edx
   422fa:	ee                   	out    %al,(%dx)
}
   422fb:	90                   	nop
   422fc:	c7 45 f4 d4 03 00 00 	movl   $0x3d4,-0xc(%rbp)
   42303:	c6 45 f3 0f          	movb   $0xf,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42307:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   4230b:	8b 55 f4             	mov    -0xc(%rbp),%edx
   4230e:	ee                   	out    %al,(%dx)
}
   4230f:	90                   	nop
    outb(0x3D4, 15);
    outb(0x3D5, cpos % 256);
   42310:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42313:	99                   	cltd   
   42314:	c1 ea 18             	shr    $0x18,%edx
   42317:	01 d0                	add    %edx,%eax
   42319:	0f b6 c0             	movzbl %al,%eax
   4231c:	29 d0                	sub    %edx,%eax
   4231e:	0f b6 c0             	movzbl %al,%eax
   42321:	c7 45 fc d5 03 00 00 	movl   $0x3d5,-0x4(%rbp)
   42328:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4232b:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   4232f:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42332:	ee                   	out    %al,(%dx)
}
   42333:	90                   	nop
}
   42334:	90                   	nop
   42335:	c9                   	leave  
   42336:	c3                   	ret    

0000000000042337 <keyboard_readc>:
    /*CKEY(16)*/ {{'\'', '"', 0, 0}},  /*CKEY(17)*/ {{'`', '~', 0, 0}},
    /*CKEY(18)*/ {{'\\', '|', 034, 0}},  /*CKEY(19)*/ {{',', '<', 0, 0}},
    /*CKEY(20)*/ {{'.', '>', 0, 0}},  /*CKEY(21)*/ {{'/', '?', 0, 0}}
};

int keyboard_readc(void) {
   42337:	f3 0f 1e fa          	endbr64 
   4233b:	55                   	push   %rbp
   4233c:	48 89 e5             	mov    %rsp,%rbp
   4233f:	48 83 ec 20          	sub    $0x20,%rsp
   42343:	c7 45 f0 64 00 00 00 	movl   $0x64,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   4234a:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4234d:	89 c2                	mov    %eax,%edx
   4234f:	ec                   	in     (%dx),%al
   42350:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   42353:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    static uint8_t modifiers;
    static uint8_t last_escape;

    if ((inb(KEYBOARD_STATUSREG) & KEYBOARD_STATUS_READY) == 0) {
   42357:	0f b6 c0             	movzbl %al,%eax
   4235a:	83 e0 01             	and    $0x1,%eax
   4235d:	85 c0                	test   %eax,%eax
   4235f:	75 0a                	jne    4236b <keyboard_readc+0x34>
        return -1;
   42361:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   42366:	e9 fd 01 00 00       	jmp    42568 <keyboard_readc+0x231>
   4236b:	c7 45 e8 60 00 00 00 	movl   $0x60,-0x18(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42372:	8b 45 e8             	mov    -0x18(%rbp),%eax
   42375:	89 c2                	mov    %eax,%edx
   42377:	ec                   	in     (%dx),%al
   42378:	88 45 e7             	mov    %al,-0x19(%rbp)
    return data;
   4237b:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
    }

    uint8_t data = inb(KEYBOARD_DATAREG);
   4237f:	88 45 fb             	mov    %al,-0x5(%rbp)
    uint8_t escape = last_escape;
   42382:	0f b6 05 79 1f 01 00 	movzbl 0x11f79(%rip),%eax        # 54302 <last_escape.2>
   42389:	88 45 fa             	mov    %al,-0x6(%rbp)
    last_escape = 0;
   4238c:	c6 05 6f 1f 01 00 00 	movb   $0x0,0x11f6f(%rip)        # 54302 <last_escape.2>

    if (data == 0xE0) {         // mode shift
   42393:	80 7d fb e0          	cmpb   $0xe0,-0x5(%rbp)
   42397:	75 11                	jne    423aa <keyboard_readc+0x73>
        last_escape = 0x80;
   42399:	c6 05 62 1f 01 00 80 	movb   $0x80,0x11f62(%rip)        # 54302 <last_escape.2>
        return 0;
   423a0:	b8 00 00 00 00       	mov    $0x0,%eax
   423a5:	e9 be 01 00 00       	jmp    42568 <keyboard_readc+0x231>
    } else if (data & 0x80) {   // key release: matters only for modifier keys
   423aa:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   423ae:	84 c0                	test   %al,%al
   423b0:	79 64                	jns    42416 <keyboard_readc+0xdf>
        int ch = keymap[(data & 0x7F) | escape];
   423b2:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   423b6:	83 e0 7f             	and    $0x7f,%eax
   423b9:	89 c2                	mov    %eax,%edx
   423bb:	0f b6 45 fa          	movzbl -0x6(%rbp),%eax
   423bf:	09 d0                	or     %edx,%eax
   423c1:	48 98                	cltq   
   423c3:	48 8d 15 76 26 00 00 	lea    0x2676(%rip),%rdx        # 44a40 <keymap>
   423ca:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
   423ce:	0f b6 c0             	movzbl %al,%eax
   423d1:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   423d4:	81 7d f4 f9 00 00 00 	cmpl   $0xf9,-0xc(%rbp)
   423db:	7e 2f                	jle    4240c <keyboard_readc+0xd5>
   423dd:	81 7d f4 fc 00 00 00 	cmpl   $0xfc,-0xc(%rbp)
   423e4:	7f 26                	jg     4240c <keyboard_readc+0xd5>
            modifiers &= ~(1 << (ch - KEY_SHIFT));
   423e6:	8b 45 f4             	mov    -0xc(%rbp),%eax
   423e9:	2d fa 00 00 00       	sub    $0xfa,%eax
   423ee:	ba 01 00 00 00       	mov    $0x1,%edx
   423f3:	89 c1                	mov    %eax,%ecx
   423f5:	d3 e2                	shl    %cl,%edx
   423f7:	89 d0                	mov    %edx,%eax
   423f9:	f7 d0                	not    %eax
   423fb:	89 c2                	mov    %eax,%edx
   423fd:	0f b6 05 ff 1e 01 00 	movzbl 0x11eff(%rip),%eax        # 54303 <modifiers.1>
   42404:	21 d0                	and    %edx,%eax
   42406:	88 05 f7 1e 01 00    	mov    %al,0x11ef7(%rip)        # 54303 <modifiers.1>
        }
        return 0;
   4240c:	b8 00 00 00 00       	mov    $0x0,%eax
   42411:	e9 52 01 00 00       	jmp    42568 <keyboard_readc+0x231>
    }

    int ch = (unsigned char) keymap[data | escape];
   42416:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   4241a:	0a 45 fa             	or     -0x6(%rbp),%al
   4241d:	0f b6 c0             	movzbl %al,%eax
   42420:	48 98                	cltq   
   42422:	48 8d 15 17 26 00 00 	lea    0x2617(%rip),%rdx        # 44a40 <keymap>
   42429:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
   4242d:	0f b6 c0             	movzbl %al,%eax
   42430:	89 45 fc             	mov    %eax,-0x4(%rbp)

    if (ch >= 'a' && ch <= 'z') {
   42433:	83 7d fc 60          	cmpl   $0x60,-0x4(%rbp)
   42437:	7e 57                	jle    42490 <keyboard_readc+0x159>
   42439:	83 7d fc 7a          	cmpl   $0x7a,-0x4(%rbp)
   4243d:	7f 51                	jg     42490 <keyboard_readc+0x159>
        if (modifiers & MOD_CONTROL) {
   4243f:	0f b6 05 bd 1e 01 00 	movzbl 0x11ebd(%rip),%eax        # 54303 <modifiers.1>
   42446:	0f b6 c0             	movzbl %al,%eax
   42449:	83 e0 02             	and    $0x2,%eax
   4244c:	85 c0                	test   %eax,%eax
   4244e:	74 09                	je     42459 <keyboard_readc+0x122>
            ch -= 0x60;
   42450:	83 6d fc 60          	subl   $0x60,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   42454:	e9 0b 01 00 00       	jmp    42564 <keyboard_readc+0x22d>
        } else if (!(modifiers & MOD_SHIFT) != !(modifiers & MOD_CAPSLOCK)) {
   42459:	0f b6 05 a3 1e 01 00 	movzbl 0x11ea3(%rip),%eax        # 54303 <modifiers.1>
   42460:	0f b6 c0             	movzbl %al,%eax
   42463:	83 e0 01             	and    $0x1,%eax
   42466:	85 c0                	test   %eax,%eax
   42468:	0f 94 c2             	sete   %dl
   4246b:	0f b6 05 91 1e 01 00 	movzbl 0x11e91(%rip),%eax        # 54303 <modifiers.1>
   42472:	0f b6 c0             	movzbl %al,%eax
   42475:	83 e0 08             	and    $0x8,%eax
   42478:	85 c0                	test   %eax,%eax
   4247a:	0f 94 c0             	sete   %al
   4247d:	31 d0                	xor    %edx,%eax
   4247f:	84 c0                	test   %al,%al
   42481:	0f 84 dd 00 00 00    	je     42564 <keyboard_readc+0x22d>
            ch -= 0x20;
   42487:	83 6d fc 20          	subl   $0x20,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   4248b:	e9 d4 00 00 00       	jmp    42564 <keyboard_readc+0x22d>
        }
    } else if (ch >= KEY_CAPSLOCK) {
   42490:	81 7d fc fc 00 00 00 	cmpl   $0xfc,-0x4(%rbp)
   42497:	7e 30                	jle    424c9 <keyboard_readc+0x192>
        modifiers ^= 1 << (ch - KEY_SHIFT);
   42499:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4249c:	2d fa 00 00 00       	sub    $0xfa,%eax
   424a1:	ba 01 00 00 00       	mov    $0x1,%edx
   424a6:	89 c1                	mov    %eax,%ecx
   424a8:	d3 e2                	shl    %cl,%edx
   424aa:	89 d0                	mov    %edx,%eax
   424ac:	89 c2                	mov    %eax,%edx
   424ae:	0f b6 05 4e 1e 01 00 	movzbl 0x11e4e(%rip),%eax        # 54303 <modifiers.1>
   424b5:	31 d0                	xor    %edx,%eax
   424b7:	88 05 46 1e 01 00    	mov    %al,0x11e46(%rip)        # 54303 <modifiers.1>
        ch = 0;
   424bd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   424c4:	e9 9c 00 00 00       	jmp    42565 <keyboard_readc+0x22e>
    } else if (ch >= KEY_SHIFT) {
   424c9:	81 7d fc f9 00 00 00 	cmpl   $0xf9,-0x4(%rbp)
   424d0:	7e 2d                	jle    424ff <keyboard_readc+0x1c8>
        modifiers |= 1 << (ch - KEY_SHIFT);
   424d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
   424d5:	2d fa 00 00 00       	sub    $0xfa,%eax
   424da:	ba 01 00 00 00       	mov    $0x1,%edx
   424df:	89 c1                	mov    %eax,%ecx
   424e1:	d3 e2                	shl    %cl,%edx
   424e3:	89 d0                	mov    %edx,%eax
   424e5:	89 c2                	mov    %eax,%edx
   424e7:	0f b6 05 15 1e 01 00 	movzbl 0x11e15(%rip),%eax        # 54303 <modifiers.1>
   424ee:	09 d0                	or     %edx,%eax
   424f0:	88 05 0d 1e 01 00    	mov    %al,0x11e0d(%rip)        # 54303 <modifiers.1>
        ch = 0;
   424f6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   424fd:	eb 66                	jmp    42565 <keyboard_readc+0x22e>
    } else if (ch >= CKEY(0) && ch <= CKEY(21)) {
   424ff:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   42503:	7e 3f                	jle    42544 <keyboard_readc+0x20d>
   42505:	81 7d fc 95 00 00 00 	cmpl   $0x95,-0x4(%rbp)
   4250c:	7f 36                	jg     42544 <keyboard_readc+0x20d>
        ch = complex_keymap[ch - CKEY(0)].map[modifiers & 3];
   4250e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42511:	8d 50 80             	lea    -0x80(%rax),%edx
   42514:	0f b6 05 e8 1d 01 00 	movzbl 0x11de8(%rip),%eax        # 54303 <modifiers.1>
   4251b:	0f b6 c0             	movzbl %al,%eax
   4251e:	83 e0 03             	and    $0x3,%eax
   42521:	48 63 c8             	movslq %eax,%rcx
   42524:	48 63 c2             	movslq %edx,%rax
   42527:	48 c1 e0 02          	shl    $0x2,%rax
   4252b:	48 8d 14 08          	lea    (%rax,%rcx,1),%rdx
   4252f:	48 8d 05 0a 26 00 00 	lea    0x260a(%rip),%rax        # 44b40 <complex_keymap>
   42536:	48 01 d0             	add    %rdx,%rax
   42539:	0f b6 00             	movzbl (%rax),%eax
   4253c:	0f b6 c0             	movzbl %al,%eax
   4253f:	89 45 fc             	mov    %eax,-0x4(%rbp)
   42542:	eb 21                	jmp    42565 <keyboard_readc+0x22e>
    } else if (ch < 0x80 && (modifiers & MOD_CONTROL)) {
   42544:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   42548:	7f 1b                	jg     42565 <keyboard_readc+0x22e>
   4254a:	0f b6 05 b2 1d 01 00 	movzbl 0x11db2(%rip),%eax        # 54303 <modifiers.1>
   42551:	0f b6 c0             	movzbl %al,%eax
   42554:	83 e0 02             	and    $0x2,%eax
   42557:	85 c0                	test   %eax,%eax
   42559:	74 0a                	je     42565 <keyboard_readc+0x22e>
        ch = 0;
   4255b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42562:	eb 01                	jmp    42565 <keyboard_readc+0x22e>
        if (modifiers & MOD_CONTROL) {
   42564:	90                   	nop
    }

    return ch;
   42565:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
   42568:	c9                   	leave  
   42569:	c3                   	ret    

000000000004256a <delay>:
#define IO_PARALLEL1_CONTROL    0x37A
# define IO_PARALLEL_CONTROL_SELECT     0x08
# define IO_PARALLEL_CONTROL_INIT       0x04
# define IO_PARALLEL_CONTROL_STROBE     0x01

static void delay(void) {
   4256a:	f3 0f 1e fa          	endbr64 
   4256e:	55                   	push   %rbp
   4256f:	48 89 e5             	mov    %rsp,%rbp
   42572:	48 83 ec 20          	sub    $0x20,%rsp
   42576:	c7 45 e4 84 00 00 00 	movl   $0x84,-0x1c(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   4257d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   42580:	89 c2                	mov    %eax,%edx
   42582:	ec                   	in     (%dx),%al
   42583:	88 45 e3             	mov    %al,-0x1d(%rbp)
   42586:	c7 45 ec 84 00 00 00 	movl   $0x84,-0x14(%rbp)
   4258d:	8b 45 ec             	mov    -0x14(%rbp),%eax
   42590:	89 c2                	mov    %eax,%edx
   42592:	ec                   	in     (%dx),%al
   42593:	88 45 eb             	mov    %al,-0x15(%rbp)
   42596:	c7 45 f4 84 00 00 00 	movl   $0x84,-0xc(%rbp)
   4259d:	8b 45 f4             	mov    -0xc(%rbp),%eax
   425a0:	89 c2                	mov    %eax,%edx
   425a2:	ec                   	in     (%dx),%al
   425a3:	88 45 f3             	mov    %al,-0xd(%rbp)
   425a6:	c7 45 fc 84 00 00 00 	movl   $0x84,-0x4(%rbp)
   425ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
   425b0:	89 c2                	mov    %eax,%edx
   425b2:	ec                   	in     (%dx),%al
   425b3:	88 45 fb             	mov    %al,-0x5(%rbp)
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
}
   425b6:	90                   	nop
   425b7:	c9                   	leave  
   425b8:	c3                   	ret    

00000000000425b9 <parallel_port_putc>:

static void parallel_port_putc(printer* p, unsigned char c, int color) {
   425b9:	f3 0f 1e fa          	endbr64 
   425bd:	55                   	push   %rbp
   425be:	48 89 e5             	mov    %rsp,%rbp
   425c1:	48 83 ec 40          	sub    $0x40,%rsp
   425c5:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   425c9:	89 f0                	mov    %esi,%eax
   425cb:	89 55 c0             	mov    %edx,-0x40(%rbp)
   425ce:	88 45 c4             	mov    %al,-0x3c(%rbp)
    static int initialized;
    (void) p, (void) color;
    if (!initialized) {
   425d1:	8b 05 2d 1d 01 00    	mov    0x11d2d(%rip),%eax        # 54304 <initialized.0>
   425d7:	85 c0                	test   %eax,%eax
   425d9:	75 1e                	jne    425f9 <parallel_port_putc+0x40>
   425db:	c7 45 f8 7a 03 00 00 	movl   $0x37a,-0x8(%rbp)
   425e2:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   425e6:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   425ea:	8b 55 f8             	mov    -0x8(%rbp),%edx
   425ed:	ee                   	out    %al,(%dx)
}
   425ee:	90                   	nop
        outb(IO_PARALLEL1_CONTROL, 0);
        initialized = 1;
   425ef:	c7 05 0b 1d 01 00 01 	movl   $0x1,0x11d0b(%rip)        # 54304 <initialized.0>
   425f6:	00 00 00 
    }

    for (int i = 0;
   425f9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42600:	eb 09                	jmp    4260b <parallel_port_putc+0x52>
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
         ++i) {
        delay();
   42602:	e8 63 ff ff ff       	call   4256a <delay>
         ++i) {
   42607:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
   4260b:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%rbp)
   42612:	7f 18                	jg     4262c <parallel_port_putc+0x73>
   42614:	c7 45 f0 79 03 00 00 	movl   $0x379,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   4261b:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4261e:	89 c2                	mov    %eax,%edx
   42620:	ec                   	in     (%dx),%al
   42621:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   42624:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   42628:	84 c0                	test   %al,%al
   4262a:	79 d6                	jns    42602 <parallel_port_putc+0x49>
    }
    outb(IO_PARALLEL1_DATA, c);
   4262c:	0f b6 45 c4          	movzbl -0x3c(%rbp),%eax
   42630:	c7 45 d8 78 03 00 00 	movl   $0x378,-0x28(%rbp)
   42637:	88 45 d7             	mov    %al,-0x29(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4263a:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
   4263e:	8b 55 d8             	mov    -0x28(%rbp),%edx
   42641:	ee                   	out    %al,(%dx)
}
   42642:	90                   	nop
   42643:	c7 45 e0 7a 03 00 00 	movl   $0x37a,-0x20(%rbp)
   4264a:	c6 45 df 0d          	movb   $0xd,-0x21(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4264e:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
   42652:	8b 55 e0             	mov    -0x20(%rbp),%edx
   42655:	ee                   	out    %al,(%dx)
}
   42656:	90                   	nop
   42657:	c7 45 e8 7a 03 00 00 	movl   $0x37a,-0x18(%rbp)
   4265e:	c6 45 e7 0c          	movb   $0xc,-0x19(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42662:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
   42666:	8b 55 e8             	mov    -0x18(%rbp),%edx
   42669:	ee                   	out    %al,(%dx)
}
   4266a:	90                   	nop
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT | IO_PARALLEL_CONTROL_STROBE);
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT);
}
   4266b:	90                   	nop
   4266c:	c9                   	leave  
   4266d:	c3                   	ret    

000000000004266e <log_vprintf>:

void log_vprintf(const char* format, va_list val) {
   4266e:	f3 0f 1e fa          	endbr64 
   42672:	55                   	push   %rbp
   42673:	48 89 e5             	mov    %rsp,%rbp
   42676:	48 83 ec 20          	sub    $0x20,%rsp
   4267a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4267e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    printer p;
    p.putc = parallel_port_putc;
   42682:	48 8d 05 30 ff ff ff 	lea    -0xd0(%rip),%rax        # 425b9 <parallel_port_putc>
   42689:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&p, 0, format, val);
   4268d:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
   42691:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   42695:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
   42699:	be 00 00 00 00       	mov    $0x0,%esi
   4269e:	48 89 c7             	mov    %rax,%rdi
   426a1:	e8 b3 12 00 00       	call   43959 <printer_vprintf>
}
   426a6:	90                   	nop
   426a7:	c9                   	leave  
   426a8:	c3                   	ret    

00000000000426a9 <log_printf>:

void log_printf(const char* format, ...) {
   426a9:	f3 0f 1e fa          	endbr64 
   426ad:	55                   	push   %rbp
   426ae:	48 89 e5             	mov    %rsp,%rbp
   426b1:	48 83 ec 60          	sub    $0x60,%rsp
   426b5:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   426b9:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   426bd:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   426c1:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   426c5:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   426c9:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   426cd:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   426d4:	48 8d 45 10          	lea    0x10(%rbp),%rax
   426d8:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   426dc:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   426e0:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    log_vprintf(format, val);
   426e4:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
   426e8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   426ec:	48 89 d6             	mov    %rdx,%rsi
   426ef:	48 89 c7             	mov    %rax,%rdi
   426f2:	e8 77 ff ff ff       	call   4266e <log_vprintf>
    va_end(val);
}
   426f7:	90                   	nop
   426f8:	c9                   	leave  
   426f9:	c3                   	ret    

00000000000426fa <error_vprintf>:

// error_printf, error_vprintf
//    Print debugging messages to the console and to the host's
//    `log.txt` file via `log_printf`.

int error_vprintf(int cpos, int color, const char* format, va_list val) {
   426fa:	f3 0f 1e fa          	endbr64 
   426fe:	55                   	push   %rbp
   426ff:	48 89 e5             	mov    %rsp,%rbp
   42702:	48 83 ec 40          	sub    $0x40,%rsp
   42706:	89 7d dc             	mov    %edi,-0x24(%rbp)
   42709:	89 75 d8             	mov    %esi,-0x28(%rbp)
   4270c:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   42710:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    va_list val2;
    __builtin_va_copy(val2, val);
   42714:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   42718:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   4271c:	48 8b 0a             	mov    (%rdx),%rcx
   4271f:	48 89 08             	mov    %rcx,(%rax)
   42722:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   42726:	48 89 48 08          	mov    %rcx,0x8(%rax)
   4272a:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   4272e:	48 89 50 10          	mov    %rdx,0x10(%rax)
    log_vprintf(format, val2);
   42732:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
   42736:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4273a:	48 89 d6             	mov    %rdx,%rsi
   4273d:	48 89 c7             	mov    %rax,%rdi
   42740:	e8 29 ff ff ff       	call   4266e <log_vprintf>
    va_end(val2);
    return console_vprintf(cpos, color, format, val);
   42745:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   42749:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   4274d:	8b 75 d8             	mov    -0x28(%rbp),%esi
   42750:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42753:	89 c7                	mov    %eax,%edi
   42755:	e8 fc 1c 00 00       	call   44456 <console_vprintf>
}
   4275a:	c9                   	leave  
   4275b:	c3                   	ret    

000000000004275c <error_printf>:

int error_printf(int cpos, int color, const char* format, ...) {
   4275c:	f3 0f 1e fa          	endbr64 
   42760:	55                   	push   %rbp
   42761:	48 89 e5             	mov    %rsp,%rbp
   42764:	48 83 ec 60          	sub    $0x60,%rsp
   42768:	89 7d ac             	mov    %edi,-0x54(%rbp)
   4276b:	89 75 a8             	mov    %esi,-0x58(%rbp)
   4276e:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   42772:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42776:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   4277a:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   4277e:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   42785:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42789:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   4278d:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42791:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = error_vprintf(cpos, color, format, val);
   42795:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   42799:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   4279d:	8b 75 a8             	mov    -0x58(%rbp),%esi
   427a0:	8b 45 ac             	mov    -0x54(%rbp),%eax
   427a3:	89 c7                	mov    %eax,%edi
   427a5:	e8 50 ff ff ff       	call   426fa <error_vprintf>
   427aa:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   427ad:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   427b0:	c9                   	leave  
   427b1:	c3                   	ret    

00000000000427b2 <check_keyboard>:
//    Check for the user typing a control key. 'a', 'f', and 'e' cause a soft
//    reboot where the kernel runs the allocator programs, "fork", or
//    "forkexit", respectively. Control-C or 'q' exit the virtual machine.
//    Returns key typed or -1 for no key.

int check_keyboard(void) {
   427b2:	f3 0f 1e fa          	endbr64 
   427b6:	55                   	push   %rbp
   427b7:	48 89 e5             	mov    %rsp,%rbp
   427ba:	53                   	push   %rbx
   427bb:	48 83 ec 48          	sub    $0x48,%rsp
    int c = keyboard_readc();
   427bf:	e8 73 fb ff ff       	call   42337 <keyboard_readc>
   427c4:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   427c7:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   427cb:	74 1c                	je     427e9 <check_keyboard+0x37>
   427cd:	83 7d e4 66          	cmpl   $0x66,-0x1c(%rbp)
   427d1:	74 16                	je     427e9 <check_keyboard+0x37>
   427d3:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   427d7:	74 10                	je     427e9 <check_keyboard+0x37>
   427d9:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   427dd:	74 0a                	je     427e9 <check_keyboard+0x37>
   427df:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   427e3:	0f 85 02 01 00 00    	jne    428eb <check_keyboard+0x139>
        // Install a temporary page table to carry us through the
        // process of reinitializing memory. This replicates work the
        // bootloader does.
        x86_64_pagetable* pt = (x86_64_pagetable*) 0x8000;
   427e9:	48 c7 45 d8 00 80 00 	movq   $0x8000,-0x28(%rbp)
   427f0:	00 
        memset(pt, 0, PAGESIZE * 3);
   427f1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   427f5:	ba 00 30 00 00       	mov    $0x3000,%edx
   427fa:	be 00 00 00 00       	mov    $0x0,%esi
   427ff:	48 89 c7             	mov    %rax,%rdi
   42802:	e8 8c 0e 00 00       	call   43693 <memset>
        pt[0].entry[0] = 0x9000 | PTE_P | PTE_W | PTE_U;
   42807:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4280b:	48 c7 00 07 90 00 00 	movq   $0x9007,(%rax)
        pt[1].entry[0] = 0xA000 | PTE_P | PTE_W | PTE_U;
   42812:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42816:	48 05 00 10 00 00    	add    $0x1000,%rax
   4281c:	48 c7 00 07 a0 00 00 	movq   $0xa007,(%rax)
        pt[2].entry[0] = PTE_P | PTE_W | PTE_U | PTE_PS;
   42823:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42827:	48 05 00 20 00 00    	add    $0x2000,%rax
   4282d:	48 c7 00 87 00 00 00 	movq   $0x87,(%rax)
        lcr3((uintptr_t) pt);
   42834:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42838:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
}

static inline void lcr3(uintptr_t val) {
    asm volatile("" : : : "memory");
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   4283c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42840:	0f 22 d8             	mov    %rax,%cr3
}
   42843:	90                   	nop
        // The soft reboot process doesn't modify memory, so it's
        // safe to pass `multiboot_info` on the kernel stack, even
        // though it will get overwritten as the kernel runs.
        uint32_t multiboot_info[5];
        multiboot_info[0] = 4;
   42844:	c7 45 b4 04 00 00 00 	movl   $0x4,-0x4c(%rbp)
        const char* argument = "fork";
   4284b:	48 8d 05 46 23 00 00 	lea    0x2346(%rip),%rax        # 44b98 <complex_keymap+0x58>
   42852:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        if (c == 'a') {
   42856:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   4285a:	75 0d                	jne    42869 <check_keyboard+0xb7>
            argument = "allocator";
   4285c:	48 8d 05 3a 23 00 00 	lea    0x233a(%rip),%rax        # 44b9d <complex_keymap+0x5d>
   42863:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   42867:	eb 37                	jmp    428a0 <check_keyboard+0xee>
        } else if (c == 'e') {
   42869:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   4286d:	75 0d                	jne    4287c <check_keyboard+0xca>
            argument = "forkexit";
   4286f:	48 8d 05 31 23 00 00 	lea    0x2331(%rip),%rax        # 44ba7 <complex_keymap+0x67>
   42876:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   4287a:	eb 24                	jmp    428a0 <check_keyboard+0xee>
        }
        else if (c == 't'){
   4287c:	83 7d e4 74          	cmpl   $0x74,-0x1c(%rbp)
   42880:	75 0d                	jne    4288f <check_keyboard+0xdd>
            argument = "test";
   42882:	48 8d 05 27 23 00 00 	lea    0x2327(%rip),%rax        # 44bb0 <complex_keymap+0x70>
   42889:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   4288d:	eb 11                	jmp    428a0 <check_keyboard+0xee>
        }
        else if(c == '2'){
   4288f:	83 7d e4 32          	cmpl   $0x32,-0x1c(%rbp)
   42893:	75 0b                	jne    428a0 <check_keyboard+0xee>
            argument = "test2";
   42895:	48 8d 05 19 23 00 00 	lea    0x2319(%rip),%rax        # 44bb5 <complex_keymap+0x75>
   4289c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        }
        uintptr_t argument_ptr = (uintptr_t) argument;
   428a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   428a4:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        assert(argument_ptr < 0x100000000L);
   428a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   428ad:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
   428b1:	76 1e                	jbe    428d1 <check_keyboard+0x11f>
   428b3:	48 8d 05 01 23 00 00 	lea    0x2301(%rip),%rax        # 44bbb <complex_keymap+0x7b>
   428ba:	48 89 c2             	mov    %rax,%rdx
   428bd:	be 5d 02 00 00       	mov    $0x25d,%esi
   428c2:	48 8d 05 0e 23 00 00 	lea    0x230e(%rip),%rax        # 44bd7 <complex_keymap+0x97>
   428c9:	48 89 c7             	mov    %rax,%rdi
   428cc:	e8 33 01 00 00       	call   42a04 <assert_fail>
        multiboot_info[4] = (uint32_t) argument_ptr;
   428d1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   428d5:	89 45 c4             	mov    %eax,-0x3c(%rbp)
        asm volatile("movl $0x2BADB002, %%eax; jmp entry_from_boot"
   428d8:	48 8d 45 b4          	lea    -0x4c(%rbp),%rax
   428dc:	48 89 c3             	mov    %rax,%rbx
   428df:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
   428e4:	e9 17 d7 ff ff       	jmp    40000 <entry_from_boot>
    if (c == 'a' || c == 'f' || c == 'e' || c == 't' || c =='2') {
   428e9:	eb 11                	jmp    428fc <check_keyboard+0x14a>
                     : : "b" (multiboot_info) : "memory");
    } else if (c == 0x03 || c == 'q') {
   428eb:	83 7d e4 03          	cmpl   $0x3,-0x1c(%rbp)
   428ef:	74 06                	je     428f7 <check_keyboard+0x145>
   428f1:	83 7d e4 71          	cmpl   $0x71,-0x1c(%rbp)
   428f5:	75 05                	jne    428fc <check_keyboard+0x14a>
        poweroff();
   428f7:	e8 3c f8 ff ff       	call   42138 <poweroff>
    }
    return c;
   428fc:	8b 45 e4             	mov    -0x1c(%rbp),%eax
}
   428ff:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42903:	c9                   	leave  
   42904:	c3                   	ret    

0000000000042905 <fail>:

// fail
//    Loop until user presses Control-C, then poweroff.

static void fail(void) __attribute__((noreturn));
static void fail(void) {
   42905:	f3 0f 1e fa          	endbr64 
   42909:	55                   	push   %rbp
   4290a:	48 89 e5             	mov    %rsp,%rbp
    while (1) {
        check_keyboard();
   4290d:	e8 a0 fe ff ff       	call   427b2 <check_keyboard>
   42912:	eb f9                	jmp    4290d <fail+0x8>

0000000000042914 <panic>:

// panic, assert_fail
//    Use console_printf() to print a failure message and then wait for
//    control-C. Also write the failure message to the log.

void panic(const char* format, ...) {
   42914:	f3 0f 1e fa          	endbr64 
   42918:	55                   	push   %rbp
   42919:	48 89 e5             	mov    %rsp,%rbp
   4291c:	48 83 ec 60          	sub    $0x60,%rsp
   42920:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   42924:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   42928:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   4292c:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42930:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42934:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   42938:	c7 45 b0 08 00 00 00 	movl   $0x8,-0x50(%rbp)
   4293f:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42943:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   42947:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4294b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

    if (format) {
   4294f:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
   42954:	0f 84 87 00 00 00    	je     429e1 <panic+0xcd>
        // Print panic message to both the screen and the log
        int cpos = error_printf(CPOS(23, 0), 0xC000, "PANIC: ");
   4295a:	48 8d 05 8a 22 00 00 	lea    0x228a(%rip),%rax        # 44beb <complex_keymap+0xab>
   42961:	48 89 c2             	mov    %rax,%rdx
   42964:	be 00 c0 00 00       	mov    $0xc000,%esi
   42969:	bf 30 07 00 00       	mov    $0x730,%edi
   4296e:	b8 00 00 00 00       	mov    $0x0,%eax
   42973:	e8 e4 fd ff ff       	call   4275c <error_printf>
   42978:	89 45 cc             	mov    %eax,-0x34(%rbp)
        cpos = error_vprintf(cpos, 0xC000, format, val);
   4297b:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   4297f:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   42983:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42986:	be 00 c0 00 00       	mov    $0xc000,%esi
   4298b:	89 c7                	mov    %eax,%edi
   4298d:	e8 68 fd ff ff       	call   426fa <error_vprintf>
   42992:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (CCOL(cpos)) {
   42995:	8b 4d cc             	mov    -0x34(%rbp),%ecx
   42998:	48 63 c1             	movslq %ecx,%rax
   4299b:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   429a2:	48 c1 e8 20          	shr    $0x20,%rax
   429a6:	c1 f8 05             	sar    $0x5,%eax
   429a9:	89 ce                	mov    %ecx,%esi
   429ab:	c1 fe 1f             	sar    $0x1f,%esi
   429ae:	29 f0                	sub    %esi,%eax
   429b0:	89 c2                	mov    %eax,%edx
   429b2:	89 d0                	mov    %edx,%eax
   429b4:	c1 e0 02             	shl    $0x2,%eax
   429b7:	01 d0                	add    %edx,%eax
   429b9:	c1 e0 04             	shl    $0x4,%eax
   429bc:	29 c1                	sub    %eax,%ecx
   429be:	89 ca                	mov    %ecx,%edx
   429c0:	85 d2                	test   %edx,%edx
   429c2:	74 3b                	je     429ff <panic+0xeb>
            error_printf(cpos, 0xC000, "\n");
   429c4:	8b 45 cc             	mov    -0x34(%rbp),%eax
   429c7:	48 8d 15 25 22 00 00 	lea    0x2225(%rip),%rdx        # 44bf3 <complex_keymap+0xb3>
   429ce:	be 00 c0 00 00       	mov    $0xc000,%esi
   429d3:	89 c7                	mov    %eax,%edi
   429d5:	b8 00 00 00 00       	mov    $0x0,%eax
   429da:	e8 7d fd ff ff       	call   4275c <error_printf>
   429df:	eb 1e                	jmp    429ff <panic+0xeb>
        }
    } else {
        error_printf(CPOS(23, 0), 0xC000, "PANIC");
   429e1:	48 8d 05 0d 22 00 00 	lea    0x220d(%rip),%rax        # 44bf5 <complex_keymap+0xb5>
   429e8:	48 89 c2             	mov    %rax,%rdx
   429eb:	be 00 c0 00 00       	mov    $0xc000,%esi
   429f0:	bf 30 07 00 00       	mov    $0x730,%edi
   429f5:	b8 00 00 00 00       	mov    $0x0,%eax
   429fa:	e8 5d fd ff ff       	call   4275c <error_printf>
    }

    va_end(val);
    fail();
   429ff:	e8 01 ff ff ff       	call   42905 <fail>

0000000000042a04 <assert_fail>:
}

void assert_fail(const char* file, int line, const char* msg) {
   42a04:	f3 0f 1e fa          	endbr64 
   42a08:	55                   	push   %rbp
   42a09:	48 89 e5             	mov    %rsp,%rbp
   42a0c:	48 83 ec 20          	sub    $0x20,%rsp
   42a10:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42a14:	89 75 f4             	mov    %esi,-0xc(%rbp)
   42a17:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    panic("%s:%d: assertion '%s' failed\n", file, line, msg);
   42a1b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
   42a1f:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42a22:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42a26:	48 89 c6             	mov    %rax,%rsi
   42a29:	48 8d 05 cb 21 00 00 	lea    0x21cb(%rip),%rax        # 44bfb <complex_keymap+0xbb>
   42a30:	48 89 c7             	mov    %rax,%rdi
   42a33:	b8 00 00 00 00       	mov    $0x0,%eax
   42a38:	e8 d7 fe ff ff       	call   42914 <panic>

0000000000042a3d <default_exception>:
}

void default_exception(proc* p){
   42a3d:	f3 0f 1e fa          	endbr64 
   42a41:	55                   	push   %rbp
   42a42:	48 89 e5             	mov    %rsp,%rbp
   42a45:	48 83 ec 20          	sub    $0x20,%rsp
   42a49:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    x86_64_registers * reg = &(p->p_registers);
   42a4d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42a51:	48 83 c0 08          	add    $0x8,%rax
   42a55:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    panic("Unexpected exception %d!\n", reg->reg_intno);
   42a59:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42a5d:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   42a64:	48 89 c6             	mov    %rax,%rsi
   42a67:	48 8d 05 ab 21 00 00 	lea    0x21ab(%rip),%rax        # 44c19 <complex_keymap+0xd9>
   42a6e:	48 89 c7             	mov    %rax,%rdi
   42a71:	b8 00 00 00 00       	mov    $0x0,%eax
   42a76:	e8 99 fe ff ff       	call   42914 <panic>

0000000000042a7b <pageindex>:
static inline int pageindex(uintptr_t addr, int level) {
   42a7b:	55                   	push   %rbp
   42a7c:	48 89 e5             	mov    %rsp,%rbp
   42a7f:	48 83 ec 10          	sub    $0x10,%rsp
   42a83:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42a87:	89 75 f4             	mov    %esi,-0xc(%rbp)
    assert(level >= 0 && level <= 3);
   42a8a:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   42a8e:	78 06                	js     42a96 <pageindex+0x1b>
   42a90:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
   42a94:	7e 1e                	jle    42ab4 <pageindex+0x39>
   42a96:	48 8d 05 9b 21 00 00 	lea    0x219b(%rip),%rax        # 44c38 <complex_keymap+0xf8>
   42a9d:	48 89 c2             	mov    %rax,%rdx
   42aa0:	be 1e 00 00 00       	mov    $0x1e,%esi
   42aa5:	48 8d 05 a5 21 00 00 	lea    0x21a5(%rip),%rax        # 44c51 <complex_keymap+0x111>
   42aac:	48 89 c7             	mov    %rax,%rdi
   42aaf:	e8 50 ff ff ff       	call   42a04 <assert_fail>
    return (int) (addr >> (PAGEOFFBITS + (3 - level) * PAGEINDEXBITS)) & 0x1FF;
   42ab4:	b8 03 00 00 00       	mov    $0x3,%eax
   42ab9:	2b 45 f4             	sub    -0xc(%rbp),%eax
   42abc:	89 c2                	mov    %eax,%edx
   42abe:	89 d0                	mov    %edx,%eax
   42ac0:	c1 e0 03             	shl    $0x3,%eax
   42ac3:	01 d0                	add    %edx,%eax
   42ac5:	83 c0 0c             	add    $0xc,%eax
   42ac8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   42acc:	89 c1                	mov    %eax,%ecx
   42ace:	48 d3 ea             	shr    %cl,%rdx
   42ad1:	48 89 d0             	mov    %rdx,%rax
   42ad4:	25 ff 01 00 00       	and    $0x1ff,%eax
}
   42ad9:	c9                   	leave  
   42ada:	c3                   	ret    

0000000000042adb <virtual_memory_init>:

static x86_64_pagetable kernel_pagetables[5];
x86_64_pagetable *kernel_pagetable;

void virtual_memory_init(void)
{
   42adb:	f3 0f 1e fa          	endbr64 
   42adf:	55                   	push   %rbp
   42ae0:	48 89 e5             	mov    %rsp,%rbp
   42ae3:	48 83 ec 20          	sub    $0x20,%rsp
    kernel_pagetable = &kernel_pagetables[0];
   42ae7:	48 8d 05 12 35 01 00 	lea    0x13512(%rip),%rax        # 56000 <kernel_pagetables>
   42aee:	48 89 05 0b 25 01 00 	mov    %rax,0x1250b(%rip)        # 55000 <kernel_pagetable>
    memset(kernel_pagetables, 0, sizeof(kernel_pagetables));
   42af5:	ba 00 50 00 00       	mov    $0x5000,%edx
   42afa:	be 00 00 00 00       	mov    $0x0,%esi
   42aff:	48 8d 05 fa 34 01 00 	lea    0x134fa(%rip),%rax        # 56000 <kernel_pagetables>
   42b06:	48 89 c7             	mov    %rax,%rdi
   42b09:	e8 85 0b 00 00       	call   43693 <memset>

    // connect the pagetable pages
    kernel_pagetables[0].entry[0] =
        (x86_64_pageentry_t)&kernel_pagetables[1] | PTE_P | PTE_W | PTE_U;
   42b0e:	48 8d 05 eb 44 01 00 	lea    0x144eb(%rip),%rax        # 57000 <kernel_pagetables+0x1000>
   42b15:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[0].entry[0] =
   42b19:	48 89 05 e0 34 01 00 	mov    %rax,0x134e0(%rip)        # 56000 <kernel_pagetables>
    kernel_pagetables[1].entry[0] =
        (x86_64_pageentry_t)&kernel_pagetables[2] | PTE_P | PTE_W | PTE_U;
   42b20:	48 8d 05 d9 54 01 00 	lea    0x154d9(%rip),%rax        # 58000 <kernel_pagetables+0x2000>
   42b27:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[1].entry[0] =
   42b2b:	48 89 05 ce 44 01 00 	mov    %rax,0x144ce(%rip)        # 57000 <kernel_pagetables+0x1000>
    kernel_pagetables[2].entry[0] =
        (x86_64_pageentry_t)&kernel_pagetables[3] | PTE_P | PTE_W | PTE_U;
   42b32:	48 8d 05 c7 64 01 00 	lea    0x164c7(%rip),%rax        # 59000 <kernel_pagetables+0x3000>
   42b39:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[0] =
   42b3d:	48 89 05 bc 54 01 00 	mov    %rax,0x154bc(%rip)        # 58000 <kernel_pagetables+0x2000>
    kernel_pagetables[2].entry[1] =
        (x86_64_pageentry_t)&kernel_pagetables[4] | PTE_P | PTE_W | PTE_U;
   42b44:	48 8d 05 b5 74 01 00 	lea    0x174b5(%rip),%rax        # 5a000 <kernel_pagetables+0x4000>
   42b4b:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[1] =
   42b4f:	48 89 05 b2 54 01 00 	mov    %rax,0x154b2(%rip)        # 58008 <kernel_pagetables+0x2008>

    // identity map the page table
    virtual_memory_map(kernel_pagetable, (uintptr_t)0, (uintptr_t)0,
   42b56:	48 8b 05 a3 24 01 00 	mov    0x124a3(%rip),%rax        # 55000 <kernel_pagetable>
   42b5d:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   42b63:	b9 00 00 20 00       	mov    $0x200000,%ecx
   42b68:	ba 00 00 00 00       	mov    $0x0,%edx
   42b6d:	be 00 00 00 00       	mov    $0x0,%esi
   42b72:	48 89 c7             	mov    %rax,%rdi
   42b75:	e8 0e 02 00 00       	call   42d88 <virtual_memory_map>
                       MEMSIZE_PHYSICAL, PTE_P | PTE_W | PTE_U);

    // check if kernel is identity mapped
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE)
   42b7a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   42b81:	00 
   42b82:	eb 76                	jmp    42bfa <virtual_memory_init+0x11f>
    {
        vamapping vmap = virtual_memory_lookup(kernel_pagetable, addr);
   42b84:	48 8b 0d 75 24 01 00 	mov    0x12475(%rip),%rcx        # 55000 <kernel_pagetable>
   42b8b:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   42b8f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   42b93:	48 89 ce             	mov    %rcx,%rsi
   42b96:	48 89 c7             	mov    %rax,%rdi
   42b99:	e8 2e 06 00 00       	call   431cc <virtual_memory_lookup>
        // this assert will probably fail initially!
        // have you implemented virtual_memory_map and lookup_l1pagetable ?
        assert(vmap.pa == addr);
   42b9e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42ba2:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   42ba6:	74 1e                	je     42bc6 <virtual_memory_init+0xeb>
   42ba8:	48 8d 05 b6 20 00 00 	lea    0x20b6(%rip),%rax        # 44c65 <complex_keymap+0x125>
   42baf:	48 89 c2             	mov    %rax,%rdx
   42bb2:	be 2e 00 00 00       	mov    $0x2e,%esi
   42bb7:	48 8d 05 b7 20 00 00 	lea    0x20b7(%rip),%rax        # 44c75 <complex_keymap+0x135>
   42bbe:	48 89 c7             	mov    %rax,%rdi
   42bc1:	e8 3e fe ff ff       	call   42a04 <assert_fail>
        assert((vmap.perm & (PTE_P | PTE_W)) == (PTE_P | PTE_W));
   42bc6:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42bc9:	48 98                	cltq   
   42bcb:	83 e0 03             	and    $0x3,%eax
   42bce:	48 83 f8 03          	cmp    $0x3,%rax
   42bd2:	74 1e                	je     42bf2 <virtual_memory_init+0x117>
   42bd4:	48 8d 05 ad 20 00 00 	lea    0x20ad(%rip),%rax        # 44c88 <complex_keymap+0x148>
   42bdb:	48 89 c2             	mov    %rax,%rdx
   42bde:	be 2f 00 00 00       	mov    $0x2f,%esi
   42be3:	48 8d 05 8b 20 00 00 	lea    0x208b(%rip),%rax        # 44c75 <complex_keymap+0x135>
   42bea:	48 89 c7             	mov    %rax,%rdi
   42bed:	e8 12 fe ff ff       	call   42a04 <assert_fail>
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE)
   42bf2:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   42bf9:	00 
   42bfa:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   42c01:	00 
   42c02:	76 80                	jbe    42b84 <virtual_memory_init+0xa9>
    }

    // set pointer to this pagetable in the CR3 register
    // set_pagetable also does several checks for a valid pagetable
    set_pagetable(kernel_pagetable);
   42c04:	48 8b 05 f5 23 01 00 	mov    0x123f5(%rip),%rax        # 55000 <kernel_pagetable>
   42c0b:	48 89 c7             	mov    %rax,%rdi
   42c0e:	e8 03 00 00 00       	call   42c16 <set_pagetable>
}
   42c13:	90                   	nop
   42c14:	c9                   	leave  
   42c15:	c3                   	ret    

0000000000042c16 <set_pagetable>:
//    Change page directory. lcr3() is the hardware instruction;
//    set_pagetable() additionally checks that important kernel procedures are
//    mappable in `pagetable`, and calls panic() if they aren't.

void set_pagetable(x86_64_pagetable *pagetable)
{
   42c16:	f3 0f 1e fa          	endbr64 
   42c1a:	55                   	push   %rbp
   42c1b:	48 89 e5             	mov    %rsp,%rbp
   42c1e:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   42c22:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
    assert(PAGEOFFSET(pagetable) == 0); // must be page aligned
   42c26:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42c2a:	25 ff 0f 00 00       	and    $0xfff,%eax
   42c2f:	48 85 c0             	test   %rax,%rax
   42c32:	74 1e                	je     42c52 <set_pagetable+0x3c>
   42c34:	48 8d 05 7e 20 00 00 	lea    0x207e(%rip),%rax        # 44cb9 <complex_keymap+0x179>
   42c3b:	48 89 c2             	mov    %rax,%rdx
   42c3e:	be 3e 00 00 00       	mov    $0x3e,%esi
   42c43:	48 8d 05 2b 20 00 00 	lea    0x202b(%rip),%rax        # 44c75 <complex_keymap+0x135>
   42c4a:	48 89 c7             	mov    %rax,%rdi
   42c4d:	e8 b2 fd ff ff       	call   42a04 <assert_fail>
    // check for kernel space being mapped in pagetable
    assert(virtual_memory_lookup(pagetable, (uintptr_t)default_int_handler).pa == (uintptr_t)default_int_handler);
   42c52:	48 c7 c0 9c 00 04 00 	mov    $0x4009c,%rax
   42c59:	48 89 c2             	mov    %rax,%rdx
   42c5c:	48 8d 45 98          	lea    -0x68(%rbp),%rax
   42c60:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42c64:	48 89 ce             	mov    %rcx,%rsi
   42c67:	48 89 c7             	mov    %rax,%rdi
   42c6a:	e8 5d 05 00 00       	call   431cc <virtual_memory_lookup>
   42c6f:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   42c73:	48 c7 c2 9c 00 04 00 	mov    $0x4009c,%rdx
   42c7a:	48 39 d0             	cmp    %rdx,%rax
   42c7d:	74 1e                	je     42c9d <set_pagetable+0x87>
   42c7f:	48 8d 05 52 20 00 00 	lea    0x2052(%rip),%rax        # 44cd8 <complex_keymap+0x198>
   42c86:	48 89 c2             	mov    %rax,%rdx
   42c89:	be 40 00 00 00       	mov    $0x40,%esi
   42c8e:	48 8d 05 e0 1f 00 00 	lea    0x1fe0(%rip),%rax        # 44c75 <complex_keymap+0x135>
   42c95:	48 89 c7             	mov    %rax,%rdi
   42c98:	e8 67 fd ff ff       	call   42a04 <assert_fail>
    assert(virtual_memory_lookup(kernel_pagetable, (uintptr_t)pagetable).pa == (uintptr_t)pagetable);
   42c9d:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
   42ca1:	48 8b 0d 58 23 01 00 	mov    0x12358(%rip),%rcx        # 55000 <kernel_pagetable>
   42ca8:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
   42cac:	48 89 ce             	mov    %rcx,%rsi
   42caf:	48 89 c7             	mov    %rax,%rdi
   42cb2:	e8 15 05 00 00       	call   431cc <virtual_memory_lookup>
   42cb7:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42cbb:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42cbf:	48 39 c2             	cmp    %rax,%rdx
   42cc2:	74 1e                	je     42ce2 <set_pagetable+0xcc>
   42cc4:	48 8d 05 75 20 00 00 	lea    0x2075(%rip),%rax        # 44d40 <complex_keymap+0x200>
   42ccb:	48 89 c2             	mov    %rax,%rdx
   42cce:	be 41 00 00 00       	mov    $0x41,%esi
   42cd3:	48 8d 05 9b 1f 00 00 	lea    0x1f9b(%rip),%rax        # 44c75 <complex_keymap+0x135>
   42cda:	48 89 c7             	mov    %rax,%rdi
   42cdd:	e8 22 fd ff ff       	call   42a04 <assert_fail>
    assert(virtual_memory_lookup(pagetable, (uintptr_t)kernel_pagetable).pa == (uintptr_t)kernel_pagetable);
   42ce2:	48 8b 05 17 23 01 00 	mov    0x12317(%rip),%rax        # 55000 <kernel_pagetable>
   42ce9:	48 89 c2             	mov    %rax,%rdx
   42cec:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
   42cf0:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42cf4:	48 89 ce             	mov    %rcx,%rsi
   42cf7:	48 89 c7             	mov    %rax,%rdi
   42cfa:	e8 cd 04 00 00       	call   431cc <virtual_memory_lookup>
   42cff:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42d03:	48 8b 15 f6 22 01 00 	mov    0x122f6(%rip),%rdx        # 55000 <kernel_pagetable>
   42d0a:	48 39 d0             	cmp    %rdx,%rax
   42d0d:	74 1e                	je     42d2d <set_pagetable+0x117>
   42d0f:	48 8d 05 8a 20 00 00 	lea    0x208a(%rip),%rax        # 44da0 <complex_keymap+0x260>
   42d16:	48 89 c2             	mov    %rax,%rdx
   42d19:	be 42 00 00 00       	mov    $0x42,%esi
   42d1e:	48 8d 05 50 1f 00 00 	lea    0x1f50(%rip),%rax        # 44c75 <complex_keymap+0x135>
   42d25:	48 89 c7             	mov    %rax,%rdi
   42d28:	e8 d7 fc ff ff       	call   42a04 <assert_fail>
    assert(virtual_memory_lookup(pagetable, (uintptr_t)virtual_memory_map).pa == (uintptr_t)virtual_memory_map);
   42d2d:	48 8d 15 54 00 00 00 	lea    0x54(%rip),%rdx        # 42d88 <virtual_memory_map>
   42d34:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   42d38:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42d3c:	48 89 ce             	mov    %rcx,%rsi
   42d3f:	48 89 c7             	mov    %rax,%rdi
   42d42:	e8 85 04 00 00       	call   431cc <virtual_memory_lookup>
   42d47:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42d4b:	48 8d 15 36 00 00 00 	lea    0x36(%rip),%rdx        # 42d88 <virtual_memory_map>
   42d52:	48 39 d0             	cmp    %rdx,%rax
   42d55:	74 1e                	je     42d75 <set_pagetable+0x15f>
   42d57:	48 8d 05 a2 20 00 00 	lea    0x20a2(%rip),%rax        # 44e00 <complex_keymap+0x2c0>
   42d5e:	48 89 c2             	mov    %rax,%rdx
   42d61:	be 43 00 00 00       	mov    $0x43,%esi
   42d66:	48 8d 05 08 1f 00 00 	lea    0x1f08(%rip),%rax        # 44c75 <complex_keymap+0x135>
   42d6d:	48 89 c7             	mov    %rax,%rdi
   42d70:	e8 8f fc ff ff       	call   42a04 <assert_fail>
    lcr3((uintptr_t)pagetable);
   42d75:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42d79:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   42d7d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42d81:	0f 22 d8             	mov    %rax,%cr3
}
   42d84:	90                   	nop
}
   42d85:	90                   	nop
   42d86:	c9                   	leave  
   42d87:	c3                   	ret    

0000000000042d88 <virtual_memory_map>:
static x86_64_pagetable *lookup_l1pagetable(x86_64_pagetable *pagetable,
                                            uintptr_t va, int perm);

int virtual_memory_map(x86_64_pagetable *pagetable, uintptr_t va,
                       uintptr_t pa, size_t sz, int perm)
{
   42d88:	f3 0f 1e fa          	endbr64 
   42d8c:	55                   	push   %rbp
   42d8d:	48 89 e5             	mov    %rsp,%rbp
   42d90:	53                   	push   %rbx
   42d91:	48 83 ec 58          	sub    $0x58,%rsp
   42d95:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   42d99:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   42d9d:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
   42da1:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
   42da5:	44 89 45 ac          	mov    %r8d,-0x54(%rbp)

    // sanity checks for virtual address, size, and permisions
    assert(va % PAGESIZE == 0);            // virtual address is page-aligned
   42da9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42dad:	25 ff 0f 00 00       	and    $0xfff,%eax
   42db2:	48 85 c0             	test   %rax,%rax
   42db5:	74 1e                	je     42dd5 <virtual_memory_map+0x4d>
   42db7:	48 8d 05 a6 20 00 00 	lea    0x20a6(%rip),%rax        # 44e64 <complex_keymap+0x324>
   42dbe:	48 89 c2             	mov    %rax,%rdx
   42dc1:	be 64 00 00 00       	mov    $0x64,%esi
   42dc6:	48 8d 05 a8 1e 00 00 	lea    0x1ea8(%rip),%rax        # 44c75 <complex_keymap+0x135>
   42dcd:	48 89 c7             	mov    %rax,%rdi
   42dd0:	e8 2f fc ff ff       	call   42a04 <assert_fail>
    assert(sz % PAGESIZE == 0);            // size is a multiple of PAGESIZE
   42dd5:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42dd9:	25 ff 0f 00 00       	and    $0xfff,%eax
   42dde:	48 85 c0             	test   %rax,%rax
   42de1:	74 1e                	je     42e01 <virtual_memory_map+0x79>
   42de3:	48 8d 05 8d 20 00 00 	lea    0x208d(%rip),%rax        # 44e77 <complex_keymap+0x337>
   42dea:	48 89 c2             	mov    %rax,%rdx
   42ded:	be 65 00 00 00       	mov    $0x65,%esi
   42df2:	48 8d 05 7c 1e 00 00 	lea    0x1e7c(%rip),%rax        # 44c75 <complex_keymap+0x135>
   42df9:	48 89 c7             	mov    %rax,%rdi
   42dfc:	e8 03 fc ff ff       	call   42a04 <assert_fail>
    assert(va + sz >= va || va + sz == 0); // va range does not wrap
   42e01:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   42e05:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42e09:	48 01 d0             	add    %rdx,%rax
   42e0c:	48 39 45 c0          	cmp    %rax,-0x40(%rbp)
   42e10:	76 2e                	jbe    42e40 <virtual_memory_map+0xb8>
   42e12:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   42e16:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42e1a:	48 01 d0             	add    %rdx,%rax
   42e1d:	48 85 c0             	test   %rax,%rax
   42e20:	74 1e                	je     42e40 <virtual_memory_map+0xb8>
   42e22:	48 8d 05 61 20 00 00 	lea    0x2061(%rip),%rax        # 44e8a <complex_keymap+0x34a>
   42e29:	48 89 c2             	mov    %rax,%rdx
   42e2c:	be 66 00 00 00       	mov    $0x66,%esi
   42e31:	48 8d 05 3d 1e 00 00 	lea    0x1e3d(%rip),%rax        # 44c75 <complex_keymap+0x135>
   42e38:	48 89 c7             	mov    %rax,%rdi
   42e3b:	e8 c4 fb ff ff       	call   42a04 <assert_fail>
    if (perm & PTE_P)
   42e40:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42e43:	48 98                	cltq   
   42e45:	83 e0 01             	and    $0x1,%eax
   42e48:	48 85 c0             	test   %rax,%rax
   42e4b:	0f 84 8c 00 00 00    	je     42edd <virtual_memory_map+0x155>
    {
        assert(pa % PAGESIZE == 0);          // physical addr is page-aligned
   42e51:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42e55:	25 ff 0f 00 00       	and    $0xfff,%eax
   42e5a:	48 85 c0             	test   %rax,%rax
   42e5d:	74 1e                	je     42e7d <virtual_memory_map+0xf5>
   42e5f:	48 8d 05 42 20 00 00 	lea    0x2042(%rip),%rax        # 44ea8 <complex_keymap+0x368>
   42e66:	48 89 c2             	mov    %rax,%rdx
   42e69:	be 69 00 00 00       	mov    $0x69,%esi
   42e6e:	48 8d 05 00 1e 00 00 	lea    0x1e00(%rip),%rax        # 44c75 <complex_keymap+0x135>
   42e75:	48 89 c7             	mov    %rax,%rdi
   42e78:	e8 87 fb ff ff       	call   42a04 <assert_fail>
        assert(pa + sz >= pa);               // physical address range does not wrap
   42e7d:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42e81:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42e85:	48 01 d0             	add    %rdx,%rax
   42e88:	48 39 45 b8          	cmp    %rax,-0x48(%rbp)
   42e8c:	76 1e                	jbe    42eac <virtual_memory_map+0x124>
   42e8e:	48 8d 05 26 20 00 00 	lea    0x2026(%rip),%rax        # 44ebb <complex_keymap+0x37b>
   42e95:	48 89 c2             	mov    %rax,%rdx
   42e98:	be 6a 00 00 00       	mov    $0x6a,%esi
   42e9d:	48 8d 05 d1 1d 00 00 	lea    0x1dd1(%rip),%rax        # 44c75 <complex_keymap+0x135>
   42ea4:	48 89 c7             	mov    %rax,%rdi
   42ea7:	e8 58 fb ff ff       	call   42a04 <assert_fail>
        assert(pa + sz <= MEMSIZE_PHYSICAL); // physical addresses exist
   42eac:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42eb0:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42eb4:	48 01 d0             	add    %rdx,%rax
   42eb7:	48 3d 00 00 20 00    	cmp    $0x200000,%rax
   42ebd:	76 1e                	jbe    42edd <virtual_memory_map+0x155>
   42ebf:	48 8d 05 03 20 00 00 	lea    0x2003(%rip),%rax        # 44ec9 <complex_keymap+0x389>
   42ec6:	48 89 c2             	mov    %rax,%rdx
   42ec9:	be 6b 00 00 00       	mov    $0x6b,%esi
   42ece:	48 8d 05 a0 1d 00 00 	lea    0x1da0(%rip),%rax        # 44c75 <complex_keymap+0x135>
   42ed5:	48 89 c7             	mov    %rax,%rdi
   42ed8:	e8 27 fb ff ff       	call   42a04 <assert_fail>
    }
    assert(perm >= 0 && perm < 0x1000);           // `perm` makes sense (perm can only be 12 bits)
   42edd:	83 7d ac 00          	cmpl   $0x0,-0x54(%rbp)
   42ee1:	78 09                	js     42eec <virtual_memory_map+0x164>
   42ee3:	81 7d ac ff 0f 00 00 	cmpl   $0xfff,-0x54(%rbp)
   42eea:	7e 1e                	jle    42f0a <virtual_memory_map+0x182>
   42eec:	48 8d 05 f2 1f 00 00 	lea    0x1ff2(%rip),%rax        # 44ee5 <complex_keymap+0x3a5>
   42ef3:	48 89 c2             	mov    %rax,%rdx
   42ef6:	be 6d 00 00 00       	mov    $0x6d,%esi
   42efb:	48 8d 05 73 1d 00 00 	lea    0x1d73(%rip),%rax        # 44c75 <complex_keymap+0x135>
   42f02:	48 89 c7             	mov    %rax,%rdi
   42f05:	e8 fa fa ff ff       	call   42a04 <assert_fail>
    assert((uintptr_t)pagetable % PAGESIZE == 0); // `pagetable` page-aligned
   42f0a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42f0e:	25 ff 0f 00 00       	and    $0xfff,%eax
   42f13:	48 85 c0             	test   %rax,%rax
   42f16:	74 1e                	je     42f36 <virtual_memory_map+0x1ae>
   42f18:	48 8d 05 e1 1f 00 00 	lea    0x1fe1(%rip),%rax        # 44f00 <complex_keymap+0x3c0>
   42f1f:	48 89 c2             	mov    %rax,%rdx
   42f22:	be 6e 00 00 00       	mov    $0x6e,%esi
   42f27:	48 8d 05 47 1d 00 00 	lea    0x1d47(%rip),%rax        # 44c75 <complex_keymap+0x135>
   42f2e:	48 89 c7             	mov    %rax,%rdi
   42f31:	e8 ce fa ff ff       	call   42a04 <assert_fail>

    int last_index123 = -1;
   42f36:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%rbp)
    x86_64_pagetable *l1pagetable = NULL;
   42f3d:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
   42f44:	00 

    // for each page-aligned address, set the appropriate page entry
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE)
   42f45:	e9 e6 00 00 00       	jmp    43030 <virtual_memory_map+0x2a8>
    {
        int cur_index123 = (va >> (PAGEOFFBITS + PAGEINDEXBITS));
   42f4a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42f4e:	48 c1 e8 15          	shr    $0x15,%rax
   42f52:	89 45 dc             	mov    %eax,-0x24(%rbp)
        if (cur_index123 != last_index123)
   42f55:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42f58:	3b 45 ec             	cmp    -0x14(%rbp),%eax
   42f5b:	74 20                	je     42f7d <virtual_memory_map+0x1f5>
        {
            // TODO
            // find pointer to last level pagetable for current va
            l1pagetable = lookup_l1pagetable(pagetable, va, perm);
   42f5d:	8b 55 ac             	mov    -0x54(%rbp),%edx
   42f60:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   42f64:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42f68:	48 89 ce             	mov    %rcx,%rsi
   42f6b:	48 89 c7             	mov    %rax,%rdi
   42f6e:	e8 d3 00 00 00       	call   43046 <lookup_l1pagetable>
   42f73:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            last_index123 = cur_index123;
   42f77:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42f7a:	89 45 ec             	mov    %eax,-0x14(%rbp)
        }
        if ((perm & PTE_P) && l1pagetable)
   42f7d:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42f80:	48 98                	cltq   
   42f82:	83 e0 01             	and    $0x1,%eax
   42f85:	48 85 c0             	test   %rax,%rax
   42f88:	74 34                	je     42fbe <virtual_memory_map+0x236>
   42f8a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   42f8f:	74 2d                	je     42fbe <virtual_memory_map+0x236>
        { // if page is marked present
            l1pagetable->entry[PAGEINDEX(va, 3)] = pa | perm;
   42f91:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42f94:	48 63 d8             	movslq %eax,%rbx
   42f97:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42f9b:	be 03 00 00 00       	mov    $0x3,%esi
   42fa0:	48 89 c7             	mov    %rax,%rdi
   42fa3:	e8 d3 fa ff ff       	call   42a7b <pageindex>
   42fa8:	89 c2                	mov    %eax,%edx
   42faa:	48 0b 5d b8          	or     -0x48(%rbp),%rbx
   42fae:	48 89 d9             	mov    %rbx,%rcx
   42fb1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42fb5:	48 63 d2             	movslq %edx,%rdx
   42fb8:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   42fbc:	eb 5a                	jmp    43018 <virtual_memory_map+0x290>
        }
        else if (l1pagetable)
   42fbe:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   42fc3:	74 26                	je     42feb <virtual_memory_map+0x263>
        { // if page is NOT marked present
            // TODO
            l1pagetable->entry[PAGEINDEX(va, 3)] = perm;
   42fc5:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42fc9:	be 03 00 00 00       	mov    $0x3,%esi
   42fce:	48 89 c7             	mov    %rax,%rdi
   42fd1:	e8 a5 fa ff ff       	call   42a7b <pageindex>
   42fd6:	89 c2                	mov    %eax,%edx
   42fd8:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42fdb:	48 63 c8             	movslq %eax,%rcx
   42fde:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42fe2:	48 63 d2             	movslq %edx,%rdx
   42fe5:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   42fe9:	eb 2d                	jmp    43018 <virtual_memory_map+0x290>
        }
        else if (perm & PTE_P)
   42feb:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42fee:	48 98                	cltq   
   42ff0:	83 e0 01             	and    $0x1,%eax
   42ff3:	48 85 c0             	test   %rax,%rax
   42ff6:	74 20                	je     43018 <virtual_memory_map+0x290>
        {
            // error, no allocated l1 page found for va
            log_printf("[Kern Info] failed to find l1pagetable address at " __FILE__ ": %d\n", __LINE__);
   42ff8:	be 8a 00 00 00       	mov    $0x8a,%esi
   42ffd:	48 8d 05 24 1f 00 00 	lea    0x1f24(%rip),%rax        # 44f28 <complex_keymap+0x3e8>
   43004:	48 89 c7             	mov    %rax,%rdi
   43007:	b8 00 00 00 00       	mov    $0x0,%eax
   4300c:	e8 98 f6 ff ff       	call   426a9 <log_printf>
            return -1;
   43011:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43016:	eb 28                	jmp    43040 <virtual_memory_map+0x2b8>
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE)
   43018:	48 81 45 c0 00 10 00 	addq   $0x1000,-0x40(%rbp)
   4301f:	00 
   43020:	48 81 45 b8 00 10 00 	addq   $0x1000,-0x48(%rbp)
   43027:	00 
   43028:	48 81 6d b0 00 10 00 	subq   $0x1000,-0x50(%rbp)
   4302f:	00 
   43030:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   43035:	0f 85 0f ff ff ff    	jne    42f4a <virtual_memory_map+0x1c2>
        }
    }
    return 0;
   4303b:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43040:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   43044:	c9                   	leave  
   43045:	c3                   	ret    

0000000000043046 <lookup_l1pagetable>:
//    Returns an x86_64_pagetable pointer to the last level pagetable
//    if it exists and can be accessed with the given permissions
//    Returns NULL otherwise
static x86_64_pagetable *lookup_l1pagetable(x86_64_pagetable *pagetable,
                                            uintptr_t va, int perm)
{
   43046:	f3 0f 1e fa          	endbr64 
   4304a:	55                   	push   %rbp
   4304b:	48 89 e5             	mov    %rsp,%rbp
   4304e:	48 83 ec 40          	sub    $0x40,%rsp
   43052:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   43056:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   4305a:	89 55 cc             	mov    %edx,-0x34(%rbp)
    x86_64_pagetable *pt = pagetable;
   4305d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43061:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    // 1. Find index to the next pagetable entry using the `va`
    // 2. Check if this entry has the appropriate requested permissions
    // 3. Repeat the steps till you reach the l1 pagetable (i.e thrice)
    // 4. return the pagetable address

    for (int i = 0; i <= 2; ++i)
   43065:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   4306c:	e9 4b 01 00 00       	jmp    431bc <lookup_l1pagetable+0x176>
    {
        // TODO
        // find page entry by finding `ith` level index of va to index pagetable entries of `pt`
        // you should read x86-64.h to understand relevant structs and macros to make this part easier
        x86_64_pageentry_t pe = pt->entry[PAGEINDEX(va, i)]; // replace this
   43071:	8b 55 f4             	mov    -0xc(%rbp),%edx
   43074:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   43078:	89 d6                	mov    %edx,%esi
   4307a:	48 89 c7             	mov    %rax,%rdi
   4307d:	e8 f9 f9 ff ff       	call   42a7b <pageindex>
   43082:	89 c2                	mov    %eax,%edx
   43084:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43088:	48 63 d2             	movslq %edx,%rdx
   4308b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   4308f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)

        if (!(pe & PTE_P))
   43093:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43097:	83 e0 01             	and    $0x1,%eax
   4309a:	48 85 c0             	test   %rax,%rax
   4309d:	75 6d                	jne    4310c <lookup_l1pagetable+0xc6>
        { // address of next level should be present AND PTE_P should be set, error otherwise
            log_printf("[Kern Info] Error looking up l1pagetable: Pagetable address: 0x%x perm: 0x%x."
   4309f:	8b 45 f4             	mov    -0xc(%rbp),%eax
   430a2:	8d 48 02             	lea    0x2(%rax),%ecx
   430a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   430a9:	25 ff 0f 00 00       	and    $0xfff,%eax
   430ae:	48 89 c2             	mov    %rax,%rdx
   430b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   430b5:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   430bb:	48 89 c6             	mov    %rax,%rsi
   430be:	48 8d 05 ab 1e 00 00 	lea    0x1eab(%rip),%rax        # 44f70 <complex_keymap+0x430>
   430c5:	48 89 c7             	mov    %rax,%rdi
   430c8:	b8 00 00 00 00       	mov    $0x0,%eax
   430cd:	e8 d7 f5 ff ff       	call   426a9 <log_printf>
                       " Failed to get level (%d)\n",
                       PTE_ADDR(pe), PTE_FLAGS(pe), (i + 2));
            if (!(perm & PTE_P))
   430d2:	8b 45 cc             	mov    -0x34(%rbp),%eax
   430d5:	48 98                	cltq   
   430d7:	83 e0 01             	and    $0x1,%eax
   430da:	48 85 c0             	test   %rax,%rax
   430dd:	75 0a                	jne    430e9 <lookup_l1pagetable+0xa3>
            {
                return NULL;
   430df:	b8 00 00 00 00       	mov    $0x0,%eax
   430e4:	e9 e1 00 00 00       	jmp    431ca <lookup_l1pagetable+0x184>
            }
            log_printf("[Kern Info] failed to find pagetable address at " __FILE__ ": %d\n", __LINE__);
   430e9:	be b2 00 00 00       	mov    $0xb2,%esi
   430ee:	48 8d 05 e3 1e 00 00 	lea    0x1ee3(%rip),%rax        # 44fd8 <complex_keymap+0x498>
   430f5:	48 89 c7             	mov    %rax,%rdi
   430f8:	b8 00 00 00 00       	mov    $0x0,%eax
   430fd:	e8 a7 f5 ff ff       	call   426a9 <log_printf>
            return NULL;
   43102:	b8 00 00 00 00       	mov    $0x0,%eax
   43107:	e9 be 00 00 00       	jmp    431ca <lookup_l1pagetable+0x184>
        }

        // sanity-check page entry and permissions
        assert(PTE_ADDR(pe) < MEMSIZE_PHYSICAL); // at sensible address
   4310c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43110:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   43116:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   4311c:	76 1e                	jbe    4313c <lookup_l1pagetable+0xf6>
   4311e:	48 8d 05 fb 1e 00 00 	lea    0x1efb(%rip),%rax        # 45020 <complex_keymap+0x4e0>
   43125:	48 89 c2             	mov    %rax,%rdx
   43128:	be b7 00 00 00       	mov    $0xb7,%esi
   4312d:	48 8d 05 41 1b 00 00 	lea    0x1b41(%rip),%rax        # 44c75 <complex_keymap+0x135>
   43134:	48 89 c7             	mov    %rax,%rdi
   43137:	e8 c8 f8 ff ff       	call   42a04 <assert_fail>
        if (perm & PTE_W)
   4313c:	8b 45 cc             	mov    -0x34(%rbp),%eax
   4313f:	48 98                	cltq   
   43141:	83 e0 02             	and    $0x2,%eax
   43144:	48 85 c0             	test   %rax,%rax
   43147:	74 2a                	je     43173 <lookup_l1pagetable+0x12d>
        {                       // if requester wants PTE_W,
            assert(pe & PTE_W); //   entry must allow PTE_W
   43149:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4314d:	83 e0 02             	and    $0x2,%eax
   43150:	48 85 c0             	test   %rax,%rax
   43153:	75 1e                	jne    43173 <lookup_l1pagetable+0x12d>
   43155:	48 8d 05 e4 1e 00 00 	lea    0x1ee4(%rip),%rax        # 45040 <complex_keymap+0x500>
   4315c:	48 89 c2             	mov    %rax,%rdx
   4315f:	be ba 00 00 00       	mov    $0xba,%esi
   43164:	48 8d 05 0a 1b 00 00 	lea    0x1b0a(%rip),%rax        # 44c75 <complex_keymap+0x135>
   4316b:	48 89 c7             	mov    %rax,%rdi
   4316e:	e8 91 f8 ff ff       	call   42a04 <assert_fail>
        }
        if (perm & PTE_U)
   43173:	8b 45 cc             	mov    -0x34(%rbp),%eax
   43176:	48 98                	cltq   
   43178:	83 e0 04             	and    $0x4,%eax
   4317b:	48 85 c0             	test   %rax,%rax
   4317e:	74 2a                	je     431aa <lookup_l1pagetable+0x164>
        {                       // if requester wants PTE_U,
            assert(pe & PTE_U); //   entry must allow PTE_U
   43180:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43184:	83 e0 04             	and    $0x4,%eax
   43187:	48 85 c0             	test   %rax,%rax
   4318a:	75 1e                	jne    431aa <lookup_l1pagetable+0x164>
   4318c:	48 8d 05 b8 1e 00 00 	lea    0x1eb8(%rip),%rax        # 4504b <complex_keymap+0x50b>
   43193:	48 89 c2             	mov    %rax,%rdx
   43196:	be be 00 00 00       	mov    $0xbe,%esi
   4319b:	48 8d 05 d3 1a 00 00 	lea    0x1ad3(%rip),%rax        # 44c75 <complex_keymap+0x135>
   431a2:	48 89 c7             	mov    %rax,%rdi
   431a5:	e8 5a f8 ff ff       	call   42a04 <assert_fail>
        }

        // TODO
        // set pt to physical address to next pagetable using `pe`
        pt = (x86_64_pagetable *)PTE_ADDR(pe);
   431aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   431ae:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   431b4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 2; ++i)
   431b8:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   431bc:	83 7d f4 02          	cmpl   $0x2,-0xc(%rbp)
   431c0:	0f 8e ab fe ff ff    	jle    43071 <lookup_l1pagetable+0x2b>
        // replace this
    }
    return pt;
   431c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   431ca:	c9                   	leave  
   431cb:	c3                   	ret    

00000000000431cc <virtual_memory_lookup>:
// virtual_memory_lookup(pagetable, va)
//    Returns information about the mapping of the virtual address `va` in
//    `pagetable`. The information is returned as a `vamapping` object.

vamapping virtual_memory_lookup(x86_64_pagetable *pagetable, uintptr_t va)
{
   431cc:	f3 0f 1e fa          	endbr64 
   431d0:	55                   	push   %rbp
   431d1:	48 89 e5             	mov    %rsp,%rbp
   431d4:	48 83 ec 50          	sub    $0x50,%rsp
   431d8:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   431dc:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   431e0:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    x86_64_pagetable *pt = pagetable;
   431e4:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   431e8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    x86_64_pageentry_t pe = PTE_W | PTE_U | PTE_P;
   431ec:	48 c7 45 f0 07 00 00 	movq   $0x7,-0x10(%rbp)
   431f3:	00 
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i)
   431f4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
   431fb:	eb 41                	jmp    4323e <virtual_memory_lookup+0x72>
    {
        pe = pt->entry[PAGEINDEX(va, i)] & ~(pe & (PTE_W | PTE_U));
   431fd:	8b 55 ec             	mov    -0x14(%rbp),%edx
   43200:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   43204:	89 d6                	mov    %edx,%esi
   43206:	48 89 c7             	mov    %rax,%rdi
   43209:	e8 6d f8 ff ff       	call   42a7b <pageindex>
   4320e:	89 c2                	mov    %eax,%edx
   43210:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43214:	48 63 d2             	movslq %edx,%rdx
   43217:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
   4321b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4321f:	83 e0 06             	and    $0x6,%eax
   43222:	48 f7 d0             	not    %rax
   43225:	48 21 d0             	and    %rdx,%rax
   43228:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        pt = (x86_64_pagetable *)PTE_ADDR(pe);
   4322c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43230:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   43236:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 3 && (pe & PTE_P); ++i)
   4323a:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
   4323e:	83 7d ec 03          	cmpl   $0x3,-0x14(%rbp)
   43242:	7f 0c                	jg     43250 <virtual_memory_lookup+0x84>
   43244:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43248:	83 e0 01             	and    $0x1,%eax
   4324b:	48 85 c0             	test   %rax,%rax
   4324e:	75 ad                	jne    431fd <virtual_memory_lookup+0x31>
    }
    vamapping vam = {-1, (uintptr_t)-1, 0};
   43250:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%rbp)
   43257:	48 c7 45 d8 ff ff ff 	movq   $0xffffffffffffffff,-0x28(%rbp)
   4325e:	ff 
   4325f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    if (pe & PTE_P)
   43266:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4326a:	83 e0 01             	and    $0x1,%eax
   4326d:	48 85 c0             	test   %rax,%rax
   43270:	74 34                	je     432a6 <virtual_memory_lookup+0xda>
    {
        vam.pn = PAGENUMBER(pe);
   43272:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43276:	48 c1 e8 0c          	shr    $0xc,%rax
   4327a:	89 45 d0             	mov    %eax,-0x30(%rbp)
        vam.pa = PTE_ADDR(pe) + PAGEOFFSET(va);
   4327d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43281:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   43287:	48 89 c2             	mov    %rax,%rdx
   4328a:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4328e:	25 ff 0f 00 00       	and    $0xfff,%eax
   43293:	48 09 d0             	or     %rdx,%rax
   43296:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        vam.perm = PTE_FLAGS(pe);
   4329a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4329e:	25 ff 0f 00 00       	and    $0xfff,%eax
   432a3:	89 45 e0             	mov    %eax,-0x20(%rbp)
    }
    return vam;
   432a6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   432aa:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   432ae:	48 89 10             	mov    %rdx,(%rax)
   432b1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   432b5:	48 89 50 08          	mov    %rdx,0x8(%rax)
   432b9:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   432bd:	48 89 50 10          	mov    %rdx,0x10(%rax)
}
   432c1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   432c5:	c9                   	leave  
   432c6:	c3                   	ret    

00000000000432c7 <program_load>:
//    `assign_physical_page` to as required. Returns 0 on success and
//    -1 on failure (e.g. out-of-memory). `allocator` is passed to
//    `virtual_memory_map`.

int program_load(proc* p, int programnumber,
                 x86_64_pagetable* (*allocator)(void)) {
   432c7:	f3 0f 1e fa          	endbr64 
   432cb:	55                   	push   %rbp
   432cc:	48 89 e5             	mov    %rsp,%rbp
   432cf:	48 83 ec 40          	sub    $0x40,%rsp
   432d3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   432d7:	89 75 d4             	mov    %esi,-0x2c(%rbp)
   432da:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    // is this a valid program?
    int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);
   432de:	c7 45 f8 07 00 00 00 	movl   $0x7,-0x8(%rbp)
    assert(programnumber >= 0 && programnumber < nprograms);
   432e5:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   432e9:	78 08                	js     432f3 <program_load+0x2c>
   432eb:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   432ee:	3b 45 f8             	cmp    -0x8(%rbp),%eax
   432f1:	7c 1e                	jl     43311 <program_load+0x4a>
   432f3:	48 8d 05 5e 1d 00 00 	lea    0x1d5e(%rip),%rax        # 45058 <complex_keymap+0x518>
   432fa:	48 89 c2             	mov    %rax,%rdx
   432fd:	be 37 00 00 00       	mov    $0x37,%esi
   43302:	48 8d 05 7f 1d 00 00 	lea    0x1d7f(%rip),%rax        # 45088 <complex_keymap+0x548>
   43309:	48 89 c7             	mov    %rax,%rdi
   4330c:	e8 f3 f6 ff ff       	call   42a04 <assert_fail>
    elf_header* eh = (elf_header*) ramimages[programnumber].begin;
   43311:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   43314:	48 98                	cltq   
   43316:	48 c1 e0 04          	shl    $0x4,%rax
   4331a:	48 89 c2             	mov    %rax,%rdx
   4331d:	48 8d 05 fc 2c 00 00 	lea    0x2cfc(%rip),%rax        # 46020 <ramimages>
   43324:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   43328:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    assert(eh->e_magic == ELF_MAGIC);
   4332c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43330:	8b 00                	mov    (%rax),%eax
   43332:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
   43337:	74 1e                	je     43357 <program_load+0x90>
   43339:	48 8d 05 5a 1d 00 00 	lea    0x1d5a(%rip),%rax        # 4509a <complex_keymap+0x55a>
   43340:	48 89 c2             	mov    %rax,%rdx
   43343:	be 39 00 00 00       	mov    $0x39,%esi
   43348:	48 8d 05 39 1d 00 00 	lea    0x1d39(%rip),%rax        # 45088 <complex_keymap+0x548>
   4334f:	48 89 c7             	mov    %rax,%rdi
   43352:	e8 ad f6 ff ff       	call   42a04 <assert_fail>

    // load each loadable program segment into memory
    elf_program* ph = (elf_program*) ((const uint8_t*) eh + eh->e_phoff);
   43357:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4335b:	48 8b 50 20          	mov    0x20(%rax),%rdx
   4335f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43363:	48 01 d0             	add    %rdx,%rax
   43366:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    for (int i = 0; i < eh->e_phnum; ++i) {
   4336a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   43371:	e9 94 00 00 00       	jmp    4340a <program_load+0x143>
        if (ph[i].p_type == ELF_PTYPE_LOAD) {
   43376:	8b 45 fc             	mov    -0x4(%rbp),%eax
   43379:	48 63 d0             	movslq %eax,%rdx
   4337c:	48 89 d0             	mov    %rdx,%rax
   4337f:	48 c1 e0 03          	shl    $0x3,%rax
   43383:	48 29 d0             	sub    %rdx,%rax
   43386:	48 c1 e0 03          	shl    $0x3,%rax
   4338a:	48 89 c2             	mov    %rax,%rdx
   4338d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43391:	48 01 d0             	add    %rdx,%rax
   43394:	8b 00                	mov    (%rax),%eax
   43396:	83 f8 01             	cmp    $0x1,%eax
   43399:	75 6b                	jne    43406 <program_load+0x13f>
            const uint8_t* pdata = (const uint8_t*) eh + ph[i].p_offset;
   4339b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4339e:	48 63 d0             	movslq %eax,%rdx
   433a1:	48 89 d0             	mov    %rdx,%rax
   433a4:	48 c1 e0 03          	shl    $0x3,%rax
   433a8:	48 29 d0             	sub    %rdx,%rax
   433ab:	48 c1 e0 03          	shl    $0x3,%rax
   433af:	48 89 c2             	mov    %rax,%rdx
   433b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   433b6:	48 01 d0             	add    %rdx,%rax
   433b9:	48 8b 50 08          	mov    0x8(%rax),%rdx
   433bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   433c1:	48 01 d0             	add    %rdx,%rax
   433c4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            if (program_load_segment(p, &ph[i], pdata, allocator) < 0) {
   433c8:	8b 45 fc             	mov    -0x4(%rbp),%eax
   433cb:	48 63 d0             	movslq %eax,%rdx
   433ce:	48 89 d0             	mov    %rdx,%rax
   433d1:	48 c1 e0 03          	shl    $0x3,%rax
   433d5:	48 29 d0             	sub    %rdx,%rax
   433d8:	48 c1 e0 03          	shl    $0x3,%rax
   433dc:	48 89 c2             	mov    %rax,%rdx
   433df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   433e3:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   433e7:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   433eb:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   433ef:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   433f3:	48 89 c7             	mov    %rax,%rdi
   433f6:	e8 3d 00 00 00       	call   43438 <program_load_segment>
   433fb:	85 c0                	test   %eax,%eax
   433fd:	79 07                	jns    43406 <program_load+0x13f>
                return -1;
   433ff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43404:	eb 30                	jmp    43436 <program_load+0x16f>
    for (int i = 0; i < eh->e_phnum; ++i) {
   43406:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4340a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4340e:	0f b7 40 38          	movzwl 0x38(%rax),%eax
   43412:	0f b7 c0             	movzwl %ax,%eax
   43415:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   43418:	0f 8c 58 ff ff ff    	jl     43376 <program_load+0xaf>
            }
        }
    }

    // set the entry point from the ELF header
    p->p_registers.reg_rip = eh->e_entry;
   4341e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43422:	48 8b 50 18          	mov    0x18(%rax),%rdx
   43426:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4342a:	48 89 90 a0 00 00 00 	mov    %rdx,0xa0(%rax)
    return 0;
   43431:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43436:	c9                   	leave  
   43437:	c3                   	ret    

0000000000043438 <program_load_segment>:
//    Calls `assign_physical_page` to allocate pages and `virtual_memory_map`
//    to map them in `p->p_pagetable`. Returns 0 on success and -1 on failure.

static int program_load_segment(proc* p, const elf_program* ph,
                                const uint8_t* src,
                                x86_64_pagetable* (*allocator)(void)) {
   43438:	f3 0f 1e fa          	endbr64 
   4343c:	55                   	push   %rbp
   4343d:	48 89 e5             	mov    %rsp,%rbp
   43440:	48 83 ec 40          	sub    $0x40,%rsp
   43444:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   43448:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   4344c:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   43450:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    uintptr_t va = (uintptr_t) ph->p_va;
   43454:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   43458:	48 8b 40 10          	mov    0x10(%rax),%rax
   4345c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    uintptr_t end_file = va + ph->p_filesz, end_mem = va + ph->p_memsz;
   43460:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   43464:	48 8b 50 20          	mov    0x20(%rax),%rdx
   43468:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4346c:	48 01 d0             	add    %rdx,%rax
   4346f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   43473:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   43477:	48 8b 50 28          	mov    0x28(%rax),%rdx
   4347b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4347f:	48 01 d0             	add    %rdx,%rax
   43482:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    va &= ~(PAGESIZE - 1);                // round to page boundary
   43486:	48 81 65 f0 00 f0 ff 	andq   $0xfffffffffffff000,-0x10(%rbp)
   4348d:	ff 

    // allocate memory
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   4348e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43492:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   43496:	e9 81 00 00 00       	jmp    4351c <program_load_segment+0xe4>
        if (assign_physical_page(addr, p->p_pid) < 0
   4349b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4349f:	8b 00                	mov    (%rax),%eax
   434a1:	0f be d0             	movsbl %al,%edx
   434a4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   434a8:	89 d6                	mov    %edx,%esi
   434aa:	48 89 c7             	mov    %rax,%rdi
   434ad:	e8 f5 d2 ff ff       	call   407a7 <assign_physical_page>
   434b2:	85 c0                	test   %eax,%eax
   434b4:	78 2a                	js     434e0 <program_load_segment+0xa8>
            || virtual_memory_map(p->p_pagetable, addr, addr, PAGESIZE,
   434b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   434ba:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   434c1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   434c5:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   434c9:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   434cf:	b9 00 10 00 00       	mov    $0x1000,%ecx
   434d4:	48 89 c7             	mov    %rax,%rdi
   434d7:	e8 ac f8 ff ff       	call   42d88 <virtual_memory_map>
   434dc:	85 c0                	test   %eax,%eax
   434de:	79 34                	jns    43514 <program_load_segment+0xdc>
                                  PTE_P | PTE_W | PTE_U) < 0) {
            console_printf(CPOS(22, 0), 0xC000, "program_load_segment(pid %d): can't assign address %p\n", p->p_pid, addr);
   434e0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   434e4:	8b 00                	mov    (%rax),%eax
   434e6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   434ea:	49 89 d0             	mov    %rdx,%r8
   434ed:	89 c1                	mov    %eax,%ecx
   434ef:	48 8d 05 c2 1b 00 00 	lea    0x1bc2(%rip),%rax        # 450b8 <complex_keymap+0x578>
   434f6:	48 89 c2             	mov    %rax,%rdx
   434f9:	be 00 c0 00 00       	mov    $0xc000,%esi
   434fe:	bf e0 06 00 00       	mov    $0x6e0,%edi
   43503:	b8 00 00 00 00       	mov    $0x0,%eax
   43508:	e8 c5 0f 00 00       	call   444d2 <console_printf>
            return -1;
   4350d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43512:	eb 77                	jmp    4358b <program_load_segment+0x153>
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43514:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   4351b:	00 
   4351c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43520:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
   43524:	0f 82 71 ff ff ff    	jb     4349b <program_load_segment+0x63>
        }
    }

    // ensure new memory mappings are active
    set_pagetable(p->p_pagetable);
   4352a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4352e:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   43535:	48 89 c7             	mov    %rax,%rdi
   43538:	e8 d9 f6 ff ff       	call   42c16 <set_pagetable>

    // copy data from executable image into process memory
    memcpy((uint8_t*) va, src, end_file - va);
   4353d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43541:	48 2b 45 f0          	sub    -0x10(%rbp),%rax
   43545:	48 89 c2             	mov    %rax,%rdx
   43548:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4354c:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   43550:	48 89 ce             	mov    %rcx,%rsi
   43553:	48 89 c7             	mov    %rax,%rdi
   43556:	e8 32 00 00 00       	call   4358d <memcpy>
    memset((uint8_t*) end_file, 0, end_mem - end_file);
   4355b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4355f:	48 2b 45 e8          	sub    -0x18(%rbp),%rax
   43563:	48 89 c2             	mov    %rax,%rdx
   43566:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4356a:	be 00 00 00 00       	mov    $0x0,%esi
   4356f:	48 89 c7             	mov    %rax,%rdi
   43572:	e8 1c 01 00 00       	call   43693 <memset>

    // restore kernel pagetable
    set_pagetable(kernel_pagetable);
   43577:	48 8b 05 82 1a 01 00 	mov    0x11a82(%rip),%rax        # 55000 <kernel_pagetable>
   4357e:	48 89 c7             	mov    %rax,%rdi
   43581:	e8 90 f6 ff ff       	call   42c16 <set_pagetable>
    return 0;
   43586:	b8 00 00 00 00       	mov    $0x0,%eax
}
   4358b:	c9                   	leave  
   4358c:	c3                   	ret    

000000000004358d <memcpy>:


// memcpy, memmove, memset, strcmp, strlen, strnlen
//    We must provide our own implementations.

void* memcpy(void* dst, const void* src, size_t n) {
   4358d:	f3 0f 1e fa          	endbr64 
   43591:	55                   	push   %rbp
   43592:	48 89 e5             	mov    %rsp,%rbp
   43595:	48 83 ec 28          	sub    $0x28,%rsp
   43599:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4359d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
   435a1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    const char* s = (const char*) src;
   435a5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   435a9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   435ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   435b1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
   435b5:	eb 1c                	jmp    435d3 <memcpy+0x46>
        *d = *s;
   435b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   435bb:	0f b6 10             	movzbl (%rax),%edx
   435be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   435c2:	88 10                	mov    %dl,(%rax)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   435c4:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
   435c9:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   435ce:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
   435d3:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   435d8:	75 dd                	jne    435b7 <memcpy+0x2a>
    }
    return dst;
   435da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   435de:	c9                   	leave  
   435df:	c3                   	ret    

00000000000435e0 <memmove>:

void* memmove(void* dst, const void* src, size_t n) {
   435e0:	f3 0f 1e fa          	endbr64 
   435e4:	55                   	push   %rbp
   435e5:	48 89 e5             	mov    %rsp,%rbp
   435e8:	48 83 ec 28          	sub    $0x28,%rsp
   435ec:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   435f0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
   435f4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    const char* s = (const char*) src;
   435f8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   435fc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    char* d = (char*) dst;
   43600:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43604:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (s < d && s + n > d) {
   43608:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4360c:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
   43610:	73 6a                	jae    4367c <memmove+0x9c>
   43612:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43616:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4361a:	48 01 d0             	add    %rdx,%rax
   4361d:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   43621:	73 59                	jae    4367c <memmove+0x9c>
        s += n, d += n;
   43623:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43627:	48 01 45 f8          	add    %rax,-0x8(%rbp)
   4362b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4362f:	48 01 45 f0          	add    %rax,-0x10(%rbp)
        while (n-- > 0) {
   43633:	eb 17                	jmp    4364c <memmove+0x6c>
            *--d = *--s;
   43635:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
   4363a:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
   4363f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43643:	0f b6 10             	movzbl (%rax),%edx
   43646:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4364a:	88 10                	mov    %dl,(%rax)
        while (n-- > 0) {
   4364c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43650:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
   43654:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
   43658:	48 85 c0             	test   %rax,%rax
   4365b:	75 d8                	jne    43635 <memmove+0x55>
    if (s < d && s + n > d) {
   4365d:	eb 2e                	jmp    4368d <memmove+0xad>
        }
    } else {
        while (n-- > 0) {
            *d++ = *s++;
   4365f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43663:	48 8d 42 01          	lea    0x1(%rdx),%rax
   43667:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   4366b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4366f:	48 8d 48 01          	lea    0x1(%rax),%rcx
   43673:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
   43677:	0f b6 12             	movzbl (%rdx),%edx
   4367a:	88 10                	mov    %dl,(%rax)
        while (n-- > 0) {
   4367c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43680:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
   43684:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
   43688:	48 85 c0             	test   %rax,%rax
   4368b:	75 d2                	jne    4365f <memmove+0x7f>
        }
    }
    return dst;
   4368d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   43691:	c9                   	leave  
   43692:	c3                   	ret    

0000000000043693 <memset>:

void* memset(void* v, int c, size_t n) {
   43693:	f3 0f 1e fa          	endbr64 
   43697:	55                   	push   %rbp
   43698:	48 89 e5             	mov    %rsp,%rbp
   4369b:	48 83 ec 28          	sub    $0x28,%rsp
   4369f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   436a3:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   436a6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   436aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   436ae:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   436b2:	eb 15                	jmp    436c9 <memset+0x36>
        *p = c;
   436b4:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   436b7:	89 c2                	mov    %eax,%edx
   436b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   436bd:	88 10                	mov    %dl,(%rax)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   436bf:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   436c4:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
   436c9:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   436ce:	75 e4                	jne    436b4 <memset+0x21>
    }
    return v;
   436d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   436d4:	c9                   	leave  
   436d5:	c3                   	ret    

00000000000436d6 <strlen>:

size_t strlen(const char* s) {
   436d6:	f3 0f 1e fa          	endbr64 
   436da:	55                   	push   %rbp
   436db:	48 89 e5             	mov    %rsp,%rbp
   436de:	48 83 ec 18          	sub    $0x18,%rsp
   436e2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
   436e6:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   436ed:	00 
   436ee:	eb 0a                	jmp    436fa <strlen+0x24>
        ++n;
   436f0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    for (n = 0; *s != '\0'; ++s) {
   436f5:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
   436fa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   436fe:	0f b6 00             	movzbl (%rax),%eax
   43701:	84 c0                	test   %al,%al
   43703:	75 eb                	jne    436f0 <strlen+0x1a>
    }
    return n;
   43705:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   43709:	c9                   	leave  
   4370a:	c3                   	ret    

000000000004370b <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
   4370b:	f3 0f 1e fa          	endbr64 
   4370f:	55                   	push   %rbp
   43710:	48 89 e5             	mov    %rsp,%rbp
   43713:	48 83 ec 20          	sub    $0x20,%rsp
   43717:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4371b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   4371f:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   43726:	00 
   43727:	eb 0a                	jmp    43733 <strnlen+0x28>
        ++n;
   43729:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   4372e:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
   43733:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43737:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
   4373b:	74 0b                	je     43748 <strnlen+0x3d>
   4373d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43741:	0f b6 00             	movzbl (%rax),%eax
   43744:	84 c0                	test   %al,%al
   43746:	75 e1                	jne    43729 <strnlen+0x1e>
    }
    return n;
   43748:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   4374c:	c9                   	leave  
   4374d:	c3                   	ret    

000000000004374e <strcpy>:

char* strcpy(char* dst, const char* src) {
   4374e:	f3 0f 1e fa          	endbr64 
   43752:	55                   	push   %rbp
   43753:	48 89 e5             	mov    %rsp,%rbp
   43756:	48 83 ec 20          	sub    $0x20,%rsp
   4375a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4375e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    char* d = dst;
   43762:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43766:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    do {
        *d++ = *src++;
   4376a:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   4376e:	48 8d 42 01          	lea    0x1(%rdx),%rax
   43772:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
   43776:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4377a:	48 8d 48 01          	lea    0x1(%rax),%rcx
   4377e:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
   43782:	0f b6 12             	movzbl (%rdx),%edx
   43785:	88 10                	mov    %dl,(%rax)
    } while (d[-1]);
   43787:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4378b:	48 83 e8 01          	sub    $0x1,%rax
   4378f:	0f b6 00             	movzbl (%rax),%eax
   43792:	84 c0                	test   %al,%al
   43794:	75 d4                	jne    4376a <strcpy+0x1c>
    return dst;
   43796:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   4379a:	c9                   	leave  
   4379b:	c3                   	ret    

000000000004379c <strcmp>:

int strcmp(const char* a, const char* b) {
   4379c:	f3 0f 1e fa          	endbr64 
   437a0:	55                   	push   %rbp
   437a1:	48 89 e5             	mov    %rsp,%rbp
   437a4:	48 83 ec 10          	sub    $0x10,%rsp
   437a8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   437ac:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    while (*a && *b && *a == *b) {
   437b0:	eb 0a                	jmp    437bc <strcmp+0x20>
        ++a, ++b;
   437b2:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
   437b7:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    while (*a && *b && *a == *b) {
   437bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   437c0:	0f b6 00             	movzbl (%rax),%eax
   437c3:	84 c0                	test   %al,%al
   437c5:	74 1d                	je     437e4 <strcmp+0x48>
   437c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   437cb:	0f b6 00             	movzbl (%rax),%eax
   437ce:	84 c0                	test   %al,%al
   437d0:	74 12                	je     437e4 <strcmp+0x48>
   437d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   437d6:	0f b6 10             	movzbl (%rax),%edx
   437d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   437dd:	0f b6 00             	movzbl (%rax),%eax
   437e0:	38 c2                	cmp    %al,%dl
   437e2:	74 ce                	je     437b2 <strcmp+0x16>
    }
    return ((unsigned char) *a > (unsigned char) *b)
   437e4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   437e8:	0f b6 00             	movzbl (%rax),%eax
   437eb:	89 c2                	mov    %eax,%edx
   437ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   437f1:	0f b6 00             	movzbl (%rax),%eax
   437f4:	38 c2                	cmp    %al,%dl
   437f6:	0f 97 c0             	seta   %al
   437f9:	0f b6 d0             	movzbl %al,%edx
        - ((unsigned char) *a < (unsigned char) *b);
   437fc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43800:	0f b6 00             	movzbl (%rax),%eax
   43803:	89 c1                	mov    %eax,%ecx
   43805:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43809:	0f b6 00             	movzbl (%rax),%eax
   4380c:	38 c1                	cmp    %al,%cl
   4380e:	0f 92 c0             	setb   %al
   43811:	0f b6 c8             	movzbl %al,%ecx
   43814:	89 d0                	mov    %edx,%eax
   43816:	29 c8                	sub    %ecx,%eax
}
   43818:	c9                   	leave  
   43819:	c3                   	ret    

000000000004381a <strchr>:

char* strchr(const char* s, int c) {
   4381a:	f3 0f 1e fa          	endbr64 
   4381e:	55                   	push   %rbp
   4381f:	48 89 e5             	mov    %rsp,%rbp
   43822:	48 83 ec 10          	sub    $0x10,%rsp
   43826:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   4382a:	89 75 f4             	mov    %esi,-0xc(%rbp)
    while (*s && *s != (char) c) {
   4382d:	eb 05                	jmp    43834 <strchr+0x1a>
        ++s;
   4382f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    while (*s && *s != (char) c) {
   43834:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43838:	0f b6 00             	movzbl (%rax),%eax
   4383b:	84 c0                	test   %al,%al
   4383d:	74 0e                	je     4384d <strchr+0x33>
   4383f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43843:	0f b6 00             	movzbl (%rax),%eax
   43846:	8b 55 f4             	mov    -0xc(%rbp),%edx
   43849:	38 d0                	cmp    %dl,%al
   4384b:	75 e2                	jne    4382f <strchr+0x15>
    }
    if (*s == (char) c) {
   4384d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43851:	0f b6 00             	movzbl (%rax),%eax
   43854:	8b 55 f4             	mov    -0xc(%rbp),%edx
   43857:	38 d0                	cmp    %dl,%al
   43859:	75 06                	jne    43861 <strchr+0x47>
        return (char*) s;
   4385b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4385f:	eb 05                	jmp    43866 <strchr+0x4c>
    } else {
        return NULL;
   43861:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   43866:	c9                   	leave  
   43867:	c3                   	ret    

0000000000043868 <rand>:
// rand, srand

static int rand_seed_set;
static unsigned rand_seed;

int rand(void) {
   43868:	f3 0f 1e fa          	endbr64 
   4386c:	55                   	push   %rbp
   4386d:	48 89 e5             	mov    %rsp,%rbp
    if (!rand_seed_set) {
   43870:	8b 05 8a 77 01 00    	mov    0x1778a(%rip),%eax        # 5b000 <rand_seed_set>
   43876:	85 c0                	test   %eax,%eax
   43878:	75 0a                	jne    43884 <rand+0x1c>
        srand(819234718U);
   4387a:	bf 9e 87 d4 30       	mov    $0x30d4879e,%edi
   4387f:	e8 24 00 00 00       	call   438a8 <srand>
    }
    rand_seed = rand_seed * 1664525U + 1013904223U;
   43884:	8b 05 7a 77 01 00    	mov    0x1777a(%rip),%eax        # 5b004 <rand_seed>
   4388a:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
   43890:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
   43895:	89 05 69 77 01 00    	mov    %eax,0x17769(%rip)        # 5b004 <rand_seed>
    return rand_seed & RAND_MAX;
   4389b:	8b 05 63 77 01 00    	mov    0x17763(%rip),%eax        # 5b004 <rand_seed>
   438a1:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
   438a6:	5d                   	pop    %rbp
   438a7:	c3                   	ret    

00000000000438a8 <srand>:

void srand(unsigned seed) {
   438a8:	f3 0f 1e fa          	endbr64 
   438ac:	55                   	push   %rbp
   438ad:	48 89 e5             	mov    %rsp,%rbp
   438b0:	48 83 ec 08          	sub    $0x8,%rsp
   438b4:	89 7d fc             	mov    %edi,-0x4(%rbp)
    rand_seed = seed;
   438b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
   438ba:	89 05 44 77 01 00    	mov    %eax,0x17744(%rip)        # 5b004 <rand_seed>
    rand_seed_set = 1;
   438c0:	c7 05 36 77 01 00 01 	movl   $0x1,0x17736(%rip)        # 5b000 <rand_seed_set>
   438c7:	00 00 00 
}
   438ca:	90                   	nop
   438cb:	c9                   	leave  
   438cc:	c3                   	ret    

00000000000438cd <fill_numbuf>:
//    Print a message onto the console, starting at the given cursor position.

// snprintf, vsnprintf
//    Format a string into a buffer.

static char* fill_numbuf(char* numbuf_end, unsigned long val, int base) {
   438cd:	f3 0f 1e fa          	endbr64 
   438d1:	55                   	push   %rbp
   438d2:	48 89 e5             	mov    %rsp,%rbp
   438d5:	48 83 ec 28          	sub    $0x28,%rsp
   438d9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   438dd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
   438e1:	89 55 dc             	mov    %edx,-0x24(%rbp)
    static const char upper_digits[] = "0123456789ABCDEF";
    static const char lower_digits[] = "0123456789abcdef";

    const char* digits = upper_digits;
   438e4:	48 8d 05 05 19 00 00 	lea    0x1905(%rip),%rax        # 451f0 <upper_digits.1>
   438eb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (base < 0) {
   438ef:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   438f3:	79 0e                	jns    43903 <fill_numbuf+0x36>
        digits = lower_digits;
   438f5:	48 8d 05 14 19 00 00 	lea    0x1914(%rip),%rax        # 45210 <lower_digits.0>
   438fc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        base = -base;
   43900:	f7 5d dc             	negl   -0x24(%rbp)
    }

    *--numbuf_end = '\0';
   43903:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
   43908:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4390c:	c6 00 00             	movb   $0x0,(%rax)
    do {
        *--numbuf_end = digits[val % base];
   4390f:	8b 45 dc             	mov    -0x24(%rbp),%eax
   43912:	48 63 c8             	movslq %eax,%rcx
   43915:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43919:	ba 00 00 00 00       	mov    $0x0,%edx
   4391e:	48 f7 f1             	div    %rcx
   43921:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43925:	48 01 d0             	add    %rdx,%rax
   43928:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
   4392d:	0f b6 10             	movzbl (%rax),%edx
   43930:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43934:	88 10                	mov    %dl,(%rax)
        val /= base;
   43936:	8b 45 dc             	mov    -0x24(%rbp),%eax
   43939:	48 63 f0             	movslq %eax,%rsi
   4393c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   43940:	ba 00 00 00 00       	mov    $0x0,%edx
   43945:	48 f7 f6             	div    %rsi
   43948:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    } while (val != 0);
   4394c:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   43951:	75 bc                	jne    4390f <fill_numbuf+0x42>
    return numbuf_end;
   43953:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
   43957:	c9                   	leave  
   43958:	c3                   	ret    

0000000000043959 <printer_vprintf>:
#define FLAG_NUMERIC            (1<<5)
#define FLAG_SIGNED             (1<<6)
#define FLAG_NEGATIVE           (1<<7)
#define FLAG_ALT2               (1<<8)

void printer_vprintf(printer* p, int color, const char* format, va_list val) {
   43959:	f3 0f 1e fa          	endbr64 
   4395d:	55                   	push   %rbp
   4395e:	48 89 e5             	mov    %rsp,%rbp
   43961:	53                   	push   %rbx
   43962:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   43969:	48 89 bd 78 ff ff ff 	mov    %rdi,-0x88(%rbp)
   43970:	89 b5 74 ff ff ff    	mov    %esi,-0x8c(%rbp)
   43976:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   4397d:	48 89 8d 60 ff ff ff 	mov    %rcx,-0xa0(%rbp)
#define NUMBUFSIZ 24
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
   43984:	e9 bd 09 00 00       	jmp    44346 <printer_vprintf+0x9ed>
        if (*format != '%') {
   43989:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43990:	0f b6 00             	movzbl (%rax),%eax
   43993:	3c 25                	cmp    $0x25,%al
   43995:	74 31                	je     439c8 <printer_vprintf+0x6f>
            p->putc(p, *format, color);
   43997:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   4399e:	4c 8b 00             	mov    (%rax),%r8
   439a1:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   439a8:	0f b6 00             	movzbl (%rax),%eax
   439ab:	0f b6 c8             	movzbl %al,%ecx
   439ae:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   439b4:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   439bb:	89 ce                	mov    %ecx,%esi
   439bd:	48 89 c7             	mov    %rax,%rdi
   439c0:	41 ff d0             	call   *%r8
            continue;
   439c3:	e9 76 09 00 00       	jmp    4433e <printer_vprintf+0x9e5>
        }

        // process flags
        int flags = 0;
   439c8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
        for (++format; *format; ++format) {
   439cf:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   439d6:	01 
   439d7:	eb 4d                	jmp    43a26 <printer_vprintf+0xcd>
            const char* flagc = strchr(flag_chars, *format);
   439d9:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   439e0:	0f b6 00             	movzbl (%rax),%eax
   439e3:	0f be c0             	movsbl %al,%eax
   439e6:	89 c6                	mov    %eax,%esi
   439e8:	48 8d 05 01 17 00 00 	lea    0x1701(%rip),%rax        # 450f0 <flag_chars>
   439ef:	48 89 c7             	mov    %rax,%rdi
   439f2:	e8 23 fe ff ff       	call   4381a <strchr>
   439f7:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
            if (flagc) {
   439fb:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   43a00:	74 34                	je     43a36 <printer_vprintf+0xdd>
                flags |= 1 << (flagc - flag_chars);
   43a02:	48 8d 15 e7 16 00 00 	lea    0x16e7(%rip),%rdx        # 450f0 <flag_chars>
   43a09:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   43a0d:	48 29 d0             	sub    %rdx,%rax
   43a10:	ba 01 00 00 00       	mov    $0x1,%edx
   43a15:	89 c1                	mov    %eax,%ecx
   43a17:	d3 e2                	shl    %cl,%edx
   43a19:	89 d0                	mov    %edx,%eax
   43a1b:	09 45 ec             	or     %eax,-0x14(%rbp)
        for (++format; *format; ++format) {
   43a1e:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   43a25:	01 
   43a26:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43a2d:	0f b6 00             	movzbl (%rax),%eax
   43a30:	84 c0                	test   %al,%al
   43a32:	75 a5                	jne    439d9 <printer_vprintf+0x80>
   43a34:	eb 01                	jmp    43a37 <printer_vprintf+0xde>
            } else {
                break;
   43a36:	90                   	nop
            }
        }

        // process width
        int width = -1;
   43a37:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%rbp)
        if (*format >= '1' && *format <= '9') {
   43a3e:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43a45:	0f b6 00             	movzbl (%rax),%eax
   43a48:	3c 30                	cmp    $0x30,%al
   43a4a:	7e 67                	jle    43ab3 <printer_vprintf+0x15a>
   43a4c:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43a53:	0f b6 00             	movzbl (%rax),%eax
   43a56:	3c 39                	cmp    $0x39,%al
   43a58:	7f 59                	jg     43ab3 <printer_vprintf+0x15a>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43a5a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
   43a61:	eb 2e                	jmp    43a91 <printer_vprintf+0x138>
                width = 10 * width + *format++ - '0';
   43a63:	8b 55 e8             	mov    -0x18(%rbp),%edx
   43a66:	89 d0                	mov    %edx,%eax
   43a68:	c1 e0 02             	shl    $0x2,%eax
   43a6b:	01 d0                	add    %edx,%eax
   43a6d:	01 c0                	add    %eax,%eax
   43a6f:	89 c1                	mov    %eax,%ecx
   43a71:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43a78:	48 8d 50 01          	lea    0x1(%rax),%rdx
   43a7c:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   43a83:	0f b6 00             	movzbl (%rax),%eax
   43a86:	0f be c0             	movsbl %al,%eax
   43a89:	01 c8                	add    %ecx,%eax
   43a8b:	83 e8 30             	sub    $0x30,%eax
   43a8e:	89 45 e8             	mov    %eax,-0x18(%rbp)
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43a91:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43a98:	0f b6 00             	movzbl (%rax),%eax
   43a9b:	3c 2f                	cmp    $0x2f,%al
   43a9d:	0f 8e 85 00 00 00    	jle    43b28 <printer_vprintf+0x1cf>
   43aa3:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43aaa:	0f b6 00             	movzbl (%rax),%eax
   43aad:	3c 39                	cmp    $0x39,%al
   43aaf:	7e b2                	jle    43a63 <printer_vprintf+0x10a>
        if (*format >= '1' && *format <= '9') {
   43ab1:	eb 75                	jmp    43b28 <printer_vprintf+0x1cf>
            }
        } else if (*format == '*') {
   43ab3:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43aba:	0f b6 00             	movzbl (%rax),%eax
   43abd:	3c 2a                	cmp    $0x2a,%al
   43abf:	75 68                	jne    43b29 <printer_vprintf+0x1d0>
            width = va_arg(val, int);
   43ac1:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43ac8:	8b 00                	mov    (%rax),%eax
   43aca:	83 f8 2f             	cmp    $0x2f,%eax
   43acd:	77 30                	ja     43aff <printer_vprintf+0x1a6>
   43acf:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43ad6:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43ada:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43ae1:	8b 00                	mov    (%rax),%eax
   43ae3:	89 c0                	mov    %eax,%eax
   43ae5:	48 01 d0             	add    %rdx,%rax
   43ae8:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43aef:	8b 12                	mov    (%rdx),%edx
   43af1:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43af4:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43afb:	89 0a                	mov    %ecx,(%rdx)
   43afd:	eb 1a                	jmp    43b19 <printer_vprintf+0x1c0>
   43aff:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43b06:	48 8b 40 08          	mov    0x8(%rax),%rax
   43b0a:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43b0e:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43b15:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43b19:	8b 00                	mov    (%rax),%eax
   43b1b:	89 45 e8             	mov    %eax,-0x18(%rbp)
            ++format;
   43b1e:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   43b25:	01 
   43b26:	eb 01                	jmp    43b29 <printer_vprintf+0x1d0>
        if (*format >= '1' && *format <= '9') {
   43b28:	90                   	nop
        }

        // process precision
        int precision = -1;
   43b29:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
        if (*format == '.') {
   43b30:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43b37:	0f b6 00             	movzbl (%rax),%eax
   43b3a:	3c 2e                	cmp    $0x2e,%al
   43b3c:	0f 85 00 01 00 00    	jne    43c42 <printer_vprintf+0x2e9>
            ++format;
   43b42:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   43b49:	01 
            if (*format >= '0' && *format <= '9') {
   43b4a:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43b51:	0f b6 00             	movzbl (%rax),%eax
   43b54:	3c 2f                	cmp    $0x2f,%al
   43b56:	7e 67                	jle    43bbf <printer_vprintf+0x266>
   43b58:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43b5f:	0f b6 00             	movzbl (%rax),%eax
   43b62:	3c 39                	cmp    $0x39,%al
   43b64:	7f 59                	jg     43bbf <printer_vprintf+0x266>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   43b66:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
   43b6d:	eb 2e                	jmp    43b9d <printer_vprintf+0x244>
                    precision = 10 * precision + *format++ - '0';
   43b6f:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   43b72:	89 d0                	mov    %edx,%eax
   43b74:	c1 e0 02             	shl    $0x2,%eax
   43b77:	01 d0                	add    %edx,%eax
   43b79:	01 c0                	add    %eax,%eax
   43b7b:	89 c1                	mov    %eax,%ecx
   43b7d:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43b84:	48 8d 50 01          	lea    0x1(%rax),%rdx
   43b88:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   43b8f:	0f b6 00             	movzbl (%rax),%eax
   43b92:	0f be c0             	movsbl %al,%eax
   43b95:	01 c8                	add    %ecx,%eax
   43b97:	83 e8 30             	sub    $0x30,%eax
   43b9a:	89 45 e4             	mov    %eax,-0x1c(%rbp)
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   43b9d:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43ba4:	0f b6 00             	movzbl (%rax),%eax
   43ba7:	3c 2f                	cmp    $0x2f,%al
   43ba9:	0f 8e 85 00 00 00    	jle    43c34 <printer_vprintf+0x2db>
   43baf:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43bb6:	0f b6 00             	movzbl (%rax),%eax
   43bb9:	3c 39                	cmp    $0x39,%al
   43bbb:	7e b2                	jle    43b6f <printer_vprintf+0x216>
            if (*format >= '0' && *format <= '9') {
   43bbd:	eb 75                	jmp    43c34 <printer_vprintf+0x2db>
                }
            } else if (*format == '*') {
   43bbf:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43bc6:	0f b6 00             	movzbl (%rax),%eax
   43bc9:	3c 2a                	cmp    $0x2a,%al
   43bcb:	75 68                	jne    43c35 <printer_vprintf+0x2dc>
                precision = va_arg(val, int);
   43bcd:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43bd4:	8b 00                	mov    (%rax),%eax
   43bd6:	83 f8 2f             	cmp    $0x2f,%eax
   43bd9:	77 30                	ja     43c0b <printer_vprintf+0x2b2>
   43bdb:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43be2:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43be6:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43bed:	8b 00                	mov    (%rax),%eax
   43bef:	89 c0                	mov    %eax,%eax
   43bf1:	48 01 d0             	add    %rdx,%rax
   43bf4:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43bfb:	8b 12                	mov    (%rdx),%edx
   43bfd:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43c00:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43c07:	89 0a                	mov    %ecx,(%rdx)
   43c09:	eb 1a                	jmp    43c25 <printer_vprintf+0x2cc>
   43c0b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43c12:	48 8b 40 08          	mov    0x8(%rax),%rax
   43c16:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43c1a:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43c21:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43c25:	8b 00                	mov    (%rax),%eax
   43c27:	89 45 e4             	mov    %eax,-0x1c(%rbp)
                ++format;
   43c2a:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   43c31:	01 
   43c32:	eb 01                	jmp    43c35 <printer_vprintf+0x2dc>
            if (*format >= '0' && *format <= '9') {
   43c34:	90                   	nop
            }
            if (precision < 0) {
   43c35:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
   43c39:	79 07                	jns    43c42 <printer_vprintf+0x2e9>
                precision = 0;
   43c3b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
            }
        }

        // process main conversion character
        int base = 10;
   43c42:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%rbp)
        unsigned long num = 0;
   43c49:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
   43c50:	00 
        int length = 0;
   43c51:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
        char* data = "";
   43c58:	48 8d 05 97 14 00 00 	lea    0x1497(%rip),%rax        # 450f6 <flag_chars+0x6>
   43c5f:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    again:
        switch (*format) {
   43c63:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   43c6a:	0f b6 00             	movzbl (%rax),%eax
   43c6d:	0f be c0             	movsbl %al,%eax
   43c70:	83 e8 43             	sub    $0x43,%eax
   43c73:	83 f8 37             	cmp    $0x37,%eax
   43c76:	0f 87 b6 03 00 00    	ja     44032 <printer_vprintf+0x6d9>
   43c7c:	89 c0                	mov    %eax,%eax
   43c7e:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
   43c85:	00 
   43c86:	48 8d 05 77 14 00 00 	lea    0x1477(%rip),%rax        # 45104 <flag_chars+0x14>
   43c8d:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   43c90:	48 98                	cltq   
   43c92:	48 8d 15 6b 14 00 00 	lea    0x146b(%rip),%rdx        # 45104 <flag_chars+0x14>
   43c99:	48 01 d0             	add    %rdx,%rax
   43c9c:	3e ff e0             	notrack jmp *%rax
        case 'l':
        case 'z':
            length = 1;
   43c9f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
            ++format;
   43ca6:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   43cad:	01 
            goto again;
   43cae:	eb b3                	jmp    43c63 <printer_vprintf+0x30a>
        case 'd':
        case 'i': {
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43cb0:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   43cb4:	74 5d                	je     43d13 <printer_vprintf+0x3ba>
   43cb6:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43cbd:	8b 00                	mov    (%rax),%eax
   43cbf:	83 f8 2f             	cmp    $0x2f,%eax
   43cc2:	77 30                	ja     43cf4 <printer_vprintf+0x39b>
   43cc4:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43ccb:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43ccf:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43cd6:	8b 00                	mov    (%rax),%eax
   43cd8:	89 c0                	mov    %eax,%eax
   43cda:	48 01 d0             	add    %rdx,%rax
   43cdd:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43ce4:	8b 12                	mov    (%rdx),%edx
   43ce6:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43ce9:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43cf0:	89 0a                	mov    %ecx,(%rdx)
   43cf2:	eb 1a                	jmp    43d0e <printer_vprintf+0x3b5>
   43cf4:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43cfb:	48 8b 40 08          	mov    0x8(%rax),%rax
   43cff:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43d03:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43d0a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43d0e:	48 8b 00             	mov    (%rax),%rax
   43d11:	eb 5c                	jmp    43d6f <printer_vprintf+0x416>
   43d13:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43d1a:	8b 00                	mov    (%rax),%eax
   43d1c:	83 f8 2f             	cmp    $0x2f,%eax
   43d1f:	77 30                	ja     43d51 <printer_vprintf+0x3f8>
   43d21:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43d28:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43d2c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43d33:	8b 00                	mov    (%rax),%eax
   43d35:	89 c0                	mov    %eax,%eax
   43d37:	48 01 d0             	add    %rdx,%rax
   43d3a:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43d41:	8b 12                	mov    (%rdx),%edx
   43d43:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43d46:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43d4d:	89 0a                	mov    %ecx,(%rdx)
   43d4f:	eb 1a                	jmp    43d6b <printer_vprintf+0x412>
   43d51:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43d58:	48 8b 40 08          	mov    0x8(%rax),%rax
   43d5c:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43d60:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43d67:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43d6b:	8b 00                	mov    (%rax),%eax
   43d6d:	48 98                	cltq   
   43d6f:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
   43d73:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   43d77:	48 c1 f8 38          	sar    $0x38,%rax
   43d7b:	25 80 00 00 00       	and    $0x80,%eax
   43d80:	89 45 a4             	mov    %eax,-0x5c(%rbp)
            num = negative ? -x : x;
   43d83:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
   43d87:	74 09                	je     43d92 <printer_vprintf+0x439>
   43d89:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   43d8d:	48 f7 d8             	neg    %rax
   43d90:	eb 04                	jmp    43d96 <printer_vprintf+0x43d>
   43d92:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   43d96:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
   43d9a:	8b 45 a4             	mov    -0x5c(%rbp),%eax
   43d9d:	83 c8 60             	or     $0x60,%eax
   43da0:	09 45 ec             	or     %eax,-0x14(%rbp)
            break;
   43da3:	e9 cf 02 00 00       	jmp    44077 <printer_vprintf+0x71e>
        }
        case 'u':
        format_unsigned:
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   43da8:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   43dac:	74 5d                	je     43e0b <printer_vprintf+0x4b2>
   43dae:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43db5:	8b 00                	mov    (%rax),%eax
   43db7:	83 f8 2f             	cmp    $0x2f,%eax
   43dba:	77 30                	ja     43dec <printer_vprintf+0x493>
   43dbc:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43dc3:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43dc7:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43dce:	8b 00                	mov    (%rax),%eax
   43dd0:	89 c0                	mov    %eax,%eax
   43dd2:	48 01 d0             	add    %rdx,%rax
   43dd5:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43ddc:	8b 12                	mov    (%rdx),%edx
   43dde:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43de1:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43de8:	89 0a                	mov    %ecx,(%rdx)
   43dea:	eb 1a                	jmp    43e06 <printer_vprintf+0x4ad>
   43dec:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43df3:	48 8b 40 08          	mov    0x8(%rax),%rax
   43df7:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43dfb:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43e02:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43e06:	48 8b 00             	mov    (%rax),%rax
   43e09:	eb 5c                	jmp    43e67 <printer_vprintf+0x50e>
   43e0b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43e12:	8b 00                	mov    (%rax),%eax
   43e14:	83 f8 2f             	cmp    $0x2f,%eax
   43e17:	77 30                	ja     43e49 <printer_vprintf+0x4f0>
   43e19:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43e20:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43e24:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43e2b:	8b 00                	mov    (%rax),%eax
   43e2d:	89 c0                	mov    %eax,%eax
   43e2f:	48 01 d0             	add    %rdx,%rax
   43e32:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43e39:	8b 12                	mov    (%rdx),%edx
   43e3b:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43e3e:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43e45:	89 0a                	mov    %ecx,(%rdx)
   43e47:	eb 1a                	jmp    43e63 <printer_vprintf+0x50a>
   43e49:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43e50:	48 8b 40 08          	mov    0x8(%rax),%rax
   43e54:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43e58:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43e5f:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43e63:	8b 00                	mov    (%rax),%eax
   43e65:	89 c0                	mov    %eax,%eax
   43e67:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            flags |= FLAG_NUMERIC;
   43e6b:	83 4d ec 20          	orl    $0x20,-0x14(%rbp)
            break;
   43e6f:	e9 03 02 00 00       	jmp    44077 <printer_vprintf+0x71e>
        case 'x':
            base = -16;
   43e74:	c7 45 e0 f0 ff ff ff 	movl   $0xfffffff0,-0x20(%rbp)
            goto format_unsigned;
   43e7b:	e9 28 ff ff ff       	jmp    43da8 <printer_vprintf+0x44f>
        case 'X':
            base = 16;
   43e80:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%rbp)
            goto format_unsigned;
   43e87:	e9 1c ff ff ff       	jmp    43da8 <printer_vprintf+0x44f>
        case 'p':
            num = (uintptr_t) va_arg(val, void*);
   43e8c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43e93:	8b 00                	mov    (%rax),%eax
   43e95:	83 f8 2f             	cmp    $0x2f,%eax
   43e98:	77 30                	ja     43eca <printer_vprintf+0x571>
   43e9a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43ea1:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43ea5:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43eac:	8b 00                	mov    (%rax),%eax
   43eae:	89 c0                	mov    %eax,%eax
   43eb0:	48 01 d0             	add    %rdx,%rax
   43eb3:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43eba:	8b 12                	mov    (%rdx),%edx
   43ebc:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43ebf:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43ec6:	89 0a                	mov    %ecx,(%rdx)
   43ec8:	eb 1a                	jmp    43ee4 <printer_vprintf+0x58b>
   43eca:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43ed1:	48 8b 40 08          	mov    0x8(%rax),%rax
   43ed5:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43ed9:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43ee0:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43ee4:	48 8b 00             	mov    (%rax),%rax
   43ee7:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
            base = -16;
   43eeb:	c7 45 e0 f0 ff ff ff 	movl   $0xfffffff0,-0x20(%rbp)
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
   43ef2:	81 4d ec 21 01 00 00 	orl    $0x121,-0x14(%rbp)
            break;
   43ef9:	e9 79 01 00 00       	jmp    44077 <printer_vprintf+0x71e>
        case 's':
            data = va_arg(val, char*);
   43efe:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43f05:	8b 00                	mov    (%rax),%eax
   43f07:	83 f8 2f             	cmp    $0x2f,%eax
   43f0a:	77 30                	ja     43f3c <printer_vprintf+0x5e3>
   43f0c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43f13:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43f17:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43f1e:	8b 00                	mov    (%rax),%eax
   43f20:	89 c0                	mov    %eax,%eax
   43f22:	48 01 d0             	add    %rdx,%rax
   43f25:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43f2c:	8b 12                	mov    (%rdx),%edx
   43f2e:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43f31:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43f38:	89 0a                	mov    %ecx,(%rdx)
   43f3a:	eb 1a                	jmp    43f56 <printer_vprintf+0x5fd>
   43f3c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43f43:	48 8b 40 08          	mov    0x8(%rax),%rax
   43f47:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43f4b:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43f52:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43f56:	48 8b 00             	mov    (%rax),%rax
   43f59:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            break;
   43f5d:	e9 15 01 00 00       	jmp    44077 <printer_vprintf+0x71e>
        case 'C':
            color = va_arg(val, int);
   43f62:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43f69:	8b 00                	mov    (%rax),%eax
   43f6b:	83 f8 2f             	cmp    $0x2f,%eax
   43f6e:	77 30                	ja     43fa0 <printer_vprintf+0x647>
   43f70:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43f77:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43f7b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43f82:	8b 00                	mov    (%rax),%eax
   43f84:	89 c0                	mov    %eax,%eax
   43f86:	48 01 d0             	add    %rdx,%rax
   43f89:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43f90:	8b 12                	mov    (%rdx),%edx
   43f92:	8d 4a 08             	lea    0x8(%rdx),%ecx
   43f95:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43f9c:	89 0a                	mov    %ecx,(%rdx)
   43f9e:	eb 1a                	jmp    43fba <printer_vprintf+0x661>
   43fa0:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43fa7:	48 8b 40 08          	mov    0x8(%rax),%rax
   43fab:	48 8d 48 08          	lea    0x8(%rax),%rcx
   43faf:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43fb6:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   43fba:	8b 00                	mov    (%rax),%eax
   43fbc:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
            goto done;
   43fc2:	e9 77 03 00 00       	jmp    4433e <printer_vprintf+0x9e5>
        case 'c':
            data = numbuf;
   43fc7:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
   43fcb:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            numbuf[0] = va_arg(val, int);
   43fcf:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43fd6:	8b 00                	mov    (%rax),%eax
   43fd8:	83 f8 2f             	cmp    $0x2f,%eax
   43fdb:	77 30                	ja     4400d <printer_vprintf+0x6b4>
   43fdd:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43fe4:	48 8b 50 10          	mov    0x10(%rax),%rdx
   43fe8:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   43fef:	8b 00                	mov    (%rax),%eax
   43ff1:	89 c0                	mov    %eax,%eax
   43ff3:	48 01 d0             	add    %rdx,%rax
   43ff6:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   43ffd:	8b 12                	mov    (%rdx),%edx
   43fff:	8d 4a 08             	lea    0x8(%rdx),%ecx
   44002:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44009:	89 0a                	mov    %ecx,(%rdx)
   4400b:	eb 1a                	jmp    44027 <printer_vprintf+0x6ce>
   4400d:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   44014:	48 8b 40 08          	mov    0x8(%rax),%rax
   44018:	48 8d 48 08          	lea    0x8(%rax),%rcx
   4401c:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   44023:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44027:	8b 00                	mov    (%rax),%eax
   44029:	88 45 8c             	mov    %al,-0x74(%rbp)
            numbuf[1] = '\0';
   4402c:	c6 45 8d 00          	movb   $0x0,-0x73(%rbp)
            break;
   44030:	eb 45                	jmp    44077 <printer_vprintf+0x71e>
        default:
            data = numbuf;
   44032:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
   44036:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
            numbuf[0] = (*format ? *format : '%');
   4403a:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44041:	0f b6 00             	movzbl (%rax),%eax
   44044:	84 c0                	test   %al,%al
   44046:	74 0c                	je     44054 <printer_vprintf+0x6fb>
   44048:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   4404f:	0f b6 00             	movzbl (%rax),%eax
   44052:	eb 05                	jmp    44059 <printer_vprintf+0x700>
   44054:	b8 25 00 00 00       	mov    $0x25,%eax
   44059:	88 45 8c             	mov    %al,-0x74(%rbp)
            numbuf[1] = '\0';
   4405c:	c6 45 8d 00          	movb   $0x0,-0x73(%rbp)
            if (!*format) {
   44060:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   44067:	0f b6 00             	movzbl (%rax),%eax
   4406a:	84 c0                	test   %al,%al
   4406c:	75 08                	jne    44076 <printer_vprintf+0x71d>
                format--;
   4406e:	48 83 ad 68 ff ff ff 	subq   $0x1,-0x98(%rbp)
   44075:	01 
            }
            break;
   44076:	90                   	nop
        }

        if (flags & FLAG_NUMERIC) {
   44077:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4407a:	83 e0 20             	and    $0x20,%eax
   4407d:	85 c0                	test   %eax,%eax
   4407f:	74 1e                	je     4409f <printer_vprintf+0x746>
            data = fill_numbuf(numbuf + NUMBUFSIZ, num, base);
   44081:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
   44085:	48 83 c0 18          	add    $0x18,%rax
   44089:	8b 55 e0             	mov    -0x20(%rbp),%edx
   4408c:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
   44090:	48 89 ce             	mov    %rcx,%rsi
   44093:	48 89 c7             	mov    %rax,%rdi
   44096:	e8 32 f8 ff ff       	call   438cd <fill_numbuf>
   4409b:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
        }

        const char* prefix = "";
   4409f:	48 8d 05 50 10 00 00 	lea    0x1050(%rip),%rax        # 450f6 <flag_chars+0x6>
   440a6:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
   440aa:	8b 45 ec             	mov    -0x14(%rbp),%eax
   440ad:	83 e0 20             	and    $0x20,%eax
   440b0:	85 c0                	test   %eax,%eax
   440b2:	74 51                	je     44105 <printer_vprintf+0x7ac>
   440b4:	8b 45 ec             	mov    -0x14(%rbp),%eax
   440b7:	83 e0 40             	and    $0x40,%eax
   440ba:	85 c0                	test   %eax,%eax
   440bc:	74 47                	je     44105 <printer_vprintf+0x7ac>
            if (flags & FLAG_NEGATIVE) {
   440be:	8b 45 ec             	mov    -0x14(%rbp),%eax
   440c1:	25 80 00 00 00       	and    $0x80,%eax
   440c6:	85 c0                	test   %eax,%eax
   440c8:	74 0d                	je     440d7 <printer_vprintf+0x77e>
                prefix = "-";
   440ca:	48 8d 05 26 10 00 00 	lea    0x1026(%rip),%rax        # 450f7 <flag_chars+0x7>
   440d1:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
   440d5:	eb 7d                	jmp    44154 <printer_vprintf+0x7fb>
            } else if (flags & FLAG_PLUSPOSITIVE) {
   440d7:	8b 45 ec             	mov    -0x14(%rbp),%eax
   440da:	83 e0 10             	and    $0x10,%eax
   440dd:	85 c0                	test   %eax,%eax
   440df:	74 0d                	je     440ee <printer_vprintf+0x795>
                prefix = "+";
   440e1:	48 8d 05 11 10 00 00 	lea    0x1011(%rip),%rax        # 450f9 <flag_chars+0x9>
   440e8:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
   440ec:	eb 66                	jmp    44154 <printer_vprintf+0x7fb>
            } else if (flags & FLAG_SPACEPOSITIVE) {
   440ee:	8b 45 ec             	mov    -0x14(%rbp),%eax
   440f1:	83 e0 08             	and    $0x8,%eax
   440f4:	85 c0                	test   %eax,%eax
   440f6:	74 5c                	je     44154 <printer_vprintf+0x7fb>
                prefix = " ";
   440f8:	48 8d 05 fc 0f 00 00 	lea    0xffc(%rip),%rax        # 450fb <flag_chars+0xb>
   440ff:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
            if (flags & FLAG_NEGATIVE) {
   44103:	eb 4f                	jmp    44154 <printer_vprintf+0x7fb>
            }
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   44105:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44108:	83 e0 20             	and    $0x20,%eax
   4410b:	85 c0                	test   %eax,%eax
   4410d:	74 46                	je     44155 <printer_vprintf+0x7fc>
   4410f:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44112:	83 e0 01             	and    $0x1,%eax
   44115:	85 c0                	test   %eax,%eax
   44117:	74 3c                	je     44155 <printer_vprintf+0x7fc>
                   && (base == 16 || base == -16)
   44119:	83 7d e0 10          	cmpl   $0x10,-0x20(%rbp)
   4411d:	74 06                	je     44125 <printer_vprintf+0x7cc>
   4411f:	83 7d e0 f0          	cmpl   $0xfffffff0,-0x20(%rbp)
   44123:	75 30                	jne    44155 <printer_vprintf+0x7fc>
                   && (num || (flags & FLAG_ALT2))) {
   44125:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   4412a:	75 0c                	jne    44138 <printer_vprintf+0x7df>
   4412c:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4412f:	25 00 01 00 00       	and    $0x100,%eax
   44134:	85 c0                	test   %eax,%eax
   44136:	74 1d                	je     44155 <printer_vprintf+0x7fc>
            prefix = (base == -16 ? "0x" : "0X");
   44138:	83 7d e0 f0          	cmpl   $0xfffffff0,-0x20(%rbp)
   4413c:	75 09                	jne    44147 <printer_vprintf+0x7ee>
   4413e:	48 8d 05 b8 0f 00 00 	lea    0xfb8(%rip),%rax        # 450fd <flag_chars+0xd>
   44145:	eb 07                	jmp    4414e <printer_vprintf+0x7f5>
   44147:	48 8d 05 b2 0f 00 00 	lea    0xfb2(%rip),%rax        # 45100 <flag_chars+0x10>
   4414e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   44152:	eb 01                	jmp    44155 <printer_vprintf+0x7fc>
            if (flags & FLAG_NEGATIVE) {
   44154:	90                   	nop
        }

        int len;
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
   44155:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
   44159:	78 24                	js     4417f <printer_vprintf+0x826>
   4415b:	8b 45 ec             	mov    -0x14(%rbp),%eax
   4415e:	83 e0 20             	and    $0x20,%eax
   44161:	85 c0                	test   %eax,%eax
   44163:	75 1a                	jne    4417f <printer_vprintf+0x826>
            len = strnlen(data, precision);
   44165:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   44168:	48 63 d0             	movslq %eax,%rdx
   4416b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4416f:	48 89 d6             	mov    %rdx,%rsi
   44172:	48 89 c7             	mov    %rax,%rdi
   44175:	e8 91 f5 ff ff       	call   4370b <strnlen>
   4417a:	89 45 bc             	mov    %eax,-0x44(%rbp)
   4417d:	eb 0f                	jmp    4418e <printer_vprintf+0x835>
        } else {
            len = strlen(data);
   4417f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   44183:	48 89 c7             	mov    %rax,%rdi
   44186:	e8 4b f5 ff ff       	call   436d6 <strlen>
   4418b:	89 45 bc             	mov    %eax,-0x44(%rbp)
        }
        int zeros;
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
   4418e:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44191:	83 e0 20             	and    $0x20,%eax
   44194:	85 c0                	test   %eax,%eax
   44196:	74 20                	je     441b8 <printer_vprintf+0x85f>
   44198:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
   4419c:	78 1a                	js     441b8 <printer_vprintf+0x85f>
            zeros = precision > len ? precision - len : 0;
   4419e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   441a1:	3b 45 bc             	cmp    -0x44(%rbp),%eax
   441a4:	7e 08                	jle    441ae <printer_vprintf+0x855>
   441a6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   441a9:	2b 45 bc             	sub    -0x44(%rbp),%eax
   441ac:	eb 05                	jmp    441b3 <printer_vprintf+0x85a>
   441ae:	b8 00 00 00 00       	mov    $0x0,%eax
   441b3:	89 45 b8             	mov    %eax,-0x48(%rbp)
   441b6:	eb 5c                	jmp    44214 <printer_vprintf+0x8bb>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
   441b8:	8b 45 ec             	mov    -0x14(%rbp),%eax
   441bb:	83 e0 20             	and    $0x20,%eax
   441be:	85 c0                	test   %eax,%eax
   441c0:	74 4b                	je     4420d <printer_vprintf+0x8b4>
   441c2:	8b 45 ec             	mov    -0x14(%rbp),%eax
   441c5:	83 e0 02             	and    $0x2,%eax
   441c8:	85 c0                	test   %eax,%eax
   441ca:	74 41                	je     4420d <printer_vprintf+0x8b4>
                   && !(flags & FLAG_LEFTJUSTIFY)
   441cc:	8b 45 ec             	mov    -0x14(%rbp),%eax
   441cf:	83 e0 04             	and    $0x4,%eax
   441d2:	85 c0                	test   %eax,%eax
   441d4:	75 37                	jne    4420d <printer_vprintf+0x8b4>
                   && len + (int) strlen(prefix) < width) {
   441d6:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   441da:	48 89 c7             	mov    %rax,%rdi
   441dd:	e8 f4 f4 ff ff       	call   436d6 <strlen>
   441e2:	89 c2                	mov    %eax,%edx
   441e4:	8b 45 bc             	mov    -0x44(%rbp),%eax
   441e7:	01 d0                	add    %edx,%eax
   441e9:	39 45 e8             	cmp    %eax,-0x18(%rbp)
   441ec:	7e 1f                	jle    4420d <printer_vprintf+0x8b4>
            zeros = width - len - strlen(prefix);
   441ee:	8b 45 e8             	mov    -0x18(%rbp),%eax
   441f1:	2b 45 bc             	sub    -0x44(%rbp),%eax
   441f4:	89 c3                	mov    %eax,%ebx
   441f6:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   441fa:	48 89 c7             	mov    %rax,%rdi
   441fd:	e8 d4 f4 ff ff       	call   436d6 <strlen>
   44202:	89 c2                	mov    %eax,%edx
   44204:	89 d8                	mov    %ebx,%eax
   44206:	29 d0                	sub    %edx,%eax
   44208:	89 45 b8             	mov    %eax,-0x48(%rbp)
   4420b:	eb 07                	jmp    44214 <printer_vprintf+0x8bb>
        } else {
            zeros = 0;
   4420d:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%rbp)
        }
        width -= len + zeros + strlen(prefix);
   44214:	8b 55 bc             	mov    -0x44(%rbp),%edx
   44217:	8b 45 b8             	mov    -0x48(%rbp),%eax
   4421a:	01 d0                	add    %edx,%eax
   4421c:	48 63 d8             	movslq %eax,%rbx
   4421f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   44223:	48 89 c7             	mov    %rax,%rdi
   44226:	e8 ab f4 ff ff       	call   436d6 <strlen>
   4422b:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
   4422f:	8b 45 e8             	mov    -0x18(%rbp),%eax
   44232:	29 d0                	sub    %edx,%eax
   44234:	89 45 e8             	mov    %eax,-0x18(%rbp)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   44237:	eb 25                	jmp    4425e <printer_vprintf+0x905>
            p->putc(p, ' ', color);
   44239:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44240:	48 8b 08             	mov    (%rax),%rcx
   44243:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   44249:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44250:	be 20 00 00 00       	mov    $0x20,%esi
   44255:	48 89 c7             	mov    %rax,%rdi
   44258:	ff d1                	call   *%rcx
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   4425a:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
   4425e:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44261:	83 e0 04             	and    $0x4,%eax
   44264:	85 c0                	test   %eax,%eax
   44266:	75 36                	jne    4429e <printer_vprintf+0x945>
   44268:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
   4426c:	7f cb                	jg     44239 <printer_vprintf+0x8e0>
        }
        for (; *prefix; ++prefix) {
   4426e:	eb 2e                	jmp    4429e <printer_vprintf+0x945>
            p->putc(p, *prefix, color);
   44270:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44277:	4c 8b 00             	mov    (%rax),%r8
   4427a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   4427e:	0f b6 00             	movzbl (%rax),%eax
   44281:	0f b6 c8             	movzbl %al,%ecx
   44284:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   4428a:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44291:	89 ce                	mov    %ecx,%esi
   44293:	48 89 c7             	mov    %rax,%rdi
   44296:	41 ff d0             	call   *%r8
        for (; *prefix; ++prefix) {
   44299:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
   4429e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   442a2:	0f b6 00             	movzbl (%rax),%eax
   442a5:	84 c0                	test   %al,%al
   442a7:	75 c7                	jne    44270 <printer_vprintf+0x917>
        }
        for (; zeros > 0; --zeros) {
   442a9:	eb 25                	jmp    442d0 <printer_vprintf+0x977>
            p->putc(p, '0', color);
   442ab:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   442b2:	48 8b 08             	mov    (%rax),%rcx
   442b5:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   442bb:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   442c2:	be 30 00 00 00       	mov    $0x30,%esi
   442c7:	48 89 c7             	mov    %rax,%rdi
   442ca:	ff d1                	call   *%rcx
        for (; zeros > 0; --zeros) {
   442cc:	83 6d b8 01          	subl   $0x1,-0x48(%rbp)
   442d0:	83 7d b8 00          	cmpl   $0x0,-0x48(%rbp)
   442d4:	7f d5                	jg     442ab <printer_vprintf+0x952>
        }
        for (; len > 0; ++data, --len) {
   442d6:	eb 32                	jmp    4430a <printer_vprintf+0x9b1>
            p->putc(p, *data, color);
   442d8:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   442df:	4c 8b 00             	mov    (%rax),%r8
   442e2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   442e6:	0f b6 00             	movzbl (%rax),%eax
   442e9:	0f b6 c8             	movzbl %al,%ecx
   442ec:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   442f2:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   442f9:	89 ce                	mov    %ecx,%esi
   442fb:	48 89 c7             	mov    %rax,%rdi
   442fe:	41 ff d0             	call   *%r8
        for (; len > 0; ++data, --len) {
   44301:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
   44306:	83 6d bc 01          	subl   $0x1,-0x44(%rbp)
   4430a:	83 7d bc 00          	cmpl   $0x0,-0x44(%rbp)
   4430e:	7f c8                	jg     442d8 <printer_vprintf+0x97f>
        }
        for (; width > 0; --width) {
   44310:	eb 25                	jmp    44337 <printer_vprintf+0x9de>
            p->putc(p, ' ', color);
   44312:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44319:	48 8b 08             	mov    (%rax),%rcx
   4431c:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
   44322:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
   44329:	be 20 00 00 00       	mov    $0x20,%esi
   4432e:	48 89 c7             	mov    %rax,%rdi
   44331:	ff d1                	call   *%rcx
        for (; width > 0; --width) {
   44333:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
   44337:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
   4433b:	7f d5                	jg     44312 <printer_vprintf+0x9b9>
        }
    done: ;
   4433d:	90                   	nop
    for (; *format; ++format) {
   4433e:	48 83 85 68 ff ff ff 	addq   $0x1,-0x98(%rbp)
   44345:	01 
   44346:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   4434d:	0f b6 00             	movzbl (%rax),%eax
   44350:	84 c0                	test   %al,%al
   44352:	0f 85 31 f6 ff ff    	jne    43989 <printer_vprintf+0x30>
    }
}
   44358:	90                   	nop
   44359:	90                   	nop
   4435a:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   4435e:	c9                   	leave  
   4435f:	c3                   	ret    

0000000000044360 <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
   44360:	f3 0f 1e fa          	endbr64 
   44364:	55                   	push   %rbp
   44365:	48 89 e5             	mov    %rsp,%rbp
   44368:	48 83 ec 20          	sub    $0x20,%rsp
   4436c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   44370:	89 f0                	mov    %esi,%eax
   44372:	89 55 e0             	mov    %edx,-0x20(%rbp)
   44375:	88 45 e4             	mov    %al,-0x1c(%rbp)
    console_printer* cp = (console_printer*) p;
   44378:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4437c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   44380:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44384:	48 8b 40 08          	mov    0x8(%rax),%rax
   44388:	48 8d 15 11 4c 07 00 	lea    0x74c11(%rip),%rdx        # b8fa0 <console+0xfa0>
   4438f:	48 39 d0             	cmp    %rdx,%rax
   44392:	72 0f                	jb     443a3 <console_putc+0x43>
        cp->cursor = console;
   44394:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   44398:	48 8d 15 61 3c 07 00 	lea    0x73c61(%rip),%rdx        # b8000 <console>
   4439f:	48 89 50 08          	mov    %rdx,0x8(%rax)
    }
    if (c == '\n') {
   443a3:	80 7d e4 0a          	cmpb   $0xa,-0x1c(%rbp)
   443a7:	0f 85 82 00 00 00    	jne    4442f <console_putc+0xcf>
        int pos = (cp->cursor - console) % 80;
   443ad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   443b1:	48 8b 40 08          	mov    0x8(%rax),%rax
   443b5:	48 8d 15 44 3c 07 00 	lea    0x73c44(%rip),%rdx        # b8000 <console>
   443bc:	48 29 d0             	sub    %rdx,%rax
   443bf:	48 d1 f8             	sar    %rax
   443c2:	48 89 c1             	mov    %rax,%rcx
   443c5:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   443cc:	66 66 66 
   443cf:	48 89 c8             	mov    %rcx,%rax
   443d2:	48 f7 ea             	imul   %rdx
   443d5:	48 89 d0             	mov    %rdx,%rax
   443d8:	48 c1 f8 05          	sar    $0x5,%rax
   443dc:	48 89 ce             	mov    %rcx,%rsi
   443df:	48 c1 fe 3f          	sar    $0x3f,%rsi
   443e3:	48 29 f0             	sub    %rsi,%rax
   443e6:	48 89 c2             	mov    %rax,%rdx
   443e9:	48 89 d0             	mov    %rdx,%rax
   443ec:	48 c1 e0 02          	shl    $0x2,%rax
   443f0:	48 01 d0             	add    %rdx,%rax
   443f3:	48 c1 e0 04          	shl    $0x4,%rax
   443f7:	48 29 c1             	sub    %rax,%rcx
   443fa:	48 89 ca             	mov    %rcx,%rdx
   443fd:	89 55 fc             	mov    %edx,-0x4(%rbp)
        for (; pos != 80; pos++) {
   44400:	eb 25                	jmp    44427 <console_putc+0xc7>
            *cp->cursor++ = ' ' | color;
   44402:	8b 45 e0             	mov    -0x20(%rbp),%eax
   44405:	83 c8 20             	or     $0x20,%eax
   44408:	89 c6                	mov    %eax,%esi
   4440a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4440e:	48 8b 40 08          	mov    0x8(%rax),%rax
   44412:	48 8d 48 02          	lea    0x2(%rax),%rcx
   44416:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   4441a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   4441e:	89 f2                	mov    %esi,%edx
   44420:	66 89 10             	mov    %dx,(%rax)
        for (; pos != 80; pos++) {
   44423:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   44427:	83 7d fc 50          	cmpl   $0x50,-0x4(%rbp)
   4442b:	75 d5                	jne    44402 <console_putc+0xa2>
        }
    } else {
        *cp->cursor++ = c | color;
    }
}
   4442d:	eb 24                	jmp    44453 <console_putc+0xf3>
        *cp->cursor++ = c | color;
   4442f:	0f b6 55 e4          	movzbl -0x1c(%rbp),%edx
   44433:	8b 45 e0             	mov    -0x20(%rbp),%eax
   44436:	89 d6                	mov    %edx,%esi
   44438:	09 c6                	or     %eax,%esi
   4443a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4443e:	48 8b 40 08          	mov    0x8(%rax),%rax
   44442:	48 8d 48 02          	lea    0x2(%rax),%rcx
   44446:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   4444a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   4444e:	89 f2                	mov    %esi,%edx
   44450:	66 89 10             	mov    %dx,(%rax)
}
   44453:	90                   	nop
   44454:	c9                   	leave  
   44455:	c3                   	ret    

0000000000044456 <console_vprintf>:

int console_vprintf(int cpos, int color, const char* format, va_list val) {
   44456:	f3 0f 1e fa          	endbr64 
   4445a:	55                   	push   %rbp
   4445b:	48 89 e5             	mov    %rsp,%rbp
   4445e:	48 83 ec 30          	sub    $0x30,%rsp
   44462:	89 7d ec             	mov    %edi,-0x14(%rbp)
   44465:	89 75 e8             	mov    %esi,-0x18(%rbp)
   44468:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   4446c:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    struct console_printer cp;
    cp.p.putc = console_putc;
   44470:	48 8d 05 e9 fe ff ff 	lea    -0x117(%rip),%rax        # 44360 <console_putc>
   44477:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (cpos < 0 || cpos >= CONSOLE_ROWS * CONSOLE_COLUMNS) {
   4447b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
   4447f:	78 09                	js     4448a <console_vprintf+0x34>
   44481:	81 7d ec cf 07 00 00 	cmpl   $0x7cf,-0x14(%rbp)
   44488:	7e 07                	jle    44491 <console_vprintf+0x3b>
        cpos = 0;
   4448a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    }
    cp.cursor = console + cpos;
   44491:	8b 45 ec             	mov    -0x14(%rbp),%eax
   44494:	48 98                	cltq   
   44496:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4449a:	48 8d 05 5f 3b 07 00 	lea    0x73b5f(%rip),%rax        # b8000 <console>
   444a1:	48 01 d0             	add    %rdx,%rax
   444a4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&cp.p, color, format, val);
   444a8:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
   444ac:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   444b0:	8b 75 e8             	mov    -0x18(%rbp),%esi
   444b3:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
   444b7:	48 89 c7             	mov    %rax,%rdi
   444ba:	e8 9a f4 ff ff       	call   43959 <printer_vprintf>
    return cp.cursor - console;
   444bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   444c3:	48 8d 15 36 3b 07 00 	lea    0x73b36(%rip),%rdx        # b8000 <console>
   444ca:	48 29 d0             	sub    %rdx,%rax
   444cd:	48 d1 f8             	sar    %rax
}
   444d0:	c9                   	leave  
   444d1:	c3                   	ret    

00000000000444d2 <console_printf>:

int console_printf(int cpos, int color, const char* format, ...) {
   444d2:	f3 0f 1e fa          	endbr64 
   444d6:	55                   	push   %rbp
   444d7:	48 89 e5             	mov    %rsp,%rbp
   444da:	48 83 ec 60          	sub    $0x60,%rsp
   444de:	89 7d ac             	mov    %edi,-0x54(%rbp)
   444e1:	89 75 a8             	mov    %esi,-0x58(%rbp)
   444e4:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   444e8:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   444ec:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   444f0:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   444f4:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   444fb:	48 8d 45 10          	lea    0x10(%rbp),%rax
   444ff:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   44503:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   44507:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
   4450b:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   4450f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   44513:	8b 75 a8             	mov    -0x58(%rbp),%esi
   44516:	8b 45 ac             	mov    -0x54(%rbp),%eax
   44519:	89 c7                	mov    %eax,%edi
   4451b:	e8 36 ff ff ff       	call   44456 <console_vprintf>
   44520:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   44523:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   44526:	c9                   	leave  
   44527:	c3                   	ret    

0000000000044528 <string_putc>:
    printer p;
    char* s;
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
   44528:	f3 0f 1e fa          	endbr64 
   4452c:	55                   	push   %rbp
   4452d:	48 89 e5             	mov    %rsp,%rbp
   44530:	48 83 ec 20          	sub    $0x20,%rsp
   44534:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   44538:	89 f0                	mov    %esi,%eax
   4453a:	89 55 e0             	mov    %edx,-0x20(%rbp)
   4453d:	88 45 e4             	mov    %al,-0x1c(%rbp)
    string_printer* sp = (string_printer*) p;
   44540:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44544:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    if (sp->s < sp->end) {
   44548:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4454c:	48 8b 50 08          	mov    0x8(%rax),%rdx
   44550:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44554:	48 8b 40 10          	mov    0x10(%rax),%rax
   44558:	48 39 c2             	cmp    %rax,%rdx
   4455b:	73 1a                	jae    44577 <string_putc+0x4f>
        *sp->s++ = c;
   4455d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   44561:	48 8b 40 08          	mov    0x8(%rax),%rax
   44565:	48 8d 48 01          	lea    0x1(%rax),%rcx
   44569:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4456d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
   44571:	0f b6 55 e4          	movzbl -0x1c(%rbp),%edx
   44575:	88 10                	mov    %dl,(%rax)
    }
    (void) color;
}
   44577:	90                   	nop
   44578:	c9                   	leave  
   44579:	c3                   	ret    

000000000004457a <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
   4457a:	f3 0f 1e fa          	endbr64 
   4457e:	55                   	push   %rbp
   4457f:	48 89 e5             	mov    %rsp,%rbp
   44582:	48 83 ec 40          	sub    $0x40,%rsp
   44586:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   4458a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   4458e:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   44592:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    string_printer sp;
    sp.p.putc = string_putc;
   44596:	48 8d 05 8b ff ff ff 	lea    -0x75(%rip),%rax        # 44528 <string_putc>
   4459d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    sp.s = s;
   445a1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   445a5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    if (size) {
   445a9:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
   445ae:	74 33                	je     445e3 <vsnprintf+0x69>
        sp.end = s + size - 1;
   445b0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   445b4:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
   445b8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   445bc:	48 01 d0             	add    %rdx,%rax
   445bf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
   445c3:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   445c7:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   445cb:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   445cf:	be 00 00 00 00       	mov    $0x0,%esi
   445d4:	48 89 c7             	mov    %rax,%rdi
   445d7:	e8 7d f3 ff ff       	call   43959 <printer_vprintf>
        *sp.s = 0;
   445dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   445e0:	c6 00 00             	movb   $0x0,(%rax)
    }
    return sp.s - s;
   445e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   445e7:	48 2b 45 d8          	sub    -0x28(%rbp),%rax
}
   445eb:	c9                   	leave  
   445ec:	c3                   	ret    

00000000000445ed <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
   445ed:	f3 0f 1e fa          	endbr64 
   445f1:	55                   	push   %rbp
   445f2:	48 89 e5             	mov    %rsp,%rbp
   445f5:	48 83 ec 70          	sub    $0x70,%rsp
   445f9:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   445fd:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
   44601:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
   44605:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   44609:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   4460d:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   44611:	c7 45 b0 18 00 00 00 	movl   $0x18,-0x50(%rbp)
   44618:	48 8d 45 10          	lea    0x10(%rbp),%rax
   4461c:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   44620:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   44624:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    int n = vsnprintf(s, size, format, val);
   44628:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   4462c:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
   44630:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
   44634:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   44638:	48 89 c7             	mov    %rax,%rdi
   4463b:	e8 3a ff ff ff       	call   4457a <vsnprintf>
   44640:	89 45 cc             	mov    %eax,-0x34(%rbp)
    va_end(val);
    return n;
   44643:	8b 45 cc             	mov    -0x34(%rbp),%eax
}
   44646:	c9                   	leave  
   44647:	c3                   	ret    

0000000000044648 <console_clear>:


// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
   44648:	f3 0f 1e fa          	endbr64 
   4464c:	55                   	push   %rbp
   4464d:	48 89 e5             	mov    %rsp,%rbp
   44650:	48 83 ec 10          	sub    $0x10,%rsp
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   44654:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   4465b:	eb 1a                	jmp    44677 <console_clear+0x2f>
        console[i] = ' ' | 0x0700;
   4465d:	8b 45 fc             	mov    -0x4(%rbp),%eax
   44660:	48 98                	cltq   
   44662:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   44666:	48 8d 05 93 39 07 00 	lea    0x73993(%rip),%rax        # b8000 <console>
   4466d:	66 c7 04 02 20 07    	movw   $0x720,(%rdx,%rax,1)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   44673:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   44677:	81 7d fc cf 07 00 00 	cmpl   $0x7cf,-0x4(%rbp)
   4467e:	7e dd                	jle    4465d <console_clear+0x15>
    }
    cursorpos = 0;
   44680:	c7 05 72 49 07 00 00 	movl   $0x0,0x74972(%rip)        # b8ffc <cursorpos>
   44687:	00 00 00 
}
   4468a:	90                   	nop
   4468b:	c9                   	leave  
   4468c:	c3                   	ret    
