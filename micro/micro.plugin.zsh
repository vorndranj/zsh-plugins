if ! type fzf &> /dev/null; then
  return 0
fi

EXPORT MICRO_TRUECOLOR=1