if [ ! -d "$HOME/.volta"  ]; then
  print "'.volta' folder not found. Please install 'volta' before using this plugin."
  return 0
else
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
fi