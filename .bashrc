shopt -s histappend

export HISTCONTROL=ignoredups
export HISTSIZE=100000
export BASH_SILENCE_DEPRECATION_WARNING=1

PS1='\[\033[01;36m\]\h:\[\033[01;33m\]\w\[\e[01;$(($??31:37))m\] \$ \[\033[00m\]'

HISTORY_FILE=~/history

_append_history () {
    local LAST_CMD=$(history 1)
    echo "$(date) -- cd $(pwd); $LAST_CMD" >> $HISTORY_FILE
}

PROMPT_COMMAND="_append_history; history -a;"

test -f ~/Documents/programming/dotfiles/dist/z.sh && . ~/Documents/programming/dotfiles/dist/z.sh

export PATH=/opt/homebrew/bin:$PATH
