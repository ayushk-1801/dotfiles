#!/bin/bash

BG="#ebdbb2"
FG="#000000"
RESET="^d^"

battery(){
    cmd="$(acpi | cut -d, -f2 | awk '{print $1}' | cut -d% -f1)"
    echo -ne "^b$BG^^c$FG^ BATTERY $RESET $cmd%"
}

volume(){
    cmd="$(pactl get-sink-volume 0 | cut -d/ -f2 | sed -n 1p | awk '{print $1}' | cut -d% -f1)"
    echo -ne "^b$BG^^c$FG^ VOLUME $RESET $cmd%"
}

brightness(){
    cmd="$(sudo ybacklight -get | cut -d. -f1)"
    echo -ne "^b$BG^^c$FG^ BRIGHTNESS $RESET $cmd%"
}

mute(){
    cmd="$(pactl get-sink-mute @DEFAULT_SINK@ | cut -d: -f2 | awk '{print $1}')"
    echo -ne "^b$BG^^c$FG^ MUTE $RESET $cmd"
}

bluetooth(){
    cmd="$(bluetoothctl devices Connected | sed -n 1p)"
    if [ "$cmd" != "" ]; then
        echo -ne "^b$BG^^c$FG^ BLUETOOTH $RESET $cmd"
    fi
}

wifi(){
    cmd="$(nmcli connection | awk '{print $1}' | sed -n 2p)"
    echo -ne "^b$BG^^c$FG^ WIFI $RESET $cmd"
}

arch(){
    # cmd="󰣇 ARCHLINUX"
    cmd="󰣇 HEISENBERG"
    echo -ne "^c$BG^ $cmd$RESET"
}

_time(){
    cmd="$(date +'%I:%M %p')"
    echo -ne "^b$BG^^c$FG^ TIME $RESET $cmd"
}

_date(){
    cmd="$(date +'%b %d, %a')"
    echo -ne "^b$BG^^c$FG^ DATE $RESET $cmd"
}

_mem() {
    mem_perc_with_extra=$(free | awk '/^Mem:/ {printf "%.2f\n", $3/$2 * 100}')
    final_mem_perc="${mem_perc_with_extra::-3}%"  # Removes the decimal places and appends '%'
    echo -ne "^b$BG^^c$FG^ MEM $RESET $final_mem_perc"
}

_cpu(){
    foo="$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')"
    cmd=${foo::-2}
    cmd="$(echo $cmd | cut -c 1-4)%"
    echo -ne "^b$BG^^c$FG^ CPU $RESET $cmd"
}

temp(){
    cpu_temp="$(sensors | grep 'Tctl:' | awk '{print $2}' | tr -d '+' | cut -d. -f1)"
    gpu_temp="$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)°C"
    echo -ne "^b$BG^^c$FG^ TEMP $RESET $cpu_temp°C | $gpu_temp"
}


while true; do
    xsetroot -name "$(arch) $(temp) $(_cpu) $(_mem) $(volume) $(battery) $(_time) $(_date)"
    sleep 1
done
