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

    function fish_prompt --description Aphrodite
        set -l retc red
        test $status = 0; and set retc normal

        set -g VIRTUAL_ENV_DISABLE_PROMPT true
        set -q VIRTUAL_ENV; and echo -n (set_color white)'['(basename "$VIRTUAL_ENV")'] '

        echo -n (set_color cyan)$USER
        echo -n (set_color brblack)'@'
        echo -n (set_color brblue)(prompt_hostname)
        echo -n (set_color brblack)':'
        echo -n (set_color normal)(prompt_pwd -D 64)
        echo -n ' '

        set -l git_branch (git --no-optional-locks rev-parse --abbrev-ref HEAD 2> /dev/null)
        if test -n "$git_branch"
            set -l git_status (git --no-optional-locks status --porcelain 2> /dev/null | tail -n 1)

            set -l git_branch_color brgreen
            test -n "$git_status"; and set git_branch_color bryellow

            echo -n "$(set_color $git_branch_color)‹"$git_branch"›"
        end

        set -q APHRODITE_THEME_SHOW_TIME; and echo -n "$(set_color brblack) [$(date +%H:%M:%S)]"

        echo

        set_color $retc
        if functions -q fish_is_root_user; and fish_is_root_user
            echo -n '# '
        else
            echo -n '$ '
        end

        set_color normal
    end

    zoxide init --cmd cd fish | source
    direnv hook fish | source
end
