#!/bin/sh

case $(printf "Shutdown\nPoweroff\nReboot\nSuspend" | tofi -c ~/.config/tofi/dmenu --prompt-text 'Power Menu: ') in
"Shutdown")
  exec shutdown now
  ;;
"Poweroff")
  exec poweroff
  ;;
"Reboot")
  exec reboot
  ;;
"Suspend")
  exec systemctl suspend
  ;;
esac
