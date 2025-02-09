for file ('.variables' '.aliases' '.options' '.keybindings')
  [ -s "$file" ] && . "$file"

[ -s /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ] && . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
[ -s /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ] && . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
