#!/bin/sh

for directory in conky foot mako mpd pacman sway tofi zsh; do
  cp -ri $directory ~/.config/
done
