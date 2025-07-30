#!/bin/bash

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Ensure passwordless sudo for pacman
if ! sudo grep -q "^$USER ALL=(ALL) NOPASSWD: /usr/bin/pacman" /etc/sudoers /etc/sudoers.d/* 2>/dev/null; then
    echo "$USER ALL=(ALL) NOPASSWD: /usr/bin/pacman" | sudo tee /etc/sudoers.d/99-pacman-nopasswd
    sudo chmod 0440 /etc/sudoers.d/99-pacman-nopasswd
fi

if ! command -v pacman >/dev/null 2>&1; then
    echo "This script is for Arch-based systems."
    exit 1
fi

# Install Ansible
if ! command -v ansible >/dev/null 2>&1; then
    sudo pacman -Sy --noconfirm ansible
fi

# Install yay if not present
if ! command -v yay >/dev/null 2>&1; then
    sudo pacman -S --noconfirm base-devel git
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay
fi

# Run the playbook
ansible-playbook playbook.yml --ask-become-pass
