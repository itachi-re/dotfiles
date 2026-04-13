# --- Load personal aliases (if they exist) ---
test -s ~/.alias && . ~/.alias || true

# --- Environment Variables & PATH (your original + new additions) ---
export ANDROID_HOME=/data/itachi/android-sdk
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools"
export PATH="$HOME/Apps:$PATH"
export PATH="$HOME/Scripts:$PATH"
export PATH="$PATH:/usr/sbin:/sbin"
export PATH="/home/itachi/.opencode/bin:$PATH"
export PNPM_HOME="/home/itachi/.local/share/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# --- NVM (Node Version Manager) ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- Pywal colors (your original) ---
[ -f "$HOME/.cache/wal/sequences" ] && cat "$HOME/.cache/wal/sequences"

# --- System fetch (fastfetch in GUI sessions, fallback neofetch) ---
if [[ -n $DISPLAY || -n $WAYLAND_DISPLAY ]]; then
    command -v fastfetch >/dev/null 2>&1 && fastfetch
fi
clear
command -v neofetch >/dev/null 2>&1 && neofetch

# --- Starship prompt ---
PS1=''
eval "$(starship init bash)"

# --- Optional: Syntax highlighting & autosuggestions ---
# These packages are available in openSUSE: zypper install bash-syntax-highlighting bash-autosuggestions
if [ -f /usr/share/bash-syntax-highlighting/bash-syntax-highlighting.sh ]; then
    source /usr/share/bash-syntax-highlighting/bash-syntax-highlighting.sh
fi
if [ -f /usr/share/bash-autosuggestions/bash-autosuggestions.sh ]; then
    source /usr/share/bash-autosuggestions/bash-autosuggestions.sh
fi

# Alternative: ble.sh (more advanced, but needs manual install)
# [[ -f ~/.local/share/blesh/ble.sh ]] && source ~/.local/share/blesh/ble.sh --attach=none && ble-attach

# --- Aliases (from your enhanced version) ---
alias ls='ls --color=auto -h'
alias ll='ls -lah'
alias gs720='gamescope -f -w 1280 -h 720 --'
alias update='sudo zypper refresh && sudo zypper dup'

fuck() { sudo $(fc -ln -1); }

alias home='cd ~'
alias dotfiles='cd ~/.dotfiles'
alias conf='cd ~/.config'

alias v='nvim'
alias vi='nvim'
alias vim='nvim'

alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias gco='git checkout'
alias gcb='git checkout -b'

alias df='df -h'
alias du='du -sh'
alias free='free -h'
alias ports='ss -tulanp'
alias myip='curl ifconfig.me'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias reload='source ~/.bashrc'
alias path='echo $PATH | tr ":" "\n"'
alias clr='clear'
alias h='history 50'
alias swc='wal -i /home/itachi/Pictures/Wallpapers/rei.jpg'
alias clean-cache='du -sh ~/.cache && rm -rf ~/.cache/* && echo Cache cleaned'
alias up-code='cd ~/AppImages/vscode/ && ./update-vscode.sh'

# --- Bash‑specific enhancements ---
export HISTSIZE=10000
export HISTFILESIZE=20000
shopt -s histappend
shopt -s cmdhist
shopt -s lithist

if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi

shopt -s globstar
bind "set completion-ignore-case on"
