------------------------------------------------------------------------------
-- ACP Studio
-- FND-001 Logger Foundation Service Test
------------------------------------------------------------------------------
-- Specification : FND-001
-- Category      : Foundation Test
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Test Bootstrap
------------------------------------------------------------------------------

local TestBootstrap =
    dofile(
        reaper.GetResourcePath() ..
        "/Scripts/ACP Studio/Tests/TestBootstrap.lua")

assert(
    TestBootstrap.Initialize(
        debug.getinfo(1, "S").source),
    "Failed to initialize test environment.")

------------------------------------------------------------------------------
-- Dependencies
------------------------------------------------------------------------------

local RepositoryLocator =
    require("Core.Bootstrap.RepositoryLocator")

local Logger =
    require("Core.Foundation.Logger")

------------------------------------------------------------------------------
-- Repository
------------------------------------------------------------------------------

local Repository =
    RepositoryLocator.GetRepositoryRoot()

assert(
    Repository ~= nil,
    "Repository not available.")

------------------------------------------------------------------------------
-- Console Helpers
------------------------------------------------------------------------------

local function Log(message)

    reaper.ShowConsoleMsg(message .. "\n")

end

--------------------------------------------------------------------------------

local function Pass(message)

    Log("[PASS] " .. message)

end

------------------------------------------------------------------------------
-- Test
------------------------------------------------------------------------------

local Test = {}

------------------------------------------------------------------------------
-- Construction
------------------------------------------------------------------------------

function Test.Construction()

    reaper.ClearConsole()

    Log("============================================================")
    Log("ACP Studio")
    Log("FND-001 Logger Foundation Service Test")
    Log("============================================================")
    Log("")

end

------------------------------------------------------------------------------
-- Setup
------------------------------------------------------------------------------

function Test.Setup()

    local configuration =
    {
        LogFile = Repository .. "/Logs/ACP.log"
    }

    assert(
        Logger.Initialize(configuration),
        "Logger initialization failed.")

    Pass("Logger initialized.")

end

------------------------------------------------------------------------------
-- Execution
------------------------------------------------------------------------------

function Test.Execution()

    Logger.Log("Log")
    Pass("Log() verified.")

    Logger.Info("Information")
    Pass("Info() verified.")

    Logger.Warning("Warning")
    Pass("Warning() verified.")

    Logger.Error("Error")
    Pass("Error() verified.")

end

------------------------------------------------------------------------------
-- Verification
------------------------------------------------------------------------------

function Test.Verification()

    local file =
        io.open(
            Repository .. "/Logs/ACP.log",
            "r")

    assert(
        file,
        "Log file not found.")

    local content =
        file:read("*a")

    file:close()

    assert(
        content:find("Log"),
        "Missing Log message.")

    assert(
        content:find("%[INFO%] Information"),
        "Missing INFO message.")

    assert(
        content:find("%[WARNING%] Warning"),
        "Missing WARNING message.")

    assert(
        content:find("%[ERROR%] Error"),
        "Missing ERROR message.")

    Pass("Log file verified.")

end

------------------------------------------------------------------------------
-- Cleanup
------------------------------------------------------------------------------

function Test.Cleanup()

    assert(
        Logger.Shutdown(),
        "Logger shutdown failed.")

    Pass("Logger shutdown.")

end

------------------------------------------------------------------------------
-- Run
------------------------------------------------------------------------------

function Test.Run()

    Test.Construction()

    Test.Setup()

    Test.Execution()

    Test.Verification()

    Test.Cleanup()

    assert(
        TestBootstrap.Shutdown(),
        "Failed to shutdown test environment.")

    Log("")
    Log("============================================================")
    Log("FND-001 PASSED")
    Log("============================================================")
    Log("")

end

------------------------------------------------------------------------------
-- Entry Point
------------------------------------------------------------------------------

Test.Run()