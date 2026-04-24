<div align="center">

# 🎨 itachi_re's Dotfiles

### *A minimalist, KDE-focused openSUSE configuration managed with GNU Stow*

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Shell: zsh](https://img.shields.io/badge/Shell-zsh-1f425f.svg)](https://www.zsh.org/)
[![Distribution: openSUSE](https://img.shields.io/badge/Distribution-openSUSE-73BA25?logo=opensuse)](https://www.opensuse.org/)
[![Prompt: Starship](https://img.shields.io/badge/Prompt-Starship-DD0B78)](https://starship.rs/)
[![Manager: GNU Stow](https://img.shields.io/badge/Manager-GNU%20Stow-blue)](https://www.gnu.org/software/stow/)

*Sleek, performant, and endlessly customizable*

[Features](#-features) • [Installation](#-installation) • [Configuration](#-configuration-guide) • [Dependencies](#-dependencies)

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Desktop Environment](#-desktop-environment)
- [File Structure](#-file-structure)
- [Installation](#-installation)
- [Configuration Guide](#-configuration-guide)
- [Dependencies](#-dependencies)
- [Customization](#-customization)
- [Troubleshooting](#-troubleshooting)
- [Contributing](#-contributing)
- [Acknowledgments](#-acknowledgments)
- [License](#-license)

---

## 🌟 Overview

Welcome to my personal dotfiles repository! This is a carefully curated collection of configuration files for a **KDE Plasma** desktop on **openSUSE**, managed with **GNU Stow** for clean, symlink-based deployment. These configs prioritize **performance**, **visual consistency**, and **developer productivity**.

Each top-level directory is a Stow package — run `stow <package>` to symlink its contents into `$HOME`.

---

## ✨ Features

<table>
<tr>
<td>

### 🐚 **Shell Experience**
- **Zsh** as primary shell with bash fallback (`profile/`)
- **Starship** prompt — fast, context-aware, Rust-powered
- **Smart Aliases** for everyday productivity
- **Zsh Syntax Highlighting** — color-coded commands
- **Zsh Autosuggestions** — fish-like completions

</td>
<td>

### 🎨 **Visual Consistency**
- **Pywal** (`wal/`) — dynamic, wallpaper-synced color schemes
- **GTK 3 & 4** themes unified via `gtk/`
- **KDE Plasma** theming via `kde/`
- **Panel Colorizer** plasmoid config included
- **Nerd Font** glyphs throughout

</td>
</tr>
<tr>
<td>

### 🛠️ **Development Ready**
- **Neovim** full config (`nvim/`)
- **Vim** fallback config (`vim/`)
- **Emacs** config (`emacs/`)
- **Git** identity and aliases (`git/`)
- **tmux** session management (`tmux/`)

</td>
<td>

### ⚡ **Multimedia & System**
- **MPV** — lightweight video player (`mpv/`)
- **Haruna** — KDE video player frontend (`haruna/`)
- **Audacious** — music player (`audacious/`)
- **CAVA** — terminal audio visualizer (`cava/`)
- **EasyEffects** — audio processing pipeline (`easyeffects/`)
- **OBS Studio** — streaming/recording (`obs/`)

</td>
</tr>
</table>

---

## 🖥️ Desktop Environment

<div align="center">

| Component | Choice | Description |
|:---------:|:------:|:------------|
| 🖥️ **Desktop** | `KDE Plasma` | Full-featured, highly customizable DE |
| 🎨 **GTK Theme** | `Breeze-Dark` | KDE's polished dark theme |
| 🎯 **Icon Theme** | `Papirus-Dark` | Modern, consistent icon set |
| 🖱️ **Cursor Theme** | `Dracula-cursors` | Sleek purple-accented cursors |
| 🔤 **Font** | `FiraCode Nerd Font Mono` | Ligature-enabled coding font |
| 💻 **Shell** | `zsh` (with `bash` fallback) | Best of both worlds |
| 🚀 **Prompt** | `Starship` | Cross-shell, written in Rust |
| 🖼️ **Wallpaper** | `ayanami_rei.jpg` | Applied via `feh` or KDE wallpaper settings |
| 📦 **Dotfiles Mgr** | `GNU Stow` | Symlink-based, zero extra tooling |
| 🎵 **Music Tracking** | `Last.fm` | Scrobbling as `itachi_re` |
| 🌈 **Color Theming** | `Pywal` | Generates schemes from wallpaper |
| 🎛️ **Audio FX** | `EasyEffects` | System-wide audio processing |

</div>

---

## 📁 File Structure

Each directory is a **GNU Stow package**. Running `stow <dir>` from `~/.dotfiles` symlinks its contents into `$HOME`.

```
~/.dotfiles/
├── alacritty/          # Alacritty terminal emulator
├── audacious/          # Audacious music player
├── bash/               # Bash shell configuration
├── cava/               # CAVA terminal audio visualizer
├── easyeffects/        # EasyEffects audio processing
├── emacs/              # Emacs editor configuration
├── fastfetch/          # Fastfetch system info
├── ghostty/            # Ghostty terminal emulator
├── git/                # Git config & aliases
├── gtk/                # GTK 3 & 4 theming
│   └── .config/
│       ├── gtk-3.0/gtk.css
│       └── gtk-4.0/gtk.css
├── haruna/             # Haruna video player
├── kate/               # Kate text editor
├── kde/                # KDE Plasma configuration
├── konsole/            # Konsole terminal profiles
├── misc/               # Miscellaneous configs
├── mpv/                # MPV media player
├── neofetch/           # Neofetch system info
├── nvim/               # Neovim (primary editor)
├── obs/                # OBS Studio
├── panel-colorizer/    # KDE Panel Colorizer plasmoid
├── profile/            # Shell profile / env vars
├── qbittorrent/        # qBittorrent
├── starship/           # Starship prompt (starship.toml)
├── tmux/               # tmux multiplexer
├── vim/                # Vim fallback config
├── wal/                # Pywal color scheme templates
├── xsettingsd/         # X settings daemon (GTK/cursor in X11)
├── zsh/                # Zsh configuration
├── install.sh          # Automated install script
├── .stowrc             # Default stow target ($HOME)
├── .stow-global-ignore # Files always ignored by Stow
├── .stow-local-ignore  # Per-repo ignored files
└── LICENSE.md
```

---

## 🚀 Installation

### Prerequisites

- **openSUSE** (Tumbleweed recommended — most packages current)
- `git`, `stow` installed

```bash
sudo zypper install git stow
```

### Automated Installation (Recommended)

```bash
# Clone the repository
git clone https://github.com/itachi_re/dotfiles.git ~/.dotfiles

# Navigate and run installer
cd ~/.dotfiles
chmod +x install.sh
./install.sh
```

### Manual Installation with Stow

```bash
# Clone the repository
git clone https://github.com/itachi_re/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Stow individual packages
stow zsh bash starship git nvim tmux

# Or stow everything at once (use with care — may conflict with existing configs)
stow */

# Reload shell
exec zsh
```

> **Tip:** Use `stow --simulate <package>` to do a dry run and preview symlinks before applying.

### Backup First

```bash
mkdir -p ~/dotfiles-backup
# Copy any existing configs you want to preserve before stowing
cp ~/.zshrc ~/.bashrc ~/dotfiles-backup/ 2>/dev/null
```

---

## ⚙️ Configuration Guide

### 🐚 Shell

#### Zsh (`zsh/`)

```bash
# Starship prompt init
eval "$(starship init zsh)"

# Aliases
alias update='sudo zypper refresh && sudo zypper dup'
alias gs720='gamescope -f -w 1280 -h 720 --'
alias fuck='sudo $(fc -ln -1)'
alias ll='ls -lah'
alias ..='cd ..'

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Android SDK
export ANDROID_HOME=/data/itachi/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
```

#### Bash fallback (`bash/`)

```bash
# System info on open
neofetch

# Android SDK paths
export ANDROID_HOME=/data/itachi/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

eval "$(starship init bash)"
```

### 🚀 Starship Prompt (`starship/`)

`~/.config/starship.toml`:

```toml
[character]
success_symbol = "[➜](bold green)"
error_symbol = "[✗](bold red)"

[directory]
truncation_length = 3
truncate_to_repo = true
```

### 🛠️ Neovim (`nvim/`)

Full config lives in `nvim/.config/nvim/`. Plugins managed via your preferred plugin manager (lazy.nvim, etc.). Edit `nvim/.config/nvim/init.lua` to customize.

### 🎛️ Git (`git/`)

```ini
[user]
    name = itachi_re
    email = xanbenson99@gmail.com

[core]
    editor = nvim

[alias]
    st = status
    co = checkout
    br = branch
    ci = commit
    lg = log --oneline --graph --decorate
```

### 🌈 Pywal (`wal/`)

Pywal generates a color scheme from your wallpaper and applies it across terminals, GTK apps, and any template you define in `wal/`.

```bash
# Generate scheme from wallpaper
wal -i ~/Pictures/ayanami_rei.jpg

# Reapply on login (add to .zshrc or autostart)
wal -R
```

### 🎛️ EasyEffects (`easyeffects/`)

Presets stored in `easyeffects/.config/easyeffects/`. Import them from within the EasyEffects GUI.

### 🖥️ OBS Studio (`obs/`)

Global and user settings live in `obs/.config/obs-studio/`. Note that `profiler_data/` is gitignored (untracked) to avoid committing large session files.

---

## 📦 Dependencies

### Core (Required)

```bash
sudo zypper install -y \
    zsh starship neofetch fastfetch \
    vim git stow curl wget tmux feh
```

### Terminals

```bash
sudo zypper install -y alacritty ghostty konsole
```

> **Ghostty** may need to be installed from a community repo or built from source on openSUSE.

### Editors

```bash
sudo zypper install -y neovim emacs kate
```

### Multimedia

```bash
sudo zypper install -y mpv haruna audacious cava easyeffects obs-studio
```

### Theming

```bash
# Papirus icons
sudo zypper install papirus-icon-theme

# Pywal
pip install pywal --break-system-packages

# FiraCode Nerd Font
mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
unzip FiraCode.zip && fc-cache -fv

# Dracula cursor theme
git clone https://github.com/dracula/gtk.git /tmp/dracula-gtk
sudo cp -r /tmp/dracula-gtk/kde/cursors/Dracula-cursors /usr/share/icons/
```

### Zsh Plugins

```bash
# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### Development Tools (Optional)

```bash
# Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Android SDK — download from https://developer.android.com/studio
# Extract to /data/itachi/android-sdk and paths will resolve automatically
```

---

## 🎨 Customization

### Adding a New Package

```bash
# Create a new stow package directory mirroring $HOME structure
mkdir -p ~/.dotfiles/myapp/.config/myapp
# Add config files inside it, then:
cd ~/.dotfiles
stow myapp
```

### Changing the Wallpaper + Resync Colors

```bash
# Set a new wallpaper and regenerate Pywal scheme
wal -i /path/to/wallpaper.jpg

# Apply new colors to all running terminals
wal -R
```

### Modifying Aliases

Edit `zsh/.zshrc` (or `bash/.bashrc`), then reload:

```bash
source ~/.zshrc
```

---

## 🐛 Troubleshooting

### Stow conflicts on install

```bash
# Find what's conflicting
stow --simulate <package>

# If an existing file blocks a symlink, back it up and retry
mv ~/.zshrc ~/.zshrc.bak
stow zsh
```

### Zsh plugins not working

```bash
# Verify plugin paths are sourced in zsh/.zshrc
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
```

### Starship glyphs missing / broken

```bash
# Ensure FiraCode Nerd Font (or another Nerd Font) is set in your terminal
# Verify starship is installed
starship --version
```

### Pywal colors not applying on login

```bash
# Add to .zshrc or .profile
(cat ~/.cache/wal/sequences &)
wal -R -q
```

### OBS profiler_data showing as untracked

This directory is auto-created by OBS and should stay gitignored. Add it to `.gitignore` if not already:

```bash
echo "obs/.config/obs-studio/profiler_data/" >> ~/.dotfiles/.gitignore
```

### Android SDK not detected

```bash
echo $ANDROID_HOME               # Should print /data/itachi/android-sdk
ls /data/itachi/android-sdk      # Verify SDK is there
```

---

## 🤝 Contributing

1. **Fork** this repository
2. Create a **feature branch**: `git checkout -b feature/AmazingFeature`
3. **Commit** changes: `git commit -m 'Add AmazingFeature'`
4. **Push**: `git push origin feature/AmazingFeature`
5. Open a **Pull Request**

### Guidelines

- Follow the existing Stow package structure (mirror `$HOME` paths inside each package dir)
- Test with `stow --simulate` before submitting
- Keep configs distro-agnostic where possible; note openSUSE-specific parts clearly
- Document new packages in this README

---

## 🙏 Acknowledgments

- [GNU Stow](https://www.gnu.org/software/stow/) — symlink dotfiles manager
- [Starship](https://starship.rs/) — the cross-shell prompt
- [Pywal](https://github.com/dylanaraps/pywal) — dynamic color scheme generation
- [Dracula Theme](https://draculatheme.com/) — color scheme inspiration
- [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) — icon theme
- [Nerd Fonts](https://www.nerdfonts.com/) — iconic font patches
- The openSUSE and KDE communities

---

## 📄 License

Licensed under the **MIT License** — see [LICENSE.md](LICENSE.md) for details.

---

## 👤 About

<div align="center">

### itachi_re

*Linux enthusiast • Open-source advocate • Gamer*

[![GitHub](https://img.shields.io/badge/GitHub-itachi_re-181717?logo=github)](https://github.com/itachi_re)
[![Last.fm](https://img.shields.io/badge/Last.fm-itachi__re-D51007?logo=last.fm)](https://www.last.fm/user/itachi_re)

**Interests:** Linux ricing • KDE Plasma • Neovim • Gaming on Linux (Proton / Gamescope / Wine) • Audio tinkering • Anime

</div>

---

<div align="center">

### ⭐ Star this repo if you find it useful!

**Made with ❤️ and lots of ☕**

*Last updated: April 2026*

</div>
