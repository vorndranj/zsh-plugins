if ! type starship &> /dev/null; then
  return 0
fi

eval "$(starship init zsh)"