----------------------------------------------------------------------
-- ACP Studio
-- ObservationSnapshot_Test.lua
--
-- Component     : ObservationSnapshot
-- Layer         : Runtime Observability
-- Purpose       : Unit test for ObservationSnapshot
-- Specification : OBS-001
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Test Setup
----------------------------------------------------------------------

dofile(
    debug.getinfo(1, "S").source:match("@?(.*[/\\])")
    .. "../TestSetup.lua"
)

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

local ObservationSnapshot = require("Core.Observability.ObservationSnapshot")
----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Construction
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Private Methods
----------------------------------------------------------------------

local function ClearLog()

    reaper.ClearConsole()

end

local function Log(message)

    reaper.ShowConsoleMsg(message .. "\n")

end

----------------------------------------------------------------------
-- Test Cases
----------------------------------------------------------------------

local function TestCase()

    Log("Creating ObservationSnapshot...")

    local snapshot = ObservationSnapshot.New({

        state       = "RUNNING",
        rms         = -18.0,
        peak        = -3.0,
        crestFactor = 15.0,
        sampleCount = 48000,
        timestamp   = 100

    })

    assert(snapshot ~= nil)
    Log("PASS - ObservationSnapshot created")

    assert(snapshot:GetState() == "RUNNING")
    Log("PASS - GetState()")

    assert(snapshot:GetRMS() == -18.0)
    Log("PASS - GetRMS()")

    assert(snapshot:GetPeak() == -3.0)
    Log("PASS - GetPeak()")

    assert(snapshot:GetCrestFactor() == 15.0)
    Log("PASS - GetCrestFactor()")

    assert(snapshot:GetSampleCount() == 48000)
    Log("PASS - GetSampleCount()")

    assert(snapshot:GetTimestamp() == 100)
    Log("PASS - GetTimestamp()")

end

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("ObservationSnapshot Test")
    Log("========================================")

    TestCase()

    Log("========================================")
    Log("ObservationSnapshot Test PASSED")
    Log("========================================")

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

Run()