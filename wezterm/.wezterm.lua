local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font_size = 14
config.color_scheme = 'tokyonight'

config.font = wezterm.font('Hack Nerd Font Mono', { weight = 'Regular' })

return config
