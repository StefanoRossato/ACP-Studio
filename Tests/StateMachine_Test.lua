dofile(debug.getinfo(1, "S").source:match("@?(.*[/\\])") .. "TestSetup.lua")

local StateMachine = require("Core.Analysis.StateMachine")

local sm = StateMachine.New()

assert(sm:IsState(StateMachine.States.IDLE))

sm:SetState(StateMachine.States.ANALYZING)

assert(sm:GetState() == StateMachine.States.ANALYZING)

assert(sm:IsState(StateMachine.States.ANALYZING))

reaper.ClearConsole()

reaper.ShowConsoleMsg("=========================\n")
reaper.ShowConsoleMsg("StateMachine.lua Test\n")
reaper.ShowConsoleMsg("=========================\n")
reaper.ShowConsoleMsg("PASS\n")