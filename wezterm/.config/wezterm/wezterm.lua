local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Bold" })
config.font_size = 15

config.color_scheme = "Catppuccin Mocha"

config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}

config.window_background_opacity = 0.9

config.enable_tab_bar = false
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"

return config
