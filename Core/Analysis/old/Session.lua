----------------------------------------------------------------------
-- ACP Studio
-- Session.lua
--
-- Analysis Session Controller
----------------------------------------------------------------------

local StateMachine = require("Core.Analysis.StateMachine")
local Analyzer     = require("Core.Analysis.Analyzer")
local Result       = require("Core.Analysis.Result")

local Session = {}

----------------------------------------------------------------------
-- Run Analysis Session
----------------------------------------------------------------------

function Session.Run()

    ------------------------------------------------------------------
    -- Development Trace
    ------------------------------------------------------------------

    reaper.ClearConsole()

    reaper.ShowConsoleMsg("=========================\n")
    reaper.ShowConsoleMsg("ACP Studio\n")
    reaper.ShowConsoleMsg("=========================\n")

    reaper.ShowConsoleMsg("Session started.\n")

    local stateMachine = StateMachine.New()
    local analyzer     = Analyzer.New()
    local result       = Result.New()

    ------------------------------------------------------------------
    -- Initialize
    ------------------------------------------------------------------

    stateMachine:SetState(StateMachine.States.INITIALIZING)
    reaper.ShowConsoleMsg("State: INITIALIZING\n")

    analyzer:Initialize()
    reaper.ShowConsoleMsg("Analyzer initialized.\n")

    ------------------------------------------------------------------
    -- Reset
    ------------------------------------------------------------------

    stateMachine:SetState(StateMachine.States.RESETTING)
    reaper.ShowConsoleMsg("State: RESETTING\n")

    analyzer:Reset()
    reaper.ShowConsoleMsg("Analyzer reset.\n")

    ------------------------------------------------------------------
    -- Complete
    ------------------------------------------------------------------

    stateMachine:SetState(StateMachine.States.COMPLETED)
    reaper.ShowConsoleMsg("State: COMPLETED\n")

    ------------------------------------------------------------------
    -- Terminate
    ------------------------------------------------------------------

    stateMachine:SetState(StateMachine.States.TERMINATED)
    reaper.ShowConsoleMsg("State: TERMINATED\n")

    reaper.ShowConsoleMsg("Session completed.\n")

    return result

end

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

return Session