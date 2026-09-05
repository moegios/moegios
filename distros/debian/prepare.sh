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

# Plasma defaults
PLASMA_DEFAULTS="$ROOT_DIR/common/plasma/plasma6/defaults"

install -d \
    "$INCLUDES_DIR/etc/skel/.config"

for file in \
    kdeglobals \
    kwinrc \
    kcminputrc \
    plasmashellrc \
    plasma-org.kde.plasma.desktop-appletsrc
do
    if [ -f "$PLASMA_DEFAULTS/$file" ]; then
        install -m 0644 \
            "$PLASMA_DEFAULTS/$file" \
            "$INCLUDES_DIR/etc/skel/.config/$file"
    fi
done

# Fcitx5 defaults
FCITX_DEFAULTS="$ROOT_DIR/common/input/fcitx5"

install -d \
    "$INCLUDES_DIR/etc/skel/.config/fcitx5"

for file in config profile
do
    if [ -f "$FCITX_DEFAULTS/$file" ]; then
        install -m 0644 \
            "$FCITX_DEFAULTS/$file" \
            "$INCLUDES_DIR/etc/skel/.config/fcitx5/$file"
    fi
done

# Dolphin Places template
DOLPHIN_TEMPLATE="$ROOT_DIR/common/plasma/plasma6/defaults/user-places.xbel"

if [ -f "$DOLPHIN_TEMPLATE" ]; then
    install -d \
        "$INCLUDES_DIR/usr/share/moegi-os/templates"

    install -m 0644 \
        "$DOLPHIN_TEMPLATE" \
        "$INCLUDES_DIR/usr/share/moegi-os/templates/user-places.xbel"
fi
