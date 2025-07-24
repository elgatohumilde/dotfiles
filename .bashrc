#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]] then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export PATH
export SHELL=fish
export EDITOR=nvim
export TERMINAL=kitty
