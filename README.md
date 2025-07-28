# Ansible Dev Setup

This repository contains an Ansible playbook to automate the setup of a development environment. It's designed to be modular and easily extensible.

## Features

- **Modular Design:** The playbook is broken down into roles, making it easy to add or remove functionality.
- **Dotfiles Management:** Clones and sets up dotfiles from a specified Git repository.
- **Shell Customization:** Installs and configures Zsh, Oh My Zsh, and other shell enhancements.
- **Essential CLI Tools:** Installs a collection of useful command-line tools.

## Prerequisites

- Ansible installed on the control machine.
- An SSH key configured for accessing the target machine.

## Usage

1. **Clone the repository:**
   ```bash
   git clone https://github.com/2SSK/ansible-dev-setup.git
   cd ansible-dev-setup
   ```

2. **Configure the inventory:**
   - Edit the `inventory` file to specify the target host(s).
   - For local setup, you can use the provided `[local]` group.
   - For remote servers, add the server's IP address or hostname to the `[server]` group.

3. **Run the playbook:**
   ```bash
   ansible-playbook playbook.yml
   ```

## Roles

- **common:** Clones dotfiles and wallpaper repositories.
- **shell:** Installs and configures Zsh, Oh My Zsh, zsh-autosuggestions, zsh-syntax-highlighting, and Starship.
- **cli:** Installs a set of command-line tools like `eza`, `zoxide`, `bat`, `fzf`, `htop`, `btop`, `cava`, `neofetch`, `cmatrix`, and `tty-clock`.
- **applications:** (Currently empty) For installing GUI applications.
- **dev:** (Currently empty) For setting up development-specific tools and environments.
- **gnome:** (Currently empty) For GNOME desktop environment specific configurations.
- **wm:** (Currently empty) For window manager configurations.

## Customization

- **Variables:** Modify variables in `group_vars/all.yml` to customize the setup.
- **Roles:** Add or remove roles from `playbook.yml` to tailor the setup to your needs.
- **Tasks:** Add new tasks to the `tasks/main.yml` file within each role to extend functionality.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue.
