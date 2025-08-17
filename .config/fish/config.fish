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

    function on_fish_bind_mode --on-variable fish_bind_mode
        set --global --export vi_mode_symbol ""

        set --local color
        set --local char
        if test "$fish_key_bindings" = fish_vi_key_bindings
            switch $fish_bind_mode
                case default
                    set color red
                    set symbol N
                case insert
                    set color green
                    set symbol I
                case replace replace_one
                    set color green
                    set symbol R
                case visual
                    set color brmagenta
                    set symbol V
                case '*'
                    set color cyan
                    set symbol "?"
            end
            set vi_mode_symbol (set_color --bold $color)"[$symbol]"(set_color normal)
        end
    end

    zoxide init --cmd cd fish | source
    starship init fish | source
    direnv hook fish | source
end
