# My dotfiles
This directory contains the dotfiles for my system

## What I use
- OS: [Arch Linux](https://archlinux.org/)
- Window Mananger: [bspwm](https://github.com/baskerville/bspwm)
- Bar: [Polybar](https://github.com/polybar/polybar)
- IDE: [Neovim](https://github.com/neovim/neovim)
- Terminal: [Kitty](https://github.com/kovidgoyal/kitty)
- Shell: [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- Terminal Multiplexer: [Tmux](https://github.com/tmux/tmux/wiki)
- Launcher: [Rofi](https://github.com/davatorium/rofi)
- Notification: [Dunst](https://github.com/dunst-project/dunst)
- Compositor: [Picom](https://github.com/yshui/picom)
- Display Manager: [ly](https://github.com/fairyglade/ly)
- Terminal File Manager: [lf](https://github.com/gokcehan/lf)
- Wallpaper Manager: [nitrogen](https://wiki.archlinux.org/title/nitrogen)
- Lock Screen: [Betterlockscreen](https://github.com/betterlockscreen/betterlockscreen)

## Dependencies
Ensure you have the following installed on your system
```
$ sudo pacman -S git stow
```

## Installation
First, check out the dotfiles repo in your $HOME directory using git
[Help](https://youtu.be/y6XCebnB9gs?si=Qt8Y_C_JV0rs-zD6)
```
$ git clone https://github.com/ayushk-1801/dotfiles/
$ cd dotfiles
```
then use GNU stow to create symlinks
```
$ stow .
$ stow --adopt .
```
