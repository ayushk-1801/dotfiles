#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <EFI_PARTITION> <ROOT_PARTITION> <SWAP_PARTITION>"
    exit 1
fi

EFI_PARTITION="$1"
ROOT_PARTITION="$2"
SWAP_PARTITION="$3"

mkfs.fat -F32 "$EFI_PARTITION"
mkfs.ext4 "$ROOT_PARTITION"
mkswap "$SWAP_PARTITION"

mount "$ROOT_PARTITION" /mnt
mkdir /mnt/boot
mount "$EFI_PARTITION" /mnt/boot
swapon "$SWAP_PARTITION"

pacstrap -i /mnt base base-devel linux linux-headers linux-firmware amd-ucode sudo git vim neofetch bashtop cmake make bluez bluez-utils networkmanager cargo gcc mpv

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/bash <<EOF
passwd

    useradd -m -g users -G wheel,storage,video,audio -s /bin/bash ayush
    passwd ayush

    sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

    ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
    hwclock --systohc

    sed -i 's/^#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
    locale-gen
    echo "LANG=en_US.UTF-8" > /etc/locale.conf

    echo "archlinux" > /etc/hostname
    cat <<EOT >> /etc/hosts
    127.0.0.1     localhost
    ::1           localhost
    127.0.1.1     archlinux.localdomain   archlinux
    EOT

    pacman -S --noconfirm efibootmgr networkmanager sudo network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools dosfstools

    bootctl --path=/boot install
    cat <<EOT > /boot/loader/entries/arch.conf
    title   Arch Linux
    linux   /vmlinuz-linux
    initrd  /initramfs-linux.img
    options root=$ROOT_PARTITION rw
    EOT

    sed -i 's/^default.*/default arch-linux/g' /boot/loader/loader.conf

    systemctl enable bluetooth
    systemctl enable NetworkManager
EOF

umount -lR /mnt
