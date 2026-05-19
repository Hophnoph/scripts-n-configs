local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_cwd = "~/"
config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("jetbrainsMono Nerd Font")
config.font_size = 18

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.tab_max_width = 32
config.detect_password_input = false
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.colors = {
  tab_bar = {
    background = "#1e1e2e",

    active_tab = {
      bg_color = "#89b4fa",
      fg_color = "#1e1e2e",
      intensity = "Bold",
    },

    inactive_tab = {
      bg_color = "#313244",
      fg_color = "#cdd6f4",
    },

    inactive_tab_hover = {
      bg_color = "#45475a",
      fg_color = "#cdd6f4",
    },

    new_tab = {
      bg_color = "#1e1e2e",
      fg_color = "#89b4fa",
    },
  },
}

config.keys = {
	-- Tabs
	{ mods = "CTRL", key = "t", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ mods = "CTRL", key = "w", action = wezterm.action.CloseCurrentTab({confirm = true}) },
	{ mods = "CTRL", key = "Tab", action = wezterm.action.ActivateTabRelative(1) },
	{ mods = "CTRL|SHIFT", key = "Tab", action = wezterm.action.ActivateTabRelative(-1) },
	{ mods = "CTRL|SHIFT", key = "1", action = wezterm.action.ActivateTab(0) },
	{ mods = "CTRL|SHIFT", key = "2", action = wezterm.action.ActivateTab(1) },
	{ mods = "CTRL|SHIFT", key = "3", action = wezterm.action.ActivateTab(2) },
	{ mods = "CTRL|SHIFT", key = "4", action = wezterm.action.ActivateTab(3) },
	{ mods = "CTRL|SHIFT", key = "5", action = wezterm.action.ActivateTab(4) },
	{ mods = "CTRL|SHIFT", key = "6", action = wezterm.action.ActivateTab(5) },
	{ mods = "CTRL|SHIFT", key = "7", action = wezterm.action.ActivateTab(6) },
	{ mods = "CTRL|SHIFT", key = "8", action = wezterm.action.ActivateTab(7) },
	{ mods = "CTRL|SHIFT", key = "9", action = wezterm.action.ActivateTab(8) },

	-- Panes
	{ mods = "CTRL", key = "p", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
	{ mods = "CTRL|SHIFT", key = "P", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },

	{ mods = "CTRL", key = "h", action = wezterm.action.ActivatePaneDirection "Left" },
	{ mods = "CTRL", key = "j", action = wezterm.action.ActivatePaneDirection "Down" },
	{ mods = "CTRL", key = "k", action = wezterm.action.ActivatePaneDirection "Up" },
	{ mods = "CTRL", key = "l", action = wezterm.action.ActivatePaneDirection "Right" },

	{ mods = "CTRL", key = "x", action = wezterm.action.CloseCurrentPane { confirm = true } },

	{ mods = "CTRL|SHIFT", key = "H", action = wezterm.action.AdjustPaneSize { "Left", 5 } },
	{ mods = "CTRL|SHIFT", key = "J", action = wezterm.action.AdjustPaneSize { "Down", 5 } },
	{ mods = "CTRL|SHIFT", key = "K", action = wezterm.action.AdjustPaneSize { "Up", 5 } },
	{ mods = "CTRL|SHIFT", key = "L", action = wezterm.action.AdjustPaneSize { "Right", 5 } },

	{ mods = "CTRL", key = "z", action = wezterm.action.TogglePaneZoomState },
	{ mods = "CTRL", key = "m", action = wezterm.action.RotatePanes("Clockwise") },
	{ mods = "CTRL|SHIFT", key = "m", action = wezterm.action.RotatePanes("CounterClockwise") },
}

return config
