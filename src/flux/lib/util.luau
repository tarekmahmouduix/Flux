local util = {}

function util.parse(x)
    local t : {} = {}

    for _, m in pairs(x:GetChildren()) do
        if m:IsA("ModuleScript") then
            t[m.Name] = require(m)
        end
    end
    return t
end

return util