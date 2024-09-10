local utils = {}

local function isString(string)
    return type(string) == "string"
end

local function debounce(func, delay)
    local timer
    return function(...)
        local args = table.pack(...)  -- Capture arguments into a table
        if timer then
            timer:Cancel()
        end
        timer = game:GetService("Debris"):AddItem(function()
            func(table.unpack(args))  -- Unpack arguments when calling the function
        end, delay)
    end
end

utils.debounce = debounce
utils.isString = isString

return utils