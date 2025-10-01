#!/bin/bash

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

echo "Ansible Linux System Setup"
echo "=========================="

# Detect distribution
if [[ -f /etc/arch-release ]]; then
    DISTRO="arch"
    PKG_MANAGER="pacman"
elif [[ -f /etc/fedora-release ]]; then
    DISTRO="fedora"
    PKG_MANAGER="dnf"
elif [[ -f /etc/lsb-release ]] && grep -q "Ubuntu" /etc/lsb-release; then
    DISTRO="debian"  # Ubuntu uses debian.yml
    PKG_MANAGER="apt"
elif [[ -f /etc/debian_version ]]; then
    DISTRO="debian"
    PKG_MANAGER="apt"
else
    echo "Error: Unsupported distribution. This script supports: Arch, Fedora, Ubuntu, Debian"
    exit 1
fi

echo "Detected distribution: $DISTRO"

# Install Ansible based on distribution
if ! command -v ansible >/dev/null 2>&1; then
    echo "Installing Ansible..."
    case $PKG_MANAGER in
        pacman)
            sudo pacman -Sy --noconfirm ansible
            ;;
        dnf)
            sudo dnf install -y ansible
            ;;
        apt)
            sudo apt update
            sudo apt install -y ansible
            ;;
    esac
else
    echo "Ansible already installed"
fi

# For Arch: Install yay if not present
if [[ $DISTRO == "arch" ]] && ! command -v yay >/dev/null 2>&1; then
    echo "Installing yay AUR helper..."
    sudo pacman -S --noconfirm base-devel git
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay
fi

echo ""
echo "Running Ansible playbook for $DISTRO..."
echo "You may be prompted for your sudo password."
echo ""

# Run the playbook
ansible-playbook playbook.yml -e "current_distro=$DISTRO"
