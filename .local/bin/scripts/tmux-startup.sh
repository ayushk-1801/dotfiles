#!/usr/bin/env zsh
if command -v tmux > /dev/null; then
  tmux attach || tmux new
else
    exec zsh
fi
