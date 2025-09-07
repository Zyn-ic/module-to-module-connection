local ReplicatedStorage = game:GetService("ReplicatedStorage") 
--@author: yyumchi 
--@date: 2025-09-06 
--[[@description: Short description here. ]] 
----------------------------- -- VARIABLES -- 
----------------------------- 
local Module = {} 
-- CONSTANTS -- 
----------------------------- 
-- PRIVATE FUNCTIONS -- 
----------------------------- 
-- PUBLIC FUNCTIONS -- 
function Module:Init() -- initialization code 
end 

function Module:Start() -- start / runtime code 
end 

function Module:Pong() 
  print("pond") 
  task.wait(1) 
end 
----------------------------- 
--MAIN-- 
----------------------------- 
return Module
