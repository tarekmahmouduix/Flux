local statesHandler = {}

local mapping = require(script.Parent.Parent.mapping)
local classes = require(script.Parent.Parent.classes)
local advancedClasses = require(script.Parent.Parent.advancedClasses)

function statesHandler.handle(element, value, hoverDisabled)
    local oldvalue = {}
    local advInstances = {}

    element.MouseEnter:Connect(function()
        if hoverDisabled then return end
        if not value then warn("Invalid hover value."); return end

        for hoverKey, hoverValue in pairs(value["animate"] or value) do
            if hoverValue == nil then continue end

            local property = mapping[hoverKey] -- bopacity
            if not property then continue end

            -- AdvancedClass support
            local advClassTable = advancedClasses[hoverKey]
            local advFunc = advClassTable and advClassTable[hoverValue]
            if type(advFunc) == "function" then
                local advInstance = advFunc(element)
                if advInstance and typeof(advInstance) == "Instance" then
                    advInstances[hoverKey] = advInstance
                    if oldvalue[hoverKey] == nil and advInstance[property] ~= nil then
                        oldvalue[hoverKey] = advInstance[property]
                    end
                    local targetValue = value["animate"] and value["animate"][hoverKey] or hoverValue
                    if value["animate"] and value["animate"][hoverKey] then
                        local duration = value["animate"].duration or 0.5
                        local easingStyle = value["animate"].easingStyle or Enum.EasingStyle.Linear
                        local easingDirection = value["animate"].easingDirection or Enum.EasingDirection.InOut
                        game:GetService("TweenService"):Create(
                            advInstance,
                            TweenInfo.new(duration, easingStyle, easingDirection),
                            {[property] = targetValue}
                        ):Play()
                    else
                        advInstance[property] = targetValue
                    end
                end
                continue
            end

            -- Normal class support
            if not classes[hoverKey] then continue end

            if oldvalue[property] == nil then
                if property == "CornerRadius" then
                    local borderRadius = element:FindFirstChildOfClass("UICorner")
                    oldvalue[property] = borderRadius and borderRadius.CornerRadius or UDim.new(0, 0)
                else
                    oldvalue[property] = element[property]
                end
            end

            local valueToChange = classes[hoverKey][hoverValue] or hoverValue
            if value["animate"] and value["animate"][hoverKey] then
                local duration = value["animate"].duration or 0.5
                local easingStyle = value["animate"].easingStyle or Enum.EasingStyle.Linear
                local easingDirection = value["animate"].easingDirection or Enum.EasingDirection.InOut
                if property == "CornerRadius" then
                    local borderRadius = element:FindFirstChildOfClass("UICorner") or Instance.new("UICorner", element)
                    game:GetService("TweenService"):Create(
                        borderRadius,
                        TweenInfo.new(duration, easingStyle, easingDirection),
                        {CornerRadius = valueToChange}
                    ):Play()
                else
                    game:GetService("TweenService"):Create(
                        element,
                        TweenInfo.new(duration, easingStyle, easingDirection),
                        {[property] = valueToChange}
                    ):Play()
                end
            else
                if property == "CornerRadius" then
                    local borderRadius = element:FindFirstChildOfClass("UICorner") or Instance.new("UICorner", element)
                    borderRadius.CornerRadius = valueToChange
                else
                    element[property] = valueToChange
                end
            end
        end
    end)

    element.MouseLeave:Connect(function()
        if hoverDisabled or not value then return end

        for hoverKey, hoverValue in pairs(value["animate"] or value) do
            if hoverValue == nil then continue end

            local property = mapping[hoverKey]
            if not property then continue end

            local advInstance = advInstances[hoverKey]
            if advInstance and oldvalue[hoverKey] ~= nil then
                if value["animate"] and value["animate"][hoverKey] then
                    local duration = value["animate"].duration or 0.5
                    local easingStyle = value["animate"].easingStyle or Enum.EasingStyle.Linear
                    local easingDirection = value["animate"].easingDirection or Enum.EasingDirection.InOut
                    game:GetService("TweenService"):Create(
                        advInstance,
                        TweenInfo.new(duration, easingStyle, easingDirection),
                        {[property] = oldvalue[hoverKey]}
                    ):Play()
                else
                    advInstance[property] = oldvalue[hoverKey]
                end
                continue
            end

            -- Normal class support
            if not classes[hoverKey] then continue end

            if value["animate"] and value["animate"][hoverKey] then
                local duration = value["animate"].duration or 0.5
                local easingStyle = value["animate"].easingStyle or Enum.EasingStyle.Linear
                local easingDirection = value["animate"].easingDirection or Enum.EasingDirection.InOut
                if property == "CornerRadius" then
                    local borderRadius = element:FindFirstChildOfClass("UICorner")
                    if borderRadius and oldvalue[property] then
                        game:GetService("TweenService"):Create(
                            borderRadius,
                            TweenInfo.new(duration, easingStyle, easingDirection),
                            {CornerRadius = oldvalue[property]}
                        ):Play()
                    end
                else
                    if oldvalue[property] then
                        game:GetService("TweenService"):Create(
                            element,
                            TweenInfo.new(duration, easingStyle, easingDirection),
                            {[property] = oldvalue[property]}
                        ):Play()
                    end
                end
            else
                if property == "CornerRadius" then
                    local borderRadius = element:FindFirstChildOfClass("UICorner")
                    if borderRadius and oldvalue[property] then
                        borderRadius.CornerRadius = oldvalue[property]
                    end
                else
                    if oldvalue[property] then
                        element[property] = oldvalue[property]
                    end
                end
            end
        end
    end)
end

return statesHandler