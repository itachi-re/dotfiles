#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/.dotfiles"

STOW_PACKAGES=(
  alacritty audacious bash cava easyeffects emacs fastfetch
  fontconfig ghostty git gtk haruna kde misc neofetch nvim
  panel-colorizer profile tmux vim wal xsettingsd zsh
)

echo "→ Installing dotfiles from $DOTFILES"

# Ensure stow exists
if ! command -v stow >/dev/null 2>&1; then
  echo "Installing stow..."
  sudo zypper install -y stow
fi

cd "$DOTFILES"

# Allow selective install
if [ "$#" -gt 0 ]; then
  STOW_PACKAGES=("$@")
fi

for pkg in "${STOW_PACKAGES[@]}"; do
  if [ -d "$DOTFILES/$pkg" ]; then
    echo "  stowing: $pkg"
    stow --target="$HOME" --restow "$pkg"
  else
    echo "  skipping: $pkg (not found)"
  fi
done

echo ""
echo "✓ Done! Reload your shell: exec \$SHELL"
