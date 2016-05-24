shopt -s histappend

export HISTCONTROL=ignoredups
export HISTSIZE=100000

PS1='\[\033[01;36m\]\u@\h:\[\033[01;33m\]\w\[\e[01;$(($??31:37))m\] \$ \[\033[00m\]'

HISTORY_FILE=~/history

_append_history () {
    local LAST_CMD=$(history 1)
    echo "$(date) -- cd $(pwd); $LAST_CMD" >> $HISTORY_FILE
}

_update_window_title () {
    echo -ne "\033]0;${USER-$USERNAME}@${HOSTNAME}: ${PWD}\007"
}

# Maintain $HISTORY_FILE and if this is an xterm set the title to
# user@host:dir
case $TERM in
    uxterm*|xterm*|rxvt*|st*)
        PROMPT_COMMAND="_append_history; history -a; _update_window_title"
        ;;
    *)
        PROMPT_COMMAND="_append_history; history -a"
        ;;
esac

test -f ~/Programming/dotfiles/dist/z.sh && . ~/Programming/dotfiles/dist/z.sh

cd ~
