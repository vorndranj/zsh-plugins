if ! type bat &> /dev/null; then
  return 0
fi

# Save the original under 'ocat'
alias ocat="$(which cat)"

alias cat="bat"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"