----------------------------------------------------------------------
-- ACP Studio
-- Analyzer_Test.lua
--
-- Component     : CMP-303
-- Layer         : Tests
-- Purpose       : Analyzer Integration Test Harness
-- Specification : SPT-120 v2.0
----------------------------------------------------------------------
dofile(
    debug.getinfo(1, "S").source:match("@?(.*[/\\])") ..
    "TestSetup.lua"
)
----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

local Logger   = require("Core.Logger")
local Analyzer = require("Core.Analysis.Analyzer")
----------------------------------------------------------------------
-- Configuration
----------------------------------------------------------------------

local TIMEOUT_SECONDS = 10

----------------------------------------------------------------------
-- Global State
----------------------------------------------------------------------

local analyzer  = nil
local startTime = 0

----------------------------------------------------------------------
-- Header
----------------------------------------------------------------------

Logger.Separator()

Logger.ConsoleInfo(
    "Analyzer Integration Test"
)

Logger.Separator()

----------------------------------------------------------------------
-- Initialize Test
----------------------------------------------------------------------

local function InitializeTest()

    analyzer = Analyzer.New()

    if not analyzer then

        Logger.ConsoleError(
            "Failed to create Analyzer."
        )

        return false

    end

    if not analyzer:Initialize() then

        Logger.ConsoleError(
            "Initialize FAILED"
        )

        return false

    end

    Logger.ConsoleInfo(
        "Initialize OK"
    )

    if not analyzer:Reset() then

        Logger.ConsoleError(
            "Reset FAILED"
        )

        return false

    end

    Logger.ConsoleInfo(
        "Reset OK"
    )

    if not analyzer:Start() then

        Logger.ConsoleError(
            "Start FAILED"
        )

        return false

    end

    Logger.ConsoleInfo(
        "Start OK"
    )

    startTime = reaper.time_precise()

    return true

end

----------------------------------------------------------------------
-- Print Results
----------------------------------------------------------------------

local function PrintResults()

    local measurements = analyzer:Read()

    if not measurements then

        Logger.ConsoleError(
            "Read FAILED"
        )

        return false

    end

    Logger.Separator()

    Logger.ConsoleInfo(
        string.format(
            "RMS        : %.6f",
            measurements.rms
        )
    )

    Logger.ConsoleInfo(
        string.format(
            "Peak       : %.6f",
            measurements.peak
        )
    )

    Logger.ConsoleInfo(
        string.format(
            "Linearity  : %.6f",
            measurements.linearity
        )
    )

    Logger.ConsoleInfo(
        string.format(
            "Samples    : %d",
            measurements.samples
        )
    )

    Logger.Separator()

    return true

end

----------------------------------------------------------------------
-- Cleanup
----------------------------------------------------------------------

local function Cleanup()

    if analyzer then

        analyzer:Destroy()

        analyzer = nil  

    end

    startTime = 0

end

----------------------------------------------------------------------
-- Run Test
----------------------------------------------------------------------

local function Run()

    ------------------------------------------------------------------
    -- Update
    ------------------------------------------------------------------
    -- debug
    Logger.ConsoleInfo("RUN")
    if not analyzer:Update() then

        Logger.Separator()


        Logger.ConsoleError(
            "Update FAILED"
        )

        Cleanup()

        Logger.ConsoleError(
            "TEST FAILED"
        )

        return

    end
    -- debug
    -- Logger.ConsoleInfo("STATE = " .. tostring(analyzer.state))
    
    ------------------------------------------------------------------
    -- Completed
    ------------------------------------------------------------------

    if analyzer:IsCompleted() then

        if not PrintResults() then

            Cleanup()

            Logger.ConsoleError(
                "TEST FAILED"
            )

            return

        end

        Logger.ConsoleInfo(
            "TEST PASSED"
        )

        Cleanup()

        return

    end

    ------------------------------------------------------------------
    -- Timeout
    ------------------------------------------------------------------

    if (reaper.time_precise() - startTime) >= TIMEOUT_SECONDS then

        Logger.Separator()

        Logger.ConsoleError(
            "TEST FAILED (Timeout)"
        )

        Cleanup()

        return

    end

    ------------------------------------------------------------------
    -- Continue
    ------------------------------------------------------------------

    reaper.defer(Run)

end

----------------------------------------------------------------------
-- Main
----------------------------------------------------------------------

if InitializeTest() then

    Run()

end
