#!/bin/bash

basedir="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

repo="$basedir/home"

pushd  "$repo" > /dev/null


find . -mindepth 1 -maxdepth 1 -print | while read file; 
do 
   if [ -e $HOME/${file:2} -a ! -h "$HOME/${file:2}" ]; then
     echo "skipping $HOME/${file:2} as it not a symlink"
     continue
   fi
   rm -rf "$HOME/$file" 
   ln -v -sf "$repo/${file:2}" "$HOME/${file:2}" 
done

popd > /dev/null

