if status is-interactive
    set fish_greeting

    alias v="vim"
    alias n="nvim"
    alias ls="exa --icons"
    alias ll="exa -lah --icons --color=always --group-directories-first -F"
    alias tree="exa --tree --icons"
    alias cat="bat"
    alias lg="lazygit"
    alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
end

if status is-interactive
and not set -q TMUX
    exec tmux
end

function mkcd
    command mkdir $argv; and cd $argv
end

starship init fish | source
fzf --fish | source
zoxide init --cmd cd fish | source

# Created by `pipx` on 2024-04-30 12:18:47
set PATH $PATH /home/ayush/.local/bin
