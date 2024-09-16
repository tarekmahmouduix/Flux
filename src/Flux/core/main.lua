-- Unified Style Handler and Config
local init = require(script.Parent.Parent.launch)
local patternsModule = require(script.Parent.config.patterns)
local index = require(script.Parent.Animations.index)

-- Initialize the core functionality
init.init()

-- Table to store patterns (including user-defined)
local registeredPatterns = patternsModule.patterns

-- Apply static styles
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

-- Apply styles, matching against registered patterns
local function applyStyles(guiElement, className)
    local classes = string.split(className, " ")

    -- Loop through all classes provided by the user
    for _, class in ipairs(classes) do
        local matched = false
        -- Loop through patterns to find matches
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

-- Function for users to add their own patterns
local function addUtility(pattern, handler)
    table.insert(registeredPatterns, {pattern = pattern, handler = handler})
end

-- Return module with functionality
return {
    applyStyles = applyStyles,
    addUtility = addUtility, -- Allow users to register their own utilities
}