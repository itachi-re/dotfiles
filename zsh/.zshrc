# ══════════════════════════════════════════════════════════════════
#  ~/.zshrc — Itachi's Enhanced Zsh Configuration
# ══════════════════════════════════════════════════════════════════

# ── Pywal colors (load first, before anything draws to terminal) ──
[ -f "$HOME/.cache/wal/sequences" ] && cat "$HOME/.cache/wal/sequences"

# ── Fastfetch (graphical sessions only) ──────────────────────────
if [[ -n $DISPLAY || -n $WAYLAND_DISPLAY ]]; then
  fastfetch
fi

# ══════════════════════════════════════════════════════════════════
#  HISTORY
# ══════════════════════════════════════════════════════════════════
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt HIST_IGNORE_DUPS        # Don't record duplicate consecutive commands
setopt HIST_IGNORE_ALL_DUPS    # Remove older duplicate entries from history
setopt HIST_IGNORE_SPACE       # Don't record commands starting with a space
setopt HIST_SAVE_NO_DUPS       # Don't write duplicates to history file
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks
setopt HIST_VERIFY             # Show expanded history before executing
setopt SHARE_HISTORY           # Share history between all zsh sessions
setopt EXTENDED_HISTORY        # Save timestamp and duration with each command
setopt INC_APPEND_HISTORY      # Write to history file immediately

# ══════════════════════════════════════════════════════════════════
#  ZSH OPTIONS
# ══════════════════════════════════════════════════════════════════
setopt AUTO_CD                 # cd by typing directory name
setopt AUTO_PUSHD              # Push old directory onto stack on cd
setopt PUSHD_IGNORE_DUPS       # Don't push duplicates onto stack
setopt PUSHD_SILENT            # Don't print stack after pushd/popd
setopt CORRECT                 # Suggest corrections for mistyped commands
setopt INTERACTIVE_COMMENTS    # Allow # comments in interactive shell
setopt GLOB_DOTS               # Include dotfiles in glob patterns
setopt EXTENDED_GLOB           # Extended glob patterns
setopt NO_CASE_GLOB            # Case-insensitive globbing
setopt NUMERIC_GLOB_SORT       # Sort numeric filenames numerically
setopt RM_STAR_WAIT            # Wait before rm *
setopt NO_BEEP                 # Silence all bells

# ══════════════════════════════════════════════════════════════════
#  COMPLETION
# ══════════════════════════════════════════════════════════════════
autoload -Uz compinit
# Only rebuild compdump once a day for faster startup
if [[ -n "$HOME/.zcompdump"(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Completion styling
zstyle ':completion:*' menu select                          # Arrow-key menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'        # Case-insensitive matching
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"    # Colorize completions
zstyle ':completion:*' group-name ''                       # Group completions by category
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}No matches: %d%f'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zsh/cache"
zstyle ':completion:*' rehash true                         # Auto-find new executables
zstyle ':completion::complete:*' gain-privileges 1         # Complete sudo commands

# Enable shift-tab to go backwards in menu
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete

# ══════════════════════════════════════════════════════════════════
#  KEY BINDINGS
# ══════════════════════════════════════════════════════════════════
bindkey -e                                    # Emacs keybindings (default)

# Navigation
bindkey '^[[1;5C' forward-word               # Ctrl+Right: move forward one word
bindkey '^[[1;5D' backward-word              # Ctrl+Left: move backward one word
bindkey '^[[H'    beginning-of-line          # Home key
bindkey '^[[F'    end-of-line               # End key
bindkey '^[[3~'   delete-char               # Delete key

# History search
bindkey '^[[A'    history-substring-search-up    # Up arrow: history search up
bindkey '^[[B'    history-substring-search-down  # Down arrow: history search down
bindkey '^R'      history-incremental-search-backward

# Accept autosuggestion with Ctrl+Space or Right arrow at end of line
bindkey '^ '      autosuggest-accept
bindkey '^[[C'    forward-char

# ══════════════════════════════════════════════════════════════════
#  PATH — single unified declaration
# ══════════════════════════════════════════════════════════════════
export ANDROID_HOME=/data/itachi/android-sdk

typeset -U path  # Deduplicate PATH entries automatically
path=(
  /home/itachi/.opencode/bin
  /home/itachi/.local/share/pnpm
  /home/itachi/Scripts
  $ANDROID_HOME/platform-tools
  $ANDROID_HOME/tools
  /usr/sbin
  /sbin
  $path
)
export PATH

# ══════════════════════════════════════════════════════════════════
#  ENVIRONMENT
# ══════════════════════════════════════════════════════════════════
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export LESS='-R --mouse --wheel-lines=3'
export MANPAGER='nvim +Man!'                 # Use nvim as man pager
export STARSHIP_CONFIG="$HOME/.config/starship.toml"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ]            && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ]   && source "$NVM_DIR/bash_completion"

