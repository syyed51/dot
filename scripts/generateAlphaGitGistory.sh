#!/bin/bash
 
#
# Generate git history with three branches. 
# 1. master
# 2. office
# 3. home
# 
# Merge office, home and master
# Then make a commit on master to get alpha configuration
# no conflicts please.
#
#       Task
#       move last commit on master to office and delete it from master.
#       master branch is for merging not commiting
# git-rebase 2

echo "initialize empty directory"
git init --quiet

echo "make a master commit"
echo "master file contents" > master.md
git add master.md
git ci -m "master commit"

 
echo "Create branches"
git br office
git br home

git co office
echo "add commits to office branch"
echo "office file contents."> office.md
git add office.md
git ci -m "office commit"

git co home
echo "add commits to home branch"
echo "home file contents." > home.md
git add home.md
git ci -m "home commit"

git co office
git merge home -m "Merge office -> home"
git co home 
git merge office -m "Merge office <- home"
git co master
git merge office -m "Merge office -> master"

git co master
echo "add commits to master branch"
echo "second commit in master, after merge." >> master.md
git add master.md
git ci -m "master commit"

echo "Happy rebase practicing :)"



# This script is part of git practice project, to practice
