#!/bin/bash
# modified from https://github.com/bitterjug/vim-notebook
NOTEFILE=$HOME/tasks/devjournal.md
COMMAND="call Note_add()"
nvim -c"$COMMAND" "$NOTEFILE" -c"$" +Wrap
