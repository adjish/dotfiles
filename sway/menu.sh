#!/bin/sh

case $(printf "Shutdown\nReboot\nSuspend" | tofi -c ~/.config/tofi/dmenu) in
"Shutdown")
  exec shutdown -h 0
  ;;
"Reboot")
  exec reboot
  ;;
"Suspend")
  exec systemctl suspend
  ;;
esac
