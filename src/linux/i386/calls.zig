// NR: %eax return: %eax paramters: %ebx, %ecx, %edx, %esi, %edi, %ebp

pub inline fn syscall0(n: usize) usize {
    return asm volatile ("int $$0x80"
        : [ret] "={eax}" (-> usize),
        : [n] "{eax}" (n),
        : "memory", "cc"
    );
}

pub inline fn syscall1(n: usize, arg1: usize) usize {
    return asm volatile ("int $$0x80"
        : [ret] "={eax}" (-> usize),
        : [n] "{eax}" (n),
          [arg1] "{ebx}" (arg1),
        : "memory", "cc"
    );
}

pub inline fn syscall2(n: usize, arg1: usize, arg2: usize) usize {
    return asm volatile ("int $$0x80"
        : [ret] "={eax}" (-> usize),
        : [n] "{eax}" (n),
          [arg1] "{ebx}" (arg1),
          [arg2] "{ecx}" (arg2),
        : "memory", "cc"
    );
}

pub inline fn syscall3(n: usize, arg1: usize, arg2: usize, arg3: usize) usize {
    return asm volatile ("int $$0x80"
        : [ret] "={eax}" (-> usize),
        : [n] "{eax}" (n),
          [arg1] "{ebx}" (arg1),
          [arg2] "{ecx}" (arg2),
          [arg3] "{edx}" (arg3),
        : "memory", "cc"
    );
}

pub inline fn syscall4(n: usize, arg1: usize, arg2: usize, arg3: usize, arg4: usize) usize {
    return asm volatile ("int $$0x80"
        : [ret] "={eax}" (-> usize),
        : [n] "{eax}" (n),
          [arg1] "{ebx}" (arg1),
          [arg2] "{ecx}" (arg2),
          [arg3] "{edx}" (arg3),
          [arg4] "{esi}" (arg4),
        : "memory", "cc"
    );
}

pub inline fn syscall5(n: usize, arg1: usize, arg2: usize, arg3: usize, arg4: usize, arg5: usize) usize {
    return asm volatile ("int $$0x80"
        : [ret] "={eax}" (-> usize),
        : [n] "{eax}" (n),
          [arg1] "{ebx}" (arg1),
          [arg2] "{ecx}" (arg2),
          [arg3] "{edx}" (arg3),
          [arg4] "{esi}" (arg4),
          [arg5] "{edi}" (arg5),
        : "memory", "cc"
    );
}

pub inline fn syscall6(n: usize, arg1: usize, arg2: usize, arg3: usize, arg4: usize, arg5: usize, arg6: usize) usize {
    return asm volatile ("int $$0x80"
        : [ret] "={eax}" (-> usize),
        : [n] "{eax}" (n),
          [arg1] "{ebx}" (arg1),
          [arg2] "{ecx}" (arg2),
          [arg3] "{edx}" (arg3),
          [arg4] "{esi}" (arg4),
          [arg5] "{edi}" (arg5),
          [arg6] "{ebp}" (arg6),
        : "memory", "cc"
    );
}
