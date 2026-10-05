#!/usr/bin/env bash

# Fail on any command.
set -euxo pipefail

# Install ZSH
sudo apt update
sudo apt install -y git-core zsh curl

# Install Oh My Zsh if it is not already installed.
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
