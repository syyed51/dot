#!/bin/bash


if [ ! -d ~/backup ]  
then
    mkdir -p ~/backup
else
    rm -rf ~/backup/vimrc
fi

mv -f ~/.vimrc ~/backup/vimrc
ln -s ~/configfiles/vimrc ~/.vimrc
