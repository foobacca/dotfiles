#!/bin/sh
#
# Shrink all the images in a directory

if [ $# -ne 1 ]; then
  echo "Must specify directory, use '.' for current directory."
  exit 1
fi

cd $1
mkdir -p orig

cp *.jpg *.JPG orig/

# now do the resize
mogrify -resize 50% *.jpg *.JPG
