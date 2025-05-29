local statesHandler = {}

local mapping = require(script.Parent.Parent.mapping)
local classes = require(script.Parent.Parent.classes)

function statesHandler.handle(element, value, hoverDisabled)
    element.MouseButton1Click:Connect(function()
        if not value or not value["animate"] then
            return
        end
        
        hoverDisabled = true

        for activatedKey, activatedValue in pairs(value["animate"]) do
            if not classes[activatedKey] then
                continue
            end

            local duration = value["animate"].duration or 0.5
            local easingStyle = value["animate"].easingStyle or Enum.EasingStyle.Linear
            local easingDirection = value["animate"].easingDirection or Enum.EasingDirection.InOut
            local repeatCount = value["animate"].repeatCount or 0
            local reverse = value["animate"].reverse or false
            local delayTime = value["animate"].delayTime or 0

            if activatedValue and classes[activatedKey][activatedValue] then
                local property = mapping[activatedKey]
                local valueToChange = classes[activatedKey][activatedValue]
                game:GetService("TweenService"):Create(
                    element,
                    TweenInfo.new(duration, easingStyle, easingDirection, repeatCount, reverse, delayTime),
                    {[property] = valueToChange}
                ):Play()
            end
        end
    end)
end

return statesHandler