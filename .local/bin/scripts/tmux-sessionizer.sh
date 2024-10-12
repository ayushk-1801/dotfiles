#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    if [[ $1 == '.' ]]; then
        selected=$(pwd)
    elif [[ $1 == '..' ]]; then
        selected=$(dirname $(pwd))
    else
        selected=$1
    fi
else
    # Quote $selected to handle directories with spaces
    selected=$(find ~ -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . ' ')

if [ -n "$TMUX" ]; then
    if ! tmux has-session -t="$selected_name" 2>/dev/null; then
        tmux new-session -ds "$selected_name" -c "$selected" -A -D
    fi
    tmux switch-client -t "$selected_name"
else
    if ! pgrep -x "tmux" >/dev/null; then
        tmux new-session -s "$selected_name" -c "$selected" -A -D
    else
        if ! tmux has-session -t="$selected_name" 2>/dev/null; then
            tmux new-session -s "$selected_name" -c "$selected" -A -D
        else
            tmux new-session -ds "$selected_name" -c "$selected" -A -D
            tmux switch-client -t "$selected_name"
        fi
    fi
fi

