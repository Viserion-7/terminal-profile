#!/usr/bin/env bash

# Fail on any command.
set -euxo pipefail

# Install Powerline from Ubuntu packages.
sudo apt update
sudo apt install -y powerline fonts-powerline

# Install the Vim configuration.
cp configs/.vimrc ~/.vimrc

# Install the bundled Powerline fonts.
./fonts/install.sh
