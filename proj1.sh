#!/bin/bash

#Test for correct number of arguments
if [ "$#" -ne 2 ] ; then
  echo "Incorrect number of Arguments only 2 arguments should be provided"
  exit 1
fi

#Test for file read permissions
if ! [ -r $1 ] ; then
  echo "No read permission on file or directory"
  exit 1
fi

#generate tree
find $1 | sed "s/[^-][^\/]*\//-/g" | sed ':a;N;$!ba;s/\n/<br>/g' > $2

exit 0
