#!/bin/bash

ALLREADY=`git status | grep -n 'Changes not staged for commit:' | cut -d: -f1`


if [ "$ALLREADY" == "" ];
then
  GIT_TARGET_LIST=`git status | egrep '(^\t|^Untracked|staged|Changes)' | sed -e 's/modified://g' | sed 's/new file://g' | sed 's/  //g' | sed -e 's/Changes/\
-Changes/g' | sed -e 's/commit:/commit:/g' | sed -e 's/Untracked/\
-Untracked/g' | fzf --reverse -m`
else
  GIT_TARGET_LIST=`git status | egrep '(^\t|^Untracked|staged|Changes)' | sed -e 's/modified://g' | sed 's/new file://g' | sed 's/  //g' | sed -e 's/Changes/\
-Changes/g' | sed -e 's/commit:/commit:/g' | sed -e 's/Untracked/\
-Untracked/g' | sed -n $AREADY,'$p' | fzf --reverse -m`
fi



if [ -n "$GIT_TARGET_LIST" ]
then
	echo $GIT_TARGET_LIST
  echo `git add $GIT_TARGET_LIST`
fi