# PNPM home (already in path above)
export PNPM_HOME="/home/itachi/.local/share/pnpm"

# ══════════════════════════════════════════════════════════════════
#  PLUGINS
# ══════════════════════════════════════════════════════════════════
# ── 1. Syntax Highlighting (must be sourced before autosuggestions) ──
# Prefer local clone (avoids broken system package missing .version/.revision-hash)
if [[ -f ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ── 2. Autosuggestions ────────────────────────────────────────────
if [[ -f ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

ZSH_AUTOSUGGEST_STRATEGY=(history completion)   # Use both history and completion
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20              # Don't suggest for long buffers
ZSH_AUTOSUGGEST_USE_ASYNC=1                     # Non-blocking suggestion fetching
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6c7086'   # Catppuccin surface2 grey

# ── 3. History Substring Search ───────────────────────────────────
if [[ -f ~/.zsh_plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
  source ~/.zsh_plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
  HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=green,bold'
  HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red,bold'
fi

# ── 4. FZF (fuzzy finder) ─────────────────────────────────────────
if command -v fzf &>/dev/null; then
  source <(fzf --zsh) 2>/dev/null || {
    [ -f /usr/share/fzf/key-bindings.zsh ]  && source /usr/share/fzf/key-bindings.zsh
    [ -f /usr/share/fzf/completion.zsh ]    && source /usr/share/fzf/completion.zsh
  }

  export FZF_DEFAULT_OPTS="
    --height=40%
    --layout=reverse
    --border=rounded
    --preview-window=right:60%:wrap
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

  # Use fd instead of find for FZF (if available)
  if command -v fd &>/dev/null; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
  fi
fi

# ── 5. Zoxide (smart cd with frecency) ────────────────────────────
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh --cmd cd)"   # replaces 'cd' with zoxide
fi

# ── 6. Atuin (shell history sync + search, replaces Ctrl+R) ───────
if command -v atuin &>/dev/null; then
  eval "$(atuin init zsh)"
fi

# ══════════════════════════════════════════════════════════════════
#  FUNCTIONS
# ══════════════════════════════════════════════════════════════════

# Make a directory and cd into it
mkcd() { mkdir -p "$1" && cd "$1" }

# Extract any archive
extract() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"     ;;
      *.tar.gz)    tar xzf "$1"     ;;
      *.tar.xz)    tar xJf "$1"     ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar e "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       unzip "$1"       ;;
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# fzf powered file preview (requires bat)
fp() {
  fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
}

# git: fzf branch switch
gbf() {
  local branch
  branch=$(git branch --all | grep -v HEAD | fzf --height 40% | sed 's/remotes\/origin\///')
  [[ -n "$branch" ]] && git checkout "$branch"
}

# Quick backup of a file
bak() { cp "$1"{,.bak} && echo "Backed up $1 → $1.bak" }

# Show directory size sorted
dsize() { du -sh "${1:-.}"/* | sort -h }

# Search for a process
psg() { ps aux | grep -i "$1" | grep -v grep }

# Open last modified file in nvim
vlast() { nvim "$(ls -t | head -1)" }

# Quick HTTP server in current dir
serve() { python3 -m http.server "${1:-8000}" }

# ══════════════════════════════════════════════════════════════════
#  ALIASES — Navigation
# ══════════════════════════════════════════════════════════════════
alias home='cd ~'
alias dotfiles='cd ~/.dotfiles'
alias conf='cd ~/.config'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'            # Go to previous directory
alias fzfp='fzf --preview="cat {}"'
# Simple fzf with cat preview
alias fzfp='fzf --preview="cat {}"'
# fzf with bat for syntax-highlighted preview
alias fzfb='fzf --preview="bat --color=always {}"'
# Open selected file in nvim with bat preview
alias fzfn='nvim $(fzf --preview="bat --color=always {}")'

# ── Listing ──────────────────────────────────────────────────────
# Use eza if available, fall back to ls
if command -v eza &>/dev/null; then
  alias ls='eza --color=always --icons --group-directories-first'
  alias ll='eza -la --color=always --icons --git --group-directories-first'
  alias la='eza -la --color=always --icons'
  alias lt='eza --tree --color=always --icons --level=2'
  alias llt='eza --tree --color=always --icons --level=3 -l'
else
  alias ls='ls --color=auto -h'
  alias ll='ls -lah'
  alias la='ls -lah'
fi

# ── Editor ───────────────────────────────────────────────────────
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias nv='nvim .'            # Open nvim in current dir

# ── Git ──────────────────────────────────────────────────────────
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate'
alias gll='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gd='git diff'
alias gds='git diff --staged'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gba='git branch -a'
alias gst='git stash'
alias gstp='git stash pop'
alias gundo='git reset HEAD~1 --soft'   # Undo last commit, keep changes staged

# ── System ───────────────────────────────────────────────────────
alias df='df -h'
alias du='du -sh'
alias free='free -h'
alias ports='ss -tulanp'
alias myip='curl -s ifconfig.me && echo'
alias localip="ip addr show | grep 'inet ' | awk '{print \$2}'"
alias mem='ps auxf | sort -nr -k 4 | head -10'   # Top 10 memory hogs
alias cpu='ps auxf | sort -nr -k 3 | head -10'   # Top 10 CPU hogs

# ── Safety nets ──────────────────────────────────────────────────
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ── Sudo shortcuts ───────────────────────────────────────────────
alias fuck='sudo $(fc -ln -1)'
alias please='sudo'

# ── Package management (openSUSE) ────────────────────────────────
alias update='sudo zypper refresh && sudo zypper dup'
alias install='sudo zypper install'
alias remove='sudo zypper remove'
alias search='zypper search'

# ── Misc ─────────────────────────────────────────────────────────
alias reload='source ~/.zshrc && echo "Config reloaded ✓"'
alias path='echo $PATH | tr ":" "\n"'
alias clr='clear'
alias cls='clear'
alias h='history | tail -50'
alias hg='history | grep'         # Search history
alias swc='wal -i /home/itachi/Pictures/Wallpapers/rei.jpg'
alias clean-cache='du -sh ~/.cache && rm -rf ~/.cache/* && echo "Cache cleaned ✓"'
alias up-code='cd ~/AppImages/vscode/ && ./update-vscode.sh'
alias gs720='gamescope -f -w 1280 -h 720 --'
alias json='python3 -m json.tool'   # Pretty-print JSON
# serve() function defined above — use: serve [port]  (default: 8000)

# Use bat instead of cat if available
if command -v bat &>/dev/null; then
  alias cat='bat --paging=never'
  alias catp='bat'                   # bat with pager
fi

# ── Process ──────────────────────────────────────────────────────
alias k='kill'
alias k9='kill -9'
alias pk='pkill'

# ══════════════════════════════════════════════════════════════════
#  PROMPT — Starship
# ══════════════════════════════════════════════════════════════════
PROMPT=''   # Clear before starship takes over
eval "$(starship init zsh)"
