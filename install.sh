#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/.dotfiles"
STOW_PACKAGES=(
  alacritty
  audacious
  bash
  cava
  easyeffects
  emacs
  fastfetch
  fontconfig
  ghostty
  git
  gtk
  haruna
  kde
  misc
  neofetch
  nvim
  panel-colorizer
  profile
  tmux
  vim
  wal
  xsettingsd
  zsh
)

echo "→ Installing dotfiles from $DOTFILES"

# Check dependencies
command -v stow >/dev/null 2>&1 || { echo "ERROR: stow not found. Install with: sudo zypper install stow"; exit 1; }

cd "$DOTFILES"

for pkg in "${STOW_PACKAGES[@]}"; do
  if [ -d "$DOTFILES/$pkg" ]; then
    echo "  stowing: $pkg"
    stow --target="$HOME" --restow "$pkg" 2>&1 | grep -v "^$" || true
  else
    echo "  skipping: $pkg (directory not found)"
  fi
done

echo ""
echo "✓ Done! Reload your shell: exec zsh"
