local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 14
config.color_scheme = "tokyonight"

config.font = wezterm.font("Hack Nerd Font Mono", { weight = "Regular" })

-- Claude Code Notification
config.audible_bell = "SystemBeep" -- or "Disabled"
config.visual_bell = {
	fade_in_duration_ms = 75,
	fade_out_duration_ms = 75,
	target = "CursorColor", -- flashes the cursor
}
-- Optionally change the tab color when bell fires
config.window_frame = {}
wezterm.on("bell", function(window, pane)
	window:toast_notification("Claude Code", "Needs your attention!", nil, 3000)
end)

return config
