#!/bin/sh

dir=$(realpath $(dirname "$0"))

git -C "$dir" pull
$dir/init.sh

