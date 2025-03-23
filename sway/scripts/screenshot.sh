#!/bin/sh

save_path="${HOME}/Pictures/Screenshots/Screenshot_$(date +%s).png"

while [ -e "${save_path}" ]; do
  save_path="${save_path%.*}"
  save_path="${save_path#*_}"

  case "${save_path}" in
  *_*)
    number="${save_path#*_}"
    number=$((number + 1))
    save_path="${save_path%_*}"
    save_path="Screenshot_${save_path}_${number}.png"
    ;;
  *)
    save_path="Screenshot_${save_path}_1.png"
    ;;
  esac

done

selection="$(slurp)"

if [ -n "${selection}" ]; then
  grim -g "${selection}" "${save_path}"
else
  grim "${save_path}"
fi

name="$(tofi -c ~/.config/tofi/dmenu --prompt-text 'Custom filename: ' </dev/null)"

if [ -n "${name}" ]; then
  case "${name}" in
  */*)
    notify-send 'Invalid file name.'
    ;;
  *)
    mv "${save_path}" "$(dirname "${save_path}")/${name}"
    save_path="$(dirname "${save_path}")/${name}"
    ;;
  esac
fi

answer="$(printf 'No\nYes' | tofi -c ~/.config/tofi/dmenu --prompt-text 'Copy screenshot to clipboard? ')"

if [ "${answer}" = 'Yes' ]; then
  wl-copy <"${save_path}"
fi
