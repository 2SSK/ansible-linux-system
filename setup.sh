#!/bin/bash

# Check if running on Arch-based system
if ! command -v pacman >/dev/null 2>&1; then
    echo "This script is designed for Arch-based systems (EndeavourOS, Manjaro, Arch Linux, etc.)"
    exit 1
fi

# Install Ansible
echo "Installing Ansible..."
if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y ansible
elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y ansible
elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -Sy ansible
else
    echo "No supported package manager found."
fi

# Check if yay is installed
echo "Checking for yay..."
if ! command -v yay >/dev/null 2>&1; then
    echo "yay not found. Installing yay..."
    
    # Install base-devel and git
    sudo pacman -S --noconfirm base-devel git
    
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

# Install required Galaxy roles
echo "Installing required Ansible Galaxy roles..."
ansible-galaxy install -r requirements.yml

echo "Running Ansible playbook..."
ansible-playbook playbook.yml --ask-become-pass
