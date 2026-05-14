# Arch Setup

## First install

`pacstrap -K /mnt base linux linux-firmware grub efibootmgr networkmanager neovim less curl man sudo`.

### Disk / Grub for VM

- [Arch Wiki - Partitioning](https://wiki.archlinux.org/title/Partitioning#UEFI/GPT_layout_example)
- [GNU GRUB Manual](https://www.gnu.org/software/grub/manual/grub/html_node/BIOS-installation.html#BIOS-installation)
- [Arch Wiki - GRUB UEFI](https://wiki.archlinux.org/title/GRUB#UEFI_systems)

#### UEFI Partitioning

1. `gdisk /dev/nvme0n1`
2. (gdisk) `o` # New GPT
3. (gdisk) `n`, `<DEFAULT>`, `<DEFAULT>`, `+1G`, `EF00` # EFI
4. (gdisk) `n`, `<DEFAULT>`, `<DEFAULT>`, `+4G`, `8200` # Swap
5. (gdisk) `n`, `<DEFAULT>`, `<DEFAULT>`, `<DEFAULT>`, `8304` # Swap
6. (gdisk) `p` # Print and verify
7. (gdisk) `w`, `y`

- EFI: EF00
- Swap: 8200
- Linux x86-64 root: 8304

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
