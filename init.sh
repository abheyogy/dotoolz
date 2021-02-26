#!/usr/bin/env bash
#########################################
#         My dotoolz repository         #
# ################## ################## #
#    More commonly called as dotfiles   #
#  Laugh all you want, I see your lies  #
#   For everything in Linux are files   #
#   Dotoolz are tools are still files   #
#      My humble attempt to share       #
#         For Hackers do care           #
#     To be true & precise , to dare!   #
# ##################################### #

export base_dir="${PWD}/home"
export target="${HOME}"

function linkit {

    # Create Sym links for config files
    #TODO(abheyogy): Please update to check if the symlink already
    # exists & exit if it does ...
    ln -s $1 $2
}

function configure_neovim {

    echo "Initializing neovim configuration."
    # Check if NeoVim configuration files exist, if so take
    # backup before symlinking the configuration files.
    neovim_configDir=${HOME}/.config/nvim
    if [[ ! -f $neovim_configDir/init.vim  ]]; then
      echo "Did not find init.vim. Initializing."
      echo "Creating NeoVim Folder"
      mkdir -p $neovim_configDir
      echo "Initiliaztion successful."
    else
      echo "Init.vim exists, taking a backup"
      echo "Neo Vim Folder Exists"
      mv $neovim_configDir/init.vim $neovim_configDir/init_vim_bkp
      echo "Took backup, please find init_vim_bkp:"
      echo "Old_init.vim: $newvim_configDir/init_vim_bkp"
    fi

    linkit "${base_dir}/init.vim" "${neovim_configDir}/."
}

function configure_zsh {
    # Configure Zsh. Zsh plugin Zinit is auto-configured via. plugins.zsh file.
    linkit "${base_dir}/zsh/zshrc" "${HOME}/.zshrc"
    linkit "${base_dir}/zsh/aliases.zsh" "${HOME}/.aliases.zsh"
    linkit "${base_dir}/zsh/plugins.zsh" "${HOME}/.plugins.zsh"
    linkit "${base_dir}/zsh/env.zsh" "${HOME}/.env.zsh"
}

function configure_git {
    # Configure Git global settings
    linkit "${base_dir}/gitconfig" "${HOME}/.gitconfig"
    linkit "${base_dir}/git/gitignoreglobal" "${HOME}/.gitignoreglobal"
}

function configure_irc {
    # Configure IRSSI if IRSSI or Weechat ... whatever works.
    echo "Exception: To be implemented."
}

function configure_sway {
    # Configure sway/i3 ... whatever works.
    echo "Exception: To be implemented."
}

function configure_tmux {
    echo "Configuring tmux ... hold on tight"
    linkit "${base_dir}/tmux.conf" "${HOME}/.tmux.conf"
}

function configure_alacritty {
    echo "Configuring Alacritty terminal."
    linkit "${base_dir}/alacritty.yml" "${HOME}/.alacritty.yml"
}

function main {
    # Wrapper function to invoke functions in a particular order.
    configure_alacritty
    configure_git
    configure_neovim
    configure_zsh
    configure_tmux
    configure_sway
    #configure_irc
}

# Calling main function to setup your new Operating System Deployment.
main
