if [ ! -d "$HOME/.volta"  ]; then
  return 0
fi

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
