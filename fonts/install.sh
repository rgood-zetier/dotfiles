#!/usr/bin/env bash
#
# Install Nerd Fonts:
#   - FiraCode Nerd Font Mono   (text rendering in terminal/editor)
#   - Symbols Nerd Font         (icon glyphs, used via kitty's symbol_map)
#
# Idempotent — safe to re-run.

set -euo pipefail

NERD_FONT_VERSION="v3.4.0"
RELEASE_BASE="https://github.com/ryanoasis/nerd-fonts/releases/download/${NERD_FONT_VERSION}"

FONTS_BASE="$HOME/.local/share/fonts"
FIRACODE_DIR="$FONTS_BASE/FiraCodeNerdFont"
SYMBOLS_DIR="$FONTS_BASE/SymbolsNerdFont"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

# Install a font from a Nerd Fonts release zip.
#   $1 - release zip filename (e.g. "FiraCode.zip")
#   $2 - target directory under ~/.local/share/fonts
#   $3 - glob for files to extract from the zip (e.g. "FiraCodeNerdFontMono-*.ttf")
#   $4 - friendly name for log output
install_font() {
  local zip_name="$1"
  local target_dir="$2"
  local file_glob="$3"
  local friendly="$4"

  echo "==> ${friendly}"

  if [ -d "$target_dir" ] && [ -n "$(ls -A "$target_dir" 2>/dev/null)" ]; then
    echo "    Already installed at $target_dir"
    return 0
  fi

  local zip_path="$TMP_DIR/$zip_name"
  echo "    Downloading ${RELEASE_BASE}/${zip_name}"
  curl -fL --progress-bar -o "$zip_path" "${RELEASE_BASE}/${zip_name}"

  echo "    Extracting to $target_dir"
  mkdir -p "$target_dir"
  unzip -j -q -o "$zip_path" "$file_glob" -d "$target_dir"
}

install_font \
  "FiraCode.zip" \
  "$FIRACODE_DIR" \
  "FiraCodeNerdFontMono-*.ttf" \
  "FiraCode Nerd Font Mono (terminal/editor text)"

install_font \
  "NerdFontsSymbolsOnly.zip" \
  "$SYMBOLS_DIR" \
  "SymbolsNerdFontMono-*.ttf" \
  "Symbols Nerd Font Mono (icon glyphs)"

echo
echo "==> Rebuilding font cache"
fc-cache -f "$FONTS_BASE"

echo
echo "==> Verifying"
missing=0
for name in "FiraCode Nerd Font Mono" "Symbols Nerd Font Mono"; do
  if fc-list | grep -qi "$name"; then
    echo "    ✓ $name registered"
  else
    echo "    ✗ $name NOT detected by fc-list"
    missing=$((missing + 1))
  fi
done

if [ "$missing" -gt 0 ]; then
  echo
  echo "Some fonts didn't register. Try logging out and back in, or run 'fc-cache -fv' manually."
  exit 1
fi

echo
echo "Done. Set your terminal's text font to 'FiraCode Nerd Font Mono'."
echo "For Kitty, the symbol_map config will route icon glyphs to Symbols Nerd Font Mono."
