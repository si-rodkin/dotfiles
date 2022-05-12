#
# zsh init config
#

###
# zsh history file settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '(%F{red}%s%f)-[%F{green}%b%f]%u%c'
zstyle ':vcs_info:bzr:*' formats '(%F{red}%s%f)-[%F{green}%b%f]%u%c'
zstyle ':vcs_info:svn:*' formats '(%F{red}%s%f)-[%F{green}%b%f]%u%c'
zstyle ':vcs_info:hg:*' formats '(%F{red}%s%f)-[%F{green}%b%f]%u%c'

###
# Prompt
PROMPT=' %F{blue}%~%f$ '

###
# Global Variables
export EDITOR=/usr/bin/vim

###
# Syntax Highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[command]='fg=blue,bold' 
ZSH_HIGHLIGHT_STYLES[alias]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[default]='fg=blue,bold'

###
# Autocomplite
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_option+=(globdots)

# Styles
zstyle ':completion:*:description' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

###
# Command correction
setopt correctall

###
# Autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

###
# Aliases

# std
alias q='exit'
alias ls='ls -Fh --color'
alias la='ls -a'
alias ll='ls -l'
alias lla='ll -a'

alias cp='cp -r'
alias rm='rm -r'

# Command aliases
alias upsetzsh='source ~/.zshrc'

function set-title () {
    info_print  $'\e]0;' $'\a' "$@"
}

function info_print () {
    local esc_begin esc_end
    esc_begin="$1"
    esc_end="$2"
    shift 2
    printf '%s' ${esc_begin}
    printf '%s' "$*"
    printf '%s' "${esc_end}"
}

