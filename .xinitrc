#!/bin/sh
nitrogen --restore &
bar.sh &
startup.sh &
eval $(gnome-keyring-daemon --start) &
export SSH_AUTH_SOCK &
exec dwm
