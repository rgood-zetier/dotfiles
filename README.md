# dotfiles

Personal config files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup on a new machine

```bash
# 1. Install prerequisites
sudo apt install stow git curl unzip ripgrep fd-find build-essential

# 2. Clone
git clone <repo-url> ~/dotfiles
cd ~/dotfiles

# 3. Stow configs
stow nvim kitty tmux x11

# 4. Install fonts
./fonts/install.sh

# 5. Install Neovim
# See https://github.com/neovim/neovim/blob/master/INSTALL.md
# AppImage method:
#   curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
#   chmod u+x nvim-linux-x86_64.appimage
#   sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

# 6. Launch nvim — lazy.nvim will install all plugins automatically
nvim
```

## Layout

| Package | Stows to | Contents |
|---------|----------|----------|
| `nvim/` | `~/.config/nvim/` | Neovim config (lua) |
| `kitty/` | `~/.config/kitty/` | Kitty terminal config |
| `tmux/` | `~/.tmux.conf` | tmux config |
| `fonts/` | (run `./install.sh`) | Font install script |

## Updating

```bash
cd ~/dotfiles
git pull
# Plugins auto-update on next nvim launch via lazy-lock.json
```
