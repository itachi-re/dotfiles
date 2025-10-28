<div align="center">

# 🎨 itachi_re's Dotfiles

### *A minimalist, developer-focused Linux configuration*

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Shell: zsh](https://img.shields.io/badge/Shell-zsh-1f425f.svg)](https://www.zsh.org/)
[![Distribution: SUSE](https://img.shields.io/badge/Distribution-SUSE-73BA25?logo=suse)](https://www.suse.com/)
[![Starship: Enabled](https://img.shields.io/badge/Prompt-Starship-DD0B78)](https://starship.rs/)

![Dotfiles Preview](https://via.placeholder.com/1200x600/1a1b26/ffffff?text=🖥️+Add+Your+Desktop+Screenshot+Here) 

*Sleek, performant, and endlessly customizable*

[Features](#-features) • [Installation](#-installation) • [Configuration](#-configuration-guide) • [Screenshots](#-screenshots)

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Desktop Environment](#-desktop-environment)
- [File Structure](#-file-structure)
- [Installation](#-installation)
- [Configuration Guide](#-configuration-guide)
- [Usage Examples](#-usage-examples)
- [Dependencies](#-dependencies)
- [Customization](#-customization)
- [Troubleshooting](#-troubleshooting)
- [Contributing](#-contributing)
- [Acknowledgments](#-acknowledgments)
- [License](#-license)

---

## 🌟 Overview

Welcome to my personal dotfiles repository! This is a carefully curated collection of configuration files designed for a SUSE-based Linux environment. These configs prioritize **performance**, **aesthetics**, and **developer productivity**.

Whether you're a fellow SUSE user looking for inspiration or someone wanting to adopt these configurations, this repository provides everything you need to replicate my setup.

---

## ✨ Features

<table>
<tr>
<td>

### 🐚 **Shell Experience**
- **Dual Shell Support**: Optimized `zsh` and `bash` configs
- **Starship Prompt**: Blazing-fast, context-aware prompt
- **Smart Aliases**: Productivity shortcuts for common tasks
- **Syntax Highlighting**: Color-coded command syntax
- **Auto-suggestions**: Fish-like command completions

</td>
<td>

### 🎨 **Visual Consistency**
- **Dark Theme**: Unified dark aesthetic across all apps
- **Pywal Integration**: Dynamic color scheme generation
- **Nerd Font Icons**: Beautiful terminal glyphs
- **Dracula Cursors**: Elegant cursor theme
- **Custom Wallpaper**: Anime-inspired desktop background

</td>
</tr>
<tr>
<td>

### 🛠️ **Development Ready**
- **Vim Configuration**: Optimized for coding
- **Git Integration**: Pre-configured identity and aliases
- **Node.js Setup**: NVM for version management
- **Android SDK**: Full development environment
- **Gamescope Support**: Gaming on Linux made easy

</td>
<td>

### ⚡ **Performance**
- **Minimal Bloat**: Only essential configurations
- **Fast Startup**: Optimized shell initialization
- **Resource Efficient**: Light on system resources
- **Quick Updates**: One-command system upgrades
- **System Monitoring**: Neofetch/Fastfetch integration

</td>
</tr>
</table>

---

## 🖥️ Desktop Environment

<div align="center">

| Component | Choice | Description |
|:---------:|:------:|:------------|
| 🎨 **GTK Theme** | `Breeze-Dark` | KDE's elegant dark theme |
| 🎯 **Icon Theme** | `Papirus-Dark` | Modern, consistent iconography |
| 🖱️ **Cursor Theme** | `Dracula-cursors` | Sleek purple-accented cursors |
| 🔤 **Font** | `FiraCode Nerd Font Mono` | Ligature-enabled coding font |
| 💻 **Shell** | `zsh` with `bash` fallback | Best of both worlds |
| 🚀 **Prompt** | `Starship` | Cross-shell prompt written in Rust |
| 🖼️ **Wallpaper** | `ayanami_rei.jpg` | Set via `feh` wallpaper setter |
| 🎵 **Music Tracking** | `Last.fm` | Scrobbling with user `itachi_re` |

</div>

---

## 📁 File Structure

```
dotfiles/
├── .zshrc                 # Zsh shell configuration
├── .bashrc                # Bash shell configuration
├── .vimrc                 # Vim editor settings
├── .gitconfig             # Git user configuration
├── .config/
│   └── starship.toml      # Starship prompt config (optional)
├── wallpapers/
│   └── ayanami_rei.jpg    # Desktop wallpaper
├── scripts/
│   ├── install.sh         # Automated installation script
│   └── backup.sh          # Backup existing dotfiles
├── README.md              # This file
└── LICENSE                # MIT License
```

---

## 🚀 Installation

### Prerequisites

Ensure you're running **SUSE Linux** (openSUSE Leap, Tumbleweed, or SLES). Other distributions may require package name adjustments.

### Automated Installation (Recommended)

```bash
# Clone the repository
git clone https://github.com/itachi_re/dotfiles.git ~/.dotfiles

# Navigate to the directory
cd ~/.dotfiles

# Make install script executable
chmod +x scripts/install.sh

# Run the installer
./scripts/install.sh
```

### Manual Installation

```bash
# 1. Backup existing configurations
mkdir -p ~/dotfiles-backup
cp ~/.zshrc ~/.bashrc ~/.vimrc ~/.gitconfig ~/dotfiles-backup/ 2>/dev/null

# 2. Clone repository
git clone https://github.com/itachi_re/dotfiles.git ~/.dotfiles

# 3. Create symbolic links
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig

# 4. Set wallpaper (requires feh)
feh --bg-scale ~/.dotfiles/wallpapers/ayanami_rei.jpg

# 5. Reload shell
exec zsh  # or: exec bash
```

---

## ⚙️ Configuration Guide

### 🐚 Shell Configurations

#### `.zshrc` Highlights

```bash
# Starship prompt
eval "$(starship init zsh)"

# Essential aliases
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

#### `.bashrc` Highlights

```bash
# Show system info on terminal open
neofetch

# Android development
export ANDROID_HOME=/data/itachi/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Starship prompt for bash
eval "$(starship init bash)"
```

### 🛠️ Development Tools

#### Vim Configuration (`.vimrc`)

```vim
syntax on                  " Enable syntax highlighting
set number relativenumber  " Hybrid line numbering
set tabstop=4             " 4 spaces per tab
set shiftwidth=4          " 4 spaces for indentation
set expandtab             " Use spaces instead of tabs
set cursorline            " Highlight current line
set autoindent            " Auto-indent new lines
set mouse=a               " Enable mouse support
```

#### Git Configuration (`.gitconfig`)

```ini
[user]
    name = itachi_re
    email = xanbenson99@gmail.com

[core]
    editor = vim

[alias]
    st = status
    co = checkout
    br = branch
    ci = commit
    lg = log --oneline --graph --decorate
```

---

## 💡 Usage Examples

### System Maintenance

```bash
# Update entire system
update

# Check system information
neofetch  # or fastfetch

# View disk usage
df -h
```

### Development Workflow

```bash
# Switch Node.js versions
nvm use 18

# Quick git workflow
git st              # Check status
git add .
git ci -m "Update"  # Commit
git lg              # View log
```

### Gaming

```bash
# Launch game at 720p with gamescope
gs720 steam

# Forgot sudo? Fix it!
zypper install package  # Command fails
fuck                    # Re-runs with sudo
```

---

## 📦 Dependencies

### Core Packages (Required)

```bash
sudo zypper install -y \
    zsh \
    starship \
    neofetch \
    fastfetch \
    vim \
    git \
    feh \
    curl \
    wget
```

### Zsh Plugins

```bash
# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Auto-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### Fonts & Themes

```bash
# Install FiraCode Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
unzip FiraCode.zip
fc-cache -fv

# Install Papirus icon theme
sudo zypper install papirus-icon-theme

# Install Dracula cursor theme
git clone https://github.com/dracula/gtk.git /tmp/dracula-gtk
sudo cp -r /tmp/dracula-gtk/kde/cursors/Dracula-cursors /usr/share/icons/
```

### Development Tools (Optional)

```bash
# Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Android SDK (manual setup required)
# Download from: https://developer.android.com/studio
```

---

## 🎨 Customization

### Changing the Wallpaper

```bash
# Replace wallpaper file
cp /path/to/your/wallpaper.jpg ~/.dotfiles/wallpapers/ayanami_rei.jpg

# Apply immediately
feh --bg-scale ~/.dotfiles/wallpapers/ayanami_rei.jpg
```

### Modifying Aliases

Edit `~/.zshrc` or `~/.bashrc` and add your custom aliases:

```bash
alias myalias='your_command_here'
```

Then reload:
```bash
source ~/.zshrc  # or source ~/.bashrc
```

### Starship Prompt Customization

Create `~/.config/starship.toml`:

```toml
[character]
success_symbol = "[➜](bold green)"
error_symbol = "[✗](bold red)"

[directory]
truncation_length = 3
truncate_to_repo = true
```

---

## 🐛 Troubleshooting

### Zsh plugins not working

```bash
# Ensure plugins are sourced in .zshrc
source /path/to/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /path/to/zsh-autosuggestions/zsh-autosuggestions.zsh
```

### Starship not displaying correctly

```bash
# Install a Nerd Font and set it in your terminal emulator
# Verify starship is installed
starship --version
```

### Android SDK not detected

```bash
# Verify path in .zshrc/.bashrc
echo $ANDROID_HOME

# Ensure SDK is at specified location
ls /data/itachi/android-sdk
```

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to:

1. **Fork** this repository
2. Create a **feature branch**: `git checkout -b feature/AmazingFeature`
3. **Commit** your changes: `git commit -m 'Add some AmazingFeature'`
4. **Push** to the branch: `git push origin feature/AmazingFeature`
5. Open a **Pull Request**

### Contribution Guidelines

- Keep configurations distro-agnostic when possible
- Test changes on a clean system before submitting
- Document new features in the README
- Follow existing code style and structure

---

## 📸 Screenshots

<div align="center">

### Terminal with Starship Prompt
![Terminal](https://via.placeholder.com/800x400/1a1b26/ffffff?text=Terminal+Screenshot)

### nvim Setup
![Vim](https://via.placeholder.com/800x400/1a1b26/ffffff?text=Vim+Screenshot)

### Desktop Environment
![Desktop](https://via.placeholder.com/800x400/1a1b26/ffffff?text=Full+Desktop+Screenshot)

</div>

---

## 🙏 Acknowledgments

- [Starship](https://starship.rs/) - The cross-shell prompt
- [Dracula Theme](https://draculatheme.com/) - Color scheme inspiration
- [Papirus](https://github.com/PapirusDevelopmentTeam) - Icon theme
- [Nerd Fonts](https://www.nerdfonts.com/) - Iconic font patches
- The open-source community for endless inspiration

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

You are free to use, modify, and distribute this configuration with attribution.

---

## 👤 About Me

<div align="center">

### itachi_re

*Linux enthusiast • Open-source advocate • Gamer*

[![GitHub](https://img.shields.io/badge/GitHub-itachi_re-181717?logo=github)](https://github.com/itachi_re)
[![Email](https://img.shields.io/badge/Email-itachi_re%40protonmail.com-D14836?logo=gmail)](mailto:itachi_re@protonmail.com)
[![Last.fm](https://img.shields.io/badge/Last.fm-itachi__re-D51007?logo=last.fm)](https://www.last.fm/user/itachi_re)

</div>

### What I'm passionate about:

- 🐧 Linux system administration and customization
- 💻 Building efficient development environments
- 🎮 Gaming on Linux (Proton, Gamescope, Wine)
- 🎨 UI/UX design and terminal aesthetics
- 🌸 Anime culture (hence the Ayanami Rei wallpaper!)
- 🎵 Music discovery and Last.fm scrobbling

---

<div align="center">

### ⭐ Star this repo if you find it useful!

**Made with ❤️ and lots of ☕**

*Last updated: October 2025*

</div>
