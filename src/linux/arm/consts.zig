pub const SYS = enum(usize) {
    restart_syscall = 0x00,
    exit = 0x01,
    fork = 0x02,
    read = 0x03,
    write = 0x04,
    open = 0x05,
    close = 0x06,
    creat = 0x08,
    link = 0x09,
    unlink = 0x0a,
    execve = 0x0b,
    chdir = 0x0c,
    mknod = 0x0e,
    chmod = 0x0f,
    lchown = 0x10,
    lseek = 0x13,
    getpid = 0x14,
    mount = 0x15,
    setuid = 0x17,
    getuid = 0x18,
    ptrace = 0x1a,
    pause = 0x1d,
    access = 0x21,
    nice = 0x22,
    sync = 0x24,
    kill = 0x25,
    rename = 0x26,
    mkdir = 0x27,
    rmdir = 0x28,
    dup = 0x29,
    pipe = 0x2a,
    times = 0x2b,
    brk = 0x2d,
    setgid = 0x2e,
    getgid = 0x2f,
    geteuid = 0x31,
    getegid = 0x32,
    acct = 0x33,
    umount2 = 0x34,
    ioctl = 0x36,
    fcntl = 0x37,
    setpgid = 0x39,
    umask = 0x3c,
    chroot = 0x3d,
    ustat = 0x3e,
    dup2 = 0x3f,
    getppid = 0x40,
    getpgrp = 0x41,
    setsid = 0x42,
    sigaction = 0x43,
    setreuid = 0x46,
    setregid = 0x47,
    sigsuspend = 0x48,
    sigpending = 0x49,
    sethostname = 0x4a,
    setrlimit = 0x4b,
    getrusage = 0x4d,
    gettimeofday = 0x4e,
    settimeofday = 0x4f,
    getgroups = 0x50,
    setgroups = 0x51,
    symlink = 0x53,
    readlink = 0x55,
    uselib = 0x56,
    swapon = 0x57,
    reboot = 0x58,
    munmap = 0x5b,
    truncate = 0x5c,
    ftruncate = 0x5d,
    fchmod = 0x5e,
    fchown = 0x5f,
    getpriority = 0x60,
    setpriority = 0x61,
    statfs = 0x63,
    fstatfs = 0x64,
    syslog = 0x67,
    setitimer = 0x68,
    getitimer = 0x69,
    stat = 0x6a,
    lstat = 0x6b,
    fstat = 0x6c,
    vhangup = 0x6f,
    wait4 = 0x72,
    swapoff = 0x73,
    sysinfo = 0x74,
    fsync = 0x76,
    sigreturn = 0x77,
    clone = 0x78,
    setdomainname = 0x79,
    uname = 0x7a,
    adjtimex = 0x7c,
    mprotect = 0x7d,
    sigprocmask = 0x7e,
    init_module = 0x80,
    delete_module = 0x81,
    quotactl = 0x83,
    getpgid = 0x84,
    fchdir = 0x85,
    bdflush = 0x86,
    sysfs = 0x87,
    personality = 0x88,
    setfsuid = 0x8a,
    setfsgid = 0x8b,
    _llseek = 0x8c,
    getdents = 0x8d,
    _newselect = 0x8e,
    flock = 0x8f,
    msync = 0x90,
    readv = 0x91,
    writev = 0x92,
    getsid = 0x93,
    fdatasync = 0x94,
    _sysctl = 0x95,
    mlock = 0x96,
    munlock = 0x97,
    mlockall = 0x98,
    munlockall = 0x99,
    sched_setparam = 0x9a,
    sched_getparam = 0x9b,
    sched_setscheduler = 0x9c,
    sched_getscheduler = 0x9d,
    sched_yield = 0x9e,
    sched_get_priority_max = 0x9f,
    sched_get_priority_min = 0xa0,
    sched_rr_get_interval = 0xa1,
    nanosleep = 0xa2,
    mremap = 0xa3,
    setresuid = 0xa4,
    getresuid = 0xa5,
    poll = 0xa8,
    nfsservctl = 0xa9,
    setresgid = 0xaa,
    getresgid = 0xab,
    prctl = 0xac,
    rt_sigreturn = 0xad,
    rt_sigaction = 0xae,
    rt_sigprocmask = 0xaf,
    rt_sigpending = 0xb0,
    rt_sigtimedwait = 0xb1,
    rt_sigqueueinfo = 0xb2,
    rt_sigsuspend = 0xb3,
    pread64 = 0xb4,
    pwrite64 = 0xb5,
    chown = 0xb6,
    getcwd = 0xb7,
    capget = 0xb8,
    capset = 0xb9,
    sigaltstack = 0xba,
    sendfile = 0xbb,
    vfork = 0xbe,
    ugetrlimit = 0xbf,
    mmap2 = 0xc0,
    truncate64 = 0xc1,
    ftruncate64 = 0xc2,
    stat64 = 0xc3,
    lstat64 = 0xc4,
    fstat64 = 0xc5,
    lchown32 = 0xc6,
    getuid32 = 0xc7,
    getgid32 = 0xc8,
    geteuid32 = 0xc9,
    getegid32 = 0xca,
    setreuid32 = 0xcb,
    setregid32 = 0xcc,
    getgroups32 = 0xcd,
    setgroups32 = 0xce,
    fchown32 = 0xcf,
    setresuid32 = 0xd0,
    getresuid32 = 0xd1,
    setresgid32 = 0xd2,
    getresgid32 = 0xd3,
    chown32 = 0xd4,
    setuid32 = 0xd5,
    setgid32 = 0xd6,
    setfsuid32 = 0xd7,
    setfsgid32 = 0xd8,
    getdents64 = 0xd9,
    pivot_root = 0xda,
    mincore = 0xdb,
    madvise = 0xdc,
    fcntl64 = 0xdd,
    gettid = 0xe0,
    readahead = 0xe1,
    setxattr = 0xe2,
    lsetxattr = 0xe3,
    fsetxattr = 0xe4,
    getxattr = 0xe5,
    lgetxattr = 0xe6,
    fgetxattr = 0xe7,
    listxattr = 0xe8,
    llistxattr = 0xe9,
    flistxattr = 0xea,
    removexattr = 0xeb,
    lremovexattr = 0xec,
    fremovexattr = 0xed,
    tkill = 0xee,
    sendfile64 = 0xef,
    futex = 0xf0,
    sched_setaffinity = 0xf1,
    sched_getaffinity = 0xf2,
    io_setup = 0xf3,
    io_destroy = 0xf4,
    io_getevents = 0xf5,
    io_submit = 0xf6,
    io_cancel = 0xf7,
    exit_group = 0xf8,
    lookup_dcookie = 0xf9,
    epoll_create = 0xfa,
    epoll_ctl = 0xfb,
    epoll_wait = 0xfc,
    remap_file_pages = 0xfd,
    set_tid_address = 0x100,
    timer_create = 0x101,
    timer_settime = 0x102,
    timer_gettime = 0x103,
    timer_getoverrun = 0x104,
    timer_delete = 0x105,
    clock_settime = 0x106,
    clock_gettime = 0x107,
    clock_getres = 0x108,
    clock_nanosleep = 0x109,
    statfs64 = 0x10a,
    fstatfs64 = 0x10b,
    tgkill = 0x10c,
    utimes = 0x10d,
    arm_fadvise64_64 = 0x10e,
    pciconfig_iobase = 0x10f,
    pciconfig_read = 0x110,
    pciconfig_write = 0x111,
    mq_open = 0x112,
    mq_unlink = 0x113,
    mq_timedsend = 0x114,
    mq_timedreceive = 0x115,
    mq_notify = 0x116,
    mq_getsetattr = 0x117,
    waitid = 0x118,
    socket = 0x119,
    bind = 0x11a,
    connect = 0x11b,
    listen = 0x11c,
    accept = 0x11d,
    getsockname = 0x11e,
    getpeername = 0x11f,
    socketpair = 0x120,
    send = 0x121,
    sendto = 0x122,
    recv = 0x123,
    recvfrom = 0x124,
    shutdown = 0x125,
    setsockopt = 0x126,
    getsockopt = 0x127,
    sendmsg = 0x128,
    recvmsg = 0x129,
    semop = 0x12a,
    semget = 0x12b,
    semctl = 0x12c,
    msgsnd = 0x12d,
    msgrcv = 0x12e,
    msgget = 0x12f,
    msgctl = 0x130,
    shmat = 0x131,
    shmdt = 0x132,
    shmget = 0x133,
    shmctl = 0x134,
    add_key = 0x135,
    request_key = 0x136,
    keyctl = 0x137,
    semtimedop = 0x138,
    vserver = 0x139,
    ioprio_set = 0x13a,
    ioprio_get = 0x13b,
    inotify_init = 0x13c,
    inotify_add_watch = 0x13d,
    inotify_rm_watch = 0x13e,
    mbind = 0x13f,
    get_mempolicy = 0x140,
    set_mempolicy = 0x141,
    openat = 0x142,
    mkdirat = 0x143,
    mknodat = 0x144,
    fchownat = 0x145,
    futimesat = 0x146,
    fstatat64 = 0x147,
    unlinkat = 0x148,
    renameat = 0x149,
    linkat = 0x14a,
    symlinkat = 0x14b,
    readlinkat = 0x14c,
    fchmodat = 0x14d,
    faccessat = 0x14e,
    pselect6 = 0x14f,
    ppoll = 0x150,
    unshare = 0x151,
    set_robust_list = 0x152,
    get_robust_list = 0x153,
    splice = 0x154,
    arm_sync_file_range = 0x155,
    sync_file_range2 = 0x155,
    tee = 0x156,
    vmsplice = 0x157,
    move_pages = 0x158,
    getcpu = 0x159,
    epoll_pwait = 0x15a,
    kexec_load = 0x15b,
    utimensat = 0x15c,
    signalfd = 0x15d,
    timerfd_create = 0x15e,
    eventfd = 0x15f,
    fallocate = 0x160,
    timerfd_settime = 0x161,
    timerfd_gettime = 0x162,
    signalfd4 = 0x163,
    eventfd2 = 0x164,
    epoll_create1 = 0x165,
    dup3 = 0x166,
    pipe2 = 0x167,
    inotify_init1 = 0x168,
    preadv = 0x169,
    pwritev = 0x16a,
    rt_tgsigqueueinfo = 0x16b,
    perf_event_open = 0x16c,
    recvmmsg = 0x16d,
    accept4 = 0x16e,
    fanotify_init = 0x16f,
    fanotify_mark = 0x170,
    prlimit64 = 0x171,
    name_to_handle_at = 0x172,
    open_by_handle_at = 0x173,
    clock_adjtime = 0x174,
    syncfs = 0x175,
    sendmmsg = 0x176,
    setns = 0x177,
    process_vm_readv = 0x178,
    process_vm_writev = 0x179,
    kcmp = 0x17a,
    finit_module = 0x17b,
    sched_setattr = 0x17c,
    sched_getattr = 0x17d,
    renameat2 = 0x17e,
    seccomp = 0x17f,
    getrandom = 0x180,
    memfd_create = 0x181,
    bpf = 0x182,
    execveat = 0x183,
    userfaultfd = 0x184,
    membarrier = 0x185,
    mlock2 = 0x186,
    copy_file_range = 0x187,
    preadv2 = 0x188,
    pwritev2 = 0x189,
    pkey_mprotect = 0x18a,
    pkey_alloc = 0x18b,
    pkey_free = 0x18c,
    statx = 0x18d,
    ARM_breakpoint = 0xf0001,
    ARM_cacheflush = 0xf0002,
    ARM_usr26 = 0xf0003,
    ARM_usr32 = 0xf0004,
    ARM_set_tls = 0xf0005,
};
