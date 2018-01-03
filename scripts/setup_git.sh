#!/bin/bash


if [ ! -d ~/backup ]  
then
    mkdir -p ~/backup
fi

if [ ! -d ~/.git_templates/hooks ]  
then
    mkdir -p ~/.git_templates/hooks
fi

ln -fs ~/configfiles/gitconfig ~/.gitconfig
ln -fs ~/configfiles/gitignore_global ~/.gitignore
ln -fs ~/configfiles/git/hooks/pre-commit ~/.git_templates/hooks/
