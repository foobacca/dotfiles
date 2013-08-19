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

function abbrev_pwd {
    pwd|sed -e "s!$HOME!~!"|sed -re "s!([^/])[^/]+/!\1/!g"
}

# nicked from https://github.com/twe4ked/dotfiles/blob/master/shell/zsh/prompt.zsh
function prompt_pwd {
    # find git root directory
    if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1; then
        local homerepo=${$(git rev-parse --show-toplevel)/#${HOME}/\~}
        local repopartslen=${#${(s:/:)${homerepo}}}
    fi

    # split the path into it's parts
    parts=(${(s:/:)${${PWD}/#${HOME}/\~}})

    i=0
    while (( i++ < ${#parts} )); do
        part="$parts[i]"
        if [[ $i == ${repopartslen} ]]; then
            # if this part of the path represents the repo,
            # underline it, and skip truncating the component
            parts[i]="%U$part%u"
        elif [[ $i != ${#parts} ]]; then
            # shorten the path as long as it isn't the last piece
            if [[ $part[1,1] == "." ]]; then
                # if this part of the path starts with a dot, then keep
                # the 2nd letter aswell
                parts[i]="$part[1,2]"
            else
                parts[i]="$part[1,1]"
            fi
        fi
    done

    local prompt_path="${(j:/:)parts}"
    if [ "$parts[1]" != "~" ]; then
        prompt_path="/$prompt_path"
    fi
    echo "$prompt_path"
}

function prompt_color {
    if [ "$USER" = "root" ]; then
        echo "red"
    else
        if [ -n "$SSH_TTY" ]; then
            echo "blue"
        else
            echo "cyan"
        fi
    fi
}

# stuff nicked from kphoen.zsh-theme and pygmalion.zsh-theme

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then

    ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[yellow]%}("
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%})%{$reset_color%} "
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}⚡"
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

    # display exitcode when >0
    return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%} )"

    # 1 line prompt
    #RPROMPT='${return_code}$(git_prompt_status) %{$fg[yellow]%}[%*]%{$reset_color%}'
    #PROMPT='%{$fg[blue]%}$(venv_active)%{$fg[magenta]%}$(job_count)%{$fg[green]%}%n@%m:%{$fg[cyan]%}$(abbrev_pwd) $(git_prompt_info)%{$fg[cyan]%}%#%{$reset_color%} '
    # 3 line prompt
    RPROMPT='$(git_prompt_status) %{$fg[yellow]%}[%*]%{$reset_color%}'
    PROMPT='
${return_code}%{$fg[blue]%}$(venv_active)%{$fg[magenta]%}$(job_count)%{$fg[green]%}%n@%m:%{$fg[cyan]%}$(prompt_pwd) $(git_prompt_info)
%{$fg[cyan]%}%#%{$reset_color%} '

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

    # one line prompt
    RPROMPT='${return_code}$(git_prompt_status)'
    PROMPT='$(venv_active)$(job_count)%n@%m:$(abbrev_pwd) $(git_prompt_info)%# '

    # 3 line prompt
    RPROMPT='$(git_prompt_status) [%*]'
    PROMPT='
${return_code}$(venv_active)$(job_count)%n@%m:$(prompt_pwd) $(git_prompt_info)
%# '

fi


# vi: ft=zsh
