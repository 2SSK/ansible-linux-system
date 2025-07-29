#!/bin/bash

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

ansible-playbook playbook.yml --ask-become-pass
