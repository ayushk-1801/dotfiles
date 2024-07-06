#!/bin/sh

nitrogen --restore &
xrandr --dpi 120 &

exec dwm
