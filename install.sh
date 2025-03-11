#!/usr/bin/env bash

set -o errexit -o pipefail -o nounset

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
yay --needed -Sy waybar river tofi gnu-free-fonts ttf-cascadia-code-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common noto-fonts-emoji noto-fonts-cjk xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk stow vim neovim wl-clipboard unzip 7zip wget kitty brightnessctl pavucontrol pamixer playerctl ripgrep fd fzf zathura zathura-pdf-mupdf zathura-djvu python python-pip mpv yt-dlp man-db man-pages hyprlock hyprpaper qt5-wayland qt6-wayland thunar vesktop-bin texlive librewolf-bin tree-sitter-cli nodejs syncthing openssh gitu superfile-bin fastfetch eww-git pipewire lib32-pipewire pipewire-audio pipewire-pulse pipewire-docs wireplumber wireplumber-docs lswt-git yarn tmux moreutils mako fennel tree
# yay --needed -Sy tokyonight-gtk-theme-git nwg-look
# yay --needed -Sy clang lua-language-server
# yay --needed -Sy texlab
# yay -Sy ghc cabal-install haskell-language-server
# sudo ln -s /usr/bin/kitty /usr/bin/xterm
