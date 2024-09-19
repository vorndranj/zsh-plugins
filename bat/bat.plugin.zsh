if ! type bat &> /dev/null; then
  print "command 'bat' not found. Please install 'bat' before using this plugin."
  return 0
else
  # Save the original under 'ocat'
  alias ocat="$(which cat)"

  alias cat="bat"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi