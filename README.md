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
- **EndeavourOS/Arch Optimized**: Uses `pacman` and `yay` for package management
- **Centralized Configuration**: All packages defined in `group_vars/all.yml`
- **Automatic Yay Setup**: Installs AUR helper automatically

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
- **Media**: Spotify (with Spicetify), VLC, OBS Studio
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

| Key | Action |
|-----|--------|
| `Super + 1-6` | Switch to specific workspace |
| `Super + /` | Switch to next workspace (right) |
| `Super + .` | Switch to previous workspace (left) |
| `Super + Shift + 1-6` | Move window to specific workspace |
| `Super + Shift + /` | Move window to next workspace |
| `Super + Shift + .` | Move window to previous workspace |
| `Super + Q` | Close active window |

## 📦 Package Categories

### **Core System (7 packages)**
- git, curl, stow, unzip, wget, base-devel, cargo

### **CLI Tools (15 packages)**
- eza, zoxide, bat, fzf, htop, btop, cava, fastfetch, cmatrix, cbonsai, pipe.sh, sl, tty-clock, yazi, ttyper

### **Development (12 packages)**
- clang, go, tmux, vim, nodejs, npm, yarn, neovim, docker, github-cli, lazygit, lazydocker

### **Shell (7 packages)**
- zsh, oh-my-zsh-git, zsh-autosuggestions, zsh-syntax-highlighting, starship, xsel, wl-clipboard

### **Applications (12 packages)**
- code, cursor-bin, brave-bin, postman-bin, mongodb-compass-bin, spotify-cli, spicetify, discord, obsidian, obs-studio, vlc, libreoffice-still

### **Window Managers (14 packages)**
- i3lock-color, picom, polybar, rofi, autotile, feh, scrot, sway, waybar, swaylock, swaybg, wlogout, grimshot, waypaper

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

### **Logs & Debugging**
```bash
# Verbose output
ansible-playbook playbook.yml -vvv

# Check package installation
pacman -Q | grep package-name

# Check AUR packages
yay -Q | grep package-name
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

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

**Built for Arch** 🐧 | **Powered by Ansible** ⚡
