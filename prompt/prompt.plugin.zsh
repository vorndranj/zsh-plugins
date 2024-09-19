DEFAULT_PROMPT=$'%F{green}%D{%K:%M}%f %F{red}%n%f %F{magenta}%~%f '

0=${(%):-%N}

#This requires $DEFAULT_PROMPT to be set or else only the execution time is shown as the prompt
source ${0:A:h}/functions/execution-time-prompt.zsh

source ${0:A:h}/functions/git-prompt.zsh

if type git_prompt_status &> /dev/null; then
  #allows commands in the prompt that get re-evaluated after a command (https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Expansion-of-Prompt-Sequences)
  setopt PROMPT_SUBST

  DEFAULT_PROMPT+='$(git_prompt_status)'
fi

DEFAULT_PROMPT+=$'\n> '
PS1=$DEFAULT_PROMPT

