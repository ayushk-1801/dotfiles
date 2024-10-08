running=$(pidof spotify)
if [ "$running" != "" ]; then
    song=$(playerctl --player=spotify metadata title | cut -c 1-24)
    echo -n "   $song "
fi
