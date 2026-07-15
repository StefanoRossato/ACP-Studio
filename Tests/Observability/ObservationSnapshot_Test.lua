----------------------------------------------------------------------
-- ACP Studio
-- ObservationSnapshot_Test.lua
--
-- Component     : Observation Snapshot Test
-- Layer         : Tests/Observability
-- Purpose       : Validate ObservationSnapshot behavior.
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

local ObservationSnapshot =
    require("Core.Observability.ObservationSnapshot")

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

    Log("PASS - RuntimeModel created")

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

    Log("Creating ObservationSnapshot...")

    local snapshot = ObservationSnapshot.New(model)

    assert(snapshot ~= nil)

    Log("PASS - ObservationSnapshot created")

    return model, snapshot

end

local function TestImmutability(model, snapshot)

    Log("Verifying snapshot immutability...")

    local snapshotModel = snapshot:GetModel()

    --------------------------------------------------------------------------
    -- Modify RuntimeModel
    --------------------------------------------------------------------------

    model.State = 2
    model.RMS = -12.0
    model.Peak = -3.0

    model.Metrics.Heartbeat = 50
    model.Metrics.SampleCounter = 96000

    --------------------------------------------------------------------------
    -- Snapshot must remain unchanged
    --------------------------------------------------------------------------

    assert(snapshotModel.State == 1)

    assert(snapshotModel.RMS == -18.0)
    assert(snapshotModel.Peak == -6.0)
    assert(snapshotModel.CrestFactor == 12.0)

    assert(snapshotModel.SampleCount == 1024)
    assert(snapshotModel.Timestamp == 100)

    assert(snapshotModel.Metrics.Heartbeat == 25)
    assert(snapshotModel.Metrics.SampleCounter == 48000)
    assert(snapshotModel.Metrics.FramesProcessed == 1000)
    assert(snapshotModel.Metrics.UpdateTimestamp == 100)

    Log("PASS - Snapshot is immutable")

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

    local model, snapshot = TestCreation()

    TestImmutability(model, snapshot)

    Log("========================================")
    Log("ObservationSnapshot Test PASSED")
    Log("========================================")

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

Run()
