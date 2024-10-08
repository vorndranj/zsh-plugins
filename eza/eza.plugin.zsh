if ! type eza &> /dev/null; then
  return 0
fi

alias ls='eza --color=always -F --group-directories-first'
alias ll='eza --color=always -loF --group-directories-first'
alias la='eza --color=always -laoF --group-directories-first'

alias tree='eza --tree'