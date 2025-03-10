# Arch-River dotfiles

This is where I store most of my configuration files. They're supposed to be managed with [stow](https://www.gnu.org/software/stow/).

The install script is very precarious; it installs [yay](https://github.com/Jguer/yay) and essential packages, but doesn't have good error handling.

# Installation

```bash
cd ~
git clone https://github.com/elgatohumilde/dotfiles ./.dotfiles
cd .dotfiles
chmod +x install.sh
./install.sh
```

Use at your own risk.
