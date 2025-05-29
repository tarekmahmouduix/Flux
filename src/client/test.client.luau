local initalizer = require(game:GetService("ReplicatedStorage").flux.lib.initalizer)
initalizer.init()

local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Container frame
local container = Instance.new("Frame", playerGui)
container.Name = "FluxDemoContainer"
container.Size = UDim2.new(0, 400, 0, 200)
container.Position = UDim2.new(0.5, -200, 0.5, -100)
container.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
container.BackgroundTransparency = 0.1
container.AnchorPoint = Vector2.new(0.5, 0.5)

-- Apply flex column layout with wrap and center alignment
initalizer.applyStyles(container, {
    align = "center",
    p = "md",
    border = "lg",
    
    hover = {
        animate = {
            bopacity = "75"
        }
    }
})