local styleHandlers = {
    ["s"] = function(guiElement, value, unit)
        applyUnit(guiElement, value, unit, nil, "Size")
    end,
    ["sx"] = function(guiElement, value, unit)
        applyUnit(guiElement, value, unit, "x", "Size")
    end,
    ["sy"] = function(guiElement, value, unit)
        applyUnit(guiElement, value, unit, "y", "Size")
    end,
    ["p"] = function(guiElement, value, unit)
        guiElement.Padding = unit == "sc" and UDim.new(value, 0) or UDim.new(0, value)
    end,
    ["bg"] = function(guiElement, value)
        local r, g, b = value:match("(%d+),(%d+),(%d+)")
        if r and g and b then
            guiElement.BackgroundColor3 = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
        else
            warn("Invalid color format: " .. value)
        end
    end,
    ["round"] = function(guiElement, value, unit)
        local corner = guiElement:FindFirstChild("UICorner") or Instance.new("UICorner", guiElement)
        corner.CornerRadius = unit == "sc" and UDim.new(0, value) or UDim.new(value, 0)
    end,
    ["border"] = function(guiElement, value)
        guiElement.BorderSizePixel = value
    end,
    ["bgtrans"] = function(guiElement, value)
        guiElement.BackgroundTransparency = value
    end,
    ["texttrans"] = function(guiElement, value)
        guiElement.TextTransparency = value
    end,
    -- Add more handlers as needed
}

function applyUnit(guiElement, value, unit, axis, property)
    local size = guiElement[property]
    
    if unit == "sc" then
        if axis == "x" then
            guiElement[property] = UDim2.new(value, size.X.Offset, size.Y.Scale, size.Y.Offset)
        elseif axis == "y" then
            guiElement[property] = UDim2.new(size.X.Scale, size.X.Offset, value, size.Y.Offset)
        else
            guiElement[property] = UDim2.new(value, size.X.Offset, value, size.Y.Offset)
        end
    elseif unit == "off" then
        if axis == "x" then
            guiElement[property] = UDim2.new(size.X.Scale, value, size.Y.Scale, size.Y.Offset)
        elseif axis == "y" then
            guiElement[property] = UDim2.new(size.X.Scale, size.X.Offset, size.Y.Scale, value)
        else
            guiElement[property] = UDim2.new(size.X.Scale, value, size.Y.Scale, value)
        end
    elseif unit == "%" then
        local scaledValue = value / 100
        if axis == "x" then
            guiElement[property] = UDim2.new(scaledValue, size.X.Offset, size.Y.Scale, size.Y.Offset)
        elseif axis == "y" then
            guiElement[property] = UDim2.new(size.X.Scale, size.X.Offset, scaledValue, size.Y.Offset)
        else
            guiElement[property] = UDim2.new(scaledValue, size.X.Offset, scaledValue, size.Y.Offset)
        end
    end
end

return styleHandlers
