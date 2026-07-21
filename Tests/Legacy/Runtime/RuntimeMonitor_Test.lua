----------------------------------------------------------------------
-- ACP Studio
-- RuntimeMonitor_Test.lua
--
-- Component     : Runtime Monitor Test
-- Layer         : Tests/Observability
-- Purpose       : Validate RuntimeMonitor behavior.
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

local function TestCreation()

    Log("Creating RuntimeModel...")

    local runtimeModel = RuntimeModel.New()

    assert(runtimeModel ~= nil)

    Log("PASS - RuntimeModel created")

    Log("Creating ObservationProvider...")

    local provider = ObservationProvider.New(runtimeModel)

    assert(provider ~= nil)

    Log("PASS - ObservationProvider created")

    Log("Creating ObservationCollector...")

    local collector = ObservationCollector.New(provider)

    assert(collector ~= nil)

    Log("PASS - ObservationCollector created")

    Log("Creating RuntimeMonitor...")

    local monitor = RuntimeMonitor.New()

    assert(monitor ~= nil)

    Log("PASS - RuntimeMonitor created")

    return runtimeModel, collector, monitor

end

local function TestDisplay(runtimeModel, collector, monitor)

    Log("Displaying snapshot...")

    runtimeModel.State = 1
    runtimeModel.RMS = -18.0
    runtimeModel.Peak = -6.0
    runtimeModel.CrestFactor = 12.0

    runtimeModel.SampleCount = 1024
    runtimeModel.Timestamp = 100

    runtimeModel.Metrics.Heartbeat = 25
    runtimeModel.Metrics.SampleCounter = 48000
    runtimeModel.Metrics.FramesProcessed = 1000
    runtimeModel.Metrics.UpdateTimestamp = 100

    local snapshot = collector:Collect()

    assert(snapshot ~= nil)

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
    Log("RuntimeMonitor Test")
    Log("========================================")

    local runtimeModel, collector, monitor = TestCreation()

    TestDisplay(runtimeModel, collector, monitor)

    Log("========================================")
    Log("RuntimeMonitor Test PASSED")
    Log("========================================")

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

Run()
