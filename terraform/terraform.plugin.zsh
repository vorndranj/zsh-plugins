if ! type terraform &> /dev/null; then
  return 0
fi

complete -o nospace -C /usr/local/bin/terraform terraform

alias tf=terraform