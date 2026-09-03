#!/bin/sh

set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)"
ISO="$ROOT_DIR/output/Moegi-OS-Debian-amd64.iso"

if [ ! -f "$ISO" ]; then
    echo "Error: ISO not found:" >&2
    echo "$ISO" >&2
    echo >&2
    echo "Build it first with:" >&2
    echo "  sh scripts/build debian" >&2
    exit 1
fi

exec qemu-system-x86_64 \
    -enable-kvm \
    -m 4096 \
    -smp 4 \
    -cdrom "$ISO" \
    -boot d
