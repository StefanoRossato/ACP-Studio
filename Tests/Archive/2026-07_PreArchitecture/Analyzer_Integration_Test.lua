----------------------------------------------------------------------
-- ACP Studio
-- Analyzer_Integration_Test.lua
--
-- Component     : TST-400
-- Layer         : Tests / Integration
-- Purpose       : Analyzer integration validation
-- Specification : BT-002
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
l
----------------------------------------------------------------------
-- Configuration
----------------------------------------------------------------------

local TIMEOUT_SECONDS = 10

----------------------------------------------------------------------
-- Global State
----------------------------------------------------------------------

local analyzer  = nil
local startTime = 0
local lastState = nil

----------------------------------------------------------------------
-- Header
----------------------------------------------------------------------

Logger.Separator()

Logger.ConsoleInfo(
    "Analyzer Integration Test"
)

Logger.Separator()

----------------------------------------------------------------------
-- Setup
----------------------------------------------------------------------

local function Setup()

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
    "RMS = " ..
    tostring(reaper.gmem_read(2)))

    Logger.ConsoleInfo("COMMAND = " ..tostring(reaper.gmem_read(0)))
    Logger.ConsoleInfo(
    "RMS(DEBUG) = " ..
    tostring(reaper.gmem_read(2))
    )

    Logger.ConsoleInfo(
        "Start OK"
    )

    startTime = reaper.time_precise()

    lastState = nil

    return true

end

----------------------------------------------------------------------
-- Teardown
----------------------------------------------------------------------

local function Teardown()

    if analyzer then

        analyzer:Destroy()

        analyzer = nil

    end

    startTime = 0
    lastState = nil

end

----------------------------------------------------------------------
-- Print State
----------------------------------------------------------------------

local function PrintState()

    if analyzer.state == lastState then
        return
    end

    Logger.ConsoleInfo(
        "STATE -> " ..
        tostring(analyzer.state)
    )

    lastState = analyzer.state

end

----------------------------------------------------------------------
-- Print Measurements
----------------------------------------------------------------------

local function PrintMeasurements()

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
-- Execute
----------------------------------------------------------------------

local function Execute()

    ------------------------------------------------------------------
    -- Update
    ------------------------------------------------------------------

    if not analyzer:Update() then

        

        Logger.Separator()

        Logger.ConsoleError(
            "Update FAILED"
        )

        Teardown()

        Logger.ConsoleError(
            "TEST FAILED"
        )

        return

    end
    Logger.ConsoleInfo(
    string.format(
        "STATE=%d COMMAND=%.0f GMEM255=%.0f",
        analyzer.state,
        reaper.gmem_read(0),
        reaper.gmem_read(255)
    )
)
    ------------------------------------------------------------------
    -- State
    ------------------------------------------------------------------

    PrintState()

    ------------------------------------------------------------------
    -- Completed
    ------------------------------------------------------------------

    if analyzer:IsCompleted() then

        if not PrintMeasurements() then

            Teardown()

            Logger.ConsoleError(
                "TEST FAILED"
            )

            return

        end

        Logger.ConsoleInfo(
            "TEST PASSED"
        )

        Teardown()

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

        Teardown()

        return

    end

    ------------------------------------------------------------------
    -- Continue
    ------------------------------------------------------------------

    reaper.defer(Execute)

end

----------------------------------------------------------------------
-- Main
----------------------------------------------------------------------

if Setup() then

    Execute()

end