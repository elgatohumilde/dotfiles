#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1=' \W \$ '

export PATH=$PATH:/home/joaquin/.local/bin
export EDITOR=nvim
export TERMINAL=foot

alias ls='ls --color=auto'
alias la='ls -a'
alias grep='grep --color=auto'
alias open='xdg-open'

nvim() {
  if [ -d "$1" ]; then
    local file=$(find "$1" -type f | fzf --preview 'cat {}')
    if [ -n "$file" ]; then
      command nvim "$file"
    fi
  else
    command nvim "$@"
  fi
}
