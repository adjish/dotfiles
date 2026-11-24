#!/bin/sh

screenshot="$(mktemp screenshot_XXX.png)"
text="$(mktemp text_XXX.txt)"

grim -g "$(slurp)" "${screenshot}" && tesseract "${screenshot}" "${text%.txt}" && wl-copy <"${text}"
rm "${screenshot}" "${text}"
