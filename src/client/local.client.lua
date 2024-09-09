local styleApplier = require(game.ReplicatedStorage:WaitForChild("core").initialize)
local newStarterGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
local newFrame = Instance.new("TextButton", newStarterGui)

styleApplier.applyStyles(newFrame, "s-[50%] hover:bg-[255,0,0] hover:size-x-[2sc] hover:size-y-[1sc]")

--[[local class = ":hover-size-x-[50%]"
local pattern = "^(:%w+)%-(%w+)%-(%w*)%-%[(%d*%.?%d+)([%a%%]*)%]$" -- numeric 
local prefix, category, property, r, g, b = class:match(pattern)

if prefix and category and property then
    print("Prefix:", prefix)
    print("Category:", category)
    print("Property:", property)
    print("r:", r)
    print("g:", g)
    print("b:", b)
end--]]


--ps[":hover"](newFrame, "BackgroundColor3", "0,250,0", "RGB")
