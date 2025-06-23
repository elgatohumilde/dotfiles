if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
    fish_vi_key_bindings
    for mode in default insert
        bind -M $mode ctrl-space 'accept-autosuggestion'
        bind -M $mode \cp 'history-prefix-search-backward'
        bind -M $mode \cn 'history-prefix-search-forward'
        bind -M $mode \cx\cd 'commandline -r "fuzzy_cd"; commandline -f execute'
    end

    alias sudo 'sudo '
    alias cls 'clear'
    alias ls 'eza'
    alias open 'xdg-open'
    alias nv 'nvim'
    alias nvs 'nvim -S'
    alias mc 'emacs -nw'
    alias lg 'lazygit'
    alias ylg 'lazygit --git-dir ~/.local/share/yadm/repo.git/'

    function fuzzy_cd
        set dir (fd -H -t d . ~ | fzf)
        if test -n "$dir"
            cd "$dir"
        end
    end

    function parse_git_branch
        set branch (git branch 2> /dev/null | sed -n 's/* \(.*\)/ on \1/p')
        echo $branch
    end

    function git_prompt
        if git rev-parse --is-inside-work-tree &> /dev/null
            if git diff --quiet && git diff --cached --quiet
                echo -e "\033[0;32m✔\033[0m"
            else
                echo -e "\033[0;31m✘\033[0m"
            end
        end
    end

    function fish_prompt
        set_color green
        echo -n (prompt_pwd)
        set_color normal

        set_color yellow
        echo -n (parse_git_branch)
        set_color normal

        echo -n " "(git_prompt)

        set_color blue
        echo -n " "(date "+%H:%M:%S")
        set_color normal

        echo -e "\n  "
    end

    zoxide init --cmd cd fish | source
    direnv hook fish | source

    if not set -q TMUX
        tmux attach-session -t default; or tmux new-session -s default
    end
end
