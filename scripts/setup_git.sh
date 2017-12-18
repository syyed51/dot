#!/bin/bash


if [ ! -d ~/backup ]  
then
    mkdir -p ~/backup
fi

if [ ! -d ~/.git_templates/hooks ]  
then
    mkdir -p ~/.git_templates/hooks
fi

ln -fs ~/dotfiles       /gitconfig ~/.gitconfig
ln -fs ~/dotfiles       /gitignore_global ~/.gitignore
ln -fs ~/dotfiles       /git/hooks/pre-commit ~/.git_templates/hooks/
