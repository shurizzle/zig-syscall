// NR: %eax return: %eax parameters: %ebx, %ecx, %edx, %esi, %edi, %ebp
const std = @import("std");
const SYS = @import("./consts.zig").SYS;

inline fn syscall0(n: SYS) usize {
    return asm volatile ("int $0x80"
        : [ret] "={eax}" (-> usize),
        : [n] "{eax}" (n),
        : "memory", "cc"
    );
}

inline fn syscall1(n: SYS, arg1: usize) usize {
    return asm volatile ("int $0x80"
        : [ret] "={eax}" (-> usize),
        : [n] "{eax}" (n),
          [arg1] "{ebx}" (arg1),
        : "memory", "cc"
    );
}

inline fn syscall2(n: SYS, arg1: usize, arg2: usize) usize {
    return asm volatile ("int $0x80"
        : [ret] "={eax}" (-> usize),
        : [n] "{eax}" (n),
          [arg1] "{ebx}" (arg1),
          [arg2] "{ecx}" (arg2),
        : "memory", "cc"
    );
}

inline fn syscall3(n: SYS, arg1: usize, arg2: usize, arg3: usize) usize {
    return asm volatile ("int $0x80"
        : [ret] "={eax}" (-> usize),
        : [n] "{eax}" (n),
          [arg1] "{ebx}" (arg1),
          [arg2] "{ecx}" (arg2),
          [arg3] "{edx}" (arg3),
        : "memory", "cc"
    );
}

inline fn syscall4(n: SYS, arg1: usize, arg2: usize, arg3: usize, arg4: usize) usize {
    return asm volatile ("int $0x80"
        : [ret] "={eax}" (-> usize),
        : [n] "{eax}" (n),
          [arg1] "{ebx}" (arg1),
          [arg2] "{ecx}" (arg2),
          [arg3] "{edx}" (arg3),
          [arg4] "{esi}" (arg4),
        : "memory", "cc"
    );
}

inline fn syscall5(n: SYS, arg1: usize, arg2: usize, arg3: usize, arg4: usize, arg5: usize) usize {
    return asm volatile ("int $0x80"
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

inline fn syscall6(n: SYS, arg1: usize, arg2: usize, arg3: usize, arg4: usize, arg5: usize, arg6: usize) usize {
    return asm volatile ("int $0x80"
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
