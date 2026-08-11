-- ╔══════════════════════════════════════════════════════════════╗
-- ║                    HYPRLAND LUA CONFIG                     ║
-- ║                  Clean • Modern • Minimal                   ║
-- ╚══════════════════════════════════════════════════════════════╝


-- ==============================================================
-- MONITORS
-- ==============================================================

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})


-- ==============================================================
-- PROGRAMS
-- ==============================================================

local terminal    = "kitty"
local fileManager = "dolphin"
local browser     = "firefox"
local picker      = "hyprpicker -a"
local menu = "wofi --show drun --allow-images"


-- ==============================================================
-- ENVIRONMENT
-- ==============================================================

hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-- ==============================================================
-- AUTOSTART
-- ==============================================================

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hypridle")

    -- Clipboard history
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Cursor
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
end)


-- ==============================================================
-- GENERAL
-- ==============================================================

hl.config({

    general = {

        -- Window spacing
        gaps_in  = 2,
        gaps_out = 4,

        -- Borders
        border_size = 2,

        col = {
            active_border = {
                colors = {
                    "0xff89b4faff",
                    "0xffcba6f7ff",
                },
                angle = 45,
            },

            inactive_border = "0x66545464",
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = "dwindle",
    },


    -- ==========================================================
    -- DECORATION
    -- ==========================================================

    decoration = {

        rounding = 12,
        rounding_power = 2,

        active_opacity = 0.94,
        inactive_opacity = 0.88,

        shadow = {
            enabled = false,

            range = 18,
            render_power = 3,

            color = "0xaa000000",
        },

        blur = {
            enabled = true,

            size = 1,
            passes = 1,

            vibrancy = 0.20,
        },
    },


    -- ==========================================================
    -- ANIMATIONS
    -- ==========================================================

    animations = {
        enabled = true,
    },

})


-- ==============================================================
-- ANIMATION CURVES
-- ==============================================================

hl.curve("easeOutQuint", {
    type = "bezier",

    points = {
        { 0.23, 1 },
        { 0.32, 1 },
    },
})


hl.curve("easeInOutCubic", {
    type = "bezier",

    points = {
        { 0.65, 0.05 },
        { 0.36, 1 },
    },
})


hl.curve("almostLinear", {
    type = "bezier",

    points = {
        { 0.5, 0.5 },
        { 0.75, 1 },
    },
})


hl.curve("quick", {
    type = "bezier",

    points = {
        { 0.15, 0 },
        { 0.1, 1 },
    },
})


-- Smooth spring
hl.curve("smoothSpring", {
    type = "spring",

    mass = 1,
    stiffness = 85,
    dampening = 14,
})


-- ==============================================================
-- ANIMATIONS
-- ==============================================================

hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})


hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 5,
    spring = "smoothSpring",
})


hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4,
    spring = "smoothSpring",
    style = "popin 85%",
})


hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 3,
    bezier = "almostLinear",
    style = "popin 85%",
})


hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 2,
    bezier = "almostLinear",
})


hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 2,
    bezier = "almostLinear",
})


hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "quick",
})


hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
})


hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "fade",
})


hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 2,
    bezier = "almostLinear",
    style = "fade",
})


hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 3,
    bezier = "easeInOutCubic",
    style = "fade",
})


hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 3,
    bezier = "easeInOutCubic",
    style = "fade",
})


hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 3,
    bezier = "easeInOutCubic",
    style = "fade",
})


-- ==============================================================
-- DWINDLE
-- ==============================================================

hl.config({

    dwindle = {
        preserve_split = true,
    },

})


-- ==============================================================
-- MASTER
-- ==============================================================

hl.config({

    master = {
        new_status = "master",
    },

})


-- ==============================================================
-- SCROLLING
-- ==============================================================

hl.config({

    scrolling = {
        fullscreen_on_one_column = true,
    },

})


-- ==============================================================
-- MISC
-- ==============================================================

hl.config({

    misc = {

        -- Keep Hyprland's default wallpaper behavior
        force_default_wallpaper = -1,

        -- Keep Hyprland logo / splash
        disable_hyprland_logo = false,
    },

})


-- ==============================================================
-- INPUT
-- ==============================================================

hl.config({

    input = {

        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },

})


-- ==============================================================
-- THREE-FINGER WORKSPACE GESTURE
-- ==============================================================

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})


-- ==============================================================
-- DEVICE
-- ==============================================================

hl.device({

    name = "epic-mouse-v1",
    sensitivity = -0.5,

})


-- ==============================================================
-- KEYBINDINGS
-- ==============================================================

local mainMod = "SUPER"


-- ==============================================================
-- APPLICATIONS
-- ==============================================================

-- Terminal
hl.bind(
    mainMod .. " + Q",
    hl.dsp.exec_cmd(terminal)
)


-- File manager
hl.bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd(fileManager)
)


-- Browser
hl.bind(
    mainMod .. " + B",
    hl.dsp.exec_cmd(browser)
)


-- Color picker
hl.bind(
    mainMod .. " + SHIFT + P",
    hl.dsp.exec_cmd(picker)
)


-- Application launcher
hl.bind(
    mainMod .. " + SPACE",
    hl.dsp.exec_cmd(menu)
)


-- Lock screen
hl.bind(
    mainMod .. " + L",
    hl.dsp.exec_cmd("hyprlock")
)


-- ==============================================================
-- WINDOW MANAGEMENT
-- ==============================================================

