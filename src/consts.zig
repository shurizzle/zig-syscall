const builtin = @import("builtin");

pub usingnamespace switch (builtin.target.os.tag) {
    .linux => @import("./consts/linux.zig"),
    else => @compileError("OS not supported"),
};
