# ~/.config/fish/config.fish

# ─────────────────────────────────────────────
# General
# ─────────────────────────────────────────────

set -g fish_greeting

# Editor
set -gx EDITOR nvim
set -gx VISUAL nvim

# ─────────────────────────────────────────────
# PATH
# ─────────────────────────────────────────────

fish_add_path ~/.local/bin
fish_add_path ~/bin

# ─────────────────────────────────────────────
# Aliases
# ─────────────────────────────────────────────

alias ll 'ls -lah'
alias la 'ls -A'
alias l 'ls -CF'

alias c 'clear'
alias .. 'cd ..'
alias ... 'cd ../..'

alias g 'git'
alias gs 'git status'
alias ga 'git add'
alias gc 'git commit'
alias gp 'git push'
alias gl 'git log --oneline --graph --decorate'

alias v 'nvim'

# Safety
alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'

# ─────────────────────────────────────────────
# Git
# ─────────────────────────────────────────────

function gco
    git checkout $argv
end

function gcb
    git checkout -b $argv
end

function gac
    git add .; and git commit -m "$argv"
end

# ─────────────────────────────────────────────
# Navigation
# ─────────────────────────────────────────────

function mkcd
    mkdir -p $argv; and cd $argv
end

function croot
    cd (git rev-parse --show-toplevel 2>/dev/null)
end

# ─────────────────────────────────────────────
# Useful functions
# ─────────────────────────────────────────────

function extract
    if test (count $argv) -ne 1
        echo "Usage: extract <archive>"
        return 1
    end

    switch $argv[1]
        case '*.tar.gz' '*.tgz'
            tar -xzf $argv[1]
        case '*.tar.bz2'
            tar -xjf $argv[1]
        case '*.tar.xz'
            tar -xJf $argv[1]
        case '*.tar'
            tar -xf $argv[1]
        case '*.zip'
            unzip $argv[1]
        case '*.gz'
            gunzip $argv[1]
        case '*.bz2'
            bunzip2 $argv[1]
        case '*'
            echo "Unknown archive format: $argv[1]"
            return 1
    end
end

# ─────────────────────────────────────────────
# Prompt
# ─────────────────────────────────────────────

function fish_prompt
    set_color cyan
    printf '%s' (whoami)

    set_color normal
    printf '@'

    set_color blue
    printf '%s' (hostname -s)

    set_color normal
    printf ':'

    set_color yellow
    printf '%s' (prompt_pwd)

    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set_color magenta
        printf ' (%s)' (git branch --show-current)
    end

    set_color normal
    printf '\n❯ '
end

# ─────────────────────────────────────────────
# Optional tools
# ─────────────────────────────────────────────

# Starship
if type -q starship
    starship init fish | source
end

# fzf
if type -q fzf
    fzf --fish | source
end

# zoxide
if type -q zoxide
    zoxide init fish | source
end