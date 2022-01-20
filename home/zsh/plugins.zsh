## Place to keep hold of Zsh plugins.
#  Using Zinit & hence could potentially use Presto &/or Oh-My-ZSH plugins.

setopt promptsubst

##### Initializing Zint	For Managing ZSH #####
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma-continuum/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
#autoload -Uz _zinit
#(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# TODO(abheyogy): Fix me asap ... can't find the repository to clone.
#zinit light-mode for \
#    zinit-zsh/z-a-patch-dl \
#    zinit-zsh/z-a-as-monitor \
#    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# ------------------
# Zsh Plugins

zinit for 					                      \
    light-mode zsh-users/zsh-autosuggestions      \
    light-mode zdharma-continuum/fast-syntax-highlighting   \
	           zdharma-continuum/history-search-multi-word  \
    light-mode pick"async.zsh" src"pure.zsh"      \
               sindresorhus/pure

zinit ice from"gh-r" as"program"
zinit light junegunn/fzf-bin

zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!'     \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

zinit from"gh-r" as"program" mv"direnv* -> direnv"          \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for                        \
        direnv/direnv

zinit ice atclone'PYENV_ROOT="$PWD" ./libexec/pyenv init - > zpyenv.zsh' \
    atinit'export PYENV_ROOT="$PWD"' atpull"%atclone" \
    as'command' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
zinit light pyenv/pyenv

zinit ice silent wait!1 atload"ZINIT[COMPINIT_OPTS]=-C; zpcompinit"
zinit ice pick"h.sh"
zinit light paoloantinori/hhighlighter

# diff-so-fancy
zinit ice wait"2" lucid as"program" pick"bin/git-dsf"
zinit light zdharma-continuum/zsh-diff-so-fancy

zinit light zdharma-continuum/git-url

# zsh-startify, a vim-startify like plugin
zinit ice wait"0b" lucid atload"zsh-startify"
zinit light zdharma-continuum/zsh-startify

# declare-zsh
zinit ice wait"2" lucid
zinit light zdharma-continuum/declare-zsh

# fzf-marks
zinit ice wait lucid
zinit light urbainvaes/fzf-marks

# zsh-autopair
zinit ice wait lucid
zinit light hlissner/zsh-autopair

zinit ice wait"1" lucid
#zinit light psprint/zsh-navigation-tools

# zdharma-continuum/history-search-multi-word
zstyle ":history-search-multi-word" page-size "11"
zinit ice wait"1" lucid
zinit light zdharma-continuum/history-search-multi-word

# ZUI and Crasis
zinit ice wait"1" lucid
zinit light zdharma-continuum/zui

zinit ice wait'[[ -n ${ZLAST_COMMANDS[(r)cra*]} ]]' lucid
zinit light zdharma-continuum/zinit-crasis

# Gitignore plugin – commands gii and gi
zinit ice wait"2" lucid
zinit light voronkovich/gitignore.plugin.zsh

# Git plugin
zinit light wfxr/forgit

# Kubernetes aliases
zinit light Dbz/kube-aliases

#zinit wait for \
#    atinit"zicompinit; zicdreplay" \
#        OMZ::plugins/{git,git-flow,git-fast,gitignore,git-extras,git-prompt,git-remote-branch} \
#        OMZ::{pip,pep8,pyenv,python,pylint} \
#        OMZ::{archlinux,debian,ssh-agent,docker,tmux,sudo,rsync,colorize,colored-man-pages}
