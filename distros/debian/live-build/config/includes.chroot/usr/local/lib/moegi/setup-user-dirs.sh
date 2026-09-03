#!/bin/sh

set -eu

# XDG user directoriesを英語名で生成
LC_ALL=C xdg-user-dirs-update --force

# 旧日本語ディレクトリが空なら削除
for dir in \
    "$HOME/デスクトップ" \
    "$HOME/ダウンロード" \
    "$HOME/ドキュメント" \
    "$HOME/画像" \
    "$HOME/ビデオ" \
    "$HOME/音楽" \
    "$HOME/テンプレート" \
    "$HOME/公開"
do
    if [ -d "$dir" ]; then
        rmdir "$dir" 2>/dev/null || true
    fi
done
