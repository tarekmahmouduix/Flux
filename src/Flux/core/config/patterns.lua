-- patternsModule.lua
local patternsModule = {}
local styleHandlers = require(script.Parent.Parent.StyleHandler)  -- Adjust the path as needed
local config = require(script.Parent.Parent.stylesConfig)

local propertyMappings = {
    s = { x = "Size", y = "Size" },
    pos = { x = "Position", y = "Position" },
    bg = { color = "BackgroundColor3" },
    textColor = { color = "TextColor3" },
    border = { color = "BorderColor3" }
}

local function applySizeOrPosition(guiElement, category, property, value, unit, isSize)
    if isSize then
        if property == "x" then
            guiElement.Size = UDim2.new(
                unit == "%" and value / 100 or value, 
                guiElement.Size.X.Offset, 
                guiElement.Size.Y.Scale, 
                guiElement.Size.Y.Offset
            )
        elseif property == "y" then
            guiElement.Size = UDim2.new(
                guiElement.Size.X.Scale, 
                guiElement.Size.X.Offset, 
                unit == "%" and value / 100 or value, 
                guiElement.Size.Y.Offset
            )
        end
    else
        if property == "x" then
            guiElement.Position = UDim2.new(
                unit == "%" and value / 100 or value, 
                guiElement.Position.X.Offset, 
                guiElement.Position.Y.Scale, 
                guiElement.Position.Y.Offset
            )
        elseif property == "y" then
            guiElement.Position = UDim2.new(
                guiElement.Position.X.Scale, 
                guiElement.Position.X.Offset, 
                unit == "%" and value / 100 or value, 
                guiElement.Position.Y.Offset
            )
        end
    end
end

local function applyProperty(guiElement, category, property, value, unit)
    if category == "s" or category == "pos" then
        applySizeOrPosition(guiElement, category, property, value, unit, category == "s")
    elseif category == "border" then
        guiElement.BorderSizePixel = tonumber(value)
    elseif category == "bg" then
        if property == "opacity" then
            guiElement.BackgroundTransparency = value / 100
        end
    elseif category == "text" then
        if property == "opacity" then
            guiElement.TextTransparency = value / 100
        end
    elseif category == "item" and property == "rotate" and unit == "deg" then
        guiElement.Rotation = tonumber(value)
    end
end

local function handlePseudoClass(guiElement, pseudoClass, category, property, value, unit)
    local originalProperty
    if pseudoClass == "hover:" then
        if category == "s" then
            originalProperty = guiElement.Size
        elseif category == "pos" then
            originalProperty = guiElement.Position
        elseif category == "b" then
            originalProperty = guiElement.BorderSizePixel
        elseif category == "bg" and property == "opacity" then
            originalProperty = guiElement.BackgroundTransparency
        elseif category == "text" and property == "opacity" then
            originalProperty = guiElement.TextTransparency
        elseif category == "item" and property == "rotate" and unit == "deg" then
            originalProperty = guiElement.Rotation
        end

        guiElement.MouseEnter:Connect(function()
            applyProperty(guiElement, category, property, value, unit)
        end)
        guiElement.MouseLeave:Connect(function()
            if category == "s" then
                guiElement.Size = originalProperty
            elseif category == "pos" then
                guiElement.Position = originalProperty
            elseif category == "b" then
                guiElement.BorderSizePixel = originalProperty
            elseif category == "bg" and property == "opacity" then
                guiElement.BackgroundTransparency = originalProperty
            elseif category == "text" and property == "opacity" then
                guiElement.TextTransparency = originalProperty
            elseif category == "item" and property == "rotate" and unit == "deg" then
                guiElement.Rotation = originalProperty
            end
        end)
    elseif pseudoClass == "focus:" then
        local originalProperty
        if category == "s" then
            originalProperty = guiElement.Size
        elseif category == "pos" then
            originalProperty = guiElement.Position
        elseif category == "b" then
            originalProperty = guiElement.BorderSizePixel
        elseif category == "bg" and property == "opacity" then
            originalProperty = guiElement.BackgroundTransparency
        elseif category == "text" and property == "opacity" then
            originalProperty = guiElement.TextTransparency
        elseif category == "item" and property == "rotate" and unit == "deg" then
            originalProperty = guiElement.Rotation
        end

        guiElement.Focused:Connect(function()
            applyProperty(guiElement, category, property, value, unit)
        end)
        guiElement.FocusLost:Connect(function()
            if category == "s" then
                guiElement.Size = originalProperty
            elseif category == "pos" then
                guiElement.Position = originalProperty
            elseif category == "b" then
                guiElement.BorderSizePixel = originalProperty
            elseif category == "bg" and property == "opacity" then
                guiElement.BackgroundTransparency = originalProperty
            elseif category == "text" and property == "opacity" then
                guiElement.TextTransparency = originalProperty
            elseif category == "item" and property == "rotate" and unit == "deg" then
                guiElement.Rotation = originalProperty
            end
        end)
    else
        applyProperty(guiElement, category, property, value, unit)
    end
end

