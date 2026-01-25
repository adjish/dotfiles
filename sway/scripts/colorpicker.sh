#!/bin/sh

color="$(grim -g "$(slurp -p -b '#00000000')" -t ppm - | magick - txt: | awk 'NR == 2 {print $3}')"

notify-send "Color" "${color}"

answer="$(printf 'No\nYes' | tofi -c ~/.config/tofi/dmenu --prompt-text 'Copy color to clipboard? ')"

if [ "${answer}" = 'Yes' ]; then
  printf "%s" "${color}" | wl-copy
fi
