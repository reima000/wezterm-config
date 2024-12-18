local wezterm = require("wezterm")

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

local config = wezterm.config_builder()

config.window_background_opacity = 0.80

config.hide_tab_bar_if_only_one_tab = true

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
