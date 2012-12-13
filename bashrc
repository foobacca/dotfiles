
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... and ignore same sucessive entries.
HISTCONTROL=ignoreboth

# Expand the history size
HISTFILESIZE=500000
HISTSIZE=50000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make Bash append rather than overwrite the history on disk:
shopt -s histappend
#  Whenever displaying the prompt, write the previous line to disk:
#          PROMPT_COMMAND='history -a'

# allow use of ** - but only in bash 4.x
if [[ $BASH_VERSION == 4.* ]]; then shopt -s globstar; fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

RESET=$(tput sgr0)
GREEN=$(tput setaf 2)
YELLOW="$(tput bold ; tput setaf 3)"
RED=$(tput setaf 1)

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " ("${ref#refs/heads/}")"
}

# abbreviate the dir path in the prompt
PROMPT_COMMAND='history -a; CurDir=`pwd|sed -e "s!$HOME!~!"|sed -re "s!([^/])[^/]+/!\1/!g"`'
RET_VALUE='$(RET=$?; if [[ $RET = 0 ]]; then echo -ne "\[$GREEN\]0"; else echo -ne "\[$RED\]$RET"; fi;)'
PS1="$RET_VALUE \u@\h:\$CurDir\[$YELLOW\]\$(parse_git_branch)\[$RESET\]\$ "

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

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# use vim as the man pager instead of less
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -u ~/.vimrc_light -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# wrap by default
export MOST_SWITCHES="-w"

# have colour output from Django
export DJANGO_COLORs="dark"

# stop the pc speaker ever annoying me :)
setterm -bfreq 0

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/dev/dotfiles/bash_aliases ]; then
  source ~/dev/dotfiles/bash_aliases
fi

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# ssh key stuff for fen-vz-console
if [ `hostname` = 'fen-vz-console' ] && [ -f ~/bin/fixssh-vzconsole ]; then
  source ~/bin/fixssh-vzconsole
fi

# from https://github.com/seebi/dircolors-solarized
if [ -f ~/dev/solarize/dircolors-solarized/dircolors.ansi-universal ]; then
  eval `dircolors ~/dev/solarize/dircolors-solarized/dircolors.ansi-universal`
fi

if [ -d $HOME/bin ]; then
  PATH=$PATH:$HOME/bin
fi

if [ -d ~/Dropbox/tech/bin ]; then
  export PATH=/home/mish/Dropbox/tech/bin:$PATH
fi

if [ -d /var/lib/gems/1.8/bin/ ]; then
  PATH=$PATH:/var/lib/gems/1.8/bin/
fi

if [[ -s $HOME/.tmuxinator/scripts/tmuxinator ]]; then
  source $HOME/.tmuxinator/scripts/tmuxinator
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# check for when the last back up was run
BACKUP_FILE_RECORD=~/.lastbackupdate

if [ -f $BACKUP_FILE_RECORD ]; then
  filemtime=`stat -c %Y ${BACKUP_FILE_RECORD}`
  currtime=`date +%s`
  backup_age=$(( (currtime - filemtime) / 86400 ))

  WARNING_AGE=7
  CRITICAL_AGE=14

  if [ $backup_age -gt $CRITICAL_AGE ]; then
    # if file older than critical
    echo "${RED}Last backup is ${backup_age} days old${RESET}"
  elif [ $backup_age -gt $WARNING_AGE ]; then
    # elif file older than warning
    echo "${GREEN}Last backup is ${backup_age} days old${RESET}"
  fi
fi

