#!/bin/sh

if [ "$(id -u)" -eq 0 ]
then
  run_as_root() { "$@"; }
elif command -v sudo > /dev/null 2>&1
then
  run_as_root() { sudo "$@"; }
else
  run_as_root() { echo 'sudo: program not found!' >&2; return 1; }
fi

missing_programs=""

for program in conky foot mako mpd sway zsh
do
  if ! command -v "${program}" > /dev/null 2>&1
  then
    missing_programs="${missing_programs} ${program}"
    echo "${program}: program not found!"
  fi
done

if [ -n "${missing_programs}" ]
then
  if command -v pacman > /dev/null 2>&1
  then
    while printf '\nInstall missing programs with pacman? [Y/n]: '; do
      read -r answer || exit 1

      case "${answer}" in
        ''|[Yy]|[Yy][Ee][Ss])
          run_as_root pacman --noconfirm -S --needed ${missing_programs}
          break
          ;;
        [Nn]|[Nn][Oo])
          break
          ;;
        *)
          echo 'Please answer "y" or "n".'
          ;;
      esac
    done
  else
    echo 'pacman: program not found!'
  fi

  printf '\n'
fi

printf 'Installing config files...\n'

mkdir -p "${HOME}/.config"

for directory in conky foot mako mpd sway tofi zsh
do
  if command -v "${directory}" > /dev/null 2>&1
  then
    cp -ri "${directory}" ~/.config/
  else
    case "${missing_programs}" in
      *"${directory}"*)
        ;;
      *)
        echo "${directory}: program not found!"
        ;;
    esac
  fi
done

if command -v pacman > /dev/null 2>&1
then
  run_as_root cp -i pacman/pacman.conf /etc/pacman.conf &&
  run_as_root cp -ri pacman/pacman.d /etc/
else
  echo 'pacman: program not found!'
fi

zshenv_line='export ZDOTDIR="${HOME}"/.config/zsh'

if ! grep -qxF -- "$zshenv_line" "${HOME}/.zshenv" 2>/dev/null
then
  printf '%s\n' "$zshenv_line" >>"${HOME}/.zshenv"
fi

if command -v yay > /dev/null 2>&1
then
  yay --save --answerdiff None --answerclean None --version > /dev/null
fi

mkdir -pv "${HOME}/Pictures/Screenshots"
