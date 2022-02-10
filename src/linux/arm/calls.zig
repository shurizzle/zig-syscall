// NR: %r7 return: %r0 parameters: %r0, %r1, %r2, %r3, %r4, %r5
const SYS = @import("./consts.zig").SYS;

pub inline fn syscall0(n: SYS) usize {
    return asm volatile ("svc #0"
        : [ret] "={r0}" (-> usize),
        : [n] "{r7}" (n),
        : "memory", "cc"
    );
}

pub inline fn syscall1(n: SYS, arg1: usize) usize {
    return asm volatile ("svc #0"
        : [ret] "={r0}" (-> usize),
        : [n] "{r7}" (n),
          [arg1] "{r0}" (arg1),
        : "memory", "cc"
    );
}

pub inline fn syscall2(n: SYS, arg1: usize, arg2: usize) usize {
    return asm volatile ("svc #0"
        : [ret] "={r0}" (-> usize),
        : [n] "{r7}" (n),
          [arg1] "{r0}" (arg1),
          [arg2] "{r1}" (arg2),
        : "memory", "cc"
    );
}

pub inline fn syscall3(n: SYS, arg1: usize, arg2: usize, arg3: usize) usize {
    return asm volatile ("svc #0"
        : [ret] "={r0}" (-> usize),
        : [n] "{r7}" (n),
          [arg1] "{r0}" (arg1),
          [arg2] "{r1}" (arg2),
          [arg3] "{r2}" (arg3),
        : "memory", "cc"
    );
}

pub inline fn syscall4(n: SYS, arg1: usize, arg2: usize, arg3: usize, arg4: usize) usize {
    return asm volatile ("svc #0"
        : [ret] "={r0}" (-> usize),
        : [n] "{r7}" (n),
          [arg1] "{r0}" (arg1),
          [arg2] "{r1}" (arg2),
          [arg3] "{r2}" (arg3),
          [arg4] "{r3}" (arg4),
        : "memory", "cc"
    );
}

pub inline fn syscall5(n: SYS, arg1: usize, arg2: usize, arg3: usize, arg4: usize, arg5: usize) usize {
    return asm volatile ("svc #0"
        : [ret] "={r0}" (-> usize),
        : [n] "{r7}" (n),
          [arg1] "{r0}" (arg1),
          [arg2] "{r1}" (arg2),
          [arg3] "{r2}" (arg3),
          [arg4] "{r3}" (arg4),
          [arg5] "{r4}" (arg5),
        : "memory", "cc"
    );
}

pub inline fn syscall6(n: SYS, arg1: usize, arg2: usize, arg3: usize, arg4: usize, arg5: usize, arg6: usize) usize {
    return asm volatile ("svc #0"
        : [ret] "={r0}" (-> usize),
        : [n] "{r7}" (n),
          [arg1] "{r0}" (arg1),
          [arg2] "{r1}" (arg2),
          [arg3] "{r2}" (arg3),
          [arg4] "{r3}" (arg4),
          [arg5] "{r4}" (arg5),
          [arg6] "{r5}" (arg6),
        : "memory", "cc"
    );
}
