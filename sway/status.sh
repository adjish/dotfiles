#!/bin/sh

volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
muted=false

case "$volume" in
*'MUTED'*) muted=true ;;
esac

volume="${volume% \[MUTED*}"
volume=$(echo "${volume#* }*100" | bc)

if [ $muted = true ]; then
  echo "${volume%.*}"% 'MUTED |' "$(date '+%H:%M %a %d/%m/%y')"
else
  echo "${volume%.*}"% '|' "$(date '+%H:%M %a %d/%m/%y')"
fi
