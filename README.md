# Moegi OS

Moegi OS is a custom Linux distribution project focused on a clean KDE Plasma desktop and a ready-to-use Japanese environment.

## Current goal

The first target is:

- Debian 13 (trixie)
- KDE Plasma 6
- Breeze Light
- Green accent color
- Japanese locale
- Japanese fonts
- Fcitx5 + Mozc
- Firefox ESR
- Flatpak + Flathub
- Calamares installer
- Moegi OS branding
- Custom Plasma panel layout

## Repository design

This repository is designed to support multiple Linux distributions in the future.

Planned targets include:

- Debian
- Arch Linux
- Fedora
- openSUSE
- Ubuntu
- Void Linux
- Alpine Linux
- NixOS

Development will start with Debian, while keeping the repository structure ready for additional distributions.

## Project structure

```text
moegios/
├── common/
├── editions/
├── distros/
│   ├── debian/
│   ├── arch/
│   ├── fedora/
│   ├── opensuse/
│   ├── ubuntu/
│   ├── void/
│   ├── alpine/
│   └── nixos/
├── scripts/
├── specs/
├── tests/
└── output/
