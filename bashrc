# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... and ignore same sucessive entries.
HISTCONTROL=ignoreboth

# Expand the history size
HISTFILESIZE=50000
HISTSIZE=5000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# allow use of ** - but only in bash 4.x
if [[ $BASH_VERSION == 4.* ]]; then shopt -s globstar; fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ -d $HOME/bin ]; then
  PATH=$PATH:$HOME/bin
fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#xterm-color)
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
#    ;;
#*)
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
#    ;;
#esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '

RESET=$(tput sgr0)
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)

# abbreviate the dir path in the prompt
PROMPT_COMMAND='CurDir=`pwd|sed -e "s!$HOME!~!"|sed -re "s!([^/])[^/]+/!\1/!g"`'
RET_VALUE='$(RET=$?; if [[ $RET = 0 ]]; then echo -ne "\[$GREEN\]0"; else echo -ne "\[$RED\]$RET"; fi;)'
PS1="$RET_VALUE \u@\h:\$CurDir\[$RESET\]\$ "

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"; history -a; CurDir=`pwd|sed -e "s!$HOME!~!"|sed -re "s!([^/])[^/]+/!\1/!g"`'
    ;;
*)
    ;;
esac

# Make Bash append rather than overwrite the history on disk:
shopt -s histappend
#  Whenever displaying the prompt, write the previous line to disk:
#          PROMPT_COMMAND='history -a'
# done above

# default editor
export EDITOR=vim

# make bc work nicely - use math library
export BC_ENV_ARGS=-l

# CVS exports
export CVS_RSH=ssh
export CVSROOT=":ext:hamish@cvs.aptivate.org:/home/cvs/root/"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

if [ -f ~/Dropbox/config/bash_aliases ]; then
  source ~/Dropbox/config/bash_aliases
fi

if [ -d ~/Dropbox/tech/bin ]; then
  export PATH=/home/mish/Dropbox/tech/bin:$PATH
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# use vim as the man pager instead of less
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# wrap by default
export MOST_SWITCHES="-w"

# stop the pc speaker ever annoying me :)
setterm -bfreq 0

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

