local engine = require(game.ReplicatedStorage.flux.core.main)
local scGUI = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)

local newElement = Instance.new("TextLabel", scGUI)
newElement.Text = "Hello, Flux!"

engine.applyStyles(newElement, "bg-gray-50 hover:bg-[30,30,30]-transition hover:text-[255,255,255]-transition sx-[30%] sy-[30%] align-center text-2xl font-arial font-bold round-md aspect-16-9")