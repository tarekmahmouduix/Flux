local animations = {}

local mapping = require(script.Parent.Parent.Mapping.index)

local tweenService = game:GetService("TweenService")

local __animation_track = {}

local METATABLE = table.freeze({__index = __animation_track})

local function transitionColor(guiElement, pseudoClass, category, v1, v2,v3)
    local self = setmetatable({
        UIelement = guiElement,
        track = {},
        animationData = {},
        db = false
    }, METATABLE)

        local propertyName = mapping[category]
        local oldProp = guiElement[propertyName]

        local function onHover()
            self.track[propertyName] = tweenService:Create(guiElement, TweenInfo.new(.2), {
                [propertyName] = Color3.fromRGB(tonumber(v1), tonumber(v2), tonumber(v3))
                })
                self.track[propertyName]:Play()
            end

            local function afterHover()
                -- Create and play the tween animation
                self.track[propertyName .. "end"] = tweenService:Create(guiElement, TweenInfo.new(.2), {
                    [propertyName] = oldProp
                    })
                    self.track[propertyName .. "end"]:Play()
                end

            guiElement.MouseEnter:Connect(function()
                onHover()
            end)

            guiElement.MouseLeave:Connect(function()
                self.track[propertyName]:Pause()
                afterHover()
            end)
    return self
end

return {
    transitionColor = transitionColor
}
