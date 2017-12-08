#!/bin/bash


if [ ! -d ~/backup ]  
then
    mkdir -p ~/backup
else
    rm -rf ~/backup/gitconfig
    rm -rf ~/.backup/gitignore
fi

mv -f  ~/.gitconfig ~/backup/gitconfig
mv -f ~/.gitignore ~/backup/gitignore

ln -s ~/configfiles/gitconfig ~/.gitconfig
ln -s ~/configfiles/gitignore_global ~/.gitignore
