local ClassParser = require(script.Parent.ClassParser)
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
            applyCustomStyle(guiElement, category, value, unit)
        end
    },
    
    {
        pattern = "(:%w+)%-(%w+)%-%[(%d*%.?%d+)([%a%%]*)%]",
        handler = function(guiElement, pseudoClass, category, value, unit)
            print("done")
            print(pseudoClass, category, value, unit)
        end
    },
    {
        pattern = "(::%w+)%s(%w+)",
        handler = function(guiElement)
            
        end
    },
    --more handlers
}

function applyPredefinedStyle(guiElement, className)
    if config.textColors[className] then
        config.textColors[className](guiElement)
    elseif config.size[className] then
        config.size[className](guiElement)
    elseif config.backgroundColors[className] then
        config.backgroundColors[className](guiElement)
    elseif config.round[className] then
        config.round[className](guiElement)
    elseif config.border[className] then
        config.border[className](guiElement)
    elseif config.visible[className] then
        config.visible[className](guiElement)
    elseif config.borderColors[className] then
        config.borderColors[className](guiElement)
    elseif config.transparency[className] then
        config.transparency[className](guiElement)
    else
        return false -- No match found for predefined styles
    end
    return true -- Successfully applied predefined style
end

function applyPseudoClassStyle(guiElement, pseudoClass, styleName, value, unit)
    -- Check for specific pseudo-classes and apply corresponding styles
    if pseudoClass == ":hover" then
        print("nigest")
        guiElement.MouseLeave:Connect(function()
            -- Revert to the default style when not hovering
            -- Assuming a default style is stored or handled separately
        end)
    elseif pseudoClass == ":active" then
        -- Example: Apply an active effect
        -- Use Roblox's event system to detect clicks
        guiElement.MouseButton1Down:Connect(function()
            applyCustomStyle(guiElement, styleName, value, unit)
        end)
        guiElement.MouseButton1Up:Connect(function()
            -- Revert to the default style when not active
        end)
    else
        -- Handle other pseudo-classes if needed
    end
end

function applyCustomStyle(guiElement, category, value, unit)
    local handler = ClassParser[category]
    if handler then
        handler(guiElement, tonumber(value), unit)
    else
        warn("Handler for category " .. category .. " does not exist.")
    end
end

function processClass(class, guiElement)
    local matched = false
    
    for _, entry in ipairs(patterns) do
        local pattern = entry.pattern
        local handler = entry.handler
        local matches = {class:match(pattern)}
        
        if #matches > 0 then
            matched = true
            -- Pass the matched groups to the handler function
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