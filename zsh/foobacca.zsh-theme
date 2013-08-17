PREV_EXIT_FILE=/tmp/XYZprev_exit

function venv_active {
    if [ -n "${VIRTUAL_ENV:+x}" ]; then
        echo "["${VIRTUAL_ENV##*/}"]"  #`basename \` dirname ${VIRTUAL_ENV}\``]"
    fi
}

function job_count {
    num_jobs=$(jobs -s | wc -l)
    if [ $num_jobs -gt 0 ]; then
        echo "[$num_jobs] "
    fi
}

function abbrev_dir {
    pwd|sed -e "s!$HOME!~!"|sed -re "s!([^/])[^/]+/!\1/!g"
}

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
    PROMPT='%{$fg[blue]%}$(venv_active)%{$fg[magenta]%}$(job_count)%{$fg[green]%}%n@%m:%{$fg[cyan]%}$(abbrev_dir) $(git_prompt_info)%{$fg[cyan]%}%#%{$reset_color%} '
    # 3 line prompt
#    PROMPT='
#%{$fg[blue]%}$(venv_active)%{$fg[magenta]%}$(job_count)%{$fg[green]%}%n@%m:%{$fg[cyan]%}${PWD/#$HOME/~} $(git_prompt_info) %{$fg[yellow]%}[%*]
#%{$fg[cyan]%}%#%{$reset_color%} '

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
    PROMPT='$(venv_active)$(job_count)%n@%m:$(abbrev_dir) $(git_prompt_info)%# '
fi


# vi: ft=zsh
