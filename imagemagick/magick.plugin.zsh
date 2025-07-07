if ! type magick &> /dev/null; then
  return 0
fi

alias resize="$(dirname "$0")/magick.resize"