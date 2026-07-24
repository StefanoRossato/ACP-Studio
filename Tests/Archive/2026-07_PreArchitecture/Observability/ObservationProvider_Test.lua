----------------------------------------------------------------------
-- ACP Studio
-- ObservationProvider_Test.lua
--
-- Component     : Observation Provider Test
-- Layer         : Tests/Runtime
-- Purpose       : Validate ObservationProvider behavior.
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

    return runtimeModel, provider

end

local function TestGetModel(runtimeModel, provider)

    Log("Retrieving RuntimeModel...")

    local model = provider:GetModel()

    assert(model ~= nil)
    assert(model == runtimeModel)

    Log("PASS - RuntimeModel retrieved")

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

    local runtimeModel, provider = TestCreation()

    TestGetModel(runtimeModel, provider)

    Log("========================================")
    Log("ObservationProvider Test PASSED")
    Log("========================================")

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

Run()