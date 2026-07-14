----------------------------------------------------------------------
-- ACP Studio
-- ObservabilityPipeline_Test.lua
--
-- Component     : Observability Pipeline
-- Layer         : Integration
-- Purpose       : Validate the complete Observability pipeline
-- Specification : OBS-001 Runtime Observability
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

local RuntimeModel =
    require("Core.Runtime.RuntimeModel")

local ObservationProvider =
    require("Core.Observability.ObservationProvider")

local ObservationCollector =
    require("Core.Observability.ObservationCollector")

local RuntimeMonitor =
    require("Core.Runtime.RuntimeMonitor")

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

    Log("Creating RuntimeModel...")

    local model = RuntimeModel.New()

    assert(model ~= nil)

    Log("PASS - RuntimeModel created")


    Log("Creating ObservationProvider...")

    local provider = ObservationProvider.New(model)

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


    ------------------------------------------------------------------
    -- QUI
    ------------------------------------------------------------------

    Log("Updating RuntimeModel...")

    model:SetState(1)
    model:SetRMS(-18.0)
    model:SetPeak(-6.0)
    model:SetCrestFactor(12.0)
    model:SetSampleCount(1024)
    model:SetTimestamp(100)

    Log("PASS - RuntimeModel updated")

    Log("Collecting snapshot...")

    local snapshot = collector:Collect()

    assert(snapshot ~= nil)

    Log("PASS - Snapshot collected")

    Log("Initializing RuntimeMonitor...")

    monitor:Initialize()

    Log("PASS - RuntimeMonitor initialized")

    Log("Displaying snapshot...")

    monitor:Display(snapshot)

    Log("PASS - Snapshot displayed")

    ------------------------------------------------------------------
    -- DOPO verranno questi
    ------------------------------------------------------------------

    -- monitor:Initialize()

    -- local snapshot = collector:Collect()

    -- monitor:Display(snapshot)

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