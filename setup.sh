#!/bin/bash

# Ensure UTF-8 locale is used
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Check if locale is supported
if ! locale -a | grep -q "en_US.utf8"; then
    echo "Generating en_US.UTF-8 locale..."
    sudo locale-gen en_US.UTF-8
    sudo localedef -i en_US -f UTF-8 en_US.UTF-8
fi

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
    sudo yay -S --noconfirm ansible
else
    echo "Ansible is already installed."
fi

# Run Ansible playbook as the user
ansible-playbook playbook.yml --ask-become-pass
