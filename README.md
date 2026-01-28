# Niri + Noctalia Shell Setup

This repository contains the configuration I personally use for a
**Niri Wayland compositor + Noctalia Shell** based Linux environment.

It is published as a **reference setup and source of inspiration**,
not as a universal, one-command desktop replacement.

This setup prioritizes:

* minimal, fast, keyboard-driven workflow
* Wayland-native stack
* TUI-first tools where possible
* no heavyweight desktop environment overhead
* stability for daily work

I actively use and maintain this configuration, but you are expected to **read, adapt, and understand it** before applying anything.

---

## Disclaimer

This setup is **hardware- and workflow-specific**.

It assumes:

* familiarity with Wayland
* comfort debugging broken sessions
* willingness to read config files before copying

Clone it. Study it. Steal ideas.
But don’t expect a turnkey desktop.

> **Note:** Output names, resolutions, and scaling are device-specific.
> You **must** adapt the `output` section in the Niri config for your hardware.

---

## Stack Overview

### Core

* **Compositor / WM**: niri
* **Shell UI**: noctalia-shell
* **Display Server**: Wayland
* **Login Manager**: SDDM

### Applications & Tools

* **Terminal**: kitty
* **Editor**: Neovim
* **Launcher**: fuzzel
* **File Manager**: yazi (TUI)
* **Browser**: Zen Browser
* **Notes**: Obsidian
* **Music**: Spotify
* **PDF Viewer**: zathura
* **Prompt**: starship
* **Shell**: zsh
* **Multiplexer**: tmux
* **System Monitor**: btop
* **Pomodoro**: pomoru

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

Primary setup is tuned for a high-DPI laptop display:

* Resolution: `2560x1600`
* Scale: `1.5`
* Refresh rate: `60 Hz`
* Variable Refresh Rate: enabled
* Layout gaps: `12px`

Additional outputs (e.g. HDMI) are supported but must be adjusted manually.

The configuration prioritizes **visual stability and battery life** over aggressive effects.

---

## Input & Interaction

* **Caps Lock remapped to Escape**
* Touchpad:

  * tap-to-click enabled
  * natural scrolling
  * two-finger scrolling
* Focus follows mouse, but **only for windows already fully on-screen**

The goal is fast keyboard navigation without accidental focus jumps.
Mouse input is supported, but never dominant.

---

## Window Management & Layout

* Column-based tiling with explicit width presets
* No focus ring; borders are used instead for clarity
* Floating windows are opt-in and intentional
* Overview mode enabled with a dimmed backdrop

Window rules include:

* Floating terminal instances
* Firefox Picture-in-Picture opens floating
* Zathura uses reduced opacity
* Obsidian opens maximized
* Explicit workaround for WezTerm initialization issues

These rules are tuned for **daily usability**, not experimentation.

---

## Keybindings (Important Ones)

| Keybind               | Action                   |
| --------------------- | ------------------------ |
| `Mod + Enter`         | Open terminal (kitty)    |
| `Mod + Shift + Enter` | Floating terminal        |
| `Mod + D`             | App launcher (fuzzel)    |
| `Mod + E`             | File manager (yazi)      |
| `Mod + B`             | Open browser (Zen)       |
| `Mod + O`             | Open Obsidian            |
| `Mod + Q`             | Close window             |
| `Mod + Shift + O`     | Overview                 |
| `Mod + 1–9`           | Focus workspace          |
| `Mod + Shift + 1–9`   | Move window to workspace |

Additional bindings include:

* Emoji picker
* Wallpaper switching via Noctalia IPC
* Session menu and screen lock via Noctalia
* Media, microphone, brightness, and volume keys
* Screenshot bindings (full / screen / window)
* Extensive column, window, and workspace manipulation

The configuration favors **flow and spatial memory** over rigid tiling.

---

## Startup & Shell Integration

* **Noctalia Shell** is spawned at startup via `qs`
* System actions (lock screen, wallpaper switching, session menu)
  are controlled through Noctalia IPC
* TUIs are launched inside **interactive shells**
  to ensure `$EDITOR` and `$VISUAL` are respected

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

Only **application and compositor configs** are included.
Personal shell files, secrets, and machine-specific scripts are intentionally excluded.

---

## Prerequisites

This setup assumes:

* **Arch Linux** (or Arch-based distro)
* Working **Wayland session**
* SDDM as display manager
* Proper GPU drivers for Wayland

### Required Packages

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

Selection is handled by Noctalia Shell.

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

* This system runs **without a traditional desktop environment**
* Functionality is composed from focused tools instead of monoliths
* Visual effects are restrained; clarity and predictability come first
* Keyboard-first does not mean keyboard-only — ergonomics matter

This setup is designed to **disappear while working**.
If you notice the desktop, something is wrong.

---

## Status

**Stable. Actively used.**

Changes will be incremental and intentional.
