#!/bin/sh

for directory in conky foot mako mpd sway tofi zsh; do
  command -v "${directory}" >/dev/null 2>&1 && cp -ri "${directory}" ~/.config/
done

command -v pacman >/dev/null 2>&1 && sudo cp -i pacman/pacman.conf /etc/pacman.conf && sudo cp -ri pacman/pacman.d /etc/
