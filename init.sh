#!/bin/sh

dir=$(dirname "$0")
ln -sf $dir/.gitconfig $HOME/.gitconfig
ln -sf $dir/.lesskey $HOME/.lesskey

# Linking .zshrc does not work with nvm
#ln -sf $dir/.zshrc $HOME/.zshrc

