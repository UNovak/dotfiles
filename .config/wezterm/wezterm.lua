local wezterm = require("wezterm")

local config = {}

function get_appearance()
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return "Dark"
end

function scheme_for_appearance(appearance)
    if appearance:find("Dark") then
        return "Tokyo Night"
    else
        return "Tokyo Night Storm"
    end
end

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.window_close_confirmation = "NeverPrompt"

config.window_decorations = "RESIZE" -- remove window decorations
config.enable_tab_bar = false        -- disable tab bar
config.window_background_opacity = 0.95
config.macos_window_background_blur = 15

config.audible_bell = "Disabled" -- disable sounds when at the end of doc
config.color_scheme = scheme_for_appearance(get_appearance())

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 14
cursor_blink_ease_in = "Linear"
cursor_blink_ease_out = "Linear"
config.cursor_blink_rate = 1200


config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
}

config.window_background_gradient = {
    orientation = { Linear = { angle = -45.0 } },
    colors = {
        '#0f101a',
        '#171720',
        "#0f101a",
    },
    blend = "Rgb",
    interpolation = "CatmullRom",
}

-- window padding
config.window_padding = {
    left = 40,
    right = 40,
    top = 32,
    bottom = 32,
}

-- custom key bindings
local act = wezterm.action
config.keys = {
    {
        key = "c",
        mods = "CMD",
        action = act.CopyTo("ClipboardAndPrimarySelection"),
    },
    {
        -- Disable Cmd + T
        key = "t",
        mods = "CMD",
        action = act.DisableDefaultAssignment,
    },
    {
        -- ALT + LeftArrow -> jump one word back
        key = "LeftArrow",
        mods = "OPT",
        action = act({ SendString = "\x1bb" }),
    },
    {
        -- ALT + RightArrow -> jump one word forward
        key = "RightArrow",
        mods = "OPT",
        action = act({ SendString = "\x1bf" }),
    },
    {
        -- CMD + Shift + p -> open command pallete
        key = "P",
        mods = "CMD",
        action = act.ActivateCommandPalette,
    },
    {
        -- CMD + , -> open wezterm config with Zed
        key = ',',
        mods = 'CMD',
        action = act.SpawnCommandInNewTab {
            cwd = os.getenv('WEZTERM_CONFIG_DIR'),
            set_environment_variables = {
                TERM = 'screen-256color',
            },
            args = {
                '/opt/homebrew/bin/zed',
                os.getenv('WEZTERM_CONFIG_FILE'),
            },
        },
    },
    {
        -- ALT + Backspace -> delete current word
        key = 'Backspace',
        mods = 'CMD',
        action = act.SendKey { key = 'w', mods = 'CTRL' }
    },
    {
        -- ALT + Backspace -> delete current line
        key = 'Backspace',
        mods = 'CMD',
        action = act.SendKey { key = 'u', mods = 'CTRL' }
    },
    {
        -- CMD + k -> clear the terminal
        key = 'k',
        mods = 'CMD',
        action = act.Multiple
            {
                act.ClearScrollback 'ScrollbackAndViewport',
                act.SendKey { key = 'L', mods = 'CTRL' }
            }
    },
    {
        -- CTRL + \ -> Split pane horizontally
        key = '\\',
        mods = 'CTRL',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        -- SHIFT + CTRL + \ -> close the current split
        key = '|',
        mods = 'SHIFT|CTRL',
        action = act.CloseCurrentPane { confirm = false },
    },
}

return config
