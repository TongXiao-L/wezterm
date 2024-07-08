local wezterm = require("wezterm")

return {
    font = wezterm.font_with_fallback {
        { family = "JetBrainsMono Nerd Font", weight = "DemiBold" },
        { family = "阿里巴巴普惠体 3.0", scale = 1.1, weight = "Medium" }
    },
    font_size = 11,
    line_height = 1.0,
    underline_thickness = 2,
    underline_position = -2
}
