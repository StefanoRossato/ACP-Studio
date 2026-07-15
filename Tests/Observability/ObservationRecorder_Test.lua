----------------------------------------------------------------------
-- ACP Studio
-- ObservationRecorder_Test.lua
--
-- Component     : ObservationRecorder
-- Layer         : Observability
-- Purpose       : Verify ObservationRecorder behavior
-- Specification : OBS-003
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

local ObservationRecorder =
    require("Core.Observability.ObservationRecorder")

local ObservationSnapshot =
    require("Core.Observability.ObservationSnapshot")

local RuntimeModel =
    require("Core.Runtime.RuntimeModel")

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

    ------------------------------------------------------------------
    -- Create Recorder
    ------------------------------------------------------------------

    local recorder = ObservationRecorder.New()

    assert(recorder ~= nil)

    Log("PASS - ObservationRecorder created")

    ------------------------------------------------------------------
    -- Create Snapshot
    ------------------------------------------------------------------

    local model = RuntimeModel.New()
    local snapshot = ObservationSnapshot.New(model)

    assert(snapshot ~= nil)

    Log("PASS - ObservationSnapshot created")

    ------------------------------------------------------------------
    -- Record
    ------------------------------------------------------------------

    recorder:Record(snapshot)

    assert(recorder:GetCount() == 1)

    Log("PASS - Snapshot recorded")

    ------------------------------------------------------------------
    -- Get
    ------------------------------------------------------------------

    local stored = recorder:Get(1)

    assert(stored == snapshot)

    Log("PASS - Snapshot retrieved")

    ------------------------------------------------------------------
    -- GetAll
    ------------------------------------------------------------------

    local history = recorder:GetAll()

    assert(history ~= nil)
    assert(#history == 1)

    Log("PASS - History retrieved")

    ------------------------------------------------------------------
    -- Clear
    ------------------------------------------------------------------

    recorder:Clear()

    assert(recorder:GetCount() == 0)

    Log("PASS - History cleared")

end

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("ObservationRecorder Test")
    Log("========================================")

    TestCase()

    Log("========================================")
    Log("ObservationRecorder Test PASSED")
    Log("========================================")

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

Run()