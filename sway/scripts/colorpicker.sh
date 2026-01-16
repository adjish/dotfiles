#!/bin/sh

notify-send $(grim -g "$(slurp -p)" -t ppm - | magick - txt: | awk 'NR == 2 {print $3}')
