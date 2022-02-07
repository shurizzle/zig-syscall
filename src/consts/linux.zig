const builtin = @import("builtin");

pub usingnamespace switch (builtin.target.cpu.arch) {
    .x86_64 => @import("./linux/x86_64.zig"),
    .i386 => @import("./linux/i386.zig"),
    .arm, .armeb => @import("./linux/arm.zig"),
    .aarch64, .aarch64_be, .aarch64_32 => @import("./linux/aarch64.zig"),
    else => @compileError("Architecture not supported"),
};
