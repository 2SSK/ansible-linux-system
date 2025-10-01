# Ansible Linux System Setup

Automated development environment setup for multiple Linux distributions.

## Quick Start

```bash
git clone https://github.com/2SSK/ansible-linux-system.git
cd ansible-linux-system
./setup.sh
```

## Supported Distributions

- Arch Linux (EndeavourOS, Manjaro)
- Fedora (39+)
- Ubuntu (20.04+)
- Debian (11+)

## What's Included

- **Development Tools**: Node.js, Go, Docker, VS Code, Neovim
- **CLI Tools**: zsh, starship, eza, bat, fzf, htop
- **Applications**: Discord, Spotify, OBS Studio, Brave Browser
- **Utilities**: SSH server, dotfiles management

## Manual Setup

```bash
# Install Ansible first (distribution-specific)
ansible-playbook playbook.yml -e "current_distro=<arch|fedora|debian>"
```

## Customization

Edit distribution-specific packages in `group_vars/`:
- `arch.yml` - Arch Linux packages
- `fedora.yml` - Fedora packages  
- `debian.yml` - Ubuntu/Debian packages

Run specific components only:
```bash
ansible-playbook playbook.yml --tags cli,dev -e "current_distro=<distro>"
```

## Troubleshooting

**Common fixes**:
- Ensure sudo privileges
- For Arch: `base-devel` group must be installed
- For syntax check: `ansible-playbook playbook.yml --syntax-check`
- For dry run: `ansible-playbook playbook.yml --check -e "current_distro=<distro>"`

## License

MIT License
