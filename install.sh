#!/bin/bash
set -e

DOTFILES="Xresources i3 emacs"

prefix=$(pwd)
for dotfile in $DOTFILES ; do
    target_name=~/.$dotfile
    printf "%-15s-> %s\n" "$dotfile" "$target_name"
    [ -e $target_name ] && mv $target_name $target_name.old
    ln -sT $prefix/$dotfile $target_name
done
