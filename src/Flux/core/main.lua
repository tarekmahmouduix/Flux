local init = require(script.Parent.Parent.launch)
local patternsModule = require(script.Parent.config.patterns)
local index = require(script.Parent.Animations.index)

init.init()

local registeredPatterns = patternsModule.patterns

local function applyStaticStyles(guiElement, className)
    for _, class in ipairs(string.split(className, " ")) do
        for _, entry in ipairs(registeredPatterns) do
            local matches = {class:match(entry.pattern)}
            if #matches > 0 then
                entry.handler(guiElement, table.unpack(matches))
                break
            end
        end
    end
end

local function applyStyles(guiElement, className)
    local classes = string.split(className, " ")

    for _, class in ipairs(classes) do
        local matched = false
        for _, entry in ipairs(registeredPatterns) do
            local matches = {class:match(entry.pattern)}
            if #matches > 0 then
                entry.handler(guiElement, table.unpack(matches))
                matched = true
                break
            end
        end
        
        if not matched then
            if class == "" then
                print("Cannot use Spaces as Classes")
            else
                print("No matching pattern found for: " .. class)
            end
        end
    end
end

return {
    applyStyles = applyStyles,
}
