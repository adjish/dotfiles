#!/bin/sh

cd ~/Data || exit

file="$(find ./* -type f | cut -c 3- | tofi -c ~/.config/tofi/dmenu)"

if [ -e "${file}" ]
then
  exec xdg-open "${file}"
fi
