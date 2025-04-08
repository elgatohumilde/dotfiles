#!/usr/bin/env bash

set -o errexit -o pipefail -o nounset

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
yay --needed -Sy pacman-contrib waybar hyprland tofi gnu-free-fonts ttf-cascadia-code-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common noto-fonts-emoji noto-fonts-cjk otf-fonts-awesome xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk wlr-randr stow vim neovim wl-clipboard unzip 7zip wget kitty brightnessctl pavucontrol pamixer playerctl ripgrep fd fzf zathura zathura-pdf-mupdf zathura-djvu python python-pip imv mpv yt-dlp man-db man-pages hyprlock qt5-wayland qt6-wayland thunar vesktop-bin texlive librewolf-bin tree-sitter-cli nodejs syncthing openssh gitu yazi fastfetch eww-git pipewire lib32-pipewire pipewire-audio pipewire-pulse pipewire-docs wireplumber wireplumber-docs lswt-git yarn tmux moreutils mako fennel tree perl-file-mimeinfo jq bc
# yay --needed -Sy tokyonight-gtk-theme-git nwg-look
# curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
# sudo ln -s /usr/bin/kitty /usr/bin/xterm
# xdg-mime default org.pwmt.zathura-pdf-mupdf.desktop application/pdf
