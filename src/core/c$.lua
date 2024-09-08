local styleHandlers = require(script.Parent.ClassParser)  -- Adjust the path as needed

local function applyCustomStyle(guiElement, category, value, unit)
    local handler = styleHandlers[category]
    if handler then
        handler(guiElement, value, unit)
    else
        warn("Handler for category " .. category .. " does not exist.")
    end
end

local pseudoClassHandlers = {
    [":hover"] = function(guiElement, styleName, value, unit)
        guiElement.MouseEnter:Connect(function()
            applyCustomStyle(guiElement, styleName, value, unit)
        end)
        guiElement.MouseLeave:Connect(function()
            -- Revert to default or previous style
            -- Implement default style handling here if needed
        end)
    end,
    [":active"] = function(guiElement, styleName, value, unit)
        guiElement.MouseButton1Down:Connect(function()
            applyCustomStyle(guiElement, styleName, value, unit)
        end)
        guiElement.MouseButton1Up:Connect(function()
            -- Revert to default or previous style
            -- Implement default style handling here if needed
        end)
    end,
    -- Add more pseudo-class handlers as needed
}

return pseudoClassHandlers