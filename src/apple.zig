const builtin = @import("builtin");

pub usingnamespace switch (builtin.target.cpu.arch) {
    .x86_64 => @import("./apple/x86_64.zig"),
    .aarch64, .aarch64_be, .aarch64_32 => @import("./apple/aarch64.zig"),
    else => @compileError("Architecture not supported"),
};
