#!/bin/sh

readonly STATE_FILE='/tmp/sway_gaps_enabled'

state=1

if [ -s "${STATE_FILE}" ]; then
    read -r state < "${STATE_FILE}"
fi

if [ "${state}" -eq 1 ]; then
    swaymsg gaps inner all set 0
else
    swaymsg gaps inner all set 4
fi

echo "$((1 - state))" > "${STATE_FILE}"
