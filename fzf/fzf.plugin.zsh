if ! type fzf &> /dev/null; then
  print "command 'fzf' not found. Please install 'fzf' before using this plugin."
  return 0
else
  source <(fzf --zsh)
fi