#!/bin/sh

cd ~/Data || exit

file="$(find ./* -type f | sed 's/^.\///' | tofi -c ~/.config/tofi/dmenu)"

exec xdg-open "${file}"
