# Niri + Noctalia Shell Setup

This repository contains the configuration I personally use for a
Niri Wayland compositor + Noctalia Shell based Linux environment.

It is published as a reference setup and source of inspiration,
not as a universal, one-command desktop replacement.

This setup prioritizes:

* minimal, fast, keyboard-driven workflow
* Wayland-native stack
* TUI-first tools where possible
* no heavyweight desktop environment overhead
* stability for daily work

I actively use and maintain this configuration, but you are expected to read, adapt, and understand it before applying anything.

---

## Disclaimer

This setup is hardware and workflow-specific.

It assumes:

* familiarity with Wayland
* comfort debugging broken sessions
* willingness to read config files before copying

Clone it. Study it. Steal ideas.
But don’t expect a turnkey desktop.

---

## Stack Overview

### Core

* **Compositor / WM**: niri
* **Shell UI**: noctalia-shell
* **Display Server**: Wayland
* **Login Manager**: SDDM

### Applications

* **Terminal**: kitty
* **Editor**: Neovim
* **Launcher**: fuzzel
* **File Manager**: yazi (TUI)
* **Browser**: Zen Browser
* **PDF Viewer**: zathura
* **Prompt**: starship
* **Shell**: zsh
* **Multiplexer**: tmux

### Audio / Media

* pipewire
* wireplumber
* playerctl
* wpctl

### Screenshot / Utilities

* grim
* slurp
* brightnessctl

---

## Display Configuration

* Resolution: `2560x1600`
* Scale: `1.5`
* Refresh rate: `60 Hz`
* Variable Refresh Rate: enabled
* Layout gaps: `16px`

Tuned for a high-DPI laptop display with an emphasis on
battery life and visual stability.

---

## Keybindings (Important Ones)

| Keybind             | Action                       |
| ------------------- | ---------------------------- |
| `Mod + Enter`       | Open terminal (kitty)        |
| `Mod + D`           | App launcher (fuzzel)        |
| `Mod + E`           | File manager (yazi in kitty) |
| `Mod + B`           | Open browser (Zen)           |
| `Mod + Q`           | Close window                 |
| `Mod + O`           | Overview                     |
| `Mod + 1–9`         | Switch workspace             |
| `Mod + Shift + 1–9` | Move window to workspace     |

Media keys and brightness keys are fully wired.

---

## Repository Structure

```text
niri-dots/
├── config/
│   ├── niri/        # niri compositor config
│   ├── noctalia/    # noctalia shell config
│   ├── kitty/       # kitty terminal config
│   ├── fuzzel/      # app launcher config
│   ├── nvim/        # Neovim config
│   ├── zathura/     # zathura PDF viewer config
│   └── starship.toml
├── sddm/
├── wallpapers/
└── README.md
```

Only application and compositor configs are included here.
Personal shell files, secrets, and machine-specific scripts are intentionally excluded.

---

## Prerequisites

This setup assumes:

* **Arch Linux** (or Arch-based distro)
* Working **Wayland session**
* SDDM as display manager
* Proper GPU drivers for Wayland

### Required Packages

Package names may vary by distro:

```bash
# Core
niri
noctalia-shell
kitty
fuzzel
neovim
tmux
zathura
zsh
starship
zen-browser
yazi
eza
sddm

# Media / system
pipewire
wireplumber
playerctl
brightnessctl

# Screenshots
grim
slurp
```

Ensure `pipewire` is active and audio works before proceeding.

---

## Manual Setup / Adapting the Configs

### 1. Clone the repository

```bash
git clone https://github.com/RanXom/niri-dots.git
```

### 2. Copy configs selectively

```bash
cp -r niri-dots/config/* ~/.config/
```

Review each directory before copying.
Do **not** blindly overwrite existing configs unless you know what you’re doing.

### 3. Wallpapers

```bash
mkdir -p ~/Pictures/Wallpapers
cp -r niri-dots/wallpapers/* ~/Pictures/Wallpapers/
```

Wallpapers are stored numerically (`1.png`, `2.jpg`, …)
to keep the setup compositor-agnostic.

Selection is handled by noctalia-shell.

---

## (Optional) SDDM Theme

If you use a custom SDDM theme:

```bash
sudo cp -r sddm/voidsddm /usr/share/sddm/themes/
```

Enable it via:

```bash
sudo nvim /etc/sddm.conf.d/theme.conf
```

```ini
[Theme]
Current=voidsddm
```

Restart SDDM or reboot.

---

## Notes & Philosophy

* TUIs are launched **inside kitty** using interactive shells
  to ensure `$EDITOR` and `$VISUAL` are respected.
* No compositor-level blur is used; transparency is handled at the application level.

This setup favors **clarity, predictability, and control**
over visual gimmicks.

---

## Status

**Stable. Actively used.**

Changes will be incremental and intentional.
