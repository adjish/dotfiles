#!/bin/sh

for directory in conky foot mako mpd sway tofi zsh; do
  command -v "${directory}" && cp -ri "${directory}" ~/.config/
done
