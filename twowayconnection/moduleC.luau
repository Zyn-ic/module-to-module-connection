--@date: 2025-09-06
--[[@description:
    Handles communication between ModuleA and ModuleB.
]]
-----------------------------
-- VARIABLES --
-----------------------------
local Module = {}

local ModuleA 
local ModuleB

-----------------------------
-- PUBLIC FUNCTIONS --
-----------------------------

function Module:RegisterModuleA(mod)
    ModuleA = mod
end

function Module:RegisterModuleB(mod)
    ModuleB = mod
end

function Module:SendToA(msg)
    if ModuleA then
        if msg == "Hi from B" then
            return ModuleA:Greetings(msg)
        end
        ModuleA:Ping()
    else
        warn("ModuleA not registered")
    end
end

function Module:SendToB(msg)
    if ModuleB then
        ModuleB:Pong()
    else
        warn("ModuleB not registered")
    end
end

-----------------------------
-- MAIN --
-----------------------------
return Module
