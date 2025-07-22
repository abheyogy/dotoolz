setopt promptsubst

# Zinit initialization
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}Installing zinit...%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}Installation successful.%f" || \
        print -P "%F{160}Installation failed.%f"
fi

source "$HOME/.zinit/bin/zinit.zsh"

# ═══════════════════════════════════════════════════════════════════════════════
# IMMEDIATE LOAD - Critical for shell functionality
# ═══════════════════════════════════════════════════════════════════════════════

# Prompt Theme (load immediately for instant appearance)
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# Essential completion and highlighting (immediate for responsiveness)
zinit for \
    light-mode zsh-users/zsh-autosuggestions \
    light-mode zdharma-continuum/fast-syntax-highlighting

# ═══════════════════════════════════════════════════════════════════════════════
# ESSENTIAL PROGRAMS - Load with slight delay
# ═══════════════════════════════════════════════════════════════════════════════

# Core programs
zinit ice wait"0a" lucid from"gh-r" as"program"
zinit light junegunn/fzf-bin

zinit ice wait"0a" lucid from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh"
zinit light direnv/direnv

# Modern CLI tools
zinit ice wait"0b" lucid from"gh-r" as"program" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

zinit ice wait"0b" lucid from"gh-r" as"program" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zinit light BurntSushi/ripgrep

zinit ice wait"0b" lucid from"gh-r" as"program" mv"delta* -> delta" pick"delta/delta"
zinit light dandavison/delta

zinit ice wait"0b" lucid from"gh-r" as"program" mv"exa* -> exa" pick"exa/exa"
zinit light ogham/exa

# ═══════════════════════════════════════════════════════════════════════════════
# ENHANCED SHELL FEATURES - Deferred loading
# ═══════════════════════════════════════════════════════════════════════════════

# Navigation and history
zinit ice wait"1a" lucid
zinit light zsh-users/zsh-history-substring-search

zinit ice wait"1a" lucid
zinit light agkozak/zsh-z

zinit ice wait"1a" lucid
zinit light zdharma-continuum/history-search-multi-word

# Interactive enhancements
zinit ice wait"1b" lucid
zinit light hlissner/zsh-autopair

zinit ice wait"1b" lucid
zinit light urbainvaes/fzf-marks

zinit ice wait"1b" lucid
zinit light Aloxaf/fzf-tab

zinit ice wait"1b" lucid
zinit light MichaelAquilina/zsh-you-should-use

# ═══════════════════════════════════════════════════════════════════════════════
# DEVELOPMENT TOOLS - Lazy load for faster startup
# ═══════════════════════════════════════════════════════════════════════════════

# Git tools
zinit ice wait"2a" lucid
zinit light wfxr/forgit

zinit ice wait"2a" lucid
zinit light tj/git-extras

zinit ice wait"2a" lucid as"program" pick"bin/git-dsf"
zinit light zdharma-continuum/zsh-diff-so-fancy

# Container and k8s tools
zinit ice wait"2b" lucid
zinit light greymd/docker-zsh-completion

zinit ice wait"2b" lucid
zinit light Dbz/kube-aliases

# Performance utilities
zinit ice wait"2c" lucid
zinit light mroth/evalcache

# ═══════════════════════════════════════════════════════════════════════════════
# COMPLETIONS - Load immediately for tab completion
# ═══════════════════════════════════════════════════════════════════════════════

# Initialize completion system immediately
autoload -Uz compinit
compinit

zinit ice wait"0c" lucid
zinit light zsh-users/zsh-completions

#zinit ice wait"3" lucid
#zinit light zsh-users/zsh-syntax-highlighting

# Configure plugins
zstyle ":history-search-multi-word" page-size "11"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1
