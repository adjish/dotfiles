#!/bin/sh

save_path="$HOME/Pictures/Screenshots/Screenshot $(date +%s).png"

grim "${save_path}"

name="$(echo | tofi -c ~/.config/tofi/dmenu --prompt-text 'Filename: ')"

if [ -n "$name" ]; then
  mv "${save_path}" "$(dirname "$save_path")/$name"
  save_path="$(dirname "$save_path")/$name"
fi

[ "$(printf 'Yes\nNo' | tofi -c ~/.config/tofi/dmenu --prompt-text 'Copy screenshot in clipboard? ')" = 'Yes' ] && wl-copy <"${save_path}"
