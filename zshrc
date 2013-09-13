# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="foobacca"
# also like bits of wedisagree
# think I want bash version, time on right, vi cmd support
# port over stuff from bash - aliases etc
# nick stuff from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git command-not-found django docker extract fabric history history-substring-search mosh pip python svn tmux tmuxinator vi-mode virtualenv vundle)
# others worth looking at: debian git* 

source $ZSH/oh-my-zsh.sh

# add in the syntax highlighting plugin
source ~/.fresh/build/vendor/zsh-syntax-highlighting.zsh

# use PageUp and PageDown like Ctrl-R
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

# rebind keys for history substring search - they seem to get lost somewhere
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

#
# options
#
setopt interactive_comments  # ignore the # char and after
setopt no_share_history      # don't import shared command history data into shell

#
# exports
#

# Display CPU usage stats for commands taking more than 10 seconds
REPORTTIME=10

#
# - global aliases
#
alias -g G='| grep'
alias -g H='| head'
alias -g L="| less"  # Write L after a command to page through the output.
alias -g T='| tail'
alias -g NUL="> /dev/null 2>&1" # You get the idea.

#
# autoload stuff
#
autoload -U zargs
#autoload -U zmv

# TODO: hash, alias -s (suffix)

if [ -f ~/.fresh/build/shell.sh ]; then
    source ~/.fresh/build/shell.sh
fi
