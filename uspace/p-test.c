#include "process.h"
#include "lib.h"

#ifndef KERNEL_ADDR
// any random address in kernel space
#define KERNEL_ADDR 0x10000 
#endif
#ifndef CONSOLE_ADDR
#define CONSOLE_ADDR ((uintptr_t) console)
#endif
extern uint8_t end[];

// program that checks if a kernel address is accessible to user
// (except CONSOLE_ADDR)

void process_main(void) {
    pid_t p = sys_getpid();
    srand(p);

    vamapping kmap;
    sys_mapping(KERNEL_ADDR, &kmap);

    if(kmap.perm &(PTE_U))
        panic("Kernel accessible by process!");

    const char* message = "Test passed!\n";
    int i = 0;
    while (message[i] != '\0') {
        *((char*) CONSOLE_ADDR + cursorpos * 2) = message[i];
        *((char*) CONSOLE_ADDR + cursorpos * 2 + 1) = 0x0F; // White on black color
        ++cursorpos;
        ++i;
    }
    TEST_PASS();
}
