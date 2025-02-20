#!/bin/sh

volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

case "$volume" in
*'MUTED'*) muted='MUTED' ;;
esac

volume="${volume% \[MUTED*}"
volume=$(bc <<<"${volume#* }*100")

echo "${volume%.*}"% $muted '|' "$(date '+%H:%M %a %d/%m/%y')"
