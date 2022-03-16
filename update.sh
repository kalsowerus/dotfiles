#!/bin/zsh

dir=$(dirname $(readlink -e "${(%):-%x}"))

git -C "$dir" pull
$dir/init.sh

