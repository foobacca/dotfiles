# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -f ~/.fresh/build/shell.sh ]; then
    source ~/.fresh/build/shell.sh
fi

if [ -f ~/.fzf.bash ]; then
    source ~/.fzf.bash
fi

# disable Ctrl-S - but only for interactive shells
if [[ $- == *i* ]]; then
    stty -ixon -ixoff 2>/dev/null
fi
