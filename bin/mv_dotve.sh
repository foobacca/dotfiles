#!/bin/sh

if [ $# -ne 1 ]; then
  echo "need to give project name"
  exit 1
fi

PROJ=$1

# do we want that?
mkdir -p ~/work/virtualenvs/

mv -i .ve ~/work/virtualenvs/$PROJ
ln -s ~/work/virtualenvs/$PROJ .ve
