#!/bin/sh

if [ $# -ne '1' ]; then
  echo "you need to specify the directory"
  exit 1
fi

dir=$1

rename 's/ /_/g' $dir/*
rename 's/,//g' $dir/*
rename 's/MP3/mp3/g' $dir/*

