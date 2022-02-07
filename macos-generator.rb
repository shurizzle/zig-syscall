#!/usr/bin/ruby

require 'uri'
require 'open-uri'
require 'fileutils'

URL = 'https://opensource.apple.com/source/xnu/xnu-7195.141.2/bsd/kern/syscalls.master'
TRAPS_URL = 'https://opensource.apple.com/source/xnu/xnu-4570.41.2/osfmk/kern/syscall_sw.c'

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

FileUtils.mkdir_p('src/consts')

File.open('src/consts/apple.zig', 'wb') do |f|
  f.print content
end
