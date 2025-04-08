
void process_setup(pid_t pid, int program_number)
{
    process_init(&processes[pid], 0);

    int pt4num = find_free_page();
    if (pt4num == -1)
    {
        panic("No more physical pages\n");
        return;
    }
    x86_64_pagetable *pt_L4 = numtopagetable(pt4num, pid);
    int pt3num = find_free_page();
    if (pt3num == -1)
    {
        freepage(pt4num);
        panic("No more physical pages\n");
        return;
    }
    x86_64_pagetable *pt_L3 = numtopagetable(pt3num, pid);
    int pt2num = find_free_page();
    if (pt2num == -1)
    {
        freepage(pt4num);
        freepage(pt3num);
        panic("No more physical pages\n");
        return;
    }
    x86_64_pagetable *pt_L2 = numtopagetable(pt2num, pid);
    int pt1_0num = find_free_page();
    if (pt1_0num == -1)
    {
        freepage(pt4num);
        freepage(pt3num);
        freepage(pt2num);

        panic("No more physical pages\n");
        return;
    }
    x86_64_pagetable *pt_L1_0 = numtopagetable(pt1_0num, pid);
    int pt1_1num = find_free_page();
    if (pt1_1num == -1)
    {
        freepage(pt4num);
        freepage(pt3num);
        freepage(pt2num);
        freepage(pt1_0num);
        panic("No more physical pages\n");
        return;
    }
    x86_64_pagetable *pt_L1_1 = numtopagetable(pt1_1num, pid);
    // set the pages to zero
    memset(pt_L4, 0, PAGESIZE);
    memset(pt_L3, 0, PAGESIZE);
    memset(pt_L2, 0, PAGESIZE);
    memset(pt_L1_0, 0, PAGESIZE);
    memset(pt_L1_1, 0, PAGESIZE);

    // Link the page tables together. Did I do this right?
    pt_L4->entry[0] = (x86_64_pageentry_t)pt_L3 | PTE_P | PTE_W | PTE_U;
    pt_L3->entry[0] = (x86_64_pageentry_t)pt_L2 | PTE_P | PTE_W | PTE_U;
    pt_L2->entry[0] = (x86_64_pageentry_t)pt_L1_0 | PTE_P | PTE_W | PTE_U;
    pt_L2->entry[1] = (x86_64_pageentry_t)pt_L1_1 | PTE_P | PTE_W | PTE_U;

    // Copy kernel mappings (for addresses below PROC_START_ADDR)
    for (uintptr_t addr = 0; addr < PROC_START_ADDR; addr += PAGESIZE)
    {                                                                   // we're gonna go page by page I think
        vamapping vmap = virtual_memory_lookup(kernel_pagetable, addr); // get the pagetable page of addr in the kernel
        if (vmap.pn >= 0)
        {
            // Copy the mapping, but ensure the console is user-accessible
            int perm = vmap.perm;
            if (addr == CONSOLE_ADDR)
            {
                perm |= PTE_U; // Make console user-accessible
            }
            else
            {
                perm &= ~PTE_U; // Make sure kernel memory is not user-accessible
            }
            virtual_memory_map(pt_L4, addr, vmap.pa, PAGESIZE, perm);
        }
    }

    processes[pid].p_pagetable = pt_L4;

    int r = program_load(&processes[pid], program_number, NULL);
    assert(r >= 0);

    processes[pid].p_registers.reg_rsp = MEMSIZE_VIRTUAL;
    int physpage = find_free_page();
    if (physpage == -1)
    {
        freepage(pt4num);
        freepage(pt3num);
        freepage(pt2num);
        freepage(pt1_0num);
        freepage(pt1_1num);
        panic("No more physical pages\n");
        return;
    }

    uintptr_t stack_page = processes[pid].p_registers.reg_rsp - PAGESIZE;
    int val = assign_physical_page(PAGEADDRESS(physpage), pid);
    if (val == -1)
    {
        freepage(pt4num);
        freepage(pt3num);
        freepage(pt2num);
        freepage(pt1_0num);
        freepage(pt1_1num);
        panic("no idea");
        return;
    }
    virtual_memory_map(processes[pid].p_pagetable, stack_page, PAGEADDRESS(physpage), PAGESIZE, PTE_P | PTE_W | PTE_U);
    processes[pid].p_state = P_RUNNABLE;
}