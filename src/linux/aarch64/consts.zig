pub const SYS = enum(usize) {
    io_setup = 0x00,
    io_destroy = 0x01,
    io_submit = 0x02,
    io_cancel = 0x03,
    io_getevents = 0x04,
    setxattr = 0x05,
    lsetxattr = 0x06,
    fsetxattr = 0x07,
    getxattr = 0x08,
    lgetxattr = 0x09,
    fgetxattr = 0x0a,
    listxattr = 0x0b,
    llistxattr = 0x0c,
    flistxattr = 0x0d,
    removexattr = 0x0e,
    lremovexattr = 0x0f,
    fremovexattr = 0x10,
    getcwd = 0x11,
    lookup_dcookie = 0x12,
    eventfd2 = 0x13,
    epoll_create1 = 0x14,
    epoll_ctl = 0x15,
    epoll_pwait = 0x16,
    dup = 0x17,
    dup3 = 0x18,
    fcntl = 0x19,
    inotify_init1 = 0x1a,
    inotify_add_watch = 0x1b,
    inotify_rm_watch = 0x1c,
    ioctl = 0x1d,
    ioprio_set = 0x1e,
    ioprio_get = 0x1f,
    flock = 0x20,
    mknodat = 0x21,
    mkdirat = 0x22,
    unlinkat = 0x23,
    symlinkat = 0x24,
    linkat = 0x25,
    renameat = 0x26,
    umount2 = 0x27,
    mount = 0x28,
    pivot_root = 0x29,
    nfsservctl = 0x2a,
    statfs = 0x2b,
    fstatfs = 0x2c,
    truncate = 0x2d,
    ftruncate = 0x2e,
    fallocate = 0x2f,
    faccessat = 0x30,
    chdir = 0x31,
    fchdir = 0x32,
    chroot = 0x33,
    fchmod = 0x34,
    fchmodat = 0x35,
    fchownat = 0x36,
    fchown = 0x37,
    openat = 0x38,
    close = 0x39,
    vhangup = 0x3a,
    pipe2 = 0x3b,
    quotactl = 0x3c,
    getdents64 = 0x3d,
    lseek = 0x3e,
    read = 0x3f,
    write = 0x40,
    readv = 0x41,
    writev = 0x42,
    pread64 = 0x43,
    pwrite64 = 0x44,
    preadv = 0x45,
    pwritev = 0x46,
    sendfile = 0x47,
    pselect6 = 0x48,
    ppoll = 0x49,
    signalfd4 = 0x4a,
    vmsplice = 0x4b,
    splice = 0x4c,
    tee = 0x4d,
    readlinkat = 0x4e,
    newfstatat = 0x4f,
    fstat = 0x50,
    sync = 0x51,
    fsync = 0x52,
    fdatasync = 0x53,
    sync_file_range = 0x54,
    timerfd_create = 0x55,
    timerfd_settime = 0x56,
    timerfd_gettime = 0x57,
    utimensat = 0x58,
    acct = 0x59,
    capget = 0x5a,
    capset = 0x5b,
    personality = 0x5c,
    exit = 0x5d,
    exit_group = 0x5e,
    waitid = 0x5f,
    set_tid_address = 0x60,
    unshare = 0x61,
    futex = 0x62,
    set_robust_list = 0x63,
    get_robust_list = 0x64,
    nanosleep = 0x65,
    getitimer = 0x66,
    setitimer = 0x67,
    kexec_load = 0x68,
    init_module = 0x69,
    delete_module = 0x6a,
    timer_create = 0x6b,
    timer_gettime = 0x6c,
    timer_getoverrun = 0x6d,
    timer_settime = 0x6e,
    timer_delete = 0x6f,
    clock_settime = 0x70,
    clock_gettime = 0x71,
    clock_getres = 0x72,
    clock_nanosleep = 0x73,
    syslog = 0x74,
    ptrace = 0x75,
    sched_setparam = 0x76,
    sched_setscheduler = 0x77,
    sched_getscheduler = 0x78,
    sched_getparam = 0x79,
    sched_setaffinity = 0x7a,
    sched_getaffinity = 0x7b,
    sched_yield = 0x7c,
    sched_get_priority_max = 0x7d,
    sched_get_priority_min = 0x7e,
    sched_rr_get_interval = 0x7f,
    restart_syscall = 0x80,
    kill = 0x81,
    tkill = 0x82,
    tgkill = 0x83,
    sigaltstack = 0x84,
    rt_sigsuspend = 0x85,
    rt_sigaction = 0x86,
    rt_sigprocmask = 0x87,
    rt_sigpending = 0x88,
    rt_sigtimedwait = 0x89,
    rt_sigqueueinfo = 0x8a,
    rt_sigreturn = 0x8b,
    setpriority = 0x8c,
    getpriority = 0x8d,
    reboot = 0x8e,
    setregid = 0x8f,
    setgid = 0x90,
    setreuid = 0x91,
    setuid = 0x92,
    setresuid = 0x93,
    getresuid = 0x94,
    setresgid = 0x95,
    getresgid = 0x96,
    setfsuid = 0x97,
    setfsgid = 0x98,
    times = 0x99,
    setpgid = 0x9a,
    getpgid = 0x9b,
    getsid = 0x9c,
    setsid = 0x9d,
    getgroups = 0x9e,
    setgroups = 0x9f,
    uname = 0xa0,
    sethostname = 0xa1,
    setdomainname = 0xa2,
    getrlimit = 0xa3,
    setrlimit = 0xa4,
    getrusage = 0xa5,
    umask = 0xa6,
    prctl = 0xa7,
    getcpu = 0xa8,
    gettimeofday = 0xa9,
    settimeofday = 0xaa,
    adjtimex = 0xab,
    getpid = 0xac,
    getppid = 0xad,
    getuid = 0xae,
    geteuid = 0xaf,
    getgid = 0xb0,
    getegid = 0xb1,
    gettid = 0xb2,
    sysinfo = 0xb3,
    mq_open = 0xb4,
    mq_unlink = 0xb5,
    mq_timedsend = 0xb6,
    mq_timedreceive = 0xb7,
    mq_notify = 0xb8,
    mq_getsetattr = 0xb9,
    msgget = 0xba,
    msgctl = 0xbb,
    msgrcv = 0xbc,
    msgsnd = 0xbd,
    semget = 0xbe,
    semctl = 0xbf,
    semtimedop = 0xc0,
    semop = 0xc1,
    shmget = 0xc2,
    shmctl = 0xc3,
    shmat = 0xc4,
    shmdt = 0xc5,
    socket = 0xc6,
    socketpair = 0xc7,
    bind = 0xc8,
    listen = 0xc9,
    accept = 0xca,
    connect = 0xcb,
    getsockname = 0xcc,
    getpeername = 0xcd,
    sendto = 0xce,
    recvfrom = 0xcf,
    setsockopt = 0xd0,
    getsockopt = 0xd1,
    shutdown = 0xd2,
    sendmsg = 0xd3,
    recvmsg = 0xd4,
    readahead = 0xd5,
    brk = 0xd6,
    munmap = 0xd7,
    mremap = 0xd8,
    add_key = 0xd9,
    request_key = 0xda,
    keyctl = 0xdb,
    clone = 0xdc,
    execve = 0xdd,
    mmap = 0xde,
    fadvise64 = 0xdf,
    swapon = 0xe0,
    swapoff = 0xe1,
    mprotect = 0xe2,
    msync = 0xe3,
    mlock = 0xe4,
    munlock = 0xe5,
    mlockall = 0xe6,
    munlockall = 0xe7,
    mincore = 0xe8,
    madvise = 0xe9,
    remap_file_pages = 0xea,
    mbind = 0xeb,
    get_mempolicy = 0xec,
    set_mempolicy = 0xed,
    migrate_pages = 0xee,
    move_pages = 0xef,
    rt_tgsigqueueinfo = 0xf0,
    perf_event_open = 0xf1,
    accept4 = 0xf2,
    recvmmsg = 0xf3,
    wait4 = 0x104,
    prlimit64 = 0x105,
    fanotify_init = 0x106,
    fanotify_mark = 0x107,
    name_to_handle_at = 0x108,
    open_by_handle_at = 0x109,
    clock_adjtime = 0x10a,
    syncfs = 0x10b,
    setns = 0x10c,
    sendmmsg = 0x10d,
    process_vm_readv = 0x10e,
    process_vm_writev = 0x10f,
    kcmp = 0x110,
    finit_module = 0x111,
    sched_setattr = 0x112,
    sched_getattr = 0x113,
    renameat2 = 0x114,
    seccomp = 0x115,
    getrandom = 0x116,
    memfd_create = 0x117,
    bpf = 0x118,
    execveat = 0x119,
    userfaultfd = 0x11a,
    membarrier = 0x11b,
    mlock2 = 0x11c,
    copy_file_range = 0x11d,
    preadv2 = 0x11e,
    pwritev2 = 0x11f,
    pkey_mprotect = 0x120,
    pkey_alloc = 0x121,
    pkey_free = 0x122,
    statx = 0x123,
};
