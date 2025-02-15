if status is-interactive
    set fish_greeting

end

#if status is-interactive
#and not set -q TMUX
#    exec tmux
#end

alias ls="exa --icons"
alias ll="exa -lah --icons --color=always --group-directories-first -F"
alias tree="exa --tree --icons"
alias cat="bat"
alias lg="lazygit"
#alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
#alias artix='qemu-system-x86_64 -boot d -cdrom artix-base-runit-20230814-x86_64.iso -m 3G -smp 4 -drive file=artix_disk.img,format=qcow2 -bios /usr/share/ovmf/x64/OVMF_CODE.fd -netdev user,id=net0,hostfwd=tcp::1024-:22 -device e1000,netdev=net0 -enable-kvm'
#alias kali='qemu-system-x86_64 -boot d -cdrom ~/Downloads/kali-linux-2024.2-installer-amd64.iso -m 4G -smp 4 -drive file=kali_disk.img,format=qcow2 -bios /usr/share/ovmf/x64/OVMF_CODE.fd -netdev user,id=net0,hostfwd=tcp::1024-:22 -device e1000,netdev=net0 -enable-kvm'


function mkcd
    command mkdir $argv; and cd $argv
end

starship init fish | source
fzf --fish | source
zoxide init --cmd cd fish | source

set PATH $PATH /home/ayush/.local/bin
