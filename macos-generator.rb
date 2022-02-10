#!/usr/bin/ruby

require 'uri'
require 'open-uri'
require 'fileutils'

URL = 'https://opensource.apple.com/source/xnu/xnu-7195.141.2/bsd/kern/syscalls.master'
TRAPS_URL = 'https://opensource.apple.com/source/xnu/xnu-4570.41.2/osfmk/kern/syscall_sw.c'

puts "Generating consts..."

content = "// BSD's syscalls\n"
URI.open(URL) do |f|
  f.each_line do |line|
    if line =~ /^(\d+)\s+[a-zA-Z0-9_]+\s+\w+\s+\{\s*[a-zA-Z0-9_]+\s*([a-zA-Z0-9_]+)\s*\(.*?\)\s*(?:NO_SYSCALL_STUB\s*)?;\s*\}.*$/
      nr, name = $1, $2
      name.sub!(/^sys_/, '')
      nr = nr.to_i
      nr |= 0x2000000
      if name !~ /^e?nosys/
        content << "pub const SYS_#{name} = 0x#{nr.to_s(16)};\n"
      end
    end
  end
end

content << "\n// Mach traps\n"
URI.open(TRAPS_URL) {|f| f.read } =~ /mach_syscall_name_table.+?{(.+?)}/m
array = $1

array.gsub!(/\/\*.*?\*\//, '')

eval "array = [#{array}]"

array.each_with_index do |name, nr|
  if name != 'kern_invalid'
    nr |= 0x1000000
    content << "pub const SYS_#{name} = 0x#{nr.to_s(16)};\n"
  end
end

FileUtils.mkdir_p('src/apple')

File.open('src/apple/consts.zig', 'wb') do |f|
  f.print content
end

def generate_call(argno, inst, nr, ret, arg1, arg2, arg3, arg4, arg5, arg6, clobber_regs)
  content = "pub inline fn syscall#{argno}(n: usize"
  (1..argno).each do |i|
    content << ", arg#{i}: usize"
  end
  content << ") usize {\n"
  content << "    return asm volatile (\"#{inst}\"\n"
  content << "        : [ret] \"={#{ret}}\" (-> usize),\n"
  content << "        : [n] \"{#{nr}}\" (n),\n"
  content << "          [arg1] \"{#{arg1}}\" (arg1),\n" if argno > 0
  content << "          [arg2] \"{#{arg2}}\" (arg2),\n" if argno > 1
  content << "          [arg3] \"{#{arg3}}\" (arg3),\n" if argno > 2
  content << "          [arg4] \"{#{arg4}}\" (arg4),\n" if argno > 3
  content << "          [arg5] \"{#{arg5}}\" (arg5),\n" if argno > 4
  content << "          [arg6] \"{#{arg6}}\" (arg6),\n" if argno > 5
  content << "        : #{clobber_regs}\n"
  content << "    );\n"
  content << "}\n"

  content
end

def generate_calls(arch, inst, nr, ret, arg1, arg2, arg3, arg4, arg5, arg6, clobber_regs)
  puts "Generating #{arch} calls..."

  content = "// NR: %#{nr} return: %#{ret} parameters: %#{arg1}, %#{arg2}, %#{arg3}, %#{arg4}, %#{arg5}, %#{arg6}\n"
  (0..6).each do |i|
    content << "\n"
    content << generate_call(i, inst, nr, ret, arg1, arg2, arg3, arg4, arg5, arg6, clobber_regs)
  end

  File.open("src/apple/#{arch}/calls.zig", 'wb') do |f|
    f.print content
  end
end

generate_calls 'x86_64', 'syscall', 'rax', 'rax', 'rdi', 'rsi', 'rdx', 'r10', 'r8', 'r9', '"rcx", "r11", "memory"'
generate_calls 'aarch64', 'svc 0x80', 'x8', 'x0', 'x0', 'x1', 'x2', 'x3', 'x4', 'x5', '"memory", "cc"'
