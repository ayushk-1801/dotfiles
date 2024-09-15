# Post Installation Instructions

## Touchpad Gestures
Location: '/etc/X11/xorg.conf.d/30-touchpad.conf'
```
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "TappingButtonMap" "lrm"
    Option "NaturalScrolling" "true"
EndSection
```

## Sleep on Lid Close & Power Button
Location: '/etc/systemd/logind.conf'
```
HandleLidSwitch=suspend
HandlePowerKey=suspend
HandlePowerKerLongPress=poweroff
```

## Fix clock in dual boot
```
$ timedatectl set-local-rtc 1 --adjust-system-clock
```

## Keyboard Layout
Location: '/etc/keyd/default.conf'
```
[ids]

*

[main]

leftalt = oneshot(meta)
meta = oneshot(alt)

capslock = overload(ctrl_vim, esc)

[ctrl_vim:C]
space = swap(below)

[below:C]
h = left
j = down
k = up
l = right
w = C-right
b = C-left
u = home
i = end
```
