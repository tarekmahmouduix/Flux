local init = require(script.Parent.Parent.launch)
local patternsModule = require(script.Parent.config.patterns)

local style__apply = {}

init.init()

-- Apply static styles
function applyStaticStyles(guiElement, className)
    for _, class in ipairs(string.split(className, " ")) do
        for _, entry in ipairs(patternsModule.patterns) do
            local matches = {class:match(entry.pattern)}
            if #matches > 0 then
                entry.handler(guiElement, table.unpack(matches))
                break
            end
        end
    end
end

-- Main function to apply styles
function style__apply.applyStyles(guiElement, className)
    local classes = string.split(className, " ")
    for _, class in ipairs(classes) do
            local matched = false
            for _, entry in ipairs(patternsModule.patterns) do
                local matches = {class:match(entry.pattern)}
                if #matches > 0 then
                    entry.handler(guiElement, table.unpack(matches))
                    matched = true
                    break
                end
            end
            if not matched then
            print("No matching pattern found for: " .. class)
        end
    end
end

return style__apply
