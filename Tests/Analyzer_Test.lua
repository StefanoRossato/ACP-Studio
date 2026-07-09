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
    Logger.ConsoleError("Initialize FAILED")
    return
end

Logger.ConsoleInfo("Initialize OK")

----------------------------------------------------------------------
-- Reset
----------------------------------------------------------------------

Logger.ConsoleInfo("Reset")

if not analyzer:Reset() then
    Logger.ConsoleError("Reset FAILED")
    return
end

Logger.ConsoleInfo("Reset OK")

----------------------------------------------------------------------
-- Start
----------------------------------------------------------------------

Logger.ConsoleInfo("Start")

if not analyzer:Start() then
    Logger.ConsoleError("Start FAILED")
    return
end

Logger.ConsoleInfo("Start OK")

----------------------------------------------------------------------
-- Poll
----------------------------------------------------------------------

local attempts = 0
local maxAttempts = 100

local function Poll()

    attempts = attempts + 1

    analyzer:Update()

    ------------------------------------------------------------
    -- Completed
    ------------------------------------------------------------

    if analyzer:IsCompleted() then

        local m = analyzer:Read()

        Logger.Section("Measurements")

        Logger.ConsoleInfo("RMS        : " .. tostring(m.rms))
        Logger.ConsoleInfo("PEAK       : " .. tostring(m.peak))
        Logger.ConsoleInfo("LINEARITY  : " .. tostring(m.linearity))
        Logger.ConsoleInfo("SAMPLES    : " .. tostring(m.samples))

        Logger.Section("Result")

        Logger.ConsoleInfo("TEST PASSED")

        return

    end

    ------------------------------------------------------------
    -- Timeout
    ------------------------------------------------------------

        if attempts >= maxAttempts then

            local echo = reaper.gmem_read(10)
            local stateRaw = reaper.gmem_read(1)

            Logger.Section("Result")

            Logger.ConsoleError("TIMEOUT")

            Logger.ConsoleInfo("STATE (object) = " .. tostring(analyzer.state))
            Logger.ConsoleInfo("STATE (raw)    = " .. tostring(stateRaw))
            Logger.ConsoleInfo("COMMAND (echo) = " .. tostring(echo))

        return

    end

    reaper.defer(Poll)

end

----------------------------------------------------------------------
-- Run
----------------------------------------------------------------------

Poll()