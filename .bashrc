#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:/home/joaquin/.local/bin
export EDITOR=nvim
export TERMINAL=kitty

alias sudo='sudo '
alias cls='clear'
alias ls='ls --color=auto -l'
alias la='ls -A'
alias grep='grep --color=auto'
alias open='xdg-open'
alias nv='nvim'

cd() {
    if [ -z "$1" ]; then
        command cd ~
    else
        command cd "$@"
    fi
}

fuzzy_cd() {
    local dir=$(fd -H -t d | fzf)
    if [ -n "$dir" ]; then
        command cd "$dir"
    fi
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ on \1/'
}

PS1=" \[\e[1;32m\]\w\[\e[0m\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \[\e[1;34m\]\t\[\e[0m\]\n  "

[ -f "/home/joaquin/.ghcup/env" ] && . "/home/joaquin/.ghcup/env" # ghcup-env

bind '"\C-x\C-d":"fuzzy_cd\n"'
