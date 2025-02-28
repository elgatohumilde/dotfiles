git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
yay --needed -Sy waybar river tofi ttf-cascadia-code-nerd xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk gnu-free-fonts noto-fonts-emoji noto-fonts-cjk stow yazi neovim wl-clipboard unzip 7zip vim foot hyprlock brightnessctl pavucontrol pamixer playerctl  ripgrep fd fzf zathura zathura-pdf-mupdf zathura-djvu r gcc-fortran python-pip mpv yt-dlp man-db man-pages hyprpaper qt5-wayland qt6-wayland thunar quarto-cli-bin vesktop-bin texlive librewolf-bin tree-sitter-cli nodejs syncthing
