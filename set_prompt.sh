# Based on: https://gist.github.com/weibeld/f3b6e6187029924a9b3d
# the only thing I added was to change color if received exit code was not 0

# Command that Bash executes just before displaying a prompt
export PROMPT_COMMAND=set_prompt

set_prompt() {
  # Capture exit code of last command
  local ex=$?

  #----------------------------------------------------------------------------#
  # Bash text colour specification:  \e[<STYLE>;<COLOUR>m
  # (Note: \e = \033 (oct) = \x1b (hex) = 27 (dec) = "Escape")
  # Styles:  0=normal, 1=bold, 2=dimmed, 4=underlined, 7=highlighted
  # Colours: 31=red, 32=green, 33=yellow, 34=blue, 35=purple, 36=cyan, 37=white
  #----------------------------------------------------------------------------#
  local color='\e[1;32m'
  local reset='\e[0m'

  # Set prompt content
  PS1="\u@\h:\w$\[$reset\] "
  # If exit code of last command is non-zero, prepend this code to the prompt
  [[ "$ex" -ne 0 ]] && color='\e[1;31m' && PS1="$ex|$PS1"
  # Set colour of prompt
  PS1="\[$color\]$PS1"
}
