-- patternsModule.lua
local patternsModule = {}
local styleHandlers = require(script.Parent.Parent.StyleHandler)  -- Adjust the path as needed
local config = require(script.Parent.Parent.stylesConfig)

local propertyMappings = {
    s = {
        x = "Size",
        y = "Size"
    },
    pos = {
        x = "Position",
        y = "Position"
    },
    bg = {
        color = "BackgroundColor3"
    },
    textColor = {
        color = "TextColor3"
    },
    b = {
        color = "BorderColor3"
    }
}


local function applyPredefinedStyle(guiElement, className)
    for category, styles in pairs(config) do
        if styles[className] then
            print("Applying predefined style for className:", className)
            styles[className](guiElement)
            return true
        end
    end
    return false
end

patternsModule.patterns = {
    
    -- Size Pattern
    {
        pattern = "^(%w+:)(%w+)%-(%w*)%-%[(%d*%.?%d+)([%a+%%]*)%]$",
        handler = function(guiElement, pseudoClass, category, property, value, unit) -- hover:item-rotate-[50deg]
            local applyProperty = function()
                if category == "s" then
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
                elseif category == "pos" then
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
                elseif category == "b" then
                    -- Assuming 'b' refers to 'BorderSizePixel'
                    guiElement.BorderSizePixel = tonumber(value)
                elseif category == "bg" then
                    if property == "opacity" then
                        guiElement.BackgroundTransparency = value / 100
                    end
                elseif category == "text" then
                    if property == "opacity" then
                        guiElement.TextTransparency = value / 100
                    end
                elseif category == "item" then
                    if property == "rotate" and unit == "deg" then
                        guiElement.Rotation = tonumber(value)
                    end
                end
            end
            if pseudoClass == "hover:" then
                -- Store original properties dynamically
                local originalProperty
                if category == "s" then
                    originalProperty = guiElement.Size
                elseif category == "pos" then
                    originalProperty = guiElement.Position
                elseif category == "b" then
                    originalProperty = guiElement.BorderSizePixel
                elseif category == "bg" then
                    if property == "opacity" then
                        originalProperty = guiElement.BackgroundTransparency
                    end
                elseif category == "text" then
                    if property == "opacity" then
                        originalProperty = guiElement.TextTransparency
                    end
                elseif category == "item" then
                    if property == "rotate" and unit == "deg" then
                        originalProperty = guiElement.Rotation
                    end
                end

                guiElement.MouseEnter:Connect(function()
                    applyProperty()
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
            else
                applyProperty()
            end
        end
    },

    -- State Color Pattern
    {
        pattern = "^(%w+:)(%w+)%-%[(%d+),(%d+),(%d+)%]$",
        handler = function(guiElement, pseudoClass, category, r, g, b)
            local color = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
            
            -- Get the property to apply based on category
            local property = propertyMappings[category] and propertyMappings[category].color
            if not property then
                warn("Invalid category for color:", category)
                return
            end
            
            local applyColor = function()
                if property == "BackgroundColor3" then
                    guiElement.BackgroundColor3 = color
                elseif property == "TextColor3" then
                    guiElement.TextColor3 = color
                elseif property == "BorderColor3" then
                    guiElement.BorderColor3 = color
                end
            end
    
            if pseudoClass == "hover:" then
                -- Store original color
                local originalColor = guiElement[property]
                
                guiElement.MouseEnter:Connect(function()
                    applyColor()
                end)
                guiElement.MouseLeave:Connect(function()
                    guiElement[property] = originalColor
                end)
            else
                applyColor()
            end
        end
    },



    {
        pattern = "^(%w+:)(%w+)%-%[(%d*%.?%d+)([px]*)%]$",
        handler = function(guiElement, pseudoClass, category, value, unit)
        local function applyProperty()
                if category == "b" then
                    guiElement.BorderSizePixel = value
                end
            end

                if pseudoClass == "hover:" then
                    local originalProperty
                    if category == "b" then
                        originalProperty = guiElement.BorderSizePixel
                    end
    
                    guiElement.MouseEnter:Connect(function()
                        applyProperty()
                    end)
                    guiElement.MouseLeave:Connect(function()
                        if category == "b" then
                            guiElement.BorderSizePixel = originalProperty
                        end
                    end)
                else
                    applyProperty()
                end
            applyProperty()
        end
    },
    
    -- Numeric Pattern
    {
        pattern = "^(%w+)%-%[(%d*%.?%d+)([%.%%]*)%]$",
        handler = function(guiElement, category, value, unit)
            local handler = styleHandlers[category]
            if handler then
                handler(guiElement, tonumber(value), unit)
            end
        end
    },

    -- Color Pattern
    {
        pattern = "^(%w+)%-%[(%d+),(%d+),(%d+)%]$",
        handler = function(guiElement, colorCategory, r, g, b)
            local color = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
            if colorCategory == "bg" then
                guiElement.BackgroundColor3 = color
            elseif colorCategory == "textColor" then
                guiElement.TextColor3 = color
            end
        end
    }
}

return patternsModule