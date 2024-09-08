local styleHandlers = require(script.Parent.ClassParser)  -- Adjust the path as needed
local pseudoClassHandlers = require(script.Parent["c$"])  -- Adjust the path as needed
local config = require(script.Parent.stylesConfig)

local style__apply = {}

local patterns = {
    {
        pattern = "(%w+)%-%[(%d+),(%d+),(%d+)%]",
        handler = function(guiElement, colorCategory, r, g, b)
            if colorCategory == "bg" then
                guiElement.BackgroundColor3 = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
            elseif colorCategory == "textColor" then
                guiElement.TextColor3 = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
            end
        end
    },
    {
        pattern = "(%w+)%-%[(%d*%.?%d+)([%.%.%%]*)%]",
        handler = function(guiElement, category, value, unit)
            local handler = styleHandlers[category]
            if handler then
                handler(guiElement, tonumber(value), unit)
            end
        end
    },
    {
        pattern = "(:%w+)%-(%w+)%-%[(%d*%.?%d+)([%a%%]*)%]",
        handler = function(guiElement, pseudoClass, category, value, unit)
            local handler = pseudoClassHandlers[pseudoClass]
            if handler then
                handler(guiElement, category, value, unit)
            end
        end
    },
    -- more patterns
}

function applyPredefinedStyle(guiElement, className)
    if config[className] then
        config[className](guiElement)
        return true
    end
    return false
end

function processClass(class, guiElement)
    local matched = false
    
    for _, entry in ipairs(patterns) do
        local pattern = entry.pattern
        local handler = entry.handler
        local matches = {class:match(pattern)}
        
        if #matches > 0 then
            matched = true
            handler(guiElement, table.unpack(matches))
            break
        end
    end

    if not matched then
        print("Error: No matching pattern found for: " .. tostring(class))
    end
end

function style__apply.applyStyles(guiElement, className)
    local classes = string.split(className, " ")
    for _, class in ipairs(classes) do
        if not applyPredefinedStyle(guiElement, class) then
            processClass(class, guiElement)
        end
    end
end

return style__apply
