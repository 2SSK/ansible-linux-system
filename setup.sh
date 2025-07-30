#!/bin/bash

# Check if running on Arch-based system
if ! command -v pacman >/dev/null 2>&1; then
    echo "This script is designed for Arch-based systems (EndeavourOS, Manjaro, Arch Linux, etc.)"
    exit 1
fi

# Check and install yay first
echo "Checking for yay..."
if ! command -v yay >/dev/null 2>&1; then
    echo "yay not found. Installing yay..."

    # Install base-devel and git if not already installed
    sudo pacman -S --needed --noconfirm base-devel git

    # Clone and install yay
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay

    echo "yay installed successfully!"
else
    echo "yay is already installed."
fi

# Now install Ansible
echo "Installing Ansible..."
if ! command -v ansible >/dev/null 2>&1; then
    yay -S --noconfirm ansible
else
    echo "Ansible is already installed."
fi

# Run playbook if it exists
if [[ -f playbook.yml ]]; then
    echo "Running Ansible playbook..."
    ansible-playbook playbook.yml --ask-become-pass
else
    echo "No playbook.yml found. Exiting."
fi
