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
--@ Refer to existing utilities for structure and syntax.


local config = {
    size = {
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
        ["pt-1"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                local newInstance = Instance.new("UIPadding", guiElement)
            end
            guiElement.UIPadding.PaddingTop = UDim.new(.3, 0)
        end,
        ["pt-2"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                local newInstance = Instance.new("UIPadding", guiElement)
            end
            guiElement.UIPadding.PaddingTop = UDim.new(.6, 0)
        end,
        ["pb-1"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                local newInstance = Instance.new("UIPadding", guiElement)
            end
            guiElement.UIPadding.PaddingBottom = UDim.new(.3, 0)
        end,
        ["pb-2"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                local newInstance = Instance.new("UIPadding", guiElement)
            end
            guiElement.UIPadding.PaddingBottom = UDim.new(.6, 0)
        end,
        ["pr-1"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                local newInstance = Instance.new("UIPadding", guiElement)
            end
            guiElement.UIPadding.PaddingRight = UDim.new(.3, 0)
        end,
        ["pr-2"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                local newInstance = Instance.new("UIPadding", guiElement)
            end
            guiElement.UIPadding.PaddingRight = UDim.new(.6, 0)
        end,
        ["pl-1"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                local newInstance = Instance.new("UIPadding", guiElement)
            end
            guiElement.UIPadding.PaddingLeft = UDim.new(.3, 0)
        end,
        ["pl-2"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UIPadding") then
                local newInstance = Instance.new("UIPadding", guiElement)
            end
            guiElement.UIPadding.PaddingLeft = UDim.new(.6, 0)
        end,
    },

    --##ASPECT-RATIO
    aspectRatio = {
        ["aspect-16-9"] = function(guiElement) -- (%w+)%-(%w+)%-(%w+)
            local aspectConstraint = Instance.new("UIAspectRatioConstraint", guiElement)
            aspectConstraint.AspectRatio = 16 / 9
        end,
        ["aspect-4-3"] = function(guiElement)
            local aspectConstraint = Instance.new("UIAspectRatioConstraint", guiElement)
            aspectConstraint.AspectRatio = 4 / 3
        end,
        ["aspect-1-1"] = function(guiElement)
            local aspectConstraint = Instance.new("UIAspectRatioConstraint", guiElement)
            aspectConstraint.AspectRatio = 1
        end
    },

    --##ROUND/UICORNER
    round = {
        ["round-xs"] = function(guiElement : GuiObject) -- (%w+)%-(%w+)
            if not guiElement:FindFirstChild("UICorner") then
                local newInstance = Instance.new("UICorner", guiElement)
            end
            guiElement.UICorner.CornerRadius = UDim.new(0, 2)
        end,
        ["round-sm"] = function(guiElement : GuiObject) -- (%w+)%-(%w+)
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
        ["round-xl"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UICorner") then
                local newInstance = Instance.new("UICorner", guiElement)
            end
            guiElement.UICorner.CornerRadius = UDim.new(0, 20)
        end,
        ["round-2xl"] = function(guiElement : GuiObject)
            if not guiElement:FindFirstChild("UICorner") then
                local newInstance = Instance.new("UICorner", guiElement)
            end
            guiElement.UICorner.CornerRadius = UDim.new(0, 30)
        end,
    },

     --##VISIBLE
    visible = {
        ["hidden"] = function(guiElement : GuiObject) -- border-[v] = (%w+)%-%[]
            guiElement.Visible = false
        end
    },
    border = {

        --# zindex -> [Utility-Class]
        ["border"] = function(guiElement : GuiObject)
            guiElement.BorderSizePixel = 1
        end,
        ["border-none"] = function(guiElement : GuiObject)
            guiElement.BorderSizePixel = 0
        end,

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

    --##POSITION
    pos = {
        ["po-0.5"] = function(guiElement)
            guiElement.Position = UDim2.new(0.5, 0, 0.5, 0)
        end,
    },

    --##ZIndex
    zindex = {

        --# zindex -> [Utility-Class]
        ["z-0"] = function(guiElement)
            guiElement.ZIndex = 0
        end,
        ["z-10"] = function(guiElement)
            guiElement.ZIndex = 10
        end,
        ["z-20"] = function(guiElement)
            guiElement.ZIndex = 20
        end,
        ["z-50"] = function(guiElement)
            guiElement.ZIndex = 50
        end,
        ["z-auto"] = function(guiElement)
            guiElement.ZIndex = 1 -- default value
        end,
    },

    --##ALIGN
    align = {

        --# alignObject -> [Utility-function]
        ["align-center"] = function(guiElement)
            guiElement.Position = UDim2.new(0.5, 0, 0.5, 0)
            guiElement.AnchorPoint = Vector2.new(0.5, 0.5)
        end,

        -- Top-Left Alignment
        ["align-top-left"] = function(guiElement)
            guiElement.Position = UDim2.new(0, 0, 0, 0)
            guiElement.AnchorPoint = Vector2.new(0, 0)
        end,

        -- Top-Right Alignment
        ["align-top-right"] = function(guiElement)
            guiElement.Position = UDim2.new(1, 0, 0, 0)
            guiElement.AnchorPoint = Vector2.new(1, 0)
        end,

        -- Bottom-Left Alignment
        ["align-bottom-left"] = function(guiElement)
            guiElement.Position = UDim2.new(0, 0, 1, 0)
            guiElement.AnchorPoint = Vector2.new(0, 1)
        end,

        -- Bottom-Right Alignment
        ["align-bottom-right"] = function(guiElement)
            guiElement.Position = UDim2.new(1, 0, 1, 0)
            guiElement.AnchorPoint = Vector2.new(1, 1)
        end,
        -- Middle Alignment (Horizontally and Vertically Centered)
        ["align-middle"] = function(guiElement)
            guiElement.Position = UDim2.new(0.5, -guiElement.Size.X.Offset / 2, 0.5, -guiElement.Size.Y.Offset / 2)
            guiElement.AnchorPoint = Vector2.new(0.5, 0.5)
        end
    },


    --##TEXT-COLORS/TEXT-SIZE/TEXT-ALIGN/TEXT-OPACITY
    text = {

        --# textColor -> [Utility-Class]
        ["text-gray-50"] = function(guiElement)
            guiElement.TextColor3 = Color3.fromRGB(249, 250, 251)  -- #F9FAFB
        end,
        ["text-white"] = function(guiElement)
            guiElement.TextColor3 = Color3.fromRGB(255, 255, 255)  -- #F9FAFB
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


        --# textSize -> [Utility-Class]
        ["text-xs"] = function(guiElement)
            guiElement.TextSize = 8
         end,
         ["text-sm"] = function(guiElement)
             guiElement.TextSize = 14
         end,
         ["text-base"] = function(guiElement)
             guiElement.TextSize = 16
          end,
         ["text-lg"] = function(guiElement)
              guiElement.TextSize = 18
          end,
          ["text-xl"] = function(guiElement)
             guiElement.TextSize = 20
          end,
         ["text-2xl"] = function(guiElement)
              guiElement.TextSize = 24
          end,
          ["text-3xl"] = function(guiElement)
             guiElement.TextSize = 30
          end,
         ["text-4xl"] = function(guiElement)
              guiElement.TextSize = 36
          end,
          ["text-5xl"] = function(guiElement)
             guiElement.TextSize = 48
          end,
         ["text-6xl"] = function(guiElement)
              guiElement.TextSize = 60
          end,
          ["text-7xl"] = function(guiElement)
             guiElement.TextSize = 72
          end,
         ["text-8xl"] = function(guiElement)
              guiElement.TextSize = 96
          end,
         ["text-9xl"] = function(guiElement)
              guiElement.TextSize = 128
          end,


          --# textAlign -> [Utility-Class]
          ["text-left"] = function(guiElement)
            guiElement.TextXAlignment = Enum.TextXAlignment.Left
          end,
          ["text-right"] = function(guiElement)
            guiElement.TextXAlignment = Enum.TextXAlignment.Right
          end,
          ["text-center"] = function(guiElement)
            guiElement.TextXAlignment = Enum.TextXAlignment.Center
          end,

          ["text-top"] = function(guiElement)
            guiElement.TextYAlignment = Enum.TextYAlignment.Top
          end,
          ["text-bottom"] = function(guiElement)
            guiElement.TextYAlignment = Enum.TextYAlignment.Bottom
          end,
          ["text-middle"] = function(guiElement)
            guiElement.TextYAlignment = Enum.TextYAlignment.Center
          end,


          --# textOpacity -> [Utility-Class]
         ["text-opacity-50"] = function(guiElement)
              guiElement.TextTransparency = 0.5
          end,
         ["text-opacity-75"] = function(guiElement)
            guiElement.TextTransparency = 0.75
        end
    },

    --##FONT/FONT-WEIGHT
    font = {

        --# font -> [Utility-Class]
        ["font-sourceSans"] = function(guiElement : GuiObject)
            guiElement.Font = Enum.Font.SourceSans
        end,
        ["font-arial"] = function(guiElement : GuiObject)
            guiElement.Font = Enum.Font.Arimo
        end,
        ["font-roboto"] = function(guiElement : GuiObject)
            guiElement.Font = Enum.Font.Roboto
        end,
        ["font-gotham"] = function(guiElement : GuiObject)
            guiElement.Font = Enum.Font.Montserrat
        end,

        --# fontWeight -> [Utility-Function]
        ["font-thin"] = function(guiElement : TextBox)
            guiElement.FontFace = Font.new(guiElement.FontFace.Family, Enum.FontWeight.Thin, Enum.FontStyle.Normal)
        end,
        ["font-light"] = function(guiElement : TextBox)
            guiElement.FontFace = Font.new(guiElement.FontFace.Family, Enum.FontWeight.Light, Enum.FontStyle.Normal)
        end,
        ["font-extralight"] = function(guiElement : TextBox)
            guiElement.FontFace = Font.new(guiElement.FontFace.Family, Enum.FontWeight.ExtraLight, Enum.FontStyle.Normal)
        end,
        ["font-base"] = function(guiElement : TextBox)
            guiElement.FontFace = Font.new(guiElement.FontFace.Family, Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        end,
        ["font-semibold"] = function(guiElement : TextBox)
            guiElement.FontFace = Font.new(guiElement.FontFace.Family, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
        end,
        ["font-bold"] = function(guiElement : TextBox)
            guiElement.FontFace = Font.new(guiElement.FontFace.Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
        end,
        ["font-extrabold"] = function(guiElement : TextBox)
            guiElement.FontFace = Font.new(guiElement.FontFace.Family, Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
        end,
    },

    --##BACKGROUND-COLORS/BACKGROUND-GRADIENTS/BACKGROUND-OPACITY
    background = {

        --# backgroundColors -> [Utility-Class]
        ["bg-gray-50"] = function(guiElement)
            guiElement.BackgroundColor3 = Color3.fromRGB(249, 250, 251)  -- #F9FAFB
        end,
        ["bg-red-500"] = function(guiElement)
            guiElement.BackgroundColor3 = Color3.fromRGB(239, 68, 68)  -- #EF4444
        end,
        ["bg-blue-500"] = function(guiElement)
            guiElement.BackgroundColor3 = Color3.fromRGB(59, 130, 246)  -- #3B82F6
        end,
        
        --# gradients -> [Utility-Function]
        ["bg-gradient-blue"] = function(guiElement)
            if not guiElement:FindFirstChild("UIGradient") then
                local gradient = Instance.new("UIGradient", guiElement)
            end
            guiElement.UIGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(59, 130, 246)),  -- #3B82F6
                ColorSequenceKeypoint.new(1, Color3.fromRGB(14, 165, 233))   -- #0EA5E9
            }
        end,
        ["bg-gradient-red"] = function(guiElement)
            if not guiElement:FindFirstChild("UIGradient") then
                local gradient = Instance.new("UIGradient", guiElement)
            end
            guiElement.UIGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(239, 68, 68)),   -- #EF4444
                ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 38, 38))    -- #DC2626
            }
        end,


        --# opacity -> [Utility-Class]
        ["bg-opacity-50"] = function(guiElement)
            guiElement.BackgroundTransparency = 0.5
        end,
        ["bg-opacity-75"] = function(guiElement)
            guiElement.BackgroundTransparency = 0.75
        end
    },
}

return config