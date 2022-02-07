const builtin = @import("builtin");

pub usingnamespace switch (builtin.target.os.tag) {
    .linux => @import("./consts/linux.zig"),
    .macos => @import("./consts/apple.zig"),
    else => @compileError("OS not supported"),
};
