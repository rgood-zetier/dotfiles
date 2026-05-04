# Fonts

[FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases) (Mono variant) for terminal and editor.

## Install

```bash
./install.sh
```

After install, set your terminal's font to **`FiraCode Nerd Font Mono`**.

For Kitty, this is already configured in `kitty/.config/kitty/kitty.conf`.

## Why only the Mono variant?

The Nerd Font release includes three variants:

- **Mono** — every glyph forced to single-cell width. Required for terminals so icons don't break alignment in file trees, statuslines, and tabs.
- **(plain)** — most glyphs single-width, some span two cells. For GUI editors that handle variable-width.
- **Propo** — proportional spacing. Not for code/terminals.

Only the Mono variant is installed.

## Upgrading

1. Edit `FONT_VERSION` in `install.sh` to the new release tag
2. Delete `~/.local/share/fonts/FiraCodeNerdFont/`
3. Re-run `./install.sh`
4. Commit the change to `install.sh`
