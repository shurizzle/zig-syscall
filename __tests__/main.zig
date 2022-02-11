const std = @import("std");
const builtin = @import("builtin");

test "test" {
    const expect = std.testing.expect;
    const sc = @import("syscall");

    var filename = "test.txt";
    var content = "TEST" ** 16;

    defer std.fs.cwd().deleteFile(filename) catch {};

    const flags = switch (builtin.target.os.tag) {
        .linux => 0x242,
        .macos => 0x602,
        else => @compileError("OS doesn't have tests :("),
    };

    var _fd = @bitCast(isize, sc.syscall(sc.SYS.open, .{ @ptrToInt(filename), flags, @as(usize, 0o640) }));
    try expect(_fd >= 0);
    var fd = @bitCast(usize, _fd);

    try expect(sc.syscall(sc.SYS.write, .{ fd, @ptrToInt(content), content.len }) == content.len);

    try expect(sc.syscall(sc.SYS.close, .{fd}) == 0);

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
