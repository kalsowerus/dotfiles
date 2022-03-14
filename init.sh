#!/bin/sh

sudo apt install jq
sudo apt install fzf
sudo apt install xclip

dir=$(dirname "$0")

link() {
	if [ -e "$HOME/$1" ]; then
		echo -n "$1 exists. Overwrite? (y/N) "
		read 'reply'

		if [ "$reply" != 'y' ]; then
			return
		fi
	fi

	ln -sf "$dir/$1" "$HOME/$1"
}

link .gitconfig
link .lesskey
link .vimrc

# Linking .zshrc does not work with nvm
#link .zshrc

if [ ! -e "$HOME/zshrc" ]; then
    echo 'source "$HOME/dotfiles/.zshrc"' > "$HOME/.zshrc"
fi

