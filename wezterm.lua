local config = require("config")

require("events.gui-startup")
require("events.tab-title")
require("events.update-status")

return config:init()
    :append(require("config.appearance"))
    :append(require("config.font"))
    :append(require("config.launch"))
    .options
