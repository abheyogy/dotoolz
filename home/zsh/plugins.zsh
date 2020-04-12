## Place to keep hold of Zsh plugins.
#  Using Zinit & hence could potentially use Presto &/or Oh-My-ZSH plugins.

setopt promptsubst

##### Initializing Zint	For Managing ZSH #####
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# ------------------
# Zsh Plugins

zinit for 					                      \
    light-mode zsh-users/zsh-autosuggestions      \
    light-mode zdharma/fast-syntax-highlighting   \
	       zdharma/history-search-multi-word      \
    light-mode pick"async.zsh" src"pure.zsh"      \
               sindresorhus/pure                  \
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS
zinit ice silent wait!1 atload"ZINIT[COMPINIT_OPTS]=-C; zpcompinit"
zinit ice pick"h.sh"
zinit light paoloantinori/hhighlighter

# diff-so-fancy
zinit ice wait"2" lucid as"program" pick"bin/git-dsf"
zinit load zdharma/zsh-diff-so-fancy

# zsh-startify, a vim-startify like plugin
zinit ice wait"0b" lucid atload"zsh-startify"
zinit load zdharma/zsh-startify

# declare-zsh
zinit ice wait"2" lucid
zinit load zdharma/declare-zsh

# fzf-marks
zinit ice wait lucid
zinit load urbainvaes/fzf-marks

# zsh-autopair
zinit ice wait lucid
zinit load hlissner/zsh-autopair

zinit ice wait"1" lucid
zinit load psprint/zsh-navigation-tools

# zdharma/history-search-multi-word
zstyle ":history-search-multi-word" page-size "11"
zinit ice wait"1" lucid
zinit load zdharma/history-search-multi-word

# ZUI and Crasis
zinit ice wait"1" lucid
zinit load zdharma/zui

zinit ice wait'[[ -n ${ZLAST_COMMANDS[(r)cra*]} ]]' lucid
zinit load zdharma/zinit-crasis

# Gitignore plugin – commands gii and gi
zinit ice wait"2" lucid
zinit load voronkovich/gitignore.plugin.zsh

zinit wait for \
    atinit"zicompinit; zicdreplay" \
        OMZ::{git,git-flow,git-fast,gitignore,git-extras,git-prompt,git-remote-branch} \
	    OMZ::{pip,pep8,pyenv,python,pylint} \
	    OMZ::{archlinux,debian,ssh-agent,docker,tmux,sudo,rsync,colorize,colored-man-pages}
