----------------------------------------------------------------------
-- ACP Studio
-- RuntimeModel_Test.lua
--
-- Component     : Runtime Model Test
-- Layer         : Tests/Runtime
-- Purpose       : Validate RuntimeModel behavior.
-- Specification : OBS-002
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

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

local RuntimeModel = require("Core.Runtime.RuntimeModel")

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

local function TestCreation()

    Log("Creating RuntimeModel...")

    local model = RuntimeModel.New()

    assert(model ~= nil)
    assert(model.Metrics ~= nil)

    Log("PASS - RuntimeModel created")

    return model

end

local function TestInitialState(model)

    Log("Verifying initial state...")

    assert(model.State == 0)

    assert(model.RMS == 0.0)
    assert(model.Peak == 0.0)
    assert(model.CrestFactor == 0.0)

    assert(model.SampleCount == 0)
    assert(model.Timestamp == 0)

    assert(model.Metrics ~= nil)

    assert(model.Metrics.Heartbeat == 0)
    assert(model.Metrics.SampleCounter == 0)
    assert(model.Metrics.FramesProcessed == 0)
    assert(model.Metrics.UpdateTimestamp == 0)

    Log("PASS - Initial state verified")

end

local function TestUpdate(model)

    Log("Updating RuntimeModel...")

    model.State = 1

    model.RMS = -18.0
    model.Peak = -6.0
    model.CrestFactor = 12.0

    model.SampleCount = 1024
    model.Timestamp = 100

    model.Metrics.Heartbeat = 25
    model.Metrics.SampleCounter = 48000
    model.Metrics.FramesProcessed = 1000
    model.Metrics.UpdateTimestamp = 100

    assert(model.State == 1)

    assert(model.RMS == -18.0)
    assert(model.Peak == -6.0)
    assert(model.CrestFactor == 12.0)

    assert(model.SampleCount == 1024)
    assert(model.Timestamp == 100)

    assert(model.Metrics.Heartbeat == 25)
    assert(model.Metrics.SampleCounter == 48000)
    assert(model.Metrics.FramesProcessed == 1000)
    assert(model.Metrics.UpdateTimestamp == 100)

    Log("PASS - RuntimeModel updated")

end

local function TestClone(model)

    Log("Cloning RuntimeModel...")

    local clone = model:Clone()

    assert(clone ~= nil)
    assert(clone ~= model)

    assert(clone.Metrics ~= nil)
    assert(clone.Metrics ~= model.Metrics)

    assert(clone.State == model.State)

    assert(clone.RMS == model.RMS)
    assert(clone.Peak == model.Peak)
    assert(clone.CrestFactor == model.CrestFactor)

    assert(clone.SampleCount == model.SampleCount)
    assert(clone.Timestamp == model.Timestamp)

    assert(clone.Metrics.Heartbeat == model.Metrics.Heartbeat)
    assert(clone.Metrics.SampleCounter == model.Metrics.SampleCounter)
    assert(clone.Metrics.FramesProcessed == model.Metrics.FramesProcessed)
    assert(clone.Metrics.UpdateTimestamp == model.Metrics.UpdateTimestamp)

    Log("PASS - RuntimeModel cloned")

end

local function TestReset(model)

    Log("Resetting RuntimeModel...")

    model:Reset()

    assert(model.State == 0)

    assert(model.RMS == 0.0)
    assert(model.Peak == 0.0)
    assert(model.CrestFactor == 0.0)

    assert(model.SampleCount == 0)
    assert(model.Timestamp == 0)

    assert(model.Metrics ~= nil)

    assert(model.Metrics.Heartbeat == 0)
    assert(model.Metrics.SampleCounter == 0)
    assert(model.Metrics.FramesProcessed == 0)
    assert(model.Metrics.UpdateTimestamp == 0)

    Log("PASS - RuntimeModel reset")

end

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("RuntimeModel Test")
    Log("========================================")

    local model = TestCreation()

    TestInitialState(model)
    TestUpdate(model)
    TestClone(model)
    TestReset(model)

    Log("========================================")
    Log("RuntimeModel Test PASSED")
    Log("========================================")

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

Run()
