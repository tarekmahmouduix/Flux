local styleApplier = require(game.ReplicatedStorage:WaitForChild("core").initialize)
local newStarterGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
local newFrame = Instance.new("TextButton", newStarterGui)

newFrame.Position = UDim2.new(.3,0,0,0)

styleApplier.applyStyles(newFrame, "s-[50%] hover:item-rotate-[30deg]")


--[[local class = "hover:bg-opacity-[50%]"
local pattern = "^(%w+:)(%w+)%-(%w+)%-%[(%d*%.?%d+)([%%]*)%]$" -- numeric 
local pseudoClass, category, property, value, unit = class:match(pattern)

if pseudoClass and category and property then
    print("Prefix:", pseudoClass)
    print("Category:", category)
    print("Property:", property)
    print("v:", value)
    print("u:", unit)
end--]]


--ps[":hover"](newFrame, "BackgroundColor3", "0,250,0", "RGB")
