# zig-syscall

A pure zig implementation of syscalls in zig.

### What

This library aims to nothing.

### So, why.

I'm just learing zig and I'm avoiding libc because I don't like it.

### How I can use it?

Maybe you don't really want to. Just in case:

```zig
const sc = @import("syscall");

sc.syscall(sc.SYS_example0, .{});
sc.syscall(sc.SYS_example1, .{ arg1 });
sc.syscall(sc.SYS_example2, .{ arg1, arg2 });
sc.syscall(sc.SYS_example3, .{ arg1, arg2, arg3 });
sc.syscall(sc.SYS_example4, .{ arg1, arg2, arg3, arg4 });
sc.syscall(sc.SYS_example5, .{ arg1, arg2, arg3, arg4, arg5 });
sc.syscall(sc.SYS_example6, .{ arg1, arg2, arg3, arg4, arg5, arg6 });
```

### Support

- Linux
  - x86_64
  - i386 (not tested)
  - arm (not tested)
  - aarch64 (not tested)
- MacOS
  - x86_64
  - aarch64 (not tested)

---

Feel free to contribute. Tests and support for other platforms are welcome.

Make sure to include references for new implementations when opening PRs.

Don't open issues if your are not interested into solving the problem, I'm not
paid for this, just solve your issues by yourself.

---

♥️ shurizzle
