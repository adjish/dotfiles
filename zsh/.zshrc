for file in \
  ~/.config/zsh/.variables \
  ~/.config/zsh/.aliases \
  ~/.config/zsh/.options \
  ~/.config/zsh/.keybindings \
  /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh \
  /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh \
  /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh \
  /etc/profile.d/autojump.sh
do
  [[ -s "${file}" ]] && . "${file}"
done
