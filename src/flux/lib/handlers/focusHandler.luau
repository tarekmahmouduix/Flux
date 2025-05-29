local statesHandler = {}

local mapping = require(script.Parent.Parent.mapping)
local classes = require(script.Parent.Parent.classes)

function statesHandler.handle(element: TextBox, value, hoverDisabledRef)
    if element:IsA("TextBox") then
        local oldvalue = {}

        -- Handle Focused
        element.Focused:Connect(function()
            if not value or not value["animate"] then
                return
            end

            for focusKey, focusValue in pairs(value["animate"]) do
                if not classes[focusKey] then
                    continue
                end

                local property = mapping[focusKey]
                if property == "CornerRadius" then
                    local borderRadius = element:FindFirstChildOfClass("UICorner")
                    if borderRadius and oldvalue[property] then
                        game:GetService("TweenService"):Create(
                            borderRadius,
                            TweenInfo.new(value["animate"].duration or 0.5, value["animate"].easingStyle or Enum.EasingStyle.Linear, value["animate"].easingDirection or Enum.EasingDirection.InOut, value["animate"].repeatCount or 0, value["animate"].reverse or false, value["animate"].delayTime or 0),
                            {CornerRadius = oldvalue[property]}
                        ):Play()
                    end
                else
                    if not oldvalue[property] then
                        warn("No old value found for focusKey:", focusKey)
                        continue
                    end

                    local valueToChange = oldvalue[property]
                    game:GetService("TweenService"):Create(
                        element,
                        TweenInfo.new(value["animate"].duration or 0.5, value["animate"].easingStyle or Enum.EasingStyle.Linear, value["animate"].easingDirection or Enum.EasingDirection.InOut, value["animate"].repeatCount or 0, value["animate"].reverse or false, value["animate"].delayTime or 0),
                        {[property] = valueToChange}
                    ):Play()
                end
            end
        end)

        -- Handle FocusLost
        element.FocusLost:Connect(function(enterPressed)
            if not value or not value["animate"] then
                return
            end

            for focusKey, focusValue in pairs(value["animate"]) do
                if not classes[focusKey] then
                    continue
                end

                local duration = value["animate"].duration or 0.5
                local easingStyle = value["animate"].easingStyle or Enum.EasingStyle.Linear
                local easingDirection = value["animate"].easingDirection or Enum.EasingDirection.InOut
                local repeatCount = value["animate"].repeatCount or 0
                local reverse = value["animate"].reverse or false
                local delayTime = value["animate"].delayTime or 0

                if focusValue and classes[focusKey][focusValue] then
                    local property = mapping[focusKey]
                    local valueToChange = classes[focusKey][focusValue]
                    oldvalue[property] = element[property] -- Save the old value
                    game:GetService("TweenService"):Create(
                        element,
                        TweenInfo.new(duration, easingStyle, easingDirection, repeatCount, reverse, delayTime),
                        {[property] = valueToChange}
                    ):Play()
                end
            end
        end)

    end
end

return statesHandler