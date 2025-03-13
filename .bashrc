#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:/home/joaquin/.local/bin
export EDITOR=nvim
export TERMINAL=kitty

alias sudo='sudo '
alias ls='ls --color=auto -l'
alias la='ls -A'
alias grep='grep --color=auto'
alias open='xdg-open'

nv() {
  if [ -d "$1" ]; then
    while true; do
      echo "1. fzf"
      echo "2. Netrw"
      echo "3. Exit"
      read -r option
      case "$option" in
        1)
          local file=$(fd -I -H f . "$1" | fzf --preview 'cat {}')
          if [ -n "$file" ]; then
            command nvim "$file"
          fi
          break
          ;;
        2)
          command nvim "$1"
          break
          ;;
        3)
          echo "Exit."
          break
          ;;
        *)
          echo "Invalid option."
          ;;
      esac
    done
  else
    command nvim "$@"
  fi
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ on \1/'
}

PS1=" \[\e[1;32m\]\w\[\e[0m\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \[\e[1;34m\]\t\[\e[0m\]\n  "
