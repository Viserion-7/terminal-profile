#!/usr/bin/env bash

# Fail on any command.
set -euxo pipefail

# Install Zsh plugins.
plugins_dir="$HOME/.oh-my-zsh/custom/plugins"

if [ ! -d "$plugins_dir/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$plugins_dir/zsh-syntax-highlighting"
fi

if [ ! -d "$plugins_dir/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$plugins_dir/zsh-autosuggestions"
fi

# Install Zsh configuration and Pixegami theme.
cp configs/.zshrc "$HOME/.zshrc"
cp configs/pixegami-agnoster.zsh-theme \
    "$HOME/.oh-my-zsh/themes/pixegami-agnoster.zsh-theme"

# Configure Ptyxis.
if command -v ptyxis >/dev/null 2>&1; then
    ptyxis_palette_dir="${XDG_DATA_HOME:-$HOME/.local/share}/org.gnome.Ptyxis/palettes"
    mkdir -p "$ptyxis_palette_dir"

    cp configs/pixegami.palette "$ptyxis_palette_dir/pixegami.palette"

    ptyxis_profile_uuid="$(
        gsettings get org.gnome.Ptyxis default-profile-uuid |
        tr -d "'"
    )"

    ptyxis_profile="org.gnome.Ptyxis.Profile:/org/gnome/Ptyxis/Profiles/${ptyxis_profile_uuid}/"

    gsettings set org.gnome.Ptyxis use-system-font false
    gsettings set org.gnome.Ptyxis font-name "Roboto Mono for Powerline 14"

    gsettings set "$ptyxis_profile" palette "pixegami"
    gsettings set "$ptyxis_profile" opacity 0.97
fi

# Configure GNOME Terminal if it is installed.
if command -v gnome-terminal >/dev/null 2>&1 && command -v dconf >/dev/null 2>&1; then
    profile_id="fb358fc9-49ea-4252-ad34-1d25c649e633"

    dconf load "/org/gnome/terminal/legacy/profiles:/:${profile_id}/" \
        < configs/terminal_profile.dconf

    existing_profiles="$(dconf read /org/gnome/terminal/legacy/profiles:/list)"

    if [[ "$existing_profiles" != *"$profile_id"* ]]; then
        if [ -z "$existing_profiles" ] || [ "$existing_profiles" = "@as []" ]; then
            dconf write /org/gnome/terminal/legacy/profiles:/list \
                "['$profile_id']"
        else
            dconf write /org/gnome/terminal/legacy/profiles:/list \
                "${existing_profiles%]}, '$profile_id']"
        fi
    fi

    dconf write /org/gnome/terminal/legacy/profiles:/default "'$profile_id'"
fi

# Switch the default shell to Zsh.
if command -v zsh >/dev/null 2>&1 && [ "$SHELL" != "$(command -v zsh)" ]; then
    chsh -s "$(command -v zsh)"
fi
