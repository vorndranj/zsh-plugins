if [ ! -d "$HOME/.sdkman"  ]; then
  return 0
fi

export SDKMAN_DIR="$HOME/.sdkman"
source "$SDKMAN_DIR/bin/sdkman-init.sh"
