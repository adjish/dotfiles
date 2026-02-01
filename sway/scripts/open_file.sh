#!/bin/sh

cd ~/Data || exit

file="$(find ./* -type f | sed 's/^.\///' | tofi -c ~/.config/tofi/dmenu)"

if [ -e "${file}" ]
then
  exec xdg-open "${file}"
fi
