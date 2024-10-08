if ! type zoxide &> /dev/null; then
  return 0
fi

eval "$(zoxide init --cmd cd zsh)"