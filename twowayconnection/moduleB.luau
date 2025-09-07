--local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ModuleC = require(pathtoc) -- connection module

--@date: 2025-09-06
--[[@description:
    ModuleB receives Ping and replies Pong.
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
    ModuleC:RegisterModuleB(self)
end

function Module:Start()
    -- Nothing to start yet
end

function Module:Pong()
    print("Pong from B")
end

function Module:Hi()
    ModuleC:SendToA("Hi from B")
end

-----------------------------
-- MAIN --
-----------------------------
return Module
