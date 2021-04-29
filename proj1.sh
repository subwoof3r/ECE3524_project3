#!/bin/bash

#Test for file read permissions
if ! [ -r /home ] ; then
  echo "No read permission on file or directory"
  exit 1
fi

#generate tree
find $HOME | sed "s/[^-][^\/]*\//-/g" | sed ':a;N;$!ba;s/\n/<br>/g' > filetree.html

exit 0
