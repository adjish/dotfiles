#!/usr/bin/sh

geometry="$(slurp)"
screenshot="$(mktemp screenshot_XXX.png)"
text="$(mktemp text_XXX.txt)"

grim -g "${geometry}" "${screenshot}" && tesseract "${screenshot}" "${text%.txt}" && wl-copy <"${text}"
rm "${screenshot}" "${text}"
