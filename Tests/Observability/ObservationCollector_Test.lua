----------------------------------------------------------------------
-- ACP Studio
-- ObservationCollector_Test.lua
--
-- Component     : ObservationCollector
-- Layer         : Observability
-- Purpose       : Validate ObservationCollector.
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

local RuntimeModel = require("Core.Runtime.RuntimeModel")
local ObservationProvider =
    require("Core.Observability.ObservationProvider")
local ObservationCollector =
    require("Core.Observability.ObservationCollector")

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

    model:SetState("RUNNING")
    model:SetRMS(-18.0)
    model:SetPeak(-3.0)
    model:SetCrestFactor(15.0)
    model:SetSampleCount(48000)
    model:SetTimestamp(100)

    Log("PASS - RuntimeModel created")

    Log("Creating ObservationProvider...")

    local provider = ObservationProvider.New(model)

    Log("PASS - ObservationProvider created")

    Log("Creating ObservationCollector...")

    local collector = ObservationCollector.New(provider)

    Log("PASS - ObservationCollector created")

    Log("Collecting snapshot...")

    local snapshot = collector:Collect()

    assert(snapshot ~= nil)

    assert(snapshot:GetState() == "RUNNING")
    assert(snapshot:GetRMS() == -18.0)
    assert(snapshot:GetPeak() == -3.0)
    assert(snapshot:GetCrestFactor() == 15.0)
    assert(snapshot:GetSampleCount() == 48000)
    assert(snapshot:GetTimestamp() == 100)

    Log("PASS - Snapshot collected")

end

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("ObservationCollector Test")
    Log("========================================")

    TestCase()

    Log("========================================")
    Log("ObservationCollector Test PASSED")
    Log("========================================")

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

Run()