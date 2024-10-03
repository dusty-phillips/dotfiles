if status is-interactive
    # Managing dot files (https://www.atlassian.com/git/tutorials/dotfiles)
    # curl -Lks https://is.gd/B5GXbi | /bin/bash
    alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

    set fish_greeting
    set fish_cursor_insert line
    set -x EDITOR nvim
    set -x _ZL_FZF_FLAG +s # make z.lua fuzzy by removing -e

    fish_vi_key_bindings

    # Need brew install fisher fzf && fisher install PatrickF1/fzf.fish
    fzf_configure_bindings --directory=\cf --processes=\cp --git_log=\cl --git_status=\cs
    set fzf_fd_opts --exclude Library

    function fish_user_key_bindings
        bind --mode insert \er 'z -I . ; commandline -f repaint'
    end

    alias lg='lazygit'
    alias rm=grm
    alias cp=gcp
    alias sed=gsed
    function grep # Needs to be function or fish overrules it
        ggrep --color=auto $argv
    end

    starship init fish | source
end
