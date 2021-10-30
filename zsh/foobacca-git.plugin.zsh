# Get the status of the working tree
git_prompt_status_foobacca() {
  INDEX=$(command git status --porcelain -b 2> /dev/null)
  if [[ -z $INDEX ]]; then
    return
  fi

  STATUS=""
  if $(echo "$INDEX" | grep -E '^\?\? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi

  # now we get the status for the staging/index area
  INDEX_STATUS=""
  if $(echo "$INDEX" | grep '^A[ MDAU] ' &> /dev/null); then
    INDEX_STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$INDEX_STATUS"
  fi
  if $(echo "$INDEX" | grep '^C[ MD]  ' &> /dev/null); then
    INDEX_STATUS="$ZSH_THEME_GIT_PROMPT_COPIED$INDEX_STATUS"
  fi
  if $(echo "$INDEX" | grep '^M[ MD] ' &> /dev/null); then
    INDEX_STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$INDEX_STATUS"
  fi
  if $(echo "$INDEX" | grep '^R[ MD] ' &> /dev/null); then
    INDEX_STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED$INDEX_STATUS"
  fi
  if $(echo "$INDEX" | grep '^D[ UM] ' &> /dev/null); then
    INDEX_STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$INDEX_STATUS"
  fi
  if [[ -n $INDEX_STATUS ]]; then
    STATUS="$ZSH_THEME_GIT_PROMPT_INDEX_PREFIX$INDEX_STATUS$STATUS"
  fi

  # now we get the status for the working area
  WORKING_STATUS=""
  if $(echo "$INDEX" | grep '^[ MARC]M ' &> /dev/null); then
    WORKING_STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$WORKING_STATUS"
  fi
  if $(echo "$INDEX" | grep '^[MARCDU ]D ' &> /dev/null); then
    WORKING_STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$WORKING_STATUS"
  fi
  if [[ -n $WORKING_STATUS ]]; then
    STATUS="$ZSH_THEME_GIT_PROMPT_WORKING_PREFIX$WORKING_STATUS$STATUS"
  fi

  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STASHED$STATUS"
  fi

  UNMERGED_STATUS=""
  if $(echo "$INDEX" | grep '^A[AU] ' &> /dev/null); then
    UNMERGED_STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$UNMERGED_STATUS"
  elif $(echo "$INDEX" | grep '^UA ' &> /dev/null); then
    UNMERGED_STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$UNMERGED_STATUS"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    UNMERGED_STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$UNMERGED_STATUS"
  fi
  if $(echo "$INDEX" | grep '^D[UD] ' &> /dev/null); then
    UNMERGED_STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$UNMERGED_STATUS"
  elif $(echo "$INDEX" | grep '^UD ' &> /dev/null); then
    UNMERGED_STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$UNMERGED_STATUS"
  fi
  if [[ -n $UNMERGED_STATUS ]]; then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED_PREFIX$UNMERGED_STATUS$STATUS"
  fi

  if $(echo "$INDEX" | grep '^## .*ahead.*behind' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DIVERGED$STATUS"
  elif $(echo "$INDEX" | grep '^## .*ahead' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_AHEAD$STATUS"
  elif $(echo "$INDEX" | grep '^## .*behind' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_BEHIND$STATUS"
  fi
  echo $STATUS
}
