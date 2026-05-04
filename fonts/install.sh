#!/usr/bin/env bash
#
# Install FiraCode Nerd Font (Mono variant only)
# Idempotent — safe to re-run.

set -euo pipefail

FONT_NAME="FiraCode"
FONT_VERSION="v3.4.0"   # pin to a specific release for reproducibility
FONT_DIR="$HOME/.local/share/fonts/FiraCodeNerdFont"
DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/${FONT_VERSION}/${FONT_NAME}.zip"
TMP_DIR="$(mktemp -d)"

# Cleanup tmp dir on exit, even if script fails
trap 'rm -rf "$TMP_DIR"' EXIT

echo "==> Installing ${FONT_NAME} Nerd Font ${FONT_VERSION}"

# Skip if already installed
if [ -d "$FONT_DIR" ] && [ -n "$(ls -A "$FONT_DIR" 2>/dev/null)" ]; then
    echo "    Already installed at $FONT_DIR"
    echo "    Delete that directory and re-run to reinstall."
    exit 0
fi

echo "==> Downloading from ${DOWNLOAD_URL}"
curl -fL --progress-bar -o "$TMP_DIR/font.zip" "$DOWNLOAD_URL"

echo "==> Extracting Mono variants only"
mkdir -p "$FONT_DIR"
unzip -j -q "$TMP_DIR/font.zip" 'FiraCodeNerdFontMono-*.ttf' -d "$FONT_DIR"

echo "==> Rebuilding font cache"
fc-cache -f "$FONT_DIR"

echo "==> Verifying"
if fc-list | grep -qi "FiraCode Nerd Font Mono"; then
    echo "    Success: FiraCode Nerd Font Mono is registered"
    echo
    echo "Next: set your terminal's font to 'FiraCode Nerd Font Mono'"
else
    echo "    Warning: font installed to disk but not detected by fc-list"
    echo "    Try logging out and back in, or run 'fc-cache -fv' manually"
    exit 1
fi
