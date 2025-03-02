git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
yay --needed -Sy waybar river tofi ttf-cascadia-code-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common xdg-desktop-portal xdg-desktop-portal-wlr gnu-free-fonts noto-fonts-emoji noto-fonts-cjk stow neovim wl-clipboard unzip 7zip vim foot hyprlock brightnessctl pavucontrol pamixer playerctl  ripgrep fd fzf zathura zathura-pdf-mupdf zathura-djvu gcc-fortran python-pip mpv yt-dlp man-db man-pages hyprpaper qt5-wayland qt6-wayland thunar vesktop-bin texlive librewolf-bin tree-sitter-cli nodejs syncthing openssh gitu
