local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'elgatohumilde'
config.color_schemes = {
    ['elgatohumilde'] = {
        foreground = '#dcd7ba',
        background = '#0c0c0c',

        selection_fg = '#c8c093',
        selection_bg = '#2d4f67',

        cursor_bg = '#a89984',
        cursor_fg = '#0c0c0c',

        ansi = {
            '#16161d',
            '#c34043',
            '#76946a',
            '#c0a36e',
            '#7e9cd8',
            '#957fb8',
            '#6a9589',
            '#c8c093',
        },

        brights = {
            '#727169',
            '#e82424',
            '#98bb6c',
            '#e6c384',
            '#7fb4ca',
            '#938aa9',
            '#7aa89f',
            '#dcd7ba',
        },
    }
}

config.window_background_opacity = 0.85

config.enable_tab_bar = false

config.font = wezterm.font 'CaskaydiaCove Nerd Font Mono'
config.font_size = 14.0

config.enable_kitty_graphics = true
config.enable_wayland = true

config.default_prog = { '/usr/bin/fish' }

return config
