#!/usr/bin/env bash

for file in `find $(cd $(dirname $BASH_SOURCE) && pwd)/ -type f ` ; do
  if [ $file = $BASH_SOURCE ]; then 
    continue
  fi 
  source $file 
done
