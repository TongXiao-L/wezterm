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
end

return config
