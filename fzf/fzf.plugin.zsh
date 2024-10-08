if ! type fzf &> /dev/null; then
  return 0
fi

source <(fzf --zsh)