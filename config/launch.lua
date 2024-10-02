local platform = require("utils.platform")()

local config = {
    launch_menu = {},
    default_prog = {}
}

if platform.is_win then
    config.launch_menu = {
        { label = "PowerShell",     args = { "pwsh", "-nologo" } },
        { label = "Command Prompt", args = { "cmd" } },
    }
    config.default_prog = { "pwsh", "-nologo" }
elseif platform.is_linux or platform.is_macos then
    config.launch_menu = {
        { label = "Bash", args = { "bash" } },
        { label = "Fish", args = { "fish" } },
	{ label = "Zellij", args = { "zellij" } }
    }
    config.default_prog = { "zellij" }
end

return config
