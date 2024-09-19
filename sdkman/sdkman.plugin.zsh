if [ ! -d "$HOME/.sdkman"  ]; then
  print "'.sdkman' folder not found. Please install 'sdkman' before using this plugin."
  return 0
else
  export SDKMAN_DIR="$HOME/.sdkman"
  source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi