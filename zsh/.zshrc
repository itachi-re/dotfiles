# ~/.zshrc

# --- System Fetch ---
# Run fastfetch only if inside a graphical session
if [[ -n $DISPLAY || -n $WAYLAND_DISPLAY ]]; then
  fastfetch
fi
# CLEAR EXISTING PROMPT (IMPORTANT FIX)
PROMPT=''

# Initialize starship prompt (only once)
eval "$(starship init zsh)"

# Add /usr/sbin and /sbin to PATH for user sessions
export PATH=$PATH:/usr/sbin:/sbin

# Syntax highlighting and autosuggestions
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# Aliases
alias ls='ls --color=auto -h'
alias ll='ls -lah'
alias gs720='gamescope -f -w 1280 -h 720 --'
alias update='sudo zypper refresh && sudo zypper dup'
alias fuck='sudo $(fc -ln -1)'

# Environment variables
export STARSHIP_CONFIG=~/.config/starship.toml
export ANDROID_HOME=/data/itachi/android-sdk
export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH

# Zsh autosuggestions
source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh syntax highlighting
source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto-add current directory to z's database on every command execution
zstyle ':completion:*' list-colors ''
autoload -Uz compinit
compinit
# source /usr/share/z/z.sh# ── Navigation ─────────────────────────────────────────────
alias home='cd ~'
alias dotfiles='cd ~/.dotfiles'
alias conf='cd ~/.config'

# ── Editor ─────────────────────────────────────────────────
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# ── Git ────────────────────────────────────────────────────
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

# ── System ─────────────────────────────────────────────────
alias df='df -h'
alias du='du -sh'
alias free='free -h'
alias ports='ss -tulanp'
alias myip='curl ifconfig.me'

# ── Safety nets ────────────────────────────────────────────
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ── Misc ───────────────────────────────────────────────────
alias reload='source ~/.zshrc'
alias path='echo $PATH | tr ":" "\n"'
alias clr='clear'
alias h='history | tail -50'
alias swc='wal -i /home/itachi/Pictures/Wallpapers/rei.jpg'
export ANDROID_HOME=/data/itachi/android-sdk
export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH
# Load pywal colors
# ~/.bashrc or ~/.zshrc
[ -f "$HOME/.cache/wal/sequences" ] && cat "$HOME/.cache/wal/sequences"


export PATH="$HOME/Scripts:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Allow comments in interactive Zsh (like Bash)
setopt interactive_comments

# opencode
export PATH=/home/itachi/.opencode/bin:$PATH
alias clean-cache='du -sh ~/.cache && rm -rf ~/.cache/* && echo Cache cleaned'

# vscode
alias up-code='cd ~/AppImages/vscode/ && ./update-vscode.sh'

# pnpm
export PNPM_HOME="/home/itachi/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
