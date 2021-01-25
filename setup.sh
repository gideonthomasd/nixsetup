#!/usr/bin/env bash

echo "sda1 is root; sda2 is swap; in root"
mkfs.ext4 -L nixos /dev/sda1
mkswap -L swap /dev/sda2
swapon /dev/sda2
mount /dev/disk/by-label/nixos /mnt
nixos-generate-config --root /mnt
git clone https://github.com/gideonthomasd/configuration.git
cd configuration
cp configuration.nix /mnt/etc/nixos/configuration.nix
nixos-install

