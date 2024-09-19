if ! type zoxide &> /dev/null; then
  print "command 'zoxide' not found. Please install 'zoxide' before using this plugin."
  return 0
else
  eval "$(zoxide init --cmd cd zsh)"

  alias ..="cd .."
fi