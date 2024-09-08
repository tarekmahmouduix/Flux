local ClassParser = require(script.Parent.ClassParser)
local config = require(script.Parent.stylesConfig)

local style__apply = {}

function applybgcolor(guiElement : GuiObject, colorUtil)
    local bgcolor = config.backgroundColors[colorUtil]
    if bgcolor then
        bgcolor(guiElement)
    else
        warn(bgcolor .. "does not exist")
    end 
end

function applyround(guiElement : GuiObject, roundUtil)
    local round = config.round[roundUtil]
    if round then
        round(guiElement)
    else
        warn(round .. "does not exist")
    end 
end

function applyhidden(guiElement : GuiObject, hiddenUtil)
    local hidden = config.visible[hiddenUtil]
    if hidden then
        hidden(guiElement)
    else
        warn(hidden .. "does not exist")
    end 
end

function applyborder(guiElement : GuiObject, borderUtil)
    local border = config.border[borderUtil]
    if border then
        border(guiElement)
    else
        warn(border .. "does not exist")
    end 
end

function applytransparency(guiElement : GuiObject, transUtil)
    local transparency = config.transparency[transUtil]
    if transparency then
        transparency(guiElement)
    else
        warn(transparency .. "does not exist")
    end 
end

function applytextcolor(guiElement : GuiObject, colorUtil)
    local textcolor = config.textColors[colorUtil]
    if textcolor then
        textcolor(guiElement)
    else
        warn(textcolor .. "does not exist")
    end 
end

function applybordercolor(guiElement : GuiObject, colorUtil)
    local bordercolor = config.borderColors[colorUtil]
    if bordercolor then
        bordercolor(guiElement)
    else
        warn(bordercolor .. "does not exist")
    end 
end

function applysize(guiElement : GuiObject, sizeUtil)
    local size = config.size[sizeUtil]
    if size then
        size(guiElement)
    else
        warn(size .. "does not exist")
    end 
end

function applyposition(guiElement : GuiObject, positionUtil)
    local position = config.position[positionUtil]
    if position then
        position(guiElement)
    else
        warn(position .. "does not exist")
    end 
end

function applyCustomStyle(guiElement, category, value, unit)
    -- Convert value to a number for calculations
    local numValue = tonumber(value)
        
    -- Use the corresponding handler from `styleHandlers`
    local handler = ClassParser[category]
    if handler then
        handler(guiElement, numValue, unit)
    else
        warn("Handler for category " .. category .. " does not exist.")
    end
end

function style__apply.applyStyles(guiElement, className)
    local classes = string.split(className, " ")
    for _, class in ipairs(classes) do
        if config.textColors[class] then
            applytextcolor(guiElement, class)
        elseif config.size[class] then
            applysize(guiElement, class)
        elseif config.backgroundColors[class] then
            applybgcolor(guiElement, class)
        elseif config.round[class] then
            applyround(guiElement, class)
        elseif config.border[class] then
            applyborder(guiElement, class)
        elseif config.visible[class] then
            applyhidden(guiElement, class)
        elseif config.borderColors[class] then
            applybordercolor(guiElement, class)
        elseif config.transparency[class] then
            applytransparency(guiElement, class)
        else
            local colorCategory, r, g, b = class:match("(%w+)%-%[(%d+),(%d+),(%d+)%]")
            if colorCategory and r and g and b then
                if colorCategory == "bg" then
                    guiElement.BackgroundColor3 = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
                elseif colorCategory == "textColor" then
                    guiElement.TextColor3 = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
                end
            else
                local category, value, unit, psuedo = class:match("([%w%-]+)%[?(%d*%.?%d*)%s*([%w%%%-]*)%]?%s*(%:[%w%-]+)?") -- "(%w+)%-%[(%d*%.?%d+)([%a%a%%]*)%]"
                print(category ,value, unit, psuedo)
                if category and value then
                    applyCustomStyle(guiElement ,category, value, unit)
                end
            end
        end
    end
end

return style__apply