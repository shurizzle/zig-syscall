#!/bin/sh

set -eu

fetch() {
  local ARCH="$1"

  curl -qLsS -X 'GET' \
    "https://api.syscall.sh/v1/syscalls/$ARCH" \
    -H 'accept: application/json'
}

format() {
  echo "pub const SYS = enum(usize) {"
  jq -r '.[] | select(.name | contains(" ") | not) | "    " + .name + " = " + .return + ","' | sed -e 's/ break / @"break" /g'
  echo "};"
}

generate_consts() {
  echo "Generating ${1} consts..."
  fetch "$2" | format > src/linux/"$1"/consts.zig
}


_generate_call() {
    local signature="pub inline fn syscall${1}(n: SYS"
    local i
    for i in `seq 1 $1`; do
      signature="${signature}, arg${i}: usize"
    done
    signature="${signature}) usize {"

    echo "$signature"
    echo "    return asm volatile (\"$2\""
    echo "        : [ret] \"={$4}\" (-> usize),"
    echo "        : [n] \"{$3}\" (n),"
    if (( $1 > 0 )); then
      echo "          [arg1] \"{$5}\" (arg1),"
    fi
    if (( $1 > 1 )); then
      echo "          [arg2] \"{$6}\" (arg2),"
    fi
    if (( $1 > 2 )); then
      echo "          [arg3] \"{$7}\" (arg3),"
    fi
    if (( $1 > 3 )); then
      echo "          [arg4] \"{$8}\" (arg4),"
    fi
    if (( $1 > 4 )); then
      echo "          [arg5] \"{$9}\" (arg5),"
    fi
    if (( $1 > 5 )); then
      echo "          [arg6] \"{${10}}\" (arg6),"
    fi
    echo "        : ${11}"
    echo "    );"
    echo "}"
}

_generate_calls() {
    local i
    echo "// NR: %${2} return: %${3} parameters: %${4}, %${5}, %${6}, %${7}, %${8}, %${9}"
    echo "const SYS = @import(\"./consts.zig\").SYS;"

    for i in `seq 0 6`; do
      echo
      _generate_call $i "$1" "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "${10}"
    done
}

generate_calls() {
  echo "Generating ${1} calls..."
  _generate_calls "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "${10}" "${11}" > src/linux/"$1"/calls.zig
}

generate() {
  mkdir -p src/linux/"$1"
  generate_consts "$1" "$2"
  generate_calls "$1" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "${10}" "${11}" "${12}"
}

mkdir -p src/linux

generate x86_64 x64 \
  syscall rax rax rdi rsi rdx r10 r8 r9 '"rcx", "r11", "memory"'
generate aarch64 arm64 \
  'svc #0' x8 x0 x0 x1 x2 x3 x4 x5 '"memory", "cc"'
generate i386 x86 \
  'int $0x80' eax eax ebx ecx edx esi edi ebp '"memory", "cc"'
generate arm arm \
  'svc #0' r7 r0 r0 r1 r2 r3 r4 r5 '"memory", "cc"'
