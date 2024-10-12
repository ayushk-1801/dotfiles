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


yay -S -needed - < ~/dotfiles/packages.txt


if [ -d ~/dotfiles ]; then
    cd ~/dotfiles || exit
    stow .
else
    echo "Dotfiles directory not found!"
fi


cd ~/.config/dwm && sudo make clean install
cd ~/.config/dmenu && sudo make clean install


cd
git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install
sudo systemctl enable keyd && sudo systemctl start keyd
cd ..
rm -rf ~/keyd


cd
git config --global user.email "ayush23162@iiitd.ac.in"
git config --global user.name "ayushk-1801"
ssh-keygen -t ed25519 -C "ayush23162@iiitd.ac.in"
exec ssh-agent fish
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub


sudo chmod 600 ~/.ssh/id_ed25519
sudo chmod 600 ~/.ssh/id_ed25519.pub
sudo chmod 644 ~/.ssh/known_hosts
sudo chmod 755 ~/.ssh

