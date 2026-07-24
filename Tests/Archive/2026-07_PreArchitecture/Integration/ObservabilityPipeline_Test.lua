----------------------------------------------------------------------
-- ACP Studio
-- ObservabilityPipeline_Test.lua
--
-- Component     : Observability Pipeline
-- Layer         : Integration
-- Purpose       : Validate the complete Observability pipeline.
-- Specification : OBS-002 Runtime Metrics
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

local RuntimeModel =
    require("Core.Runtime.RuntimeModel")

local ObservationProvider =
    require("Core.Observability.ObservationProvider")

local ObservationCollector =
    require("Core.Observability.ObservationCollector")

local RuntimeMonitor =
    require("Core.Runtime.RuntimeMonitor")

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

    --------------------------------------------------------------------------
    -- RuntimeModel
    --------------------------------------------------------------------------

    Log("Creating RuntimeModel...")

    local model = RuntimeModel.New()

    assert(model ~= nil)

    Log("PASS - RuntimeModel created")

    --------------------------------------------------------------------------
    -- ObservationProvider
    --------------------------------------------------------------------------

    Log("Creating ObservationProvider...")

    local provider = ObservationProvider.New(model)

    assert(provider ~= nil)

    Log("PASS - ObservationProvider created")

    --------------------------------------------------------------------------
    -- ObservationCollector
    --------------------------------------------------------------------------

    Log("Creating ObservationCollector...")

    local collector = ObservationCollector.New(provider)

    assert(collector ~= nil)

    Log("PASS - ObservationCollector created")

    --------------------------------------------------------------------------
    -- RuntimeMonitor
    --------------------------------------------------------------------------

    Log("Creating RuntimeMonitor...")

    local monitor = RuntimeMonitor.New()

    assert(monitor ~= nil)

    Log("PASS - RuntimeMonitor created")

    --------------------------------------------------------------------------
    -- Update RuntimeModel
    --------------------------------------------------------------------------

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

    Log("PASS - RuntimeModel updated")

    --------------------------------------------------------------------------
    -- Collect Snapshot
    --------------------------------------------------------------------------

    Log("Collecting snapshot...")

    local snapshot = collector:Collect()

    assert(snapshot ~= nil)

    Log("PASS - Snapshot collected")

    --------------------------------------------------------------------------
    -- Display Snapshot
    --------------------------------------------------------------------------

    Log("Displaying snapshot...")

    monitor:Display(snapshot)

    Log("PASS - Snapshot displayed")

end

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("Observability Pipeline Test")
    Log("========================================")

    TestCase()

    Log("========================================")
    Log("Observability Pipeline Test PASSED")
    Log("========================================")

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

Run()