local config = {
    size = {
        ["s-1"] = function(guiElement)
            print("[" .. tostring(guiElement) .. "]" .. "triggered scale")
            guiElement.Size = UDim2.new(1, 0, 1, 0)
        end,
    },
    padding = {
        ["p-1"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                local newInstance = Instance.new("UIPadding", guiElement)
            end
            guiElement.Padding = UDim.new(0, 1)
        end,
    },
    round = {
        ["round-sm"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UICorner") then
                local newInstance = Instance.new("UICorner", guiElement)
            end
            guiElement.UICorner.CornerRadius = UDim.new(0, 5)
        end,
        ["round-md"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UICorner") then
                local newInstance = Instance.new("UICorner", guiElement)
            end
            guiElement.UICorner.CornerRadius = UDim.new(0, 10)
        end,
        ["round-lg"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UICorner") then
                local newInstance = Instance.new("UICorner", guiElement)
            end
            guiElement.UICorner.CornerRadius = UDim.new(0, 15)
        end,
    },
    border = {
        ["border"] = function(guiElement : GuiObject)
            guiElement.BorderSizePixel = 1
        end,
        ["border-none"] = function(guiElement : GuiObject)
            guiElement.BorderSizePixel = 0
        end,
    },
    visible = {
        ["hidden"] = function(guiElement : GuiObject)
            guiElement.Visible = false
        end
    },
    borderColors = {
        ["border-gray-50"] = function(guiElement : GuiObject)
            guiElement.BorderColor3 = Color3.fromRGB(249, 250, 251)  -- #F9FAFB
        end,
        ["border-gray-100"] = function(guiElement)
            guiElement.BorderColor3 = Color3.fromRGB(243, 244, 246)  -- #F3F4F6
        end,
        ["border-gray-500"] = function(guiElement)
            guiElement.BorderColor3 = Color3.fromRGB(107, 114, 128)  -- #6B7280
        end,
        ["border-red-500"] = function(guiElement)
            guiElement.BorderColor3 = Color3.fromRGB(239, 68, 68)  -- #EF4444
        end,
        ["border-blue-500"] = function(guiElement)
            guiElement.BorderColor3 = Color3.fromRGB(59, 130, 246)  -- #3B82F6
        end,
    },
    position = {
        ["po-0.5"] = function(guiElement)
            print("used")
            guiElement.Position = UDim2.new(0.5, 0, 0.5, 0)
        end,
    },
    textColors = {
        ["text-gray-50"] = function(guiElement)
            guiElement.TextColor3 = Color3.fromRGB(249, 250, 251)  -- #F9FAFB
        end,
        ["text-gray-100"] = function(guiElement)
            guiElement.TextColor3 = Color3.fromRGB(243, 244, 246)  -- #F3F4F6
        end,
        ["text-gray-500"] = function(guiElement)
            guiElement.TextColor3 = Color3.fromRGB(107, 114, 128)  -- #6B7280
        end,
        ["text-red-500"] = function(guiElement)
            guiElement.TextColor3 = Color3.fromRGB(239, 68, 68)  -- #EF4444
        end,
        ["text-blue-500"] = function(guiElement)
            guiElement.TextColor3 = Color3.fromRGB(59, 130, 246)  -- #3B82F6
        end,
    },
    backgroundColors = {
        ["bg-gray-50"] = function(guiElement)
            guiElement.BackgroundColor3 = Color3.fromRGB(249, 250, 251)  -- #F9FAFB
        end,
        ["bg-red-500"] = function(guiElement)
            guiElement.BackgroundColor3 = Color3.fromRGB(239, 68, 68)  -- #EF4444
        end,
        ["bg-blue-500"] = function(guiElement)
            guiElement.BackgroundColor3 = Color3.fromRGB(59, 130, 246)  -- #3B82F6
        end,
    },
    transparency = {
        ["bgtrans-1"] = function(guiElement : GuiObject)
            guiElement.BackgroundTransparency = 1
        end,
        ["bgtrans-0"] = function(guiElement : GuiObject)
            guiElement.BackgroundTransparency = 0
        end,
        ["texttrans-1"] = function(guiElement : GuiObject)
            guiElement.TextTransparency = 1
        end,
        ["texttrans-0"] = function(guiElement : GuiObject)
            guiElement.TextTransparency = 0
        end,
    },
}

return config