# My dotfiles
This directory contains the dotfiles for my system
[Help](https://youtu.be/y6XCebnB9gs?si=Qt8Y_C_JV0rs-zD6)

## What I use
- OS: [Arch Linux]()
- Window Mananger: [bspwm]()
- Bar: [Polybar]()
- IDE: [Neovim]()
- Terminal: [Kitty]()
- Shell: [zsh]()
- Terminal Multiplexer: [Tmux]()
- Launcher: [Rofi]()
- Notification: [Dunst]()


## Dependencies
Ensure you have the following installed on your system
```
pacman -S git stow
```

## Installation
First, check out the dotfiles repo in your $HOME directory using git
```
$ git clone git@github.com/dreamsofautonomy/dotfiles.git
$ cd dotfiles
```
then use GNU stow to create symlinks
```
$ stow .
$ stow --adopt .
```
