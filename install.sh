#!/bin/zsh

if ! command -v jq >/dev/null 2>&1; then
    sudo apt install -y jq
fi
if ! command -v fzf >/dev/null 2>&1; then
    sudo apt install -y fzf
fi
if ! command -v xclip >/dev/null 2>&1; then
    sudo apt install -y xclip
fi
if ! command -v git >/dev/null 2>&1; then
    sudo apt install -y git
fi

dir=$(dirname $(readlink -e "${(%):-%x}"))

mkdir -p "$HOME/.ssh"

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
if command -v git >/dev/null 2>&1 && ! git config --global --list 2>/dev/null | grep "path=$GIT_INCLUDE_PATH$" >/dev/null; then
    git config --global --add include.path "$GIT_INCLUDE_PATH" 
fi

VIMRC_INCLUDE="source $dir/kalsowerus.vimrc"
VIMRC_FILE="$HOME/.vimrc"
if ! grep "^$VIMRC_INCLUDE$" "$VIMRC_FILE" >/dev/null 2>&1; then
    echo "$VIMRC_INCLUDE" >> "$VIMRC_FILE"
fi

REPOS_PATH="${HOME}/.zsh"

NVM_PATH="${REPOS_PATH}/nvm"
if [[ ! -d "${NVM_PATH}" ]]; then
    git clone 'git@github.com:nvm-sh/nvm.git' "${NVM_PATH}"
fi

ANTIGEN_PATH="${REPOS_PATH}/antigen"
if [[ ! -d "${ANTIGEN_PATH}" ]]; then
    git clone 'git@github.com:zsh-users/antigen.git' "${ANTIGEN_PATH}"
fi

VIM_PLUG_PATH="${REPOS_PATH}/vim-plug"
if [[ ! -d "${VIM_PLUG_PATH}" ]]; then
    git clone 'git@github.com:junegunn/vim-plug.git' "${VIM_PLUG_PATH}"
    ln -s "${VIM_PLUG_PATH}/plug.vim" "${HOME}/.vim/autoload/plug.vim"
fi

