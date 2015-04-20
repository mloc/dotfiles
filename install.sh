#!/bin/bash

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles/old             # old dotfiles backup directory
files="bashrc screenrc vimrc zshrc zsh tmux.conf tmuxline screenrc vim weechat commonrc"
# list of files/folders to symlink in homedir

# create dotfiles_old in homedir
if ! [[ -d $olddir ]]; then
    echo "Creating $olddir for backup of any existing dotfiles in ~"
    mkdir -p $olddir
    echo "...done"
fi

# change to the dotfiles directory
echo "Moving to $dir"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    if [[ -L ~/.$file ]]; then
        echo ".$file already symlinked in ~"
    else
        if [[ -e ~/.$file ]]; then
            echo "Moving .$file from ~ to $olddir"
            mv ~/.$file $olddir/$file
        fi
        echo "Creating symlink to .$file in ~"
        ln -s $dir/$file ~/.$file
    fi
done
