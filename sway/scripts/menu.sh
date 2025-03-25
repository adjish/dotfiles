#!/bin/sh

case $(printf "Shutdown\nReboot\nSuspend" | tofi -c ~/.config/tofi/dmenu --prompt-text 'Power Menu: ') in
"Shutdown")
  exec shutdown now
  ;;
"Reboot")
  exec reboot
  ;;
"Suspend")
  exec systemctl suspend
  ;;
esac
