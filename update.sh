#!/bin/sh

dir=$(realpath $(dirname "$0"))

git pull "$dir"
$dir/init.sh

