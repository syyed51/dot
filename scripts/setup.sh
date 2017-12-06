#!/bin/bash

mkdir ~/backup
mv ~/.gitconfig ~/backup/
mv ~/.gitignore ~/backup/
mv ~/.bash_profile ~/backup/
mv ~/.vimrc ~/backup/


ln -s ~/configfiles/gitconfig ~/.gitconfig
ln -s ~/configfiles/gitignore_global ~/.gitignore
ln -s ~/configfiles/bash_profile ~/.bash_profile
ln -s ~/configfiles/vimrc ~/.vimrc

chmod +x .
