#!/bin/sh

volume="$(wpctl get-volume @DEFAULT_SINK@)"

case "$volume" in
*'MUTED'*) muted='MUTED ' ;;
esac

volume="${volume% \[MUTED*}"
volume=$(echo "${volume#* }" | tr -d .)
volume="${volume#0}"
volume="${volume#0}"

echo "${volume%.*}% $muted| $(date '+%H:%M %a %d/%m/%y')"
