#!/bin/sh

save_path="${HOME}/Pictures/Screenshots/Screenshot_$(date +%s).png"

while [ -e "${save_path}" ]; do
  save_path="${save_path%.*}"
  save_path="${save_path#*_}"

  case "${save_path}" in
  *_*)
    number=$((${save_path#*_} + 1))
    save_path="Screenshot_${save_path%_*}_${number}.png"
    ;;
  *)
    save_path="Screenshot_${save_path}_1.png"
    ;;
  esac

done

grim "${save_path}"

name="$(tofi -c ~/.config/tofi/dmenu --prompt-text 'Custom filename: ' </dev/null)"

if [ -n "${name}" ] && [ ! -e "$(dirname "${save_path}")/${name}" ]; then
  case "${name}" in
  */*)
    notify-send 'Invalid filename.' 'Using default filename.'
    ;;
  *)
    mv "${save_path}" "$(dirname "${save_path}")/${name}"
    save_path="$(dirname "${save_path}")/${name}"
    ;;
  esac
else
  notify-send 'Invalid filename.' 'Using default filename.'
fi

answer="$(printf 'No\nYes' | tofi -c ~/.config/tofi/dmenu --prompt-text 'Copy screenshot to clipboard? ')"

if [ "${answer}" = 'Yes' ]; then
  wl-copy <"${save_path}"
fi
