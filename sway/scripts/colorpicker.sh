#!/bin/sh

notify-send $(grim -g "$(slurp -p -b '#00000000')" -t ppm - | magick - txt: | awk 'NR == 2 {print $3}')
