--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test          : BaseTestSkeleton Foundation Test
-- Category      : Engineering Test
--
-- Purpose       : Verify BaseTestSkeleton foundation behavior.
--
-- Specification : BST-001
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

local BaseTestSkeleton =
    require("Documentation.Engineering.Templates.BaseTestSkeleton")


--------------------------------------------------------------------------------
-- Console Helpers
--------------------------------------------------------------------------------

local function Log(message)

    reaper.ShowConsoleMsg(
        message .. "\n")

end


--------------------------------------------------------------------------------

local function Pass(message)

    Log(
        "[PASS] " .. message)

end


--------------------------------------------------------------------------------

local function Assert(condition, message)

    assert(
        condition,
        message)

end


--------------------------------------------------------------------------------
-- Test State
--------------------------------------------------------------------------------

local Calls = {}


--------------------------------------------------------------------------------
-- Test
--------------------------------------------------------------------------------

local Test = {}


--------------------------------------------------------------------------------
-- Construction
--------------------------------------------------------------------------------

function Test.Construction()

    reaper.ClearConsole()

    Log("============================================================")
    Log("ACP Studio")
    Log("BST-001 BaseTestSkeleton Foundation Test")
    Log("============================================================")
    Log("")

end


--------------------------------------------------------------------------------
-- Setup
--------------------------------------------------------------------------------

function Test.Setup()

    Test.Instance =
        BaseTestSkeleton.New(
            "BST-001 Test")


    Pass(
        "BaseTestSkeleton instance created.")

end


--------------------------------------------------------------------------------
-- Execution
--------------------------------------------------------------------------------

function Test.Execution()


    function Test.Instance.OnSetup()

        table.insert(
            Calls,
            "Setup")

    end


    function Test.Instance.OnExecute()

        table.insert(
            Calls,
            "Execute")

    end


    function Test.Instance.OnVerify()

        table.insert(
            Calls,
            "Verify")

        return true

    end


    function Test.Instance.OnCleanup()

        table.insert(
            Calls,
            "Cleanup")

    end


    function Test.Instance.OnShutdown()

        table.insert(
            Calls,
            "Shutdown")

    end


    Test.Instance.Run()


    Pass(
        "Lifecycle execution completed.")

end


--------------------------------------------------------------------------------
-- Verification
--------------------------------------------------------------------------------

function Test.Verification()


    Assert(
        Test.Instance.GetName()
            == "BST-001 Test",
        "Invalid test name.")


    Pass(
        "Name verified.")



    Assert(
        Test.Instance.GetState()
            == "Completed",
        "Invalid final state.")


    Pass(
        "Final state verified.")



    Assert(
        Test.Instance.GetResult()
            == true,
        "Invalid result.")


    Pass(
        "Result verified.")



    local Expected =
    {
        "Setup",
        "Execute",
        "Verify",
        "Cleanup",
        "Shutdown"
    }


    Assert(
        #Calls == #Expected,
        "Invalid lifecycle count.")


    for index, value in ipairs(Expected) do

        Assert(
            Calls[index] == value,
            "Invalid lifecycle order.")

    end


    Pass(
        "Lifecycle order verified.")

end


--------------------------------------------------------------------------------
-- Cleanup
--------------------------------------------------------------------------------

function Test.Cleanup()

    assert(
        TestBootstrap.Shutdown(),
        "Failed to shutdown test environment.")


    Pass(
        "Test environment shutdown.")

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
    Log("BST-001 PASSED")
    Log("============================================================")
    Log("")

end


--------------------------------------------------------------------------------
-- Entry Point
--------------------------------------------------------------------------------

Test.Run()