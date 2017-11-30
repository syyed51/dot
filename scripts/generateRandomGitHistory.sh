#!/bin/bash
 
#
# Generate git history with three branches. 
# 1. master
# 2. office
# 3. home
# 
# git-rebase 

echo "initialize empty directory"
git init --quiet

echo "make a master commit"
echo "master file contents" > master.md
git add master.md
git ci -m "master"

 
echo "Create branches"
git br office
git br home

git co office
echo "office file contents."> office.md
git add office.md
git ci -m "office"

echo "office file contents.">> office.md
git add office.md
git ci -m "office"

git co home
echo "home file contents." > home.md
git add home.md
git ci -m "home"

echo "home file contents." >> home.md
git add home.md
git ci -m "home"

git co office

# This script is part of git practice project, to practice
