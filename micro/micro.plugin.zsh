if ! type fzf &> /dev/null; then
  return 0
fi

export MICRO_TRUECOLOR=1