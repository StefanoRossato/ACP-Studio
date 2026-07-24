--------------------------------------------------------------------------------
-- ACP Studio
-- GUI-214 HomeView Integration Test
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

local ViewManager =
    require("Core.GUI.ViewManager")

local NavigationService =
    require("Core.Application.Navigation.NavigationService")

local ViewId =
    require("Core.Application.Navigation.ViewId")

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

    Log(
        "[PASS] " .. message)

end

local function Fail(message)

    Failed = Failed + 1

    Log(
        "[FAIL] " .. message)

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
    Log("GUI-214 HomeView Integration Test")
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

    ViewManager.Register(
        Test.View)

    assert(
        ViewManager.Get(ViewId.Home) == Test.View,
        "HomeView registration failed.")

    Pass("HomeView registered.")

end

--------------------------------------------------------------------------------
-- Execution
--------------------------------------------------------------------------------

function Test.Execution()

    NavigationService.Initialize(
        ViewManager)

    Pass("NavigationService initialized.")

    assert(
        NavigationService.Navigate(
            ViewId.Home),
        "Navigation failed.")

    Pass("Navigation completed.")

end

--------------------------------------------------------------------------------
-- Verification
--------------------------------------------------------------------------------

function Test.Verification()

    assert(
        ViewManager.GetActive() == Test.View,
        "Active view mismatch.")

    Pass("Active view verified.")

    assert(
        NavigationService.CurrentViewId()
            == ViewId.Home,
        "Current view id mismatch.")

    Pass("Current view verified.")

    assert(
        Test.View.PresentationModel ~= nil,
        "PresentationModel not initialized.")

    Pass("PresentationModel verified.")

    assert(
        Test.View.DataBindingService ~= nil,
        "DataBindingService not initialized.")

    Pass("DataBindingService verified.")

end

--------------------------------------------------------------------------------
-- Cleanup
--------------------------------------------------------------------------------

function Test.Cleanup()

    ViewManager.Reset()

    Pass("ViewManager reset.")

    assert(
        TestBootstrap.Shutdown(),
        "Failed to shutdown test environment.")

    Pass("Test environment shutdown.")

end

--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

function Test.Run()

    Test.Construction()

    Test.Setup()

    Test.Execution()

    Test.Verification()

    Test.Cleanup()

    Log("")
    Log("============================================================")

    if Failed == 0 then

        Log("GUI-214 HomeView Integration PASSED")

    else

        Log("GUI-214 HomeView Integration FAILED")

    end

    Log("============================================================")
    Log("")

end

--------------------------------------------------------------------------------
-- Execute
--------------------------------------------------------------------------------

Test.Run()