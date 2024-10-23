if ! type docker &> /dev/null; then
  return 0
fi

mkdir -p ~/.docker/completions
docker completion zsh > ~/.docker/completions/_docker

FPATH="$HOME/.docker/completions:$FPATH"
