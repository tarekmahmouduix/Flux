local styleApplier = require(game.ReplicatedStorage.core.StyleApplier)

local newStarterGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
local newFrame = Instance.new("Frame", newStarterGui)

local pattern = "([%w%-]+)%[?(%d*%.?%d*)%s*([%w%%%-]*)%]?%s*(%:[%w%-]+)?"


local test_string = "identifier[12.34px]:property"
local name, number, unit, property = test_string:match(pattern)

print("Name:", name)          -- identifier
print("Number:", number)      -- 12.34
print("Unit:", unit)          -- px
print("Property:", property)  -- :property


styleApplier.applyStyles(newFrame, "s-[30%] bg-[160,70,90] bgtrans-[.3]")
