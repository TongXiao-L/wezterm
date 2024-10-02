local wezterm = require("wezterm")

return {
    font = wezterm.font_with_fallback {
        { family = "JetBrainsMono Nerd Font", weight = "DemiBold" },
        { family = "MiSans", scale = 1.1, weight = "Medium" }
    },
    font_size = 12,
    line_height = 1.0,
    underline_thickness = 2,
    underline_position = -2
}
