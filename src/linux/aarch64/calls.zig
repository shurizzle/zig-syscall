// NR: %x8 return: %x0 parameters: %x0, %x1, %x2, %x3, %x4, %x5
const std = @import("std");
const SYS = @import("./consts.zig").SYS;

inline fn syscall0(n: SYS) usize {
    return asm volatile ("svc #0"
        : [ret] "={x0}" (-> usize),
        : [n] "{x8}" (n),
        : "memory", "cc"
    );
}

inline fn syscall1(n: SYS, arg1: usize) usize {
    return asm volatile ("svc #0"
        : [ret] "={x0}" (-> usize),
        : [n] "{x8}" (n),
          [arg1] "{x0}" (arg1),
        : "memory", "cc"
    );
}

inline fn syscall2(n: SYS, arg1: usize, arg2: usize) usize {
    return asm volatile ("svc #0"
        : [ret] "={x0}" (-> usize),
        : [n] "{x8}" (n),
          [arg1] "{x0}" (arg1),
          [arg2] "{x1}" (arg2),
        : "memory", "cc"
    );
}

inline fn syscall3(n: SYS, arg1: usize, arg2: usize, arg3: usize) usize {
    return asm volatile ("svc #0"
        : [ret] "={x0}" (-> usize),
        : [n] "{x8}" (n),
          [arg1] "{x0}" (arg1),
          [arg2] "{x1}" (arg2),
          [arg3] "{x2}" (arg3),
        : "memory", "cc"
    );
}

inline fn syscall4(n: SYS, arg1: usize, arg2: usize, arg3: usize, arg4: usize) usize {
    return asm volatile ("svc #0"
        : [ret] "={x0}" (-> usize),
        : [n] "{x8}" (n),
          [arg1] "{x0}" (arg1),
          [arg2] "{x1}" (arg2),
          [arg3] "{x2}" (arg3),
          [arg4] "{x3}" (arg4),
        : "memory", "cc"
    );
}

inline fn syscall5(n: SYS, arg1: usize, arg2: usize, arg3: usize, arg4: usize, arg5: usize) usize {
    return asm volatile ("svc #0"
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

inline fn syscall6(n: SYS, arg1: usize, arg2: usize, arg3: usize, arg4: usize, arg5: usize, arg6: usize) usize {
    return asm volatile ("svc #0"
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

pub inline fn syscall(n: SYS, args: anytype) usize {
    const typ = @TypeOf(args);

    comptime if (!std.meta.trait.isTuple(typ)) {
        @compileError("syscall only accept tuple as argument");
    };
    const fun = comptime switch (args.len) {
        0 => syscall0,
        1 => syscall1,
        2 => syscall2,
        3 => syscall3,
        4 => syscall4,
        5 => syscall5,
        6 => syscall6,
        else => @compileError("Unsupported arguments length"),
    };
    const full_args = comptime .{n} ++ args;

    return @call(.{}, fun, full_args);
}
