#!/bin/bash
# modified from https://github.com/bitterjug/vim-notebook
NOTEFILE=$HOME/tasks/devjournal.md
COMMAND="+NoteAdd"
nvim "$NOTEFILE" "$COMMAND" -c"$" +Wrap
