# Yay! High voltage and arrows!

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

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

PROMPT='$(prev_exit) $(venv_active)$(job_count)$(prev_exit_colour)%n@%m:%{$reset_color%}%{$fg[cyan]%}$(abbrev_dir)%{$reset_color%} $(git_prompt_info)%{$fg[cyan]%}⇒%{$reset_color%}  '

