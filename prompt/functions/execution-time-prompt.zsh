zmodload zsh/datetime
NEWLINE=$'\n'
LC_NUMERIC=C

__execution_time_format() {
  local hours=$(printf '%u' $(($1 / 3600)))
  local mins=$(printf '%u' $((($1 - hours * 3600) / 60)))
  local secs=$(printf "%.3f" $(($1 - 60 * mins - 3600 * hours)))

  if [[ ! "${mins}" == "0" ]] || [[ ! "${hours}" == "0" ]]; then
    secs=${secs%\.*}
  elif [[ "${secs}" =~ "^0\..*" ]]; then
    secs="${${${secs#0.}#0}#0}m"
  else
    secs=${secs%?}
  fi

  local duration=$(echo "${hours}h:${mins}m:${secs}s")
  echo "%F{${EXECUTION_TIME_PROMPT_COLOR:-yellow}}${${duration#0h:}#0m:}%f"
}

__execution_time_start() {
  __execution_start_time=$EPOCHREALTIME
}

__execution_time_display() {
  if [ -n "${__execution_start_time}" ]; then
    local execution_end_time=$EPOCHREALTIME
    local timeDiff=$((execution_end_time - __execution_start_time))
    unset __execution_start_time

    local timeDiffFormatted=$(__execution_time_format ${timeDiff})

    export PS1="$timeDiffFormatted${NEWLINE}${NEWLINE}$DEFAULT_PROMPT"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook preexec __execution_time_start
add-zsh-hook precmd __execution_time_display