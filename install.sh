#!/bin/bash
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> UPDATING SYSTEM <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
sudo pacman --noconfirm -Syu

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> INSTALLING XORG <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
sudo pacman --noconfirm -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot xorg-xrdb xorg-xinput

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> INSTALLING NVIDIA DRIVERS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
sudo pacman --noconfirm -S nvidia nvidia-lts nvidia-settings nvidia-utils

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> INSTALLING IMPORTANT PROGRAMS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
sudo pacman --noconfirm -S git vim tmux fish neovim kitty neofetch bashtop exa bat fd fzf lxappearance picom nitrogen dunst firefox firefox-developer-edition discord xcolor thunar gvfs
