# Ansible Dev Setup for EndeavourOS

Automated development environment setup for EndeavourOS (Arch-based) with comprehensive package management, GNOME customization, and development tools.

## 🚀 Quick Start

```bash
# Clone and run
git clone https://github.com/2SSK/ansible-dev-setup.git
cd ansible-dev-setup
./setup.sh
```

## ✨ Features

### **🎯 Core System**

- **EndeavourOS/Arch Optimized**: Uses `yay` for all package management
- **Centralized Configuration**: All packages defined in `group_vars/all.yml`
- **Automatic Yay Setup**: Installs AUR helper automatically via `setup.sh`
- **User-Safe Installation**: Runs yay as user, not root

### **🖥️ Desktop Environment**

- **GNOME 6 Workspaces**: Fixed workspace configuration
- **Custom Keybindings**: Complete workspace navigation system
- **GNOME Extensions**: Spacebar, Dash-to-Dock
- **Window Management**: Move windows between workspaces

### **💻 Development Environment**

- **Complete Dev Stack**: Node.js, Go, Docker, GitHub CLI
- **Editors**: VS Code, Cursor, Neovim, Vim
- **Terminal**: Zsh, Oh My Zsh, Starship prompt
- **CLI Tools**: eza, zoxide, bat, fzf, htop, btop

### **🎨 Applications**

- **Browsers**: Brave, Firefox
- **Development**: VS Code, Cursor, Postman, MongoDB Compass
- **Media**: Spotify, VLC, OBS Studio
- **Productivity**: Obsidian, LibreOffice, Discord

## 📋 Prerequisites

- EndeavourOS or other Arch-based Linux distribution
- Ansible installed (`sudo pacman -S ansible`)
- SSH key configured (optional for local setup)

## 🔧 Setup Options

### **Option 1: Quick Setup (Recommended)**

```bash
git clone https://github.com/2SSK/ansible-dev-setup.git
cd ansible-dev-setup
./setup.sh
```

### **Option 2: Manual Setup**

```bash
# Install Ansible
sudo pacman -S ansible

# Run playbook
ansible-playbook playbook.yml --ask-become-pass
```

### **Option 3: Custom User**

```bash
# Set custom user and SSH key
ANSIBLE_USER=yourusername ANSIBLE_SSH_KEY=~/.ssh/custom_key ansible-playbook playbook.yml
```

## 🎮 GNOME Keybindings

| Key                   | Action                              |
| --------------------- | ----------------------------------- |
| `Super + 1-6`         | Switch to specific workspace        |
| `Super + /`           | Switch to next workspace (right)    |
| `Super + .`           | Switch to previous workspace (left) |
| `Super + Shift + 1-6` | Move window to specific workspace   |
| `Super + Shift + /`   | Move window to next workspace       |
| `Super + Shift + .`   | Move window to previous workspace   |
| `Super + Q`           | Close active window                 |

## 📦 Package Categories

### **Core System (7 packages)**

- git, curl, stow, unzip, wget, base-devel, cargo

### **CLI Tools (13 packages)**

- eza, zoxide, bat, fzf, htop, btop, cava, cmatrix, sl, tty-clock, yazi, fastfetch, ttyper

### **Development (9 packages)**

- clang, go, vim, nodejs, npm, neovim, docker, github-cli, tmux

### **Shell (4 packages)**

- zsh, xsel, wl-clipboard, starship

### **Applications (10 packages)**

- discord, obs-studio, vlc, libreoffice-still, code, cursor-bin, brave-bin, postman-bin, mongodb-compass-bin, obsidian

### **Window Managers (9 packages)**

- i3, picom, polybar, rofi, feh, scrot, swaybg, swaylock, waybar

### **GNOME Extensions (2 packages)**

- gnome-shell-extension-space-bar-git, gnome-shell-extension-dash-to-dock-git

## 🔧 Customization

### **Add/Remove Packages**

Edit `group_vars/all.yml`:

```yaml
cli_packages:
  - your-new-package
```

### **Run Specific Roles**

```bash
# Install only CLI tools
ansible-playbook playbook.yml --tags cli

# Install only development tools
ansible-playbook playbook.yml --tags dev
```

### **Update Packages**

```bash
# Update system packages
sudo pacman -Syu

# Update AUR packages
yay -Sua
```

## 🛠️ Troubleshooting

### **Common Issues**

1. **Yay not found**: Run `./setup.sh` to install yay
2. **Permission denied**: Ensure you have sudo privileges
3. **Package conflicts**: Check for conflicting packages in AUR
4. **GNOME extensions not working**: Restart GNOME Shell (`Alt+F2`, type `r`)
5. **Root user build errors**: All yay commands now run as user, not root
6. **Missing packages**: Some packages may not exist in AUR - check package names

### **Recent Fixes**

- ✅ **Root User Issue**: Fixed yay running as root (now runs as user)
- ✅ **Missing Packages**: Removed non-existent packages from lists
- ✅ **Build Failures**: Separated problematic AUR packages
- ✅ **Conditional Tasks**: Added checks for optional packages like spicetify

### **Logs & Debugging**

```bash
# Verbose output
ansible-playbook playbook.yml -vvv

# Check package installation
pacman -Q | grep package-name

# Check AUR packages
yay -Q | grep package-name

# Check if yay is installed
which yay
```

## 📁 Project Structure

```
ansible-dev-setup/
├── playbook.yml          # Main playbook
├── ansible.cfg           # Ansible configuration
├── inventory             # Host definitions
├── setup.sh             # Quick setup script
├── group_vars/all.yml   # Package definitions
├── README.md            # This file
└── roles/               # Modular roles
    ├── ssh/             # SSH server setup
    ├── common/          # Dotfiles management
    ├── shell/           # Zsh + Oh My Zsh
    ├── cli/             # Command-line tools
    ├── dev/             # Development environment
    ├── gnome/           # GNOME + extensions
    ├── wm/              # Window managers
    └── applications/    # GUI applications
```

## 🔄 Recent Changes

### **v2.0 - Arch Migration**

- Migrated from Ubuntu to EndeavourOS/Arch
- Switched to `yay` for all package management
- Fixed root user build issues
- Centralized package configuration
- Added GNOME workspace customization

### **Key Improvements**

- **User-Safe Installation**: All yay commands run as user
- **Centralized Configuration**: All packages in `group_vars/all.yml`
- **Conditional Tasks**: Optional packages handled gracefully
- **Better Error Handling**: Improved troubleshooting

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

**Built for Arch** 🐧 | **Powered by Ansible** ⚡ | **Yay-First** 🚀
