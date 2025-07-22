# Editor & terminal
alias vim=nvim
alias tmux='tmux -u'
alias c='clear'
alias x='exit'
alias h='cd ~'
alias reload='source ~/.zshrc'
alias zshconfig='nvim ~/.zshrc'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Directory shortcuts
alias repos=$HOME/Repos
alias rplayground=$HOME/Repos/PlayGround
alias rsaltstack=$HOME/Repos/SaltStack

# Modern CLI replacements
alias cat='bat'
alias ls='exa --icons'
alias ll='exa --icons -l'
alias la='exa --icons -la'
alias find='fd'
alias grep='rg'
alias du='dust'
alias df='duf'
alias top='btop'
alias ps='procs'

# Git shortcuts
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gs='git status'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias gm='git merge'
alias gr='git remote'

# System utilities
alias ports='netstat -tulanp'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias mkdir='mkdir -pv'
alias wget='wget -c'
alias myip='curl http://ipecho.net/plain; echo'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias history='fc -l 1'