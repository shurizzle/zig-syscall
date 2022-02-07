const std = @import("std");
const builtin = @import("builtin");

pub usingnamespace @import("./calls.zig");
pub usingnamespace @import("./consts.zig");

test "test" {
    const expect = std.testing.expect;
    const sc = @import("./main.zig");

    var filename = "test.txt";
    var content = "TEST" ** 16;

    defer std.fs.cwd().deleteFile(filename) catch {};

    switch (builtin.target.os.tag) {
        .linux => {
            var _fd = @bitCast(isize, sc.syscall3(sc.SYS_open, @ptrToInt(filename), 0x242, @as(usize, 0o640)));
            try expect(_fd >= 0);
            var fd = @bitCast(usize, _fd);

            try expect(sc.syscall3(sc.SYS_write, fd, @ptrToInt(content), content.len) == content.len);

            try expect(sc.syscall1(sc.SYS_close, fd) == 0);
        },
        .macos => {
            var _fd = @bitCast(isize, sc.syscall3(sc.SYS_open, @ptrToInt(filename), 0x602, @as(usize, 0o640)));
            try expect(_fd >= 0);
            var fd = @bitCast(usize, _fd);

            try expect(sc.syscall3(sc.SYS_write, fd, @ptrToInt(content), content.len) == content.len);

            try expect(sc.syscall1(sc.SYS_close, fd) == 0);
        },
        else => @compileError("OS not supported"),
    }

    var file = try std.fs.cwd().openFile(filename, .{ .write = false, .read = true });
    errdefer file.close();
    const stat = try file.stat();
    try expect((stat.mode & 0o777) == 0o640);
    var c: [16 * 4:0]u8 = undefined;
    const n = try file.read(&c);
    c[n] = 0;
    file.close();
    try expect(n == 16 * 4);
    try expect(std.mem.eql(u8, content, &c));
}
