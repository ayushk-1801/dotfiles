#!/bin/bash
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> UPDATING SYSTEM <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
sudo pacman --noconfirm -Syu

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> INSTALLING XORG <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
sudo pacman --noconfirm -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot xorg-xrdb xorg-xinput
sudo pacman --noconfirm -S xmonad xmonad-contrib xmobar

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> INSTALLING NVIDIA DRIVERS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
# sudo pacman --noconfirm -S nvidia nvidia-lts nvidia-settings nvidia-utils

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> INSTALLING IMPORTANT PROGRAMS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
sudo pacman --noconfirm -S git vim tmux fish neovim kitty neofetch bashtop exa bat fd fzf lxappearance nitrogen dunst firefox firefox-developer-edition discord xcolor thunar gvfs rofi ly

# paru -S picom-ftlabs-git
