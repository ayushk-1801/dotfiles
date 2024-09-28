export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)
plugins=(zsh-autosuggestions)
plugins=(fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Alias
alias v="nvim"
alias ls="exa --icons"
alias ll="exa -lah --icons --color=always --group-directories-first -F"
alias tree="exa --tree --icons"
alias cat="bat"
alias lg="lazygit"

mkcd() {
    command mkdir "$@" && cd "$@"
}

source <(fzf --zsh)
eval "$(zoxide init zsh --cmd cd)"
eval "$(starship init zsh)"

# Set paths
export PATH=$PATH:/home/ayush/.local/bin:/home/ayush/.deno/bin
