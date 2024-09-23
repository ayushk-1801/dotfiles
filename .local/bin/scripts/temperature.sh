cpu_temp=$(sensors | grep temp1 | awk 'NR==1{gsub("+", " "); gsub("\\..", " "); print $2}')

gpu_temp=$(nvidia-settings -q gpucoretemp -t | head -n 1)

echo "$cpu_temp°C $gpu_temp°C"
