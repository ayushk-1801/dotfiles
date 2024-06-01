#!/bin/env sh
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> UPDATING SYSTEM <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
sudo pacman --noconfirm -Syu

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> INSTALLING PARU <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> INSTALLING XORG <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
sudo pacman --noconfirm -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot xorg-xrdb xorg-xinput

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> INSTALLING NVIDIA DRIVERS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
sudo pacman --noconfirm -S nvidia nvidia-lts nvidia-settings nvidia-utils

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> INSTALLING IMPORTANT PROGRAMS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
sudo pacman --noconfirm -S git vim tmux fish neovim kitty neofetch bashtop exa bat fd fzf lxappearance picom nitrogen dunst firefox firefox-developer-edition discord xcolor
paru -S --noconfirm spotify
paru -S --noconfirm ttf-jetbrains-mono nerd-fonts-jetbrains-mono
paru -S --noconfirm ttf-fira-code nerd-fonts-fira-code
paru -S --noconfirm ttf-font-awesome
paru -S --noconfirm picom-ftlabs-git 
paru -S --noconfirm visual-studio-code-bin