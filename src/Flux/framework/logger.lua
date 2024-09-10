-- logger.lua
local Logger = {}
Logger.__index = Logger

function Logger.new()
    local self = setmetatable({}, Logger)
    return self
end

function Logger:log(message, level)
    level = level or "Flux"
    print(string.format("[%s] %s", level, message))
end

function Logger:error(message)
    self:log(message, "ERROR")
end

function Logger:warn(message)
    self:log(message, "WARN")
end

return Logger
