#!/bin/sh

set -eu

STATE_DIR="$HOME/.local/state/moegi-os"
DONE_FILE="$STATE_DIR/first-login.done"

# すでに初回設定済みなら何もしない
if [ -f "$DONE_FILE" ]; then
    exit 0
fi

mkdir -p "$STATE_DIR"

# XDGユーザーディレクトリを英語名にする
/usr/local/lib/moegi/setup-user-dirs.sh

# Dolphin Placesを英語名で設定
if [ -x /usr/local/lib/moegi/setup-dolphin-places.sh ]; then
    /usr/local/lib/moegi/setup-dolphin-places.sh
fi

# デスクトップショートカットを作成
if [ -x /usr/local/lib/moegi/setup-desktop-shortcuts.sh ]; then
    /usr/local/lib/moegi/setup-desktop-shortcuts.sh
fi

# 初回設定完了フラグ
touch "$DONE_FILE"
