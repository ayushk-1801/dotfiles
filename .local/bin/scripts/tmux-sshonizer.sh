#!/usr/bin/env bash

ssh_config="$HOME/.ssh/config"

if [ ! -f "$ssh_config" ]; then
    tmux display-message -d 3000 "SSH config file not found"
    sleep 3
    exit 1
fi

fzf_main_menu=$'Select an option:'
main_options="SSH\nDocker"

selected_option=$(echo -e "$main_options" | fzf --height=20% --reverse --header="$fzf_main_menu" --prompt="Choose SSH or Docker: ")

if [[ -z $selected_option ]]; then
    echo "No option selected. Exiting."
    exit 0
fi

if [[ "$selected_option" == "SSH" ]]; then
    fzf_ssh_header=$'Select an SSH host to connect to:'
    selected_host=$(awk '/^Host / && !/\*/ {print $2}' "$ssh_config" | fzf --height=40% --reverse --header="$fzf_ssh_header" --prompt="Type or select SSH host: ")

    if [[ -z $selected_host ]]; then
        echo "No SSH host selected. Exiting."
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

    if ! tmux has-session -t=$selected_name 2>/dev/null; then
        tmux new-session -s "$selected_name" -d "ssh $selected_host"
    fi

    tmux switch-client -t $selected_name

elif [[ "$selected_option" == "Docker" ]]; then
    docker_containers=$(docker ps --format '{{.Names}}')

    if [[ -z $docker_containers ]]; then
        echo "No running Docker containers."
        exit 0
    fi

    fzf_docker_header=$'Select a Docker container to connect to:'
    selected_container=$(echo "$docker_containers" | fzf --height=40% --reverse --header="$fzf_docker_header" --prompt="Type or select Docker container: ")

    if [[ -z $selected_container ]]; then
        echo "No Docker container selected. Exiting."
        exit 0
    fi

    if [ -n "$TMUX" ]; then
        if ! tmux has-session -t="$selected_container" 2>/dev/null; then
            tmux new-session -s "$selected_container" "docker exec -it $selected_container sh"
        else
            tmux switch-client -t "$selected_container"
        fi
    else
        if ! pgrep -x "tmux" >/dev/null; then
            tmux new-session -s "$selected_container" "docker exec -it $selected_container sh"
        else
            if ! tmux has-session -t="$selected_container" 2>/dev/null; then
                tmux new-session -s "$selected_container" "docker exec -it $selected_container sh"
            else
                tmux switch-client -t "$selected_container"
            fi
        fi
    fi

    if ! tmux has-session -t=$selected_container 2>/dev/null; then
        tmux new-session -s "$selected_container" -d "docker exec -it $selected_container sh"
    fi

    tmux switch-client -t $selected_container
fi
