local convars, frameworks in Config
local clientDir = 'client.modules'
local moduleNames = {
    "core",
    "context",
    "target",
    "radial",
    "notify",
    "progressbar",
    'textui',
}

for _, moduleName in ipairs(moduleNames) do
    local framework = convars[moduleName]
    if frameworks[framework] then
        local fomartedModule = ("%s.%s.%s"):format(clientDir, moduleName, framework)
        local success, module = pcall(require, fomartedModule)
        if type(module) ~= "string" or not string.find(module, 'not found') then
            if success then
                Framework[moduleName] = module
                print(("[%s] Loaded module %s"):format(framework, moduleName))
            else
                print(module)
                error(("Error loading module %s: %s"):format(moduleName, module))
            end
        end
    end
end
