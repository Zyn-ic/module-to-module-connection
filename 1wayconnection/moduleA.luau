local ReplicatedStorage = game:GetService("ReplicatedStorage") 
local ThingPool = require(script.Parent.ThingPool) 
local Things = require(ReplicatedStorage.Shared.Config.Things) 
--@author: yyumchi 
--@date: 2025-09-03 
--[[@description: Short description here. ]] 
----------------------------- -- VARIABLES -- 
----------------------------- 
local Module = {} 
-- CONSTANTS -- 
----------------------------- 
-- PRIVATE FUNCTIONS -- 
----------------------------- 
-- PUBLIC FUNCTIONS -- 
function Module:Init() 
  -- initialization code 
end 

function Module:Start() 
  -- start / runtime code 
end 

function Module:Ping() 
  print("Ping") 
  task.wait(1) 
  ThingPool:Pong() 
end 
----------------------------- 
--MAIN-- 
----------------------------- 
return Module
