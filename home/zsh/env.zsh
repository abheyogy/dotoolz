## Set and unset environment variables to make like better.
#  Environment could underly the following:
#  	i. Operating System specifics
#  	ii. Programming language & dependency specific
#  	iii. Whatever else could have its own enviornment qualifies.


# Disable the pinetry GUI Window, if installed!
unset GPG_AGENT_INFO
unset SSH_ASKPASS


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

# GoLango
export GOPATH=$HOME/.go

# PyEnv ...
export PATH="/home/abheyogy/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
