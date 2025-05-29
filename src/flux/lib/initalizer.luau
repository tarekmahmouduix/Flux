local initalizer = {}

local classes = require(script.Parent.classes)
local advancedClasses = require(script.Parent.advancedClasses)
local mapping = require(script.Parent.mapping)
local types = require(script.Parent.types)
local util = require(script.Parent.util)
local handlers = {}

local SPECIAL_STATES = {
    hover = true,
    click = true,
    activated = true,
    focus = true
}

function initalizer.init()
    local configClasses = require(script.Parent.config).classes

    -- Merge config classes into main classes
    for key, value in pairs(configClasses) do
        if not classes[key] then
            classes[key] = value
        else
            for subKey, subValue in pairs(value) do
                if not classes[key][subKey] then
                    classes[key][subKey] = subValue
                end
            end
        end
    end

    handlers = util.parse(script.Parent.handlers)
end

local function resolveValue(property, value, element)
    if classes[property] and classes[property][value] ~= nil then
        return classes[property][value]
    end
    
    if advancedClasses[property] and advancedClasses[property][value] then
        local advancedValue = advancedClasses[property][value]
        if type(advancedValue) == "function" then
            advancedValue(element)
            return "FUNCTION_HANDLED"
        end
        return advancedValue
    end
    return value
end

function initalizer.applyStyles(element: GuiObject, data: types.StyleCard | string): GuiObject
    if not data then
        error("No data provided")
    end

    -- Handle string presets
    if type(data) == "string" then
        if not (classes.presets and classes.presets[data]) then
            error("Preset not found: " .. data)
        end
        return initalizer.applyStyles(element, classes.presets[data])
    end

    for property, value in pairs(data) do
        if not SPECIAL_STATES[property] then
            -- Skip special states for now
            local resolvedValue = resolveValue(property, value, element)
        end
    end

    for property, value in pairs(data) do
        if SPECIAL_STATES[property] then
            if type(value) ~= "table" then
                warn(property .. " requires table value. Got: " .. type(value))
                continue
            end

            -- Handle animation presets
            if value.animate and type(value.animate) == "string" then
                value = classes.animate and classes.animate[value.animate] or value
            end

            local handlerName = property .. "Handler"
            if handlers[handlerName] then
                handlers[handlerName].handle(element, value, false)
            else
                warn("Handler not found for: " .. handlerName)
            end
            continue
        end

        local resolvedValue = resolveValue(property, value, element)
        
        if resolvedValue == "FUNCTION_HANDLED" then
            continue
        end

        local robloxProperty = mapping[property] -- e.g. CornerRadius
        if robloxProperty ~= nil then
            -- Special handling for corner radius
            if robloxProperty == "CornerRadius" then
                local corner = element:FindFirstChildOfClass("UICorner")
                if not corner then
                    corner = Instance.new("UICorner")
                    corner.Parent = element
                end
                corner.CornerRadius = resolvedValue
            elseif robloxProperty == "VerticalAlignment" then
                local UIListLayout = element:FindFirstChildOfClass("UIListLayout")

                if not UIListLayout then
                    return error("please add a list layout first")
                end

                UIListLayout.VerticalAlignment = resolvedValue

            elseif robloxProperty == "HorizontalAlignment" then
                local UIListLayout = element:FindFirstChildOfClass("UIListLayout")

                if not UIListLayout then
                    return error("please add a list layout first")
                end

                UIListLayout.HorizontalAlignment = resolvedValue
            else
                element[robloxProperty] = resolvedValue
            end
        else
            warn(("Could not apply property '%s': %s"):format(
                property,
                robloxProperty and "Invalid Roblox property" or "No mapping found"
            ))
        end
    end

    return element
end

return initalizer