#!/bin/sh

PROJ=$1

# do we want that?
mkdir -p ~/work/virtualenvs/

mv .ve ~/work/virtualenvs/$PROJ
ln -s ~/work/virtualenvs/$PROJ .ve
