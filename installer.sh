#!/bin/sh

missing_programs=""

for program in conky foot mako mpd sway zsh
do
  if ! command -v "${program}" >/dev/null 2>&1
  then
    missing_programs="${missing_programs} ${program}"
    echo "${program}: program not found!"
  fi
done

if [ -n "${missing_programs}" ]
then
  printf "\n"

  while printf 'Install missing programs with pacman? [Y/n]: '; do
    read -r ans || exit 1

    case "${ans}" in
      ""|[Yy]|[Yy][Ee][Ss])

        if command -v pacman >/dev/null 2>&1
        then
          if [ "$(id -u)" -ne 0 ]
          then
            if command -v sudo >/dev/null 2>&1
            then
              sudo pacman --noconfirm -S --needed ${missing_programs}
            else
              echo 'sudo: program not found!'
            fi
          else
            pacman --noconfirm -S --needed ${missing_programs}
          fi
        else
          echo 'pacman: program not found!'
        fi

        break
        ;;
      [Nn]|[Nn][Oo])
        break
        ;;
      *)
        echo 'Please answer y or n.'
        ;;
    esac
  done

  printf "\n"
fi

printf 'Installing config files...\n'

for directory in conky foot mako mpd sway tofi zsh
do
  if command -v "${directory}" >/dev/null 2>&1
  then
    cp -ri "${directory}" ~/.config/
  else
    echo "${directory}: program not found!"
  fi
done

if command -v pacman >/dev/null 2>&1
then
  if [ "$(id -u)" -ne 0 ]
  then
    if command -v sudo >/dev/null 2>&1
    then
      sudo cp -i pacman/pacman.conf /etc/pacman.conf && sudo cp -ri pacman/pacman.d /etc/
    else
      echo 'sudo: program not found!'
    fi
  else
    cp -i pacman/pacman.conf /etc/pacman.conf && cp -ri pacman/pacman.d /etc/
  fi
else
  echo 'pacman: program not found!'
fi

if [ "$(tail -1 ~/.zshenv)" != 'export ZDOTDIR="${HOME}"/.config/zsh' ]
then
  echo 'export ZDOTDIR="${HOME}"/.config/zsh' >> ~/.zshenv
fi

if command -v yay >/dev/null 2>&1
then
  yay --save --answerdiff None --answerclean None --version > /dev/null
fi

mkdir -pv "${HOME}/Pictures/Screenshots"
