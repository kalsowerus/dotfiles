#!/bin/zsh

if ! command -v jq >/dev/null 2>&1; then
    sudo apt install jq
fi
if ! command -v fzf >/dev/null 2>&1; then
    sudo apt install fzf
fi
if ! command -v xclip >/dev/null 2>&1; then
    sudo apt install xclip
fi

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

link .lesskey

ZSHRC_INCLUDE="source $dir/kalsowerus.zshrc"
ZSHRC_FILE="$HOME/.zshrc"
if ! grep "^$ZSHRC_INCLUDE$" "$ZSHRC_FILE" >/dev/null 2>&1; then
    echo "$ZSHRC_INCLUDE" >> "$ZSHRC_FILE"
fi

GIT_INCLUDE_PATH="$dir/kalsowerus.gitconfig"
if command -v git >/dev/null 2>&1 && ! git config --global --list | grep "path=$GIT_INCLUDE_PATH$" >/dev/null; then
    git config --global --add include.path "$GIT_INCLUDE_PATH" 
fi

SSH_INCLUDE="Include $dir/kalsowerus.ssh.conf"
SSH_CONFIG_FILE="$HOME/.ssh/config"
if ! grep "^$SSH_INCLUDE$" "$SSH_CONFIG_FILE" >/dev/null 2>&1; then
    sed -i "1s:^:$SSH_INCLUDE\n:" "$SSH_CONFIG_FILE"
fi

VIMRC_INCLUDE="source $dir/kalsowerus.vimrc"
VIMRC_FILE="$HOME/.vimrc"
if ! grep "^$VIMRC_INCLUDE$" "$VIMRC_FILE" >/dev/null 2>&1; then
    echo "$VIMRC_INCLUDE" >> "$VIMRC_FILE"
fi

