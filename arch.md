# Arch Setup

## First install

`pacstrap -K /mnt base linux linux-firmware grub networkmanager neovim less curl man sudo`.

### Disk / Grub for VM

- [Arch Wiki - Partitioning](https://wiki.archlinux.org/title/Partitioning#BIOS/GPT_layout_example)
- [GNU GRUB Manual](https://www.gnu.org/software/grub/manual/grub/html_node/BIOS-installation.html#BIOS-installation)
- [Arch Wiki - GRUB BIOS](https://wiki.archlinux.org/title/GRUB#BIOS_systems)

#### Partitioning

1. `parted /dev/sda`
2. (parted) `mklabel gpt` - set label
3. (parted) `mkpart primary 1MiB 2MiB` - make boot
4. (parted) `set 1 bios_grub on`
5. (parted) `mkpart primary linux-swap 2MiB 4GiB` - make swap
6. (parted) `mkpart primary ext4 2051MiB 100%` - make home
7. (parted) `print` - to verify
8. (parted) `quit`

#### Activating

1. `mkswap /dev/sda2 && swapon /dev/sda2`
2. `mkfs.ext4 /dev/sda3 && mount /dev/sda3 /mnt`
3. `genfstab -U /mnt >> /mnt/etc/fstab`

#### Grub

1. `grub-install --target=i386-pc /dev/sda`
2. `grub-mkconfig -o /boot/grub/grub.cfg`

## Post Install

- `useradd -m -G wheel,adm zach`, `passwd zach`
- Uncomment `wheel` line from `/etc/sudoers`

## Hyprland

1. `pacman -S hyprland pipewire wireplumber noto-fonts xdg-desktop-portal-hyprland dunst`
