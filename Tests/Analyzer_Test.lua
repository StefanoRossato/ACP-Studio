----------------------------------------------------------------------
-- ACP Studio
-- Analyzer_Test.lua
----------------------------------------------------------------------

dofile(debug.getinfo(1, "S").source:match("@?(.*[/\\])") .. "TestSetup.lua")

local Logger   = require("Core.Logger")
local Analyzer = require("Core.Analysis.Analyzer")

----------------------------------------------------------------------
-- Initialize
----------------------------------------------------------------------

Logger.Clear()
Logger.ClearConsole()

Logger.Section("Analyzer Test")

Logger.ConsoleInfo("Creating Analyzer")

local analyzer = Analyzer.New()

----------------------------------------------------------------------
-- Initialize
----------------------------------------------------------------------

Logger.ConsoleInfo("Initialize")

if not analyzer:Initialize() then
    Logger.ConsoleError("Initialization failed")
    return
end

Logger.ConsoleInfo("Initialize OK")

----------------------------------------------------------------------
-- Reset
----------------------------------------------------------------------

Logger.ConsoleInfo("Reset")

if not analyzer:Reset() then
    Logger.ConsoleError("Reset failed")
    return
end

Logger.ConsoleInfo("Reset OK")

----------------------------------------------------------------------
-- Start
----------------------------------------------------------------------

Logger.ConsoleInfo("Start")

if not analyzer:Start() then
    Logger.ConsoleError("Start failed")
    return
end

Logger.ConsoleInfo("Start OK")

----------------------------------------------------------------------
-- Polling
----------------------------------------------------------------------

local attempts = 0
local maxAttempts = 100

local function Poll()

    attempts = attempts + 1

    analyzer:Update()

    if analyzer:IsCompleted() then

        local m = analyzer:Read()

        Logger.Section("Measurements")

        Logger.ConsoleInfo(string.format("RMS        : %.2f", m.rms))
        Logger.ConsoleInfo(string.format("PEAK       : %.2f", m.peak))
        Logger.ConsoleInfo(string.format("LINEARITY  : %.2f", m.linearity))
        Logger.ConsoleInfo(string.format("SAMPLES    : %.0f", m.samples))

        Logger.Section("Result")

        Logger.ConsoleInfo("TEST PASSED")

        return

    end

    if attempts >= maxAttempts then

        Logger.Section("Result")

        Logger.ConsoleError("TIMEOUT")

        Logger.ConsoleInfo("STATE = " .. tostring(analyzer.state))

        return

    end

    reaper.defer(Poll)

end

----------------------------------------------------------------------
-- Run
----------------------------------------------------------------------

Poll()