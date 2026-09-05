#!/bin/sh

set -eu

DESKTOP_DIR="$(xdg-user-dir DESKTOP 2>/dev/null || printf '%s\n' "$HOME/Desktop")"

mkdir -p "$DESKTOP_DIR"

# Trash
cat > "$DESKTOP_DIR/trash.desktop" <<'EOF'
[Desktop Entry]
Type=Link
Name=Trash
Icon=user-trash
URL=trash:/
EOF

# Firefox ESR / Firefox
if [ -f /usr/share/applications/firefox-esr.desktop ]; then
    cp /usr/share/applications/firefox-esr.desktop \
        "$DESKTOP_DIR/firefox-esr.desktop"
elif [ -f /usr/share/applications/firefox.desktop ]; then
    cp /usr/share/applications/firefox.desktop \
        "$DESKTOP_DIR/firefox.desktop"
fi

# Install Moegi OS
if [ -f /usr/share/applications/install-moegi-os.desktop ]; then
    cp /usr/share/applications/install-moegi-os.desktop \
        "$DESKTOP_DIR/install-moegi-os.desktop"
fi

chmod +x "$DESKTOP_DIR"/*.desktop 2>/dev/null || true
