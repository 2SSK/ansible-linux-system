#!/bin/bash

# Check if pacman is present
if ! command -v pacman >/dev/null 2>&1; then
    echo "This script is for Arch-based systems only."
    exit 1
fi

# Install yay if not installed
if ! command -v yay >/dev/null 2>&1; then
    echo "Installing yay..."
    sudo -u "$USER_TO_ADD" bash -c '
        cd /tmp &&
        git clone https://aur.archlinux.org/yay.git &&
        cd yay &&
        makepkg -si --noconfirm
    '
    rm -rf /tmp/yay
else
    echo "yay is already installed."
fi

# Install ansible using yay
if ! command -v ansible >/dev/null 2>&1; then
    sudo  yay -S --noconfirm ansible
else
    echo "Ansible is already installed."
fi

# Run Ansible playbook as the user
 ansible-playbook playbook.yml --ask-become-pass
