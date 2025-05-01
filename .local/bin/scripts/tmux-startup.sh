if command -v tmux > /dev/null; then
  tmux attach || tmux new
else
    exec fish
fi
