#!/bin/bash

if [ ! -d ~/backup ]  
then
    mkdir -p ~/backup
else
    rm -rf ~/backup/bash_profile
fi

mv -f ~/.bash_profile ~/backup/bash_profile
ln -s ~/dotfiles/bash_profile ~/.bash_profile
 
export PATH=$PATH:~/dotfiles/scripts 
chmod +x .
