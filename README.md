# Terminal Profile

A modernised version of [Pixegami's terminal profile](https://github.com/pixegami/terminal-profile), updated for current Ubuntu systems and modern GNOME terminals.

This configuration provides:

- Zsh + Oh My Zsh
- Pixegami's customised Agnoster theme
- `zsh-syntax-highlighting`
- `zsh-autosuggestions`
- Powerline fonts
- Vim configuration
- **Ptyxis** support
- GNOME Terminal support
- Pixegami's original terminal colour scheme
- Roboto Mono for Powerline
- 3% terminal transparency

## Requirements

Last tested in **October 2026** on:

- **Ubuntu 26.04**
- **GNOME**
- **Ptyxis 50.1**

GNOME Terminal is also supported when it is installed.

## Installation

Clone the repository:

```bash
git clone https://github.com/Viserion-7/terminal-profile.git
cd terminal-profile
```

Install Powerline and the bundled fonts:

```bash
./install_powerline.sh
```

Install Zsh and Oh My Zsh:

```bash
./install_terminal.sh
```

Install the Pixegami profile:

```bash
./install_profile.sh
```

Restart your terminal after installation.

## What the installer does

### `install_powerline.sh`

Installs Powerline using Ubuntu packages:

- `powerline`
- `fonts-powerline`

It also installs the bundled Powerline fonts and Vim configuration.

This avoids installing `powerline-status` through `pip`, which can fail on modern Ubuntu systems because of Python's externally-managed-environment restrictions.

### `install_terminal.sh`

Installs:

- Zsh
- Git
- cURL

Oh My Zsh is installed only if it is not already present.

### `install_profile.sh`

Installs the Pixegami Zsh configuration, theme and plugins.

On systems using **Ptyxis**, it configures:

- Pixegami colour palette
- Roboto Mono for Powerline
- 3% transparency

If GNOME Terminal is installed, the original GNOME Terminal profile is also configured.

The scripts are designed to be safe to run again without cloning already-installed Zsh plugins or duplicating the GNOME Terminal profile.

## Configuration

The main configuration files are located in `configs/`:

```text
configs/
├── .vimrc
├── .zshrc
├── pixegami-agnoster.zsh-theme
├── pixegami.palette
└── terminal_profile.dconf
```

`pixegami.palette` contains the colour scheme for Ptyxis.

`terminal_profile.dconf` contains the original GNOME Terminal profile configuration.

## Original Project

This project is based on:

https://github.com/pixegami/terminal-profile

The original configuration was created for an older Ubuntu/GNOME Terminal environment. This version updates the installation process for modern Ubuntu systems and adds support for Ptyxis while retaining GNOME Terminal compatibility.

## License

See the original project for licensing information.