#!/bin/bash

sudo apt install fd-find xclip ripgrep
stow nvim kitty tmux
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

# Install latest kitty into ~/.local/kitty.app
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Register kitty (standalone install) with the desktop environment
mkdir -p ~/.local/bin ~/.local/share/applications
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty*.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=$HOME/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$HOME/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