-- Close window
hl.bind(
    mainMod .. " + C",
    hl.dsp.window.close()
)


-- Toggle floating
hl.bind(
    mainMod .. " + X",
    hl.dsp.window.float({
        action = "toggle",
    })
)


-- Toggle pseudo
hl.bind(
    mainMod .. " + P",
    hl.dsp.window.pseudo()
)


-- Toggle split
hl.bind(
    mainMod .. " + J",
    hl.dsp.layout("togglesplit")
)


-- ==============================================================
-- FOCUS
-- ==============================================================

hl.bind(
    mainMod .. " + LEFT",
    hl.dsp.focus({
        direction = "left",
    })
)


hl.bind(
    mainMod .. " + RIGHT",
    hl.dsp.focus({
        direction = "right",
    })
)


hl.bind(
    mainMod .. " + UP",
    hl.dsp.focus({
        direction = "up",
    })
)


hl.bind(
    mainMod .. " + DOWN",
    hl.dsp.focus({
        direction = "down",
    })
)


-- ==============================================================
-- SCREENSHOT
-- ==============================================================

hl.bind(
    "Print",
    hl.dsp.exec_cmd(
        'mkdir -p "$HOME/Pictures/Screenshots" && ' ..
        'grim - | satty -f - --copy-command wl-copy ' ..
        '-o "$HOME/Pictures/Screenshots/%Y%m%d_%H%M%S.png"'
    )
)


-- ==============================================================
-- EXIT / LOGOUT
-- ==============================================================

-- Direct exit
hl.bind(
    mainMod .. " + ALT + L",
    hl.dsp.exit()
)


-- Prefer hyprshutdown when available
hl.bind(
    mainMod .. " + M",
    hl.dsp.exec_cmd(
        "command -v hyprshutdown >/dev/null 2>&1 && " ..
        "hyprshutdown || hyprctl dispatch exit"
    )
)


-- ==============================================================
-- RELOAD
-- ==============================================================

hl.bind(
    mainMod .. " + SHIFT + R",
    hl.dsp.exec_cmd("hyprctl reload")
)


-- ==============================================================
-- WORKSPACES
-- ==============================================================

for i = 1, 10 do

    local key = i % 10

    -- Switch workspace
    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({
            workspace = i,
        })
    )

    -- Move window to workspace
    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({
            workspace = i,
        })
    )

end


-- ==============================================================
-- SPECIAL WORKSPACE / SCRATCHPAD
-- ==============================================================

-- Toggle scratchpad
hl.bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic")
)


-- Move active window to scratchpad
hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.window.move({
        workspace = "special:magic",
    })
)


-- ==============================================================
-- WORKSPACE SCROLLING
-- ==============================================================

hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({
        workspace = "e+1",
    })
)


hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({
        workspace = "e-1",
    })
)


-- ==============================================================
-- MOUSE WINDOW CONTROL
-- ==============================================================

-- SUPER + Left Mouse
hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    {
        mouse = true,
    }
)


-- SUPER + Right Mouse
hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    {
        mouse = true,
    }
)


-- ==============================================================
-- CLIPBOARD HISTORY
-- ==============================================================

hl.bind(
    mainMod .. " + V",
    function()
        hl.exec_cmd(
            "cliphist list | wofi --dmenu | cliphist decode | wl-copy"
        )
    end
)


-- ==============================================================
-- AUDIO CONTROL
-- ==============================================================

hl.bind(
    mainMod .. " + A",
    function()
        hl.exec_cmd("pavucontrol")
    end
)


-- ==============================================================
-- IMAGE VIEWER
-- ==============================================================

hl.bind(
    mainMod .. " + I",
    function()
        hl.exec_cmd("imv")
    end
)


-- ==============================================================
-- AUDIO
-- ==============================================================

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ),
    {
        locked = true,
        repeating = true,
    }
)


hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ),
    {
        locked = true,
        repeating = true,
    }
)


hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ),
    {
        locked = true,
        repeating = true,
    }
)


hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ),
    {
        locked = true,
        repeating = true,
    }
)


-- ==============================================================
-- BRIGHTNESS
-- ==============================================================

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%+"
    ),
    {
        locked = true,
        repeating = true,
    }
)


hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%-"
    ),
    {
        locked = true,
        repeating = true,
    }
)


-- ==============================================================
-- MEDIA KEYS
-- ==============================================================

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    {
        locked = true,
    }
)


hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    {
        locked = true,
    }
)


hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    {
        locked = true,
    }
)


hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    {
        locked = true,
    }
)


-- ==============================================================
-- WINDOW RULES
-- ==============================================================

-- Prevent maximize requests from applications.
-- This is intentionally global.
local suppressMaximizeRule = hl.window_rule({

    name = "suppress-maximize-events",

    match = {
        class = ".*",
    },

    suppress_event = "maximize",
})


-- To disable this rule later:
-- suppressMaximizeRule:set_enabled(false)


-- ==============================================================
-- XWAYLAND DRAG FIX
-- ==============================================================

hl.window_rule({

    name = "fix-xwayland-drags",

    match = {

        class = "^$",
        title = "^$",

        xwayland = true,
        float = true,

        fullscreen = false,
        pin = false,
    },

    no_focus = true,

})


-- ==============================================================
-- HYPRLAND RUN
-- ==============================================================

hl.window_rule({

    name = "move-hyprland-run",

    match = {
        class = "hyprland-run",
    },

    move = {
        "20",
        "monitor_h-120",
    },

    float = true,

})

