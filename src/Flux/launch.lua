local config = require(script.Parent.framework.config)
local Logger = require(script.Parent.framework.logger)
local logger = Logger.new()

function initialize(settings)
    settings = settings or config.defaultSettings
    if settings.logs ~= true then
        return
    else
        logger:log("Initializing Framework...")
        logger:log("Version: " .. config._version)
        logger:log("Build: " .. config._build)
    end

    
    -- Additional setup tasks
    if settings.debugMode and not settings.logs then
        logger:log("Debug mode enabled")
    else
        Logger:log("Debug mode disabled")
    end
end

return {
    init = initialize
}