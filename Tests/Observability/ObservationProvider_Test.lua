----------------------------------------------------------------------
-- ACP Studio
-- ObservationProvider_Test.lua
--
-- Component     : Observation Provider Test
-- Layer         : Tests/Runtime
-- Purpose       : Validate ObservationProvider behavior
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

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

local RuntimeModel        = require("Core.Runtime.RuntimeModel")
local ObservationProvider = require("Core.Observability.ObservationProvider")

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

local function TestConstruction()

    Log("Creating RuntimeModel...")

    local model = RuntimeModel.New()

    assert(model, "RuntimeModel creation failed.")

    Log("PASS - RuntimeModel created")

    Log("Creating ObservationProvider...")

    local provider = ObservationProvider.New(model)

    assert(provider, "ObservationProvider creation failed.")

    Log("PASS - ObservationProvider created")

    return provider, model

end

local function TestObservationAccess(provider, model)

    Log("Validating observation access...")

    assert(provider:GetState() == model:GetState(),
        "State mismatch.")

    assert(provider:GetTimestamp() == model:GetTimestamp(),
        "Timestamp mismatch.")

    
    Log("PASS - Observation access validated")

end

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("ObservationProvider Test")
    Log("========================================")

    local provider, model = TestConstruction()

    TestObservationAccess(provider, model)

    Log("========================================")
    Log("ObservationProvider Test PASSED")
    Log("========================================")

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

Run()