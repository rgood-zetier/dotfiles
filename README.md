# dotfiles

Personal config files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup on a new machine

```bash
sudo apt install stow git
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
stow nvim kitty tmux
```

Then install a Nerd Font separately (see fonts/README.md) and run `fc-cache -fv`.
