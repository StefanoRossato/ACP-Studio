--------------------------------------------------------------------------------
-- ACP Studio
-- GUI-215 HomeView Rendering Integration Test
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Test Bootstrap
--------------------------------------------------------------------------------

local TestBootstrap =
    dofile(
        reaper.GetResourcePath() ..
        "/Scripts/ACP Studio/Tests/TestBootstrap.lua")

assert(
    TestBootstrap.Initialize(
        debug.getinfo(1, "S").source),
    "Failed to initialize test environment.")

--------------------------------------------------------------------------------
-- Dependencies
--------------------------------------------------------------------------------

local HomeView =
    require("Core.Application.Views.Home.HomeView")

--------------------------------------------------------------------------------
-- Console Helpers
--------------------------------------------------------------------------------

local Passed = 0
local Failed = 0

local function Log(message)

    reaper.ShowConsoleMsg(
        message .. "\n")

end

local function Pass(message)

    Passed = Passed + 1

    Log("[PASS] " .. message)

end

local function Fail(message)

    Failed = Failed + 1

    Log("[FAIL] " .. message)

end

--------------------------------------------------------------------------------
-- Test
--------------------------------------------------------------------------------

local Test = {}

--------------------------------------------------------------------------------
-- Construction
--------------------------------------------------------------------------------

function Test.Construction()

    reaper.ClearConsole()

    Log("")
    Log("============================================================")
    Log("ACP Studio")
    Log("GUI-215 HomeView Rendering Integration Test")
    Log("============================================================")
    Log("")

end

--------------------------------------------------------------------------------
-- Setup
--------------------------------------------------------------------------------

function Test.Setup()

    Test.View =
        HomeView.New()

    assert(
        Test.View ~= nil,
        "Failed to create HomeView.")

    Pass("HomeView created.")

    Test.View:OnEnter()

    assert(
        Test.View.PresentationModel ~= nil,
        "PresentationModel not initialized.")

    Pass("PresentationModel initialized.")

    assert(
        Test.View.DataBindingService ~= nil,
        "DataBindingService not initialized.")

    Pass("DataBindingService initialized.")

end

--------------------------------------------------------------------------------
-- Execution
--------------------------------------------------------------------------------

function Test.Execution()

    Test.Context =
        reaper.ImGui_CreateContext(
            "ACP Studio GUI-215")

    assert(
        Test.Context ~= nil,
        "Failed to create ImGui context.")

    Pass("ImGui context created.")

    Test.View:Render(
        Test.Context)

    Pass("HomeView rendered.")

end

--------------------------------------------------------------------------------
-- Cleanup
--------------------------------------------------------------------------------

function Test.Cleanup()

    Test.View:OnExit()

    Pass("HomeView exited.")

    Test.Context = nil

    Pass("Rendering context released.")

    assert(
        TestBootstrap.Shutdown())

    Pass("Test environment shutdown.")

end

--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

function Test.Run()

    Test.Construction()

    Test.Setup()

    Test.Execution()

    Test.Cleanup()

    Log("")
    Log("============================================================")

    if Failed == 0 then

        Log(
            "GUI-215 HomeView Rendering Integration PASSED")

    else

        Log(
            "GUI-215 HomeView Rendering Integration FAILED")

    end

    Log("============================================================")
    Log("")

end

--------------------------------------------------------------------------------
-- Execute
--------------------------------------------------------------------------------

Test.Run()