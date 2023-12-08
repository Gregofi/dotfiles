#!/bin/bash -e

read -p "This removes all of your old configs, are you sure? [y]" -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi


mkdir ~/.config -r

rm -rf ~/.config/nvim
ln -s ${PWD}/nvim ~/.config/nvim

rm -rf ~/.vimrc
ln -s ${PWD}/.vimrc ~/.vimrc

rm -rf ~/.config/alacritty
ln -s ${PWD}/alacritty ~/.config/alacritty

rm -rf ~/i3
ln -s i3 ~/.config/i3

rm -rf ~/.config/fontconfig
ln -s ${PWD}/fontconfig ~/.config/fontconfig

rm -rf ~/.config/i3status-rs
ln -s ${PWD}/i3status-rs ~/.config/i3status-rs
