#!/bin/sh

set -eu

fetch() {
  local ARCH="$1"

  curl -qLsS -X 'GET' \
    "https://api.syscall.sh/v1/syscalls/$ARCH" \
    -H 'accept: application/json'
}

format() {
  jq -r '.[] | select(.name | contains(" ") | not) | "pub const SYS_" + .name + " = " + .return + ";"'
}

generate() {
  echo "Generating ${1}..."
  fetch "$2" | format > src/consts/linux/"$1".zig
}

mkdir -p src/consts/linux

generate x86_64 x64
generate aarch64 arm64
generate i386 x86
generate arm arm
