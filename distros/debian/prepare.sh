#!/bin/sh

set -eu

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
ROOT_DIR="$(CDPATH= cd -- "$SCRIPT_DIR/../.." && pwd)"
LIVE_DIR="$SCRIPT_DIR/live-build"

INCLUDES_DIR="$LIVE_DIR/config/includes.chroot"

# Moegi OS common branding assets
install -d \
    "$INCLUDES_DIR/usr/share/moegi-os/branding"

if [ -f "$ROOT_DIR/common/branding/moegi-os-logo.png" ]; then
    install -m 0644 \
        "$ROOT_DIR/common/branding/moegi-os-logo.png" \
        "$INCLUDES_DIR/usr/share/moegi-os/branding/moegi-os-logo.png"
fi

if [ -f "$ROOT_DIR/common/branding/wallpaper.png" ]; then
    install -d \
        "$INCLUDES_DIR/usr/share/backgrounds/moegi-os"

    install -m 0644 \
        "$ROOT_DIR/common/branding/wallpaper.png" \
        "$INCLUDES_DIR/usr/share/backgrounds/moegi-os/wallpaper.png"
fi
