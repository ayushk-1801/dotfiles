local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config = {
    enable_tab_bar = false,
    font = wezterm.font("JetBrains Mono"),
    font_size = 20.0,
    color_scheme = "Ayu Dark (Gogh)",
    window_background_opacity = 0.5,
    default_prog = {
        "/usr/bin/fish",
        "-l",
        "-c",
        [[
        if command -v tmux > /dev/null
            tmux attach || tmux new
        else
            exec fish
        end
        ]],
    },
}

return config
