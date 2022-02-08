const std = @import("std");

const syscall = std.build.Pkg{
    .name = "syscall",
    .path = .{ .path = "./src/main.zig" },
};

pub fn build(b: *std.build.Builder) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const main_tests = b.addTest("__tests__/main.zig");
    main_tests.addPackage(syscall);
    main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
