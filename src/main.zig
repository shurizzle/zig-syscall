const builtin = @import("builtin");

pub usingnamespace switch (builtin.target.os.tag) {
    .macos => @import("./apple.zig"),
    .linux => @import("./linux.zig"),
    else => @compileError("OS not supported"),
};
