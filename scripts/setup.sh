#!/bin/bash

if [ ! -d ~/backup ]  
then
    mkdir -p ~/backup
else
    rm -rf ~/backup/*
fi

mv -f  ~/.gitconfig ~/backup/gitconfig
mv -f ~/.gitignore ~/backup/gitignore
mv -f ~/.bash_profile ~/backup/bash_profile
mv -f ~/.vimrc ~/backup/vimrc


ln -s ~/configfiles/gitconfig ~/.gitconfig
ln -s ~/configfiles/gitignore_global ~/.gitignore
ln -s ~/configfiles/bash_profile ~/.bash_profile
ln -s ~/configfiles/vimrc ~/.vimrc

chmod +x .
