#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$TMUX" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec Hyprland
fi
