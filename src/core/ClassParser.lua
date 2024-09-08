local styleHandlers = {
    ["s"] = function(guiElement, value, unit)
        applyUnit(guiElement, value, unit, nil, "Size")
    end,
    ["s-x"] = function(guiElement, value, unit)
        applyUnit(guiElement, value, unit, "x", "Size")
    end,
    ["s-y"] = function(guiElement, value, unit)
        applyUnit(guiElement, value, unit, "y", "Size")
    end,
    ["p"] = function(guiElement, value, unit)
        if unit == "sc" then
            -- Handle scale units for padding
            guiElement.Padding = UDim.new(value, 0)
        elseif unit == "off" then
            -- Handle offset units for padding
            guiElement.Padding = UDim.new(0, value)
        end
    end,
    ["po"] = function(guiElement, value, unit)
        if unit == "sc" then
            -- Handle scale units for position
            guiElement.Position = UDim2.new(value, 0, value, 0)
        elseif unit == "off" then
            -- Handle offset units for position
            guiElement.Position = UDim2.new(0, value, 0, value)
        end
    end,
    ["bg"] = function(guiElement : GuiObject, value, unit)
        print("triggered atleast.:(")
        local r, g, b = value:match("(%d+),(%d+),(%d+)")
        if r and g and b then
            guiElement.BackgroundColor3 = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
        else
            warn("Invalid color format: " .. value)
        end
    end,
    ["round"] = function(guiElement, value, unit)
        if unit == "sc" then
            if not guiElement:FindFirstChild("UICorner") then
                local newInstance = Instance.new("UICorner", guiElement)
            end
            guiElement.UICorner.CornerRadius = UDim.new(0, value)
        elseif unit == "off" then
            if not guiElement:FindFirstChild("UICorner") then
                local newInstance = Instance.new("UICorner", guiElement)
            end
            guiElement.UICorner.CornerRadius = UDim.new(value, 0)
        end
    end,
    ["border"] = function(guiElement : GuiObject, value, unit)
        guiElement.BorderSizePixel = value
    end,
    ["bgtrans"] = function(guiElement : GuiObject, value, unit)
        guiElement.BackgroundTransparency = value
    end,
    ["texttrans"] = function(guiElement : GuiObject, value, unit)
        guiElement.TextTransparency = value
    end,
    -- Add more handlers as needed
}

function applyUnit(guiElement, value, unit, axis, property)
    if unit == "sc" then
        print(tostring(guiElement) .. " scaled by " .. value .. unit)
        if axis == "x" then
            guiElement[property] = UDim2.new(value, guiElement[property].X.Offset, guiElement[property].Y.Scale, guiElement[property].Y.Offset)
        elseif axis == "y" then
            guiElement[property] = UDim2.new(guiElement[property].X.Scale, guiElement[property].X.Offset, value, guiElement[property].Y.Offset)
        else
            guiElement[property] = UDim2.new(value, guiElement[property].X.Offset, value, guiElement[property].Y.Offset)
        end
    elseif unit == "off" then
        if axis == "x" then
            guiElement[property] = UDim2.new(guiElement[property].X.Scale, value, guiElement[property].Y.Scale, guiElement[property].Y.Offset)
        elseif axis == "y" then
            guiElement[property] = UDim2.new(guiElement[property].X.Scale, guiElement[property].X.Offset, guiElement[property].Y.Scale, value)
        else
            guiElement[property] = UDim2.new(guiElement[property].X.Scale, value, guiElement[property].Y.Scale, value)
        end
    elseif unit == "%" then
        print("scaled by: " .. value / 100 .. "%")
        if axis == "x" then
            guiElement[property] = UDim2.new(value / 100, guiElement[property].X.Offset, guiElement[property].Y.Scale, guiElement[property].Y.Offset)
        elseif axis == "y" then
            guiElement[property] = UDim2.new(guiElement[property].X.Scale, guiElement[property].X.Offset, value / 100, guiElement[property].Y.Offset)
        else
            guiElement[property] = UDim2.new(value / 100, guiElement[property].X.Offset, value / 100, guiElement[property].Y.Offset)
        end
    end
end


return styleHandlers