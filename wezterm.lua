local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- -- Add custom keybindings for copy mode
-- config.keys = {
-- 	-- Enter copy mode using Ctrl-Shift-C
-- 	{
-- 		key = "C",
-- 		mods = "CTRL|SHIFT",
-- 		action = wezterm.action.ActivateCopyMode,
-- 	},
-- 	-- In copy mode, press 'v' to start a selection
-- 	{
-- 		key = "v",
-- 		mods = "NONE",
-- 		action = act.CopyMode({ SetSelectionMode = "Cell" }),
-- 	},
-- 	-- Copy the selection to the clipboard using Ctrl-Shift-C
-- 	{
-- 		key = "C",
-- 		mods = "CTRL|SHIFT",
-- 		action = wezterm.action.CopyTo("Clipboard"),
-- 	},
-- 	-- Exit copy mode with 'Escape'
-- 	{
-- 		key = "Escape",
-- 		mods = "NONE",
-- 		action = wezterm.action.CopyMode("Close"),
-- 	},
-- }

config.disable_default_mouse_bindings = true

config.mouse_bindings = {
	-- Disable scrolling up with the wheel
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = "NONE",
		action = wezterm.action.Nop,
	},
	-- Disable scrolling down with the wheel
	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = "NONE",
		action = wezterm.action.Nop,
	},
	-- Disable horizontal scrolling
	{
		event = { Down = { streak = 1, button = { WheelLeft = 1 } } },
		mods = "NONE",
		action = wezterm.action.Nop,
	},
	{
		event = { Down = { streak = 1, button = { WheelRight = 1 } } },
		mods = "NONE",
		action = wezterm.action.Nop,
	},
}

config.color_scheme = "GruvboxDark"
-- config.color_scheme = "Tokyo Night"

config.font = wezterm.font({
	family = "Monaspace Neon",
	-- family = "Monaspace Argon",
	-- family='Monaspace Xenon',
	-- family='Monaspace Radon',
	-- family='Monaspace Krypton',
	weight = "Regular",
	harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
})

config.font_size = 14

-- https://wezfurlong.org/wezterm/config/lua/config/font_rules.html
-- wezterm ls-fonts
-- wezterm ls-fonts --list-system
config.font_rules = {
	--
	-- Italic (comments)
	--
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			family = "Monaspace Neon",
			weight = "Regular",
			stretch = "Normal",
			style = "Italic",
			harfbuzz_features = {
				"calt",
				"liga",
				"dlig",
				"ss01",
				"ss02",
				"ss03",
				"ss04",
				"ss05",
				"ss06",
				"ss07",
				"ss08",
			},
		}),
	},

	--
	-- Bold (highlighting)
	--
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = "Monaspace Neon",
			weight = "Bold",
			stretch = "Normal",
			style = "Normal",
			harfbuzz_features = {
				"calt",
				"liga",
				"dlig",
				"ss01",
				"ss02",
				"ss03",
				"ss04",
				"ss05",
				"ss06",
				"ss07",
				"ss08",
			},
		}),
	},
}

-- and finally, return the configuration to wezterm
return config
