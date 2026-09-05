#!/bin/sh

set -eu

TEMPLATE="/usr/share/moegi-os/templates/user-places.xbel"
DEST_DIR="$HOME/.local/share"
DEST="$DEST_DIR/user-places.xbel"

if [ ! -f "$TEMPLATE" ]; then
    exit 0
fi

mkdir -p "$DEST_DIR"

USER_NAME="$(id -un)"

sed "s|@USER@|$USER_NAME|g" \
    "$TEMPLATE" \
    > "$DEST"
