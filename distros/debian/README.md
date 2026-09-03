# Moegi OS Debian Edition

This directory contains the Debian-based implementation of Moegi OS.

## Base

- Debian 13 (trixie)
- amd64
- live-build
- KDE Plasma 6

## Build dependencies

Install the required packages on Debian:

```bash
sudo apt update

sudo apt install -y \
  live-build \
  debootstrap \
  squashfs-tools \
  xorriso \
  git \
  qemu-system-x86 \
  qemu-utils \
  ovmf
```

## Build

From the repository root:

```bash
sh scripts/build debian
```

The generated ISO should be copied to:

```text
output/Moegi-OS-Debian-amd64.iso
```

## Build flow

```text
scripts/build
    ↓
distros/debian/build.sh
    ↓
distros/debian/prepare.sh
    ↓
common assets are copied into live-build
    ↓
lb clean
    ↓
lb config
    ↓
lb build
    ↓
output/Moegi-OS-Debian-amd64.iso
```

## Notes

Debian-specific configuration should remain inside:

```text
distros/debian/
```

Shared branding, Plasma settings, package intentions, and other reusable configuration should remain inside:

```text
common/
```

The Debian Edition is the first reference implementation of Moegi OS.
