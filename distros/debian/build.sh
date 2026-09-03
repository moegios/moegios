#!/bin/sh

set -eu

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
ROOT_DIR="$(CDPATH= cd -- "$SCRIPT_DIR/../.." && pwd)"
LIVE_DIR="$SCRIPT_DIR/live-build"

cd "$LIVE_DIR"

# 以前のビルド生成物を削除
sudo lb clean --purge

# live-build 設定を生成
sudo lb config

# ISOをビルド
sudo lb build

# 出力先を用意
mkdir -p "$ROOT_DIR/output"

# 生成されたISOを output/ へコピー
ISO_FILE="$(find . -maxdepth 1 -type f -name '*.iso' | head -n 1)"

if [ -z "$ISO_FILE" ]; then
    echo "Error: ISO image was not generated." >&2
    exit 1
fi

cp "$ISO_FILE" \
    "$ROOT_DIR/output/Moegi-OS-Debian-amd64.iso"

echo
echo "Build completed:"
echo "$ROOT_DIR/output/Moegi-OS-Debian-amd64.iso"
