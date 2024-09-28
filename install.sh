#!/bin/bash

sudo pacman --noconfirm -Syu

if ! command -v yay &> /dev/null; then
    sudo pacman --noconfirm -S base-devel git
    cd
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

sudo pacman --noconfirm -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot xorg-xrdb xorg-xinput xmonad xmonad-contrib xmonad-extras xmobar

sudo pacman --noconfirm -S nvidia nvidia-settings nvidia-utils

sudo pacman --noconfirm -S git vim tmux zsh neovim kitty neofetch bashtop exa bat fd fzf lxappearance nitrogen dunst discord xcolor thunar gvfs rofi keyd paru starship xclip tldr physlock

yay --noconfirm -S picom-ftlabs-git ttf-jetbrains-mono-nerd noto-fonts-emoji spotify stremio visual-studio-code-bin zen-browser-avx2-bin

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ -d ~/dotfiles ]; then
    cd ~/dotfiles || exit
    stow .
else
    echo "Dotfiles directory not found!"
fi

if command -v xmonad &> /dev/null; then
    xmonad --recompile
else
    echo "XMonad not found!"
fi
