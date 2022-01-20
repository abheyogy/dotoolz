## Set and unset environment variables to make like better.
#  Environment could underly the following:
#  	i. Operating System specifics
#  	ii. Programming language & dependency specific
#  	iii. Whatever else could have its own environment qualifies.

## Path section
# Set $PATH if ~/.local/bin exist
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

## TODO(abheyogy): Please look into Starship in depth as time allows.
# eval "$(starship init zsh)"

# Replace yay with paru if installed
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Editor
export EDITOR='nvim'
export VISUAL='vi'

# MacOS Set Locale related globals.
os_name=`uname`
if [[ $os_name == "Darwin" ]]; then
	export LC_ALL=en_US.UTF-8
	export LANG=en_US.UTF-8
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

# GoLango
export GOPATH=$HOME/.go

# PyEnv ...
export PATH="/home/abheyogy/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
