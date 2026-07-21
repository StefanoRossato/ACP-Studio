----------------------------------------------------------------------
-- ACP Studio
-- AnalysisComponent_Test.lua
--
-- Component     : Analysis Component Test
-- Layer         : Tests/Analysis
-- Purpose       : Validate AnalysisComponent skeleton behavior.
-- Specification : BT-004
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

local AnalysisComponent = require("Core.Analysis.AnalysisComponent")

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

local function TestComponentCreation()

    Log("Creating AnalysisComponent...")

    local component = AnalysisComponent.New()

    if not component then
        error("AnalysisComponent creation failed.")
    end

    Log("PASS - AnalysisComponent created")

    return component

end

local function TestDefaultState(component)

    assert(
        component:GetName() == "AnalysisComponent",
        "Invalid default component name."
    )

    assert(
        component:GetState() == "CREATED",
        "Invalid default component state."
    )

    Log("PASS - Default state")

end

local function TestPublicInterface(component)

    assert(type(component.Initialize) == "function", "Missing Initialize()")
    assert(type(component.Prepare)   == "function", "Missing Prepare()")
    assert(type(component.Process)   == "function", "Missing Process()")
    assert(type(component.Finalize)  == "function", "Missing Finalize()")
    assert(type(component.Reset)     == "function", "Missing Reset()")
    assert(type(component.Shutdown)  == "function", "Missing Shutdown()")
    assert(type(component.GetName)   == "function", "Missing GetName()")
    assert(type(component.GetState)  == "function", "Missing GetState()")

    Log("PASS - Public interface")

end

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("AnalysisComponent Test")
    Log("========================================")

    local component = TestComponentCreation()

    TestDefaultState(component)
    TestPublicInterface(component)

    Log("========================================")
    Log("AnalysisComponent Test PASSED")
    Log("========================================")

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

Run()