#!/bin/bash

killall xdg-desktop-portal-wlr
killall xdg-desktop-portal-gnome
killall xdg-desktop-portal-kde
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-lxqt
killall xdg-desktop-portal

# Restart environment variables and start the GTK portal
systemctl --user import-environment
sleep 1
/usr/lib/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &
sleep 2
/usr/lib/xdg-desktop-portal-gtk &

# This script forcibly terminates existing portal processes to ensure `xdg-desktop-portal-gtk` gets a clean launch.