patternsModule.patterns = {
    {
        pattern = "^(%w+:)(%w+)%-(%w*)%-%[(%d*%.?%d+)([%a+%%]*)%]$",
        handler = function(guiElement, pseudoClass, category, property, value, unit)
            handlePseudoClass(guiElement, pseudoClass, category, property, value, unit)
        end
    },
    {
        pattern = "^(%w+:)(%w+)%-%[(%d)]",
        handler = function(guiElement, pseudoClass, category, property, value, unit)
            handlePseudoClass(guiElement, pseudoClass, category, property, value, unit)
        end
    },
    {
        pattern = "^(%w+:)(%w+)%-(%w+)$",
        handler = function(guiElement, pseudoClass, category, value)
            local handler = config[category]
            if handler then
                handler(guiElement, value)
            else
                warn("No handler found for category:", category)
            end
        end
    },
    {
        pattern = "^(%w+:)(%w+)%-%[(%d*%.?%d+)(px*)%]$",
        handler = function(guiElement, pseudoClass, category, value, unit)
            local function applyOnEvent(event)
                if pseudoClass == "hover:" then
                    local current
                    if category == "border" then
                        current = guiElement.BorderSizePixel
                    end
    
                    guiElement.MouseEnter:Connect(function()
                        applyProperty(guiElement, category, pseudoClass, value, unit)
                    end)
                    guiElement.MouseLeave:Connect(function()
                        if category == "border" then
                            guiElement.BorderSizePixel = current
                        end
                    end)
                elseif pseudoClass == "focus:" then
                    local current
                    if category == "border" then
                        current = guiElement.BorderSizePixel
                    end
    
                    guiElement.Focused:Connect(function()
                        applyProperty(guiElement, category, pseudoClass, value, unit)
                    end)
                    guiElement.FocusLost:Connect(function()
                        if category == "border" then
                            guiElement.BorderSizePixel = current
                        end
                    end)
                end
            end
            
            applyOnEvent(pseudoClass)
        end
    },
    {
        pattern = "^(%w+)%-(%w+)%-%[(%d*%.?%d+)([%a%%]*)%]$",
        handler = function(guiElement, category, property, value, unit)
            if category == "bg" and property == "opacity" and unit == "%" then
                guiElement.BackgroundTransparency = value / 100
            elseif category == "text" and property == "opacity" and unit == "%" then
                guiElement.TextTransparency = value / 100
            end
        end
    },
    {
        pattern = "^(%w+)%-%[(%d*%.?%d+)([px]*)%]$",
        handler = function(guiElement, category, value, unit)
            if category == "border" then
                guiElement.BorderSizePixel = tonumber(value)
            else
                warn("Unsupported category for BorderSizePixel:", category)
            end
        end
    },
    {
        pattern = "^(%w+)$",
        handler = function(guiElement, category)
            local key = category
            local styleFunction = config[category] and config[category][key]
            if styleFunction then
                styleFunction(guiElement)
            else
                warn("No predefined style found for key/property:", category)
            end
        end
    },
   --[[     {
        pattern = "^(%w+)%-(%d+)",
        handler = function(guiElement, category, value)
            local realcateg
            if category == "pt" or "pb" or "pr" or "pl" then
                realcateg = "p"
            end
            local key = category .. "-" .. value
            local styleFunction = config[category] and config[category][key]
            if styleFunction then
                styleFunction(guiElement)
            else
                warn("No predefined style found for key/property:", key)
            end
        end
    },--]]
    {
        pattern = "^(%w+)-(%w+)$",
        handler = function(guiElement, category, value)
            local realcat
            local key = category .. "-" .. value
    
            -- Map categories to real categories
            if category == "pt" or category == "pb" or category == "pr" or category == "pl" then
                realcat = "padding"
            elseif category == "s" then
                realcat = "size"
            elseif category == "z" then
                realcat = "zindex"
            else
                warn("Unknown category:", category)
                return
            end
    
            print(category, key)
    
            -- Retrieve and apply the style function
            local styleFunction = config[realcat] and config[realcat][key]
            if styleFunction then
                styleFunction(guiElement)
            else
                warn("No predefined style found for key/property:", key)
            end
        end
    },
    

    {
        pattern = "^(%w+)%-%[(%d*%.?%d+)([%.%%]*)%]$",
        handler = function(guiElement, category, value, unit)
            local handler = styleHandlers[category]
            if handler then
                handler(guiElement, tonumber(value), unit)
            else
                warn("No handler found for category:", category)
            end
        end
    },
    {
        pattern = "^(%w+)%-(%w+)%-(%w+)$",
        handler = function(guiElement, category, property, value)
            local key = category .. "-" .. property .. "-" .. value

            if category == "aspect" then
                category = "aspectRatio"
            elseif category == "bg" then
                category = "background"
            end

            local styleFunction = config[category] and config[category][key]
            if styleFunction then
                styleFunction(guiElement)
            else
                warn("No predefined style found for key/property:", key)
            end
        end
    },
    {
        pattern = "^(%w+)%-([%w%-]+)$",
        handler = function(guiElement, category, value)
            local key = category .. "-" .. value
            local styleFunction = config[category] and config[category][key]
            if styleFunction then
                styleFunction(guiElement)
            else
                warn("No predefined style found for key/property:", key)
            end
        end
    },
    
    {
        pattern = "^(%w+)%-(%w+)$",
        handler = function(guiElement, category, property)
            print(category, property)
            local key = category .. "-" .. property
            local styleFunction = config[category] and config[category][key]
            if styleFunction then
                styleFunction(guiElement)
            else
                warn("No predefined style found for key/property:", key)
            end
        end
    },

    {
        pattern = "^(%w+)%-%[(%d+),(%d+),(%d+)%]$",
        handler = function(guiElement, colorCategory, r, g, b)
            local color = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
            if colorCategory == "bg" then
                guiElement.BackgroundColor3 = color
            elseif colorCategory == "text" then
                guiElement.TextColor3 = color
            else
                warn("Unsupported color category:", colorCategory)
            end
        end
    }
}

return patternsModule
