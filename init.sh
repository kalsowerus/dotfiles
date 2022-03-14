#!/bin/sh

sudo apt install jq
sudo apt install fzf
sudo apt install xclip

dir=$(realpath $(dirname "$0"))

link() {
	if [ -f "$HOME/$1" ] && [ ! -L "$HOME/$1" ]; then
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
link .zshrc

