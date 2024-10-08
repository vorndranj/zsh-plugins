if ! type git &> /dev/null; then
  print "command 'git' not found. Please install 'git' before using this plugin."
  return 0
else

  # Handle $0 according to the standard:
  # https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
  0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
  0="${${(M)0:#/*}:-$PWD/$0}"

  function update_git_branch_variables() {
    GIT_BRANCH="${$(git branch --show-current):-"$(git rev-parse --short HEAD)"}"
    GIT_AHEAD=$(git rev-list --count @{upstream}..HEAD 2>/dev/null)
    GIT_BEHIND=$(git rev-list --count HEAD..@{upstream} 2>/dev/null)
  }

  function update_git_status_variables() {
    GIT_ADDED=0
    GIT_MODIFIED=0
    GIT_DELETED=0
    GIT_UNTRACKED=0

    GIT_STATUS=$(git status --porcelain -uall 2>/dev/null)

    while IFS= read -r line; do
      if [[ "$line" =~ '^\?\?.*' ]]; then
        GIT_UNTRACKED=$((GIT_UNTRACKED+1))
      else
        if [[ "$line" =~ ^.?A.* ]]; then
          GIT_ADDED=$((GIT_ADDED+1))
        elif [[ "$line" =~ ^.?(M|R).* ]]; then
          GIT_MODIFIED=$((GIT_MODIFIED+1))
        elif [[ "$line" =~ ^.?D.* ]]; then
          GIT_DELETED=$((GIT_DELETED+1))
        fi
      fi
      done <<< "$GIT_STATUS"
  }

  function compose_git_prompt_string() {
    GIT_PROMPT_BRANCH="%F{${GIT_PROMPT_BRANCH_PREFIX_COLOR:-white}}on%f %F{${GIT_PROMPT_BRANCH_COLOR:-black}}$GIT_BRANCH%f"
    GIT_PROMPT_AHEAD="%F{${GIT_PROMPT_AHEAD_COLOR:-green}}↑$GIT_AHEAD%f"
    GIT_PROMPT_BEHIND="%F{${GIT_PROMPT_BEHIND_COLOR:-blue}}↓$GIT_BEHIND%f"

    GIT_PROMPT_ADDED="%F{${GIT_PROMPT_ADDED_COLOR:-green}}+$GIT_ADDED%f"
    GIT_PROMPT_MODIFIED="%F{${GIT_PROMPT_MODIFIED_COLOR:-blue}}●$GIT_MODIFIED%f"
    GIT_PROMPT_DELETED="%F{${GIT_PROMPT_DELETED_COLOR:-red}}-$GIT_DELETED%f"
    GIT_PROMPT_UNTRACKED="%F{${GIT_PROMPT_UNTRACKED_COLOR:-red}}?$GIT_UNTRACKED%f"

    SEPARATOR=" "

    GIT_PROMPT="$GIT_PROMPT_BRANCH"

    if [ "$GIT_AHEAD" -ne "0" ]; then
      GIT_PROMPT+="$SEPARATOR$GIT_PROMPT_AHEAD"
    fi

    if [ "$GIT_BEHIND" -ne "0" ]; then
      GIT_PROMPT+="$SEPARATOR$GIT_PROMPT_BEHIND"
    fi

    if [ "$GIT_ADDED" -ne "0" ]; then
      GIT_PROMPT+="$SEPARATOR$GIT_PROMPT_ADDED"
    fi

    if [ "$GIT_MODIFIED" -ne "0" ]; then
      GIT_PROMPT+="$SEPARATOR$GIT_PROMPT_MODIFIED"
    fi

    if [ "$GIT_DELETED" -ne "0" ]; then
      GIT_PROMPT+="$SEPARATOR$GIT_PROMPT_DELETED"
    fi

    if [ "$GIT_UNTRACKED" -ne "0" ]; then
      GIT_PROMPT+="$SEPARATOR$GIT_PROMPT_UNTRACKED"
    fi

    echo "$GIT_PROMPT"
  }

  function git_prompt_status() {
    if git rev-parse --git-dir &> /dev/null; then
      update_git_branch_variables
      update_git_status_variables
      compose_git_prompt_string
    fi
  }

fi