if ! type brew &> /dev/null; then
  return 0
fi

eval "$(brew shellenv)"