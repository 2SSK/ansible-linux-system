#!/bin/bash

# Ensure the script is run as root
if [[ "$EUID" -ne 0 ]]; then
    echo "Please run this script as root (e.g., using sudo)"
    exit 1
fi

USER_TO_ADD="ssk"

# Check if user exists
if ! id "$USER_TO_ADD" &>/dev/null; then
    echo "User '$USER_TO_ADD' does not exist."
    exit 1
fi

# Add user to sudoers if not already
if groups "$USER_TO_ADD" | grep -qv "\bsudo\b"; then
    echo "Adding $USER_TO_ADD to sudoers..."
    usermod -aG wheel "$USER_TO_ADD"

    # Ensure wheel group has sudo privileges
    sed -i '/^# %wheel ALL=(ALL:ALL) ALL/s/^# //' /etc/sudoers
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
    sudo -u "$USER_TO_ADD" yay -S --noconfirm ansible
else
    echo "Ansible is already installed."
fi

# Run Ansible playbook as the user
sudo -u "$USER_TO_ADD" ansible-playbook /home/$USER_TO_ADD/playbook.yml --ask-become-pass
