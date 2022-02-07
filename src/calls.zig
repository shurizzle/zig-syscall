const builtin = @import("builtin");

pub usingnamespace switch (builtin.target.cpu.arch) {
    .x86_64 => @import("./calls/x86_64.zig"),
    .i386 => @import("./calls/i386.zig"),
    .arm, .armeb => @import("./calls/arm.zig"),
    .aarch64, .aarch64_be, .aarch64_32 => @import("./calls/aarch64.zig"),
    else => @compileError("Architecture not supported"),
};
