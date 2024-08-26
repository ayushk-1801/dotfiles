running=$(pidof spotify)
if [ "$running" != "" ]; then
    # artist=$(playerctl metadata artist)
    song=$(playerctl metadata title | cut -c 1-24)
    echo -n "   $song "
fi
