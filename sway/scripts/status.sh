#!/bin/sh

volume="$(wpctl get-volume @DEFAULT_SINK@)"

case "${volume}" in
*'MUTED'*) muted='true' ;;
*) ;;
esac

volume="${volume% \[MUTED*}"
volume=$(echo "${volume#* }" | tr -d .)
volume="${volume#0}"
volume="${volume#0}"
volume="${volume%.*}%"

if [ "${muted}" = 'true' ]; then
  volume="${volume} MUTED"
fi

datetime="$(date '+%H:%M %a %d/%m/%y')"
network="$(ip route get 1.1.1.1 | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')"

if [ -z "${network}" ]; then
  network="Disconnected"
fi

echo "${network}" \| "${volume}" \| "${datetime}"
