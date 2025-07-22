# Path configuration
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

# Starship disabled - using Pure theme instead
# eval "$(starship init zsh)"

# Package manager
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Editors
export EDITOR='nvim'
export VISUAL='vi'

# macOS locale settings
if [[ $(uname) == "Darwin" ]]; then
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Completion system
autoload -U +X bashcompinit && bashcompinit

# Development environments
export GOPATH=$HOME/.go

# Terminal colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export TERM=xterm-256color

# FZF configuration
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Completion caching
export ZSH_CACHE_DIR="$HOME/.cache/zsh"
mkdir -p "$ZSH_CACHE_DIR"

# Claude CLI
alias claude="$HOME/.claude/local/claude"

unset KITTY_SHELL_INTEGRATION
