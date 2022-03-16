#!/bin/zsh

sudo apt install jq
sudo apt install fzf
sudo apt install xclip

dir=$(dirname $(readlink -e "${(%):-%x}"))

link() {
    local link_name="${2:-$HOME/$1}"
    if [[ -f "$link_name" ]] && [[ ! -L "$link_name" ]]; then
        echo -n "$1 exists. Overwrite? (y/N) "
        read 'reply'

        if [ "$reply" != 'y' ]; then
            return
        fi
    fi

    mkdir -p $(dirname "$link_name")
    ln -sf "$dir/$1" "$link_name"
}

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
link .gitconfig "$XDG_CONFIG_HOME/git/config"
link .lesskey
link .vimrc
link .zshrc

