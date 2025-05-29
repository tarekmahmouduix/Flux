local statesHandler = {}

local mapping = require(script.Parent.Parent.mapping)
local classes = require(script.Parent.Parent.classes)

function statesHandler.handle(element: GuiObject, value)
    if element:IsA("TextButton") or element:IsA("ImageButton") then
        local oldvalue = {}

        element.MouseButton1Click:Connect(function()
            local values = value
            if not value or not values["animate"] then
                return
            end

            for clickKey, clickValue in pairs(values["animate"]) do
                -- Skip keys that are not part of the `classes` table
                if not classes[clickKey] then
                    continue
                end

                local duration = values.duration or 0.5
                local easingStyle = values.easingStyle or Enum.EasingStyle.Linear
                local easingDirection = values.easingDirection or Enum.EasingDirection.InOut
                local repeatCount = values.repeatCount or 0
                local reverse = values.reverse or false
                local delayTime = values.delayTime or 0

                if clickValue and classes[clickKey][clickValue] then
                    local property = mapping[clickKey]
                    if property == "CornerRadius" then
                        local borderRadius = element:FindFirstChildOfClass("UICorner")
                        if not borderRadius then
                            borderRadius = Instance.new("UICorner")
                            borderRadius.CornerRadius = UDim.new(0, 0) -- Default value
                            borderRadius.Name = "BorderRadius"
                            borderRadius.Parent = element
                        end
                        oldvalue[property] = borderRadius.CornerRadius
                        local valueToChange = classes[clickKey][clickValue]

                        local tween = game:GetService("TweenService"):Create(
                            borderRadius,
                            TweenInfo.new(duration, easingStyle, easingDirection, repeatCount, reverse, delayTime),
                            {CornerRadius = valueToChange}
                        )
                        tween:Play()
                        tween.Completed:Connect(function()
                            game:GetService("TweenService"):Create(
                                borderRadius,
                                TweenInfo.new(duration, easingStyle, easingDirection, repeatCount, reverse, delayTime),
                                {CornerRadius = oldvalue[property]}
                            ):Play()
                        end)
                    else
                        oldvalue[property] = element[property] -- e.g., oldvalue[BackgroundColor3] = element.BackgroundColor3
                        local valueToChange = classes[clickKey][clickValue] or value[clickKey]
                        if valueToChange then
                            local tween = game:GetService("TweenService"):Create(
                                element,
                                TweenInfo.new(duration, easingStyle, easingDirection, repeatCount, reverse, delayTime),
                                {[property] = valueToChange}
                            )
                            tween:Play()
                            tween.Completed:Connect(function()
                                game:GetService("TweenService"):Create(
                                    element,
                                    TweenInfo.new(duration, easingStyle, easingDirection, repeatCount, reverse, delayTime),
                                    {[property] = oldvalue[property]}
                                ):Play()
                            end)
                        else
                            warn("No valid value to change for clickKey:", clickKey)
                        end
                    end
                else
                    warn("Invalid clickValue for clickKey:", clickKey, clickValue)
                end
            end
        end)
    else
        warn("Element is not a TextButton or ImageButton")
    end
end

return statesHandler