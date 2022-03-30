#!/bin/zsh

dir=$(dirname $(readlink -e "${(%):-%x}"))

git -C "$dir" pull
$dir/install.sh

