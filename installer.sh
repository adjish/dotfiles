#!/bin/sh

for directory in conky foot mako mpd sway tofi zsh
do
  if command -v "${directory}" >/dev/null 2>&1
  then
    cp -ri "${directory}" ~/.config/
  else
    echo "${directory}": program not found!
  fi
done

if command -v pacman >/dev/null 2>&1
then
  if command -v sudo >/dev/null 2>&1
  then
    sudo cp -i pacman/pacman.conf /etc/pacman.conf && sudo cp -ri pacman/pacman.d /etc/
  else
    echo sudo: program not found!
  fi
else
  echo pacman: program not found!
fi

echo 'export ZDOTDIR="${HOME}"/.config/zsh' >> ~/.zshenv

if command -v yay >/dev/null 2>&1
then
  yay --save --answerdiff None --answerclean None --version > /dev/null
fi
