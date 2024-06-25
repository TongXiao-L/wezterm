local wezterm = require("wezterm")
local format_text = {}

local push = function(background, foreground, attribute, text)
    table.insert(format_text, { Background = { Color = background } })
    table.insert(format_text, { Foreground = { Color = foreground } })
    table.insert(format_text, { Attribute = attribute })
    table.insert(format_text, { Text = text })
end

local date = function()
    local date = wezterm.strftime(" %a %H:%M:%S")
    push("#11111b", "#f38ba8", { Intensity = "Bold" }, "  " .. date .. " ")
end

wezterm.on("update-status", function(window, pane)
    format_text = {}
    date()
    window:set_right_status(wezterm.format(format_text))
end)

return {}
