#!/bin/sh

/usr/bin/systemctl --runtime unmask halt.target poweroff.target reboot.target kexec.target suspend.target hibernate.target hybrid-sleep.target suspend-then-hibernate.target sleep.target > /dev/null 2>&1
