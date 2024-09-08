local styleApplier = require(game.ReplicatedStorage.core.StyleApplier)

local newStarterGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
local newFrame = Instance.new("Frame", newStarterGui)

local pattern = "(:%w+)%-(%w+)%-%[(%d*%.?%d+)([%a%%]*)%]"

local function testPattern(input)
    local matches = {input:match(pattern)}
    
    if #matches > 0 then
        print("Pattern Matches!")
        print("Pseudo-class:", matches[1] or "nil")
        print("Category:", matches[2] or "nil")
        print("Value:", matches[3] or "nil")
        print("Unit:", matches[4] or "nil")
    else
        print("No match found.")
    end
end

-- Test input
local input = ":hover-bg-[50%]"
testPattern(input) -- Should match: :hover, bg-red, 255,0,0, (empty or specific unit)


styleApplier.applyStyles(newFrame, "s-[30%] bgtrans-[.3] :hover-bg-[50%]")
