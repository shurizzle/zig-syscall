// NR: %x8 return %x0 paramters: %x0, %x1, %x2, %x3, %x4, %x5

pub inline fn syscall0(n: usize) usize {
    return asm volatile ("svc 0"
        : [ret] "={x0}" (-> usize),
        : [n] "{x8}" (n),
        : "memory", "cc"
    );
}

pub inline fn syscall1(n: usize, arg1: usize) usize {
    return asm volatile ("svc 0"
        : [ret] "={x0}" (-> usize),
        : [n] "{x8}" (n),
          [arg1] "{x0}" (arg1),
        : "memory", "cc"
    );
}

pub inline fn syscall2(n: usize, arg1: usize, arg2: usize) usize {
    return asm volatile ("svc 0"
        : [ret] "={x0}" (-> usize),
        : [n] "{x8}" (n),
          [arg1] "{x0}" (arg1),
          [arg2] "{x1}" (arg2),
        : "memory", "cc"
    );
}

inline fn syscall3(n: usize, arg1: usize, arg2: usize, arg3: usize) usize {
    return asm volatile ("svc 0"
        : [ret] "={x0}" (-> usize),
        : [n] "{x8}" (n),
          [arg1] "{x0}" (arg1),
          [arg2] "{x1}" (arg2),
          [arg3] "{x2}" (arg3),
        : "memory", "cc"
    );
}

inline fn syscall4(n: usize, arg1: usize, arg2: usize, arg3: usize, arg4: usize) usize {
    return asm volatile ("svc 0"
        : [ret] "={x0}" (-> usize),
        : [n] "{x8}" (n),
          [arg1] "{x0}" (arg1),
          [arg2] "{x1}" (arg2),
          [arg3] "{x2}" (arg3),
          [arg4] "{x3}" (arg4),
        : "memory", "cc"
    );
}

inline fn syscall5(n: usize, arg1: usize, arg2: usize, arg3: usize, arg4: usize, arg5: usize) usize {
    return asm volatile ("svc 0"
        : [ret] "={x0}" (-> usize),
        : [n] "{x8}" (n),
          [arg1] "{x0}" (arg1),
          [arg2] "{x1}" (arg2),
          [arg3] "{x2}" (arg3),
          [arg4] "{x3}" (arg4),
          [arg5] "{x4}" (arg5),
        : "memory", "cc"
    );
}

inline fn syscall6(n: usize, arg1: usize, arg2: usize, arg3: usize, arg4: usize, arg5: usize, arg6: usize) usize {
    return asm volatile ("svc 0"
        : [ret] "={x0}" (-> usize),
        : [n] "{x8}" (n),
          [arg1] "{x0}" (arg1),
          [arg2] "{x1}" (arg2),
          [arg3] "{x2}" (arg3),
          [arg4] "{x3}" (arg4),
          [arg5] "{x4}" (arg5),
          [arg6] "{x5}" (arg6),
        : "memory", "cc"
    );
}