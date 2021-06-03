#!/usr/bin/env bash

echo "sda1 is root; sda2 is swap; sda3 is boot"
mkfs.ext4 -L nixos /dev/sda1
mkswap -L swap /dev/sda2
mkfs.fat -F 32 -n boot /dev/sda3
swapon /dev/sda2

mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot

nixos-generate-config --root /mnt
git clone https://github.com/gideonthomasd/configuration.git
cd configuration
cp configuration.nix /mnt/etc/nixos/configuration.nix
nixos-install
