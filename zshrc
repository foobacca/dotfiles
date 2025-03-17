# required for pycharm to find docker-compose - I think
if [[ -f /etc/zprofile ]]; then
    source /etc/zprofile
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="foobacca"
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export FZF_BASE="/opt/homebrew/opt/fzf"
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    fzf
    foobacca-git
    git
    history
    history-substring-search
    pip
    # pyenv
    python
    #tmux
    #tmuxinator
    virtualenv
    virtualenvwrapper
    zsh-syntax-highlighting
    #zsh-vi-mode
)
# Others to consider
# history? 
# vi-mode - the default one, replaced by zsh-vi-mode, which is more powerful

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


# Use native zsh vi mode
bindkey -v

# rebind keys for history substring search - they seem to get lost somewhere
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

#
# options
#
setopt extendedglob          # allow more options for pattern matching directories
setopt interactive_comments  # ignore the # char and after
setopt no_share_history      # don't import shared command history data into shell
setopt rm_star_silent     # stop asking me to comfirm * deletes

#
# exports
#

# Display CPU usage stats for commands taking more than 10 seconds
REPORTTIME=10

#
# autoload stuff
#
autoload -U zargs
#autoload -U zmv

# disable Ctrl-S/Ctrl-Q
setopt noflowcontrol

# TODO: hash, alias -s (suffix)

if [ -f ~/.fresh/build/shell.sh ]; then
    source ~/.fresh/build/shell.sh
fi

# TODO: fzf
# if [ -f ~/.fzf.zsh ]; then
#     source ~/.fzf.zsh
# fi

# Mac only
# this shows 85 days after the last password change, whenever you start a new terminal.
if [ -f /usr/bin/dscl ]; then
    # unix timestamp of last change
    last_pw_change=$(dscl . read $HOME | grep -A 1 passwordLast | grep real | cut -d'>' -f 2 | cut -d'.' -f 1)
    now=$(date +%s)
    eighty_days=$((80*24*60*60))
    eighty_five_days=$((85*24*60*60))
    next_pw_change=$(echo $((last_pw_change+eighty_five_days)) | xargs date -r)
    echo "Next password change due: $next_pw_change"
    if [[ $now -gt $((last_pw_change+eighty_days)) ]]; then
        RED='\033[0;31m'
        NC='\033[0m' # No Color
        echo "${RED}     ***** LESS THAN 5 DAYS LEFT *****${NC}"
    fi
fi

# powerlevel10k bits
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
if [ -f ~/.p10k.zsh ]; then
    source ~/.p10k.zsh
fi

# Linuxbrew stuff
if [ -d /home/linuxbrew/.linuxbrew ]; then
  export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
  export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
  export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
  fpath[1,0]="/home/linuxbrew/.linuxbrew/share/zsh/site-functions";
  export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}";
  [ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}";
  export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";
fi

# alternative pyenv activate
function pyenv-activate() {source $HOME/.pyenv/versions/${1}/bin/activate}

# tre-command make editing easier
tre() { command tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null; }
