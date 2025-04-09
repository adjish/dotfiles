#!/bin/zsh

exec xdg-open ~/Data/"$(cd ~/Data; find * -type f | tofi -c ~/.config/tofi/dmenu)"
