#!/usr/bin/env zsh
  
precmd() {
  # Capture exit code of last command
  local ex=$?

  local color='%F{10}'

  # Set prompt content
  PS1="%n@%m:%d\$ "
  # If exit code of last command is non-zero, prepend this code to the prompt
  [[ "$ex" -ne 0 ]] && color='%F{9}' && PS1="$ex|$PS1"
  # Set colour of prompt
  PS1="${color}$PS1%f"
}
