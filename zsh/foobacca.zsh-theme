# stuff nicked from kphoen.zsh-theme and pygmalion.zsh-theme

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then

    ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}("
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%})%{$reset_color%} "
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[blue]%} ✚"
    ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✭"
    ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ~"
    ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[green]%} ✖"
    ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%} ?"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[magenta]%} U"
    ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[cyan]%} ⬋"
    ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[yellow]%}↑"
    ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[yellow]%}↓"
    ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg[yellow]%}↕"

    # display exitcode on the right when >0
    return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%} )"

    RPROMPT='${return_code}$(git_prompt_status)%{$reset_color%}'

#    PROMPT='%{$fg[red]%}%n%{$reset_color%}:%{$fg[blue]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
#❯ '
else

    ZSH_THEME_GIT_PROMPT_PREFIX="("
    ZSH_THEME_GIT_PROMPT_SUFFIX=")"
    ZSH_THEME_GIT_PROMPT_DIRTY="⚡"
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
    ZSH_THEME_GIT_PROMPT_MODIFIED=" ✭"
    ZSH_THEME_GIT_PROMPT_RENAMED=" ~"
    ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
    ZSH_THEME_GIT_PROMPT_UNMERGED=" ?"
    ZSH_THEME_GIT_PROMPT_UNTRACKED=" U"
    ZSH_THEME_GIT_PROMPT_STASHED=" ⬋"
    ZSH_THEME_GIT_PROMPT_AHEAD="↑"
    ZSH_THEME_GIT_PROMPT_BEHIND="↓"
    ZSH_THEME_GIT_PROMPT_DIVERGED="↕"

    # display exitcode on the right when >0
    return_code="%(?..%? ↵ )"

    RPROMPT='${return_code}$(git_prompt_status)'

#    PROMPT='[%n@%m:%~$(git_prompt_info)]
#%# '
fi


PREV_EXIT_FILE=/tmp/XYZprev_exit

function prev_exit {
    previous_exit_code=$?
    echo $previous_exit_code > $PREV_EXIT_FILE
    if [ $previous_exit_code -eq 0 ]; then
        echo "%{$fg[green]%}${previous_exit_code}%{$reset_color%}"
    else
        echo "%{$fg[red]%}${previous_exit_code}%{$reset_color%}"
    fi
}

function prev_exit_colour {
    previous_exit_code=$(cat $PREV_EXIT_FILE)
    if [ $previous_exit_code -eq "0" ]; then
        echo "%{$fg[green]%}"
    else
        echo "%{$fg[red]%}"
    fi
}

function venv_active {
    if [ -n "${VIRTUAL_ENV:+x}" ]; then
        echo "%{$fg[blue]%}["${VIRTUAL_ENV##*/}"]%{$reset_color%}" #`basename \` dirname ${VIRTUAL_ENV}\``]"
    fi
}

function job_count {
    num_jobs=$(jobs -s | wc -l)
    if [ $num_jobs -gt 0 ]; then
        echo "%{$fg[magenta]%}[$num_jobs]%{$reset_color%} "
    fi
}

function abbrev_dir {
    pwd|sed -e "s!$HOME!~!"|sed -re "s!([^/])[^/]+/!\1/!g"
}

PROMPT='$(prev_exit) $(venv_active)$(job_count)$(prev_exit_colour)%n@%m:%{$reset_color%}%{$fg[cyan]%}$(abbrev_dir)%{$reset_color%} $(git_prompt_info)%{$fg[cyan]%}%#%{$reset_color%} '

# vi: ft=zsh
