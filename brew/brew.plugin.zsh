if ! type brew &> /dev/null; then
  print "command 'brew' not found. Please install 'brew' before using this plugin."
  return 0
else
  eval "$(brew shellenv)"
fi