#!/bin/bash
if echo "$PATH" | grep dotfiles
then
	echo "No need to export dotfiles path"
else
    export PATH=$PATH:~/dotfiles/scripts 
fi

chmod +x .

. ~/dotfiles/scripts/setup_git.sh
. ~/dotfiles/scripts/setup_bash.sh
. ~/dotfiles/scripts/setup_vim.sh