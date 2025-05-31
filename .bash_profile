#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z $TMUX ]; then
    exec hyprland
fi
