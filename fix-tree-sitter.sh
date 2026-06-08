#!/usr/bin/env bash
# Rebuild tree-sitter-cli from source and replace Mason's prebuilt binary.
#
# Why: Mason ships tree-sitter prebuilts linked against newer glibc than
# Ubuntu 22.04 provides (system has 2.35; recent releases want 2.39+).
# Symptom: `/lib/x86_64-linux-gnu/libc.so.6: version 'GLIBC_2.39' not found`.
# Fix: compile locally so it links against the system glibc.
#
# Run this after every `:MasonUpdate tree-sitter-cli` until the OS is upgraded.

set -euo pipefail

MASON_BIN="$HOME/.local/share/nvim/mason/packages/tree-sitter-cli/tree-sitter-linux-x64"
CARGO="$HOME/.cargo/bin/cargo"
TREE_SITTER="$HOME/.cargo/bin/tree-sitter"

if [[ ! -x "$CARGO" ]]; then
  echo "rustup-managed cargo not found at $CARGO" >&2
  echo "Install with: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path" >&2
  exit 1
fi

if [[ ! -f "$MASON_BIN" ]]; then
  echo "Mason tree-sitter binary not found at $MASON_BIN" >&2
  echo "Install it first via :MasonInstall tree-sitter-cli in Neovim." >&2
  exit 1
fi

echo "==> Building tree-sitter-cli from source"
"$CARGO" install tree-sitter-cli

echo "==> Backing up Mason's prebuilt binary"
cp -f "$MASON_BIN" "${MASON_BIN}.glibc-incompatible.bak"

echo "==> Replacing Mason binary with locally compiled build"
cp -f "$TREE_SITTER" "$MASON_BIN"

echo "==> Verifying"
"$HOME/.local/share/nvim/mason/bin/tree-sitter" --version
echo "Done."
