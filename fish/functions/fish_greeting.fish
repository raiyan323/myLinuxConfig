function fish_greeting
    echo -ne '\x1b[38;5;16m'

    echo '██████╗  █████╗ ██╗██╗   ██╗ █████╗ ███╗   ██╗'
    echo '██╔══██╗██╔══██╗██║╚██╗ ██╔╝██╔══██╗████╗  ██║'
    echo '██████╔╝███████║██║ ╚████╔╝ ███████║██╔██╗ ██║'
    echo '██╔══██╗██╔══██║██║  ╚██╔╝  ██╔══██║██║╚██╗██║'
    echo '██║  ██║██║  ██║██║   ██║   ██║  ██║██║ ╚████║'
    echo '╚═╝  ╚═╝╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝'

    set_color normal

    command -v fastfetch &>/dev/null; and fastfetch --key-padding-left 5

end
