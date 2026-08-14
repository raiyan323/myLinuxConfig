function fish_greeting
    # ============================================================
    # RAIYAN // MODERN HACKER GREETING
    # ============================================================

    # Bright cyan
    set_color 39E8FF

    echo '██████╗  █████╗ ██╗██╗   ██╗ █████╗ ███╗   ██╗'
    
    # Cyan → blue
    set_color 27D7ED
    echo '██╔══██╗██╔══██╗██║╚██╗ ██╔╝██╔══██╗████╗  ██║'
    
    # Electric blue
    set_color 3D9FE8
    echo '██████╔╝███████║██║ ╚████╔╝ ███████║██╔██╗ ██║'
    
    # Cyan
    set_color 27D7ED
    echo '██╔══██╗██╔══██║██║  ╚██╔╝  ██╔══██║██║╚██╗██║'
    
    # Green accent
    set_color 35D39A
    echo '██║  ██║██║  ██║██║   ██║   ██║  ██║██║ ╚████║'
    
    # Bright green
    set_color 5BE8B0
    echo '╚═╝  ╚═╝╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝'

    # Reset
    set_color normal

    # System information
    if command -q fastfetch
        fastfetch --key-padding-left 5
    end
end