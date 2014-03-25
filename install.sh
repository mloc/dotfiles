#!/bin/bash

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles/old             # old dotfiles backup directory
files="bashrc screenrc vimrc zshrc tmux.conf tmuxline screenrc vim_runtime vim_plugins"
# list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
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
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    fi
done
