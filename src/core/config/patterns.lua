-- patternsModule.lua
local patternsModule = {}
local styleHandlers = require(script.Parent.Parent.StyleHandler)  -- Adjust the path as needed

patternsModule.patterns = {
    -- Size Pattern
    {
        pattern = "^(%w+:)(%w+)%-(%w*)%-%[(%d*%.?%d+)([%a%%]*)%]$",
        handler = function(guiElement, pseudoClass, category, property, value, unit)
            local applySize = function()
                if property == "x" then
                    guiElement.Size = UDim2.new(unit == "%" and value / 100 or value, guiElement.Size.X.Offset, guiElement.Size.Y.Scale, guiElement.Size.Y.Offset)
                elseif property == "y" then
                    guiElement.Size = UDim2.new(guiElement.Size.X.Scale, guiElement.Size.X.Offset, unit == "%" and value / 100 or value, guiElement.Size.Y.Offset)
                end
            end

            if pseudoClass == "hover:" then
                local originalSize = guiElement.Size
                guiElement.MouseEnter:Connect(function()
                    applySize()
                end)
                guiElement.MouseLeave:Connect(function()
                    guiElement.Size = originalSize
                end)
            else
                applySize()
            end
        end
    },

    -- Border Pattern
    {
        pattern = "^(%w+:)(%w+)%-%[(%d+)%]$",
        handler = function(guiElement, pseudoClass, category, value)
            local applyBorder = function()
                guiElement.BorderSizePixel = value
            end

            if pseudoClass == "hover:" then
                local originalBorder = guiElement.BorderSizePixel
                guiElement.MouseEnter:Connect(function()
                    applyBorder()
                end)
                guiElement.MouseLeave:Connect(function()
                    guiElement.BorderSizePixel = originalBorder
                end)
            else
                applyBorder()
            end
        end
    },

    -- State-Class Pattern
    {
        pattern = "^(%w+:)(%w+)%-(%w+)%-%[(%d*%.?%d+)([%a%%]*)%]$",
        handler = function(guiElement, pseudoClass, category, value, unit)
            -- Handle state-class based on the pseudoClass
        end
    },

    -- State Color Pattern
    {
        pattern = "^(%w+:)(%w+)%-%[(%d+),(%d+),(%d+)%]$",
        handler = function(guiElement, pseudoClass, category, r, g, b)
            local color = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
            local applyColor = function()
                if category == "bg" then
                    guiElement.BackgroundColor3 = color
                elseif category == "textColor" then
                    guiElement.TextColor3 = color
                end
            end

            if pseudoClass == "hover:" then
                local originalColor = category == "bg" and guiElement.BackgroundColor3 or guiElement.TextColor3
                guiElement.MouseEnter:Connect(function()
                    applyColor()
                end)
                guiElement.MouseLeave:Connect(function()
                    if category == "bg" then
                        guiElement.BackgroundColor3 = originalColor
                    elseif category == "textColor" then
                        guiElement.TextColor3 = originalColor
                    end
                end)
            else
                applyColor()
            end
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
