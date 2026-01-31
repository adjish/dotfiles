#!/bin/sh

confirm()
{
  answer="$(printf 'No\nYes' | tofi -c ~/.config/tofi/dmenu --prompt-text "Confirm ${1}? ")"

  if [ "${answer}" != 'Yes' ]; then
    exit
  fi
}

case $(printf "Shutdown\nPoweroff\nReboot\nSuspend" | tofi -c ~/.config/tofi/dmenu) in
  "Shutdown")
    confirm shutdown
    exec shutdown now
    ;;
  "Poweroff")
    confirm poweroff
    exec poweroff
    ;;
  "Reboot")
    confirm reboot
    exec reboot
    ;;
  "Suspend")
    confirm suspend
    exec systemctl suspend
    ;;
  *)
    exit 1
    ;;
esac
