#!/bin/bash

# This script creates symlinks from the home directory to any desired dotfiles in ~/.dot-files


# dotfiles directory
dir=~/.dot-files

# old dotfiles backup directory
backupDir=~/.dot-files/_backup

# list of files/folders to symlink in homedir
files="bashrc gitconfig gitignore vimrc vim"


# Create the backup folder for our dotfiles
echo "Creating $backupDir for backup of any existing dotfiles in ~"
mkdir -p $backupDir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $backupDir"
	mv ~/.$file $backupDir
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/.$file
done
