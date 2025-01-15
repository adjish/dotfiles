XDG_DATA_HOME=$HOME/.local/share
XDG_CONFIG_HOME=$HOME/.config
XDG_STATE_HOME=$HOME/.local/state
XDG_CACHE_HOME=$HOME/.cache
HISTFILE="${XDG_STATE_HOME}"/zsh/history
HISTSIZE=20000
SAVEHIST=10000
PS1=' %B%F{1}%(?..%? )%F{3}%d%f:%F{6}%m%f%# '

[ -s .aliases ] && source .aliases
[ -s .options ] && source .options
[ -s .keybindings ] && source .keybindings
