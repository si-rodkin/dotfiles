#
# zsh init config
#

###
# Prompt
PROMPT='[ %B%F{blue}%~%f%b ] %B%F{green}$%f%b '

###
# Syntax Highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[command]='fg=blue,bold' 
ZSH_HIGHLIGHT_STYLES[alias]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[default]='fg=blue,bold'

###
# Autocomplite
autoload -Uz compinit
compinit

# Styles
zstyle ':completion:*:description' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

###
# Command correction
setopt correctall

###
# Aliases

# std
alias p='sudo sp'
alias q='exit'

# My scripts
alias getbs='~/.bin/python_sysadm_scripts/get_bat_charge.py'

# Command aliases
alias upsetzsh='source ~/.zshrc'

