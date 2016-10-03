#!/bin/bash

# These files are not dot files.
exceptions="LICENSE|setup.sh"
# Create symbolic links for all the dotfiles.
for filename in `ls`; do
  if ! echo $filename | grep -q -E $exceptions; then
    symLinkPath="$HOME"/."$filename"
    cmd="ln -s `pwd`/$filename" $symLinkPath
    eval $cmd
    echo $cmd
  fi
done
