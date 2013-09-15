#!/usr/bin/env zsh
# from https://github.com/robbyrussell/oh-my-zsh/pull/2075/files

if [[ ! -o interactive ]]; then
  return
fi

_tmuxinator() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(tmuxinator commands)"
  else
    completions="$(tmuxinator completions ${words[2,-2]})"
  fi

  reply=("${(ps:\n:)completions}")
}

compctl -K _tmuxinator tmuxinator mux
