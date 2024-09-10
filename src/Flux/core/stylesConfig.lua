--@ Note:
-- This configuration script defines utility functions and classes for styling GUI elements.
--
--@ To extend or customize the available utilities, modify this configuration script:
-- - Add new utility functions and classes as needed.
-- - Ensure they follow the existing naming and functional patterns.
--
--@ Example:
-- For adding a new size utility, define a function under the 'size' table.
-- For adding a new text color, define a function under the 'text' table.
--
-- Refer to existing utilities for structure and syntax.


local config = {
    size = {

        --# size -> [Utility-Function]
        ["s-sm"] = function(guiElement : GuiObject)
            guiElement.Size = UDim2.new(0, 100, 0, 50)
        end,
        ["s-md"] = function(guiElement : GuiObject)
            guiElement.Size = UDim2.new(0, 200, 0, 100)
        end,
        ["s-lg"] = function(guiElement : GuiObject)
            guiElement.Size = UDim2.new(0, 300, 0, 150)
        end,
    },

    --##PADDING
    padding = {

        --# pt,pb,pr,pl -> [Utility-Function]
        ["pt-1"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                Instance.new("UIPadding", guiElement)
            end
            guiElement.UIPadding.PaddingTop = UDim.new(0.3, 0)
        end,
        ["pt-2"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                Instance.new("UIPadding", guiElement)
            end
            guiElement.UIPadding.PaddingTop = UDim.new(0.6, 0)
        end,
        ["pb-1"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                Instance.new("UIPadding", guiElement)
            end
            guiElement.UIPadding.PaddingBottom = UDim.new(0.3, 0)
        end,
        ["pb-2"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                Instance.new("UIPadding", guiElement)
            end
            guiElement.UIPadding.PaddingBottom = UDim.new(0.6, 0)
        end,
        ["pr-1"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                Instance.new("UIPadding", guiElement)
            end
            guiElement.UIPadding.PaddingRight = UDim.new(0.3, 0)
        end,
        ["pr-2"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                Instance.new("UIPadding", guiElement)
            end
            guiElement.UIPadding.PaddingRight = UDim.new(0.6, 0)
        end,
        ["pl-1"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                Instance.new("UIPadding", guiElement)
            end
            guiElement.UIPadding.PaddingLeft = UDim.new(0.3, 0)
        end,
        ["pl-2"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                Instance.new("UIPadding", guiElement)
            end
            guiElement.UIPadding.PaddingLeft = UDim.new(0.6, 0)
        end,
    },

    --##ASPECT-RATIO
    aspectRatio = {

        --# aspectRatio -> [Utility-Function]
        ["aspect-16-9"] = function(guiElement : GuiObject)
            local aspectConstraint = Instance.new("UIAspectRatioConstraint", guiElement)
            aspectConstraint.AspectRatio = 16 / 9
        end,
        ["aspect-4-3"] = function(guiElement : GuiObject)
            local aspectConstraint = Instance.new("UIAspectRatioConstraint", guiElement)
            aspectConstraint.AspectRatio = 4 / 3
        end,
        ["aspect-1-1"] = function(guiElement : GuiObject)
            local aspectConstraint = Instance.new("UIAspectRatioConstraint", guiElement)
            aspectConstraint.AspectRatio = 1
        end
    },

    --##ROUND/UICORNER
    round = {

        --# round -> [Utility-Function]
        ["round-xs"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UICorner") then
                Instance.new("UICorner", guiElement)
            end
            guiElement.UICorner.CornerRadius = UDim.new(0, 2)
        end,
        ["round-sm"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UICorner") then
                Instance.new("UICorner", guiElement)
            end
            guiElement.UICorner.CornerRadius = UDim.new(0, 5)
        end,
        ["round-md"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UICorner") then
                Instance.new("UICorner", guiElement)
            end
            guiElement.UICorner.CornerRadius = UDim.new(0, 10)
        end,
        ["round-lg"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UICorner") then
                Instance.new("UICorner", guiElement)
            end
            guiElement.UICorner.CornerRadius = UDim.new(0, 15)
        end,
        ["round-xl"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UICorner") then
                Instance.new("UICorner", guiElement)
            end
            guiElement.UICorner.CornerRadius = UDim.new(0, 20)
        end,
        ["round-2xl"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UICorner") then
                Instance.new("UICorner", guiElement)
            end
            guiElement.UICorner.CornerRadius = UDim.new(0, 30)
        end,
    },

    --##VISIBLE
    visible = {

        --# visible -> [Utility-Function]
        ["hidden"] = function(guiElement : GuiObject)
            guiElement.Visible = false
        end
    },

    border = {

        --# border -> [Utility-Class]
        ["border"] = function(guiElement : GuiObject)
            guiElement.BorderSizePixel = 1
        end,
        ["border-none"] = function(guiElement : GuiObject)
            guiElement.BorderSizePixel = 0
        end,

        --# borderColor -> [Utility-Function]
        ["border-gray-50"] = function(guiElement : GuiObject)
            guiElement.BorderColor3 = Color3.fromRGB(249, 250, 251)  -- #F9FAFB
        end,
        ["border-gray-100"] = function(guiElement : GuiObject)
            guiElement.BorderColor3 = Color3.fromRGB(243, 244, 246)  -- #F3F4F6
        end,
        ["border-gray-500"] = function(guiElement : GuiObject)
            guiElement.BorderColor3 = Color3.fromRGB(107, 114, 128)  -- #6B7280
        end,
        ["border-red-500"] = function(guiElement : GuiObject)
            guiElement.BorderColor3 = Color3.fromRGB(239, 68, 68)  -- #EF4444
        end,
        ["border-blue-500"] = function(guiElement : GuiObject)
            guiElement.BorderColor3 = Color3.fromRGB(59, 130, 246)  -- #3B82F6
        end,
    },

    --##POSITION
    pos = {

        --# position -> [Utility-Function]
        ["po-0.5"] = function(guiElement : GuiObject)
            guiElement.Position = UDim2.new(0.5, 0, 0.5, 0)
            guiElement.AnchorPoint = Vector2.new(0.5, 0.5)
        end,
    },

    --##ZIndex
    zindex = {

        --# zindex -> [Utility-Class]
        ["z-0"] = function(guiElement : GuiObject)
            guiElement.ZIndex = 0
        end,
        ["z-10"] = function(guiElement : GuiObject)
            guiElement.ZIndex = 10
        end,
        ["z-20"] = function(guiElement : GuiObject)
            guiElement.ZIndex = 20
        end,
        ["z-50"] = function(guiElement : GuiObject)
            guiElement.ZIndex = 50
        end,
        ["z-auto"] = function(guiElement : GuiObject)
            guiElement.ZIndex = 1 -- default value
        end,
    },

    --##ALIGN
    align = {

        --# alignObject -> [Utility-Function]
        ["align-center"] = function(guiElement : GuiObject)
            guiElement.Position = UDim2.new(0.5, 0, 0.5, 0)
            guiElement.AnchorPoint = Vector2.new(0.5, 0.5)
        end,

        -- Top-Left Alignment
        ["align-top-left"] = function(guiElement : GuiObject)
            guiElement.Position = UDim2.new(0, 0, 0, 0)
            guiElement.AnchorPoint = Vector2.new(0, 0)
        end,

        -- Top-Right Alignment
        ["align-top-right"] = function(guiElement : GuiObject)
            guiElement.Position = UDim2.new(1, 0, 0, 0)
            guiElement.AnchorPoint = Vector2.new(1, 0)
        end,

        -- Bottom-Left Alignment
        ["align-bottom-left"] = function(guiElement : GuiObject)
            guiElement.Position = UDim2.new(0, 0, 1, 0)
            guiElement.AnchorPoint = Vector2.new(0, 1)
        end,

        -- Bottom-Right Alignment
        ["align-bottom-right"] = function(guiElement : GuiObject)
            guiElement.Position = UDim2.new(1, 0, 1, 0)
            guiElement.AnchorPoint = Vector2.new(1, 1)
        end,
    }
}