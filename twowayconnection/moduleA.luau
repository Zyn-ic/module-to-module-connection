--local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ModuleC = require(pathto) -- connection module

--@author: yyumchi
--@date: 2025-09-03
--[[@description:
    ModuleA sends "Ping" to ModuleB.
]]
-----------------------------
-- VARIABLES --
-----------------------------
local Module = {}

-----------------------------
-- PUBLIC FUNCTIONS --
-----------------------------

function Module:Init()
    -- Register connection with ModuleC
    ModuleC:RegisterModuleA(self)
end

function Module:Start()
    -- Start communication loop
    Module:Ping()
end

function Module:Ping()
    print("Ping from A")
    task.wait(1)
    ModuleC:SendToB("Ping") -- tell connection module to route to B
end

function Module:Greetings(msg)
    print(msg)
    print("--------------")
    print("I have received the msg")
end

-----------------------------
-- MAIN --
-----------------------------
return Module
