return {
    -- 🧭 Alignment Utils
    ["align"] = {
        ["center"] = function(element: GuiObject)
            element.AnchorPoint = Vector2.new(0.5, 0.5)
            element.Position = UDim2.new(0.5, 0, 0.5, 0)
        end,

        ["top"] = function(element: GuiObject)
            element.AnchorPoint = Vector2.new(0.5, 0)
            element.Position = UDim2.new(0.5, 0, 0, 0)
        end,

        ["bottom"] = function(element: GuiObject)
            element.AnchorPoint = Vector2.new(0.5, 1)
            element.Position = UDim2.new(0.5, 0, 1, 0)
        end,

        ["left"] = function(element: GuiObject)
            element.AnchorPoint = Vector2.new(0, 0.5)
            element.Position = UDim2.new(0, 0, 0.5, 0)
        end,

        ["right"] = function(element: GuiObject)
            element.AnchorPoint = Vector2.new(1, 0.5)
            element.Position = UDim2.new(1, 0, 0.5, 0)
        end,

        ["topLeft"] = function(element: GuiObject)
            element.AnchorPoint = Vector2.new(0, 0)
            element.Position = UDim2.new(0, 0, 0, 0)
        end,

        ["topRight"] = function(element: GuiObject)
            element.AnchorPoint = Vector2.new(1, 0)
            element.Position = UDim2.new(1, 0, 0, 0)
        end,

        ["bottomLeft"] = function(element: GuiObject)
            element.AnchorPoint = Vector2.new(0, 1)
            element.Position = UDim2.new(0, 0, 1, 0)
        end,

        ["bottomRight"] = function(element: GuiObject)
            element.AnchorPoint = Vector2.new(1, 1)
            element.Position = UDim2.new(1, 0, 1, 0)
        end,
    },

    -- 📐 Flex Utils (UIListLayout based)
    ["flex"] = {
        ["row"] = function(element: GuiObject)
            local UIListLayout = element:FindFirstChildOfClass("UIListLayout")
            
            if not UIListLayout then
                UIListLayout = Instance.new("UIListLayout", element)
            end

            UIListLayout.FillDirection = Enum.FillDirection.Horizontal
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
            UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Parent = element
        end,

        ["col"] = function(element: GuiObject)
            local UIListLayout = element:FindFirstChildOfClass("UIListLayout")
            
            if not UIListLayout then
              UIListLayout = Instance.new("UIListLayout", element)
            end

            UIListLayout.FillDirection = Enum.FillDirection.Vertical
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Parent = element
        end,

        ["center"] = function(element: GuiObject)
            local UIListLayout = element:FindFirstChildOfClass("UIListLayout")
            
            if not UIListLayout then
              UIListLayout = Instance.new("UIListLayout", element)
            end
            UIListLayout.FillDirection = Enum.FillDirection.Horizontal
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Parent = element
        end,

        ["between"] = function(element: GuiObject)
            local UIListLayout = element:FindFirstChildOfClass("UIListLayout")
            
            if not UIListLayout then
              UIListLayout = Instance.new("UIListLayout", element)
            end

            UIListLayout.FillDirection = Enum.FillDirection.Horizontal
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(1, 0)
            UIListLayout.Parent = element
        end,

        ["wrap"] = function(element: GuiObject)
            local UIListLayout = element:FindFirstChildOfClass("UIListLayout")
            
            if not UIListLayout then
              UIListLayout = Instance.new("UIListLayout", element)
            end

            UIListLayout.Wraps = true
        end,

        ["nowrap"] = function(element: GuiObject)
            local UIListLayout = element:FindFirstChildOfClass("UIListLayout")
            
            if not UIListLayout then
              UIListLayout = Instance.new("UIListLayout", element)
            end

            UIListLayout.Wraps = false
        end,
    },

    ["hidden"] = {
        ["true"] = function(element)
            element.Visible = true
        end,
        ["false"] = function(element)
            element.Visible = false
        end,
    },

    ["p"] = {
        ["sm"] = function(element)
            local UIPadding = element:FindFirstChildOfClass("UIPadding")

            if not UIPadding then
                UIPadding = Instance.new("UIPadding")
                UIPadding.Parent = element
            end

            UIPadding.PaddingTop = UDim.new(0, 2)
            UIPadding.PaddingBottom = UDim.new(0, 2)
            UIPadding.PaddingLeft = UDim.new(0, 2)
            UIPadding.PaddingRight = UDim.new(0, 2)
        end,
        ["md"] = function(element)
            local UIPadding = element:FindFirstChildOfClass("UIPadding")

            if not UIPadding then
                UIPadding = Instance.new("UIPadding")
                UIPadding.Parent = element
            end

            UIPadding.PaddingTop = UDim.new(0, 5)
            UIPadding.PaddingBottom = UDim.new(0, 5)
            UIPadding.PaddingLeft = UDim.new(0, 5)
            UIPadding.PaddingRight = UDim.new(0, 5)
        end,
        ["lg"] = function(element)
            local UIPadding = element:FindFirstChildOfClass("UIPadding")

            if not UIPadding then
                UIPadding = Instance.new("UIPadding")
                UIPadding.Parent = element
            end

            UIPadding.PaddingTop = UDim.new(0, 10)
            UIPadding.PaddingBottom = UDim.new(0, 10)
            UIPadding.PaddingLeft = UDim.new(0, 10)
            UIPadding.PaddingRight = UDim.new(0, 10)
        end,
        ["xl"] = function(element)
            local UIPadding = element:FindFirstChildOfClass("UIPadding")

            if not UIPadding then
                UIPadding = Instance.new("UIPadding")
                UIPadding.Parent = element
            end

            UIPadding.PaddingTop = UDim.new(0, 20)
            UIPadding.PaddingBottom = UDim.new(0, 20)
            UIPadding.PaddingLeft = UDim.new(0, 20)
            UIPadding.PaddingRight = UDim.new(0, 20)
        end,
    },

    ["border"] = {
        ["sm"] = function(element : GuiObject) 
            local UIStroke = element:FindFirstChildOfClass("UIStroke")

            if not UIStroke then
                 UIStroke = Instance.new("UIStroke", element)
             end

             UIStroke.Thickness = 0.3
             
             return UIStroke
        end,
        ["md"] = function(element : GuiObject) 
            local UIStroke = element:FindFirstChildOfClass("UIStroke")

            if not UIStroke then
                 UIStroke = Instance.new("UIStroke", element)
             end

             UIStroke.Thickness = 1

             return UIStroke
        end,
        ["lg"] = function(element : GuiObject) 
            local UIStroke = element:FindFirstChildOfClass("UIStroke")

            if not UIStroke then
                 UIStroke = Instance.new("UIStroke", element)
             end

             UIStroke.Thickness = 2

             return UIStroke
        end,

        ["text"] = function(element : GuiObject) 
            local UIStroke = element:FindFirstChildOfClass("UIStroke")

            if not UIStroke then
                 UIStroke = Instance.new("UIStroke", element)
             end

             UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual

             return UIStroke
		  end,
		  
		["normal"] = function(element : GuiObject) 
			local UIStroke = element:FindFirstChildOfClass("UIStroke")

			if not UIStroke then
				UIStroke = Instance.new("UIStroke", element)
			end

			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			return UIStroke
		end,
		
		["round"] = function(element : GuiObject) 
			local UIStroke = element:FindFirstChildOfClass("UIStroke")

			if not UIStroke then
				UIStroke = Instance.new("UIStroke", element)
			end

			UIStroke.LineJoinMode = Enum.LineJoinMode.Round

			return UIStroke
		end,
		
		["bevel"] = function(element : GuiObject) 
			local UIStroke = element:FindFirstChildOfClass("UIStroke")

			if not UIStroke then
				UIStroke = Instance.new("UIStroke", element)
			end

			UIStroke.LineJoinMode = Enum.LineJoinMode.Bevel

			return UIStroke
		end,
		
		["miter"] = function(element : GuiObject) 
			local UIStroke = element:FindFirstChildOfClass("UIStroke")

			if not UIStroke then
				UIStroke = Instance.new("UIStroke", element)
			end

			UIStroke.LineJoinMode = Enum.LineJoinMode.Miter

			return UIStroke
		end,
    },

    ["font"] = {
        ["normal"] = function(element: TextLabel | TextButton | TextBox)
			element.Font = Enum.FontWeight.Regular
        end,
        ["xlight"] = function(element: TextLabel | TextButton | TextBox)
			element.Font = Enum.FontWeight.ExtraLight
		  end,
			["light"] = function(element: TextLabel | TextButton | TextBox)
			element.Font = Enum.FontWeight.Light
			end,
			["thing"] = function(element: TextLabel | TextButton | TextBox)
			element.Font = Enum.FontWeight.Thin
			end,
			["medium"] = function(element: TextLabel | TextButton | TextBox)
				element.Font = Enum.FontWeight.Medium
			end,
			["bold"] = function(element: TextLabel | TextButton | TextBox)
				element.Font = Enum.Font.ArialBold
			end,
			["heavy"] = function(element: TextLabel | TextButton | TextBox)
				element.Font = Enum.FontWeight.Heavy
			end,
			["semibold"] = function(element: TextLabel | TextButton | TextBox)
				element.Font = Enum.FontWeight.SemiBold
			end,
			["xbold"] = function(element: TextLabel | TextButton | TextBox)
				element.Font = Enum.FontWeight.ExtraBold
			end,
			
			--fonts
			
			["code"] = function(element: TextLabel | TextButton | TextBox)
				element.Font = Enum.Font.Code
			end,
			["jura"] = function(element: TextLabel | TextButton | TextBox)
				element.Font = Enum.Font.Jura
			end,
			["arimo"] = function(element: TextLabel | TextButton | TextBox)
				element.Font = Enum.Font.Arimo
			end,
			["kalam"] = function(element: TextLabel | TextButton | TextBox)
				element.Font = Enum.Font.Kalam
			end,
			["arcade"] = function(element: TextLabel | TextButton | TextBox)
				element.Font = Enum.Font.Arcade
			end,
			["nunito"] = function(element: TextLabel | TextButton | TextBox)
				element.Font = Enum.Font.Nunito
			end,
			["gotham"] = function(element: TextLabel | TextButton | TextBox)
				element.Font = Enum.Font.Gotham
			end,
			["arial"] = function(element: TextLabel | TextButton | TextBox)
				element.Font = Enum.Font.Arial
			end,
			["ubuntu"] = function(element: TextLabel | TextButton | TextBox)
				element.Font = Enum.Font.Ubuntu
			end,
    }
}
