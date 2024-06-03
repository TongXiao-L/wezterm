local wezterm = require("wezterm")

local config = {}
config.__index = config

function config:init()
    local config = setmetatable({ options = {} }, self)
    return config
end

function config:append(options)
    for k, v in pairs(options) do
        if self.options[k] ~= nil then
            wezterm.log_warn("Duplicate config option detected: ",
                { old = self.options[k], new = options[k] })
            goto continue
        end
        self.options[k] = v
        ::continue::
    end
    return self
end

return config
