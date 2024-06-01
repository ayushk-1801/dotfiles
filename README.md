# Post Installation Instructions

## DWM 
Location: '/usr/share/xsessions/dwm.desktop'
```
[Desktop Entry]
Encoding=UTF-8 
Name=dwm 
Comment=Dynamic Window Manager 
Exec=/usr/local/bin/dwm 
Icon=dwm 
Type=XSession
```

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
```

## Mount Partitions
Location: '/etc/fstab' \
Install ntfs-3g for ntfs partitions

```
# <file system>         <mount point>   <type>      <options>               <dump>  <pass>
# /dev/nvme0n1p4
UUID=xxxxxxxxxxxxxxx	/home/Drive 	ntfs-3g	    defaults,noatime,users	0 0
```

## Other
- Setup sddm, betterlockscreen
