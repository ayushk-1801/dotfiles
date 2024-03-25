if status is-interactive
   # Commands to run in interactive sessions can go here
   # Remove greeting message
   set fish_greeting
  if status is-interactive
and not set -q TMUX
    exec tmux
end
   # Aliases
alias vim="nvim"
alias ls="exa"
alias ll="exa -alh"
alias tree="exa --tree"
alias myscrot='scrot ~/Screenshots/%b%d::%H%M%S.png'


# Neofetch at startup
neofetch --config ~/.config/neofetch/startup.conf



   starship init fish | source
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/ayush/miniconda3/bin/conda
    eval /home/ayush/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/ayush/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/ayush/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/ayush/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

