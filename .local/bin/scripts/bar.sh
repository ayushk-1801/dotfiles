#!/bin/bash

battery() {
    cmd="$(acpi | cut -d, -f2 | awk '{print $1}' | cut -d% -f1)"
    echo -ne "BAT $cmd%"
}

volume() {
    cmd="$(pactl get-sink-volume 0 | cut -d/ -f2 | sed -n 1p | awk '{print $1}' | cut -d% -f1)"
    echo -ne "VOLUME $cmd%"
}

_mem() {
    mem_used="$(top -b -n 1 | grep -i mem | sed -n 1p | awk '{print $8}')"
    mem_total="$(top -b -n 1 | grep -i mem | sed -n 1p | awk '{print $4}')"
    mem_perc_with_extra="$(echo "scale=4; ($mem_used/$mem_total)*100" | bc)"
    final_mem_perc="${mem_perc_with_extra::-2}%"
    echo -ne "MEM $final_mem_perc"
}

_cpu() {
    foo="$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')"
    cmd=${foo::-2}
    cmd="$(echo $cmd | cut -c 1-4)%"
    echo -ne "CPU $cmd"
}

disk() {
    disk_usage=$(df -h | grep '^/dev/nvme0n1p6' | awk '{print $5}')
    echo -ne "DISK $disk_usage"
}

date_time() {
    date_time=$(date +"%Y-%m-%d %H:%M")
    echo -ne "$date_time"
}

while true; do
    cpu=$(_cpu)
    memory=$(_mem)
    vol=$(volume)
    bat=$(battery)
    disk=$(disk)
    date=$(date_time)

    xsetroot -name " $cpu | $memory | $vol | $bat | $disk | $date"

    sleep 1
done
