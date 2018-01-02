#!/bin/bash


if [ ! -d ~/backup ]  
then
    mkdir -p ~/backup
fi

if [ ! -d ~/.git_templates/hooks ]  
then
    mkdir -p ~/.git_templates/hooks
fi

ln -fs ~/dotfiles/gitconfig ~/.gitconfig
ln -fs ~/dotfiles/gitignore_global ~/.gitignore

# Note
# Rememnber to reinitialize the repo, to use hooks.
# git init
ln -fs ~/dotfiles/git/hooks/pre-commit ~/.git_templates/hooks/
