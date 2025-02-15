local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config = {
    enable_tab_bar = false,
    font = wezterm.font("JetBrains Mono"),
    font_size = 20.0,
    color_scheme = "Ayu Dark (Gogh)",
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    -- window_background_opacity = 0.5,
   default_prog = {"/home/ayush/.local/bin/tmux-startup.sh"},
}

return config
