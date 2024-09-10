local styleApplier = require(game.ReplicatedStorage:WaitForChild("flux").core.main)
local newStarterGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
local newFrame = Instance.new("TextLabel", newStarterGui)
newFrame.Position = UDim2.new(.3,0,0,0)
newFrame.Text = "Welcome, jaybeemvoid!"
--styleApplier.applyStyles(newFrame, "align-center s-lg round-lg bg-opacity-50 text-white text-xl font-gotham font-bold text-center text-top")
styleApplier.applyStyles(newFrame, "bg-red-500 z-10")
--[[local pattern = "^(%w+)%-([%w%-]+)$"

local testStrings = {
    "align-center",
    "align-top-left",
    "align-top-right",
    "align-bottom-left"
}

for _, str in ipairs(testStrings) do
    local match, v = str:match(pattern)
    if match then
        print("Matched alignment:", v)
    else
        print("No match for:", str)
    end
end

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
