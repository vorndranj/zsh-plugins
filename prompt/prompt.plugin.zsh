DEFAULT_PROMPT=$'%F{${TIME_PROMPT_COLOR:-green}}%D{%K:%M}%f %F{${USER_PROMPT_COLOR:-red}}%n%f %F{${FOLDER_PROMPT_COLOR:-magenta}}%~%f '
0=${(%):-%N}

#env variable needs to be defined, before the plugin is loaded
if [ ! "$DISABLE_EXECUTION_TIME_PROMPT" = "true" ]; then
  #This requires $DEFAULT_PROMPT to be set or else only the execution time is shown as the prompt
  source ${0:A:h}/functions/execution-time-prompt.zsh
fi

#env variable needs to be defined, before the plugin is loaded
if [ ! "$DISABLE_GIT_PROMPT" = "true" ]; then
  source ${0:A:h}/functions/git-prompt.zsh

  if type git_prompt_status &> /dev/null; then
    #allows commands in the prompt that get re-evaluated after a command (https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Expansion-of-Prompt-Sequences)
    setopt PROMPT_SUBST

    DEFAULT_PROMPT+='$(git_prompt_status)'
  fi
fi

DEFAULT_PROMPT+=$'\n> '
PS1=$DEFAULT_PROMPT

