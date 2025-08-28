if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
    fish_vi_key_bindings
    for mode in default insert
        bind -M $mode ctrl-space 'accept-autosuggestion'
        bind -M $mode \cp 'history-prefix-search-backward'
        bind -M $mode \cn 'history-prefix-search-forward'
    end

    alias sudo 'sudo '
    alias cls 'clear'
    alias ls 'eza'
    alias tree 'ls -T'
    alias open 'xdg-open'
    alias nv 'nvim'
    alias nvs 'nvim -S'
    alias lg 'lazygit'
    alias ldc 'lazydocker'
    alias ylg 'lazygit --git-dir ~/.local/share/yadm/repo.git/'

    zoxide init --cmd cd fish | source
    direnv hook fish | source
end
