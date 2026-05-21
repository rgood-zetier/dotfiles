#!/bin/bash
set -euo pipefail

sudo apt install -y stow git curl unzip fd-find xclip ripgrep build-essential
stow nvim kitty tmux
if command -v gsettings >/dev/null 2>&1; then
  gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']" || true
fi

mkdir -p "$HOME/.local/bin"

# Install uv for Python-based CLI tools like make-ls.
if ! command -v uv >/dev/null 2>&1 && [ ! -x "$HOME/.local/bin/uv" ]; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi

UV_BIN="$(command -v uv || true)"
UV_BIN="${UV_BIN:-$HOME/.local/bin/uv}"
"$UV_BIN" tool install --force make-ls

# Install a user-built tree-sitter CLI so Neovim does not depend on Mason's
# prebuilt binary, which can require a newer glibc than the host provides.
if ! command -v cargo >/dev/null 2>&1 && [ ! -x "$HOME/.cargo/bin/cargo" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

if [ -f "$HOME/.cargo/env" ]; then
  # shellcheck disable=SC1091
  . "$HOME/.cargo/env"
fi

TREE_SITTER_BIN="$HOME/.cargo/bin/tree-sitter"
if [ ! -x "$TREE_SITTER_BIN" ] || ! "$TREE_SITTER_BIN" --version >/dev/null 2>&1; then
  cargo install tree-sitter-cli --locked --force
fi

# Install latest kitty into ~/.local/kitty.app
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Register kitty (standalone install) with the desktop environment
mkdir -p "$HOME/.local/share/applications"
ln -sf "$HOME/.local/kitty.app/bin/kitty" "$HOME/.local/kitty.app/bin/kitten" "$HOME/.local/bin/"
cp "$HOME"/.local/kitty.app/share/applications/kitty*.desktop "$HOME/.local/share/applications/"
sed -i "s|Icon=kitty|Icon=$HOME/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" "$HOME"/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$HOME/.local/kitty.app/bin/kitty|g" "$HOME"/.local/share/applications/kitty*.desktop
