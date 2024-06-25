local wezterm = require("wezterm")
local format_tab_title = {}
local colors = {
    default = { background = "#181825", foreground = "#6c7086" },
    active = { background = "#1e1e2e", foreground = "#cba6f7" },
    hover = { background = "#27273d", foreground = "#cba6f7" }
}
local icons = {
    { "", "󰀻" },
    { "pwsh", "󰨊" },
    { "wslhost", "" },
    { "cmd", "" }
}

local push = function(background, foreground, attribute, text)
    table.insert(format_tab_title, { Background = { Color = background } })
    table.insert(format_tab_title, { Foreground = { Color = foreground } })
    table.insert(format_tab_title, { Attribute = attribute })
    table.insert(format_tab_title, { Text = text })
end

local process_name = function(str)
    local name = string.gsub(str, "(.*[/\\])(.*)", "%2")
    return name:gsub("%.exe$", "")
end

local tab_title = function(process_name, base_title, max_width, inset)
    local title = " "
    local found = false

    for _, icon in pairs(icons) do
        if process_name == icon[1] then
            title = title .. icon[2] .. " " .. base_title
            found = true
        end
    end

    if found == false then
        title = title .. process_name .. " - " .. base_title
    end

    if base_title:match("^Administrator: ") then
        title = "󰞀 " .. title:gsub("Administrator: ", "")
    end

    if title:len() > max_width then
        return wezterm.truncate_right(title, max_width - inset) .. "... "
    else
        return title .. " "
    end
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    format_tab_title = {}
    local title = tab_title(process_name(tab.active_pane.foreground_process_name), tab.active_pane.title,
        require("config.appearance").tab_max_width, 4)
    local background = ""
    local foreground = ""

    if tab.is_active then
        background = colors.active.background
        foreground = colors.active.foreground
    elseif hover then
        background = colors.hover.background
        foreground = colors.hover.foreground
    else
        background = colors.default.background
        foreground = colors.default.foreground
    end

    if tab.is_active then
        push(background, foreground, { Underline = "Single" }, title)
    elseif hover then
        push(background, foreground, { Intensity = "Bold" }, title)
    else
        push(background, foreground, { Intensity = "Normal" }, title)
    end

    return format_tab_title
end)

return {}
