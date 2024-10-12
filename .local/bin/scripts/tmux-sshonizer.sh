
#!/usr/bin/env bash

ssh_config="$HOME/.ssh/config"

if [ ! -f "$ssh_config" ]; then
    tmux display-message -d 3000 "SSH config file not found"
    sleep 3
    exit 1
fi

fzf_header=$'Select an SSH host to connect to:'
selected_host=$(awk '/^Host / && !/\*/ {print $2}' "$ssh_config" | fzf --height=40% --reverse --header="$fzf_header" --prompt="Type or select SSH host: ")

if [[ -z $selected_host ]]; then
    echo "No host selected. Exiting."
    exit 0
fi

selected_name=$(echo "$selected_host" | tr '.-' '__')

if [ -n "$TMUX" ]; then
    if ! tmux has-session -t="$selected_name" 2>/dev/null; then
        tmux new-session -s "$selected_name" "ssh $selected_host"
    else
        tmux switch-client -t "$selected_name"
    fi
else
    if ! pgrep -x "tmux" >/dev/null; then
        tmux new-session -s "$selected_name" "ssh $selected_host"
    else
        if ! tmux has-session -t="$selected_name" 2>/dev/null; then
            tmux new-session -s "$selected_name" "ssh $selected_host"
        else
            tmux switch-client -t "$selected_name"
        fi
    fi
fi

