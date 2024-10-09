if ! type thefuck &> /dev/null; then
  return 0
fi

eval "$(thefuck --alias)"