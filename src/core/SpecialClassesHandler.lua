-- PseudoClassHandlers.lua
local pseudoClassHandlers = {}

-- Define a mapping from category to actual property or method names
local categoryToPropertyMap = {
    bg = "BackgroundColor3",
    textColor = "TextColor3",
    size = "Size",
    border = "BorderSizePixel",
    -- Add more mappings as needed
}

pseudoClassHandlers["hover:"] = function(guiElement, propertiesMap)
    -- Store original values
    local originalSize = guiElement.Size
    local originalBG = guiElement.BackgroundColor3

    -- Initialize new values
    local newSizeX, newSizeY = originalSize.X.Scale, originalSize.Y.Scale
    local newBGColor = originalBG

    -- Process the properties for hover state
    local propertiesList = propertiesMap["hover:"] or {}

    for _, properties in ipairs(propertiesList) do
        local category, property, value = properties.category, properties.property, properties.value

        if category == "size" then
            if property == "x" then
                if properties.unit == "%" then
                    newSizeX = value / 100
                else
                    newSizeX = value
                end
            elseif property == "y" then
                if properties.unit == "%" then
                    newSizeY = value / 100
                else
                    newSizeY = value
                end
            end
        elseif category == "bg" then
            newBGColor = value
        end
    end

    -- Calculate new size
    local newSize = UDim2.new(newSizeX, originalSize.X.Offset, newSizeY, originalSize.Y.Offset)

    -- Apply changes on hover
    guiElement.MouseEnter:Connect(function()
        guiElement.Size = newSize
        guiElement.BackgroundColor3 = newBGColor
    end)

    -- Revert changes on hover exit
    guiElement.MouseLeave:Connect(function()
        guiElement.Size = originalSize
        guiElement.BackgroundColor3 = originalBG
    end)
end


return pseudoClassHandlers



