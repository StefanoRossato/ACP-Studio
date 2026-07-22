------------------------------------------------------------------------------
-- ACP Studio
-- FND-001 Logger Foundation Service Test
------------------------------------------------------------------------------
-- Specification : FND-001
-- Category      : Foundation Test
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Bootstrap
------------------------------------------------------------------------------

local Bootstrap =
    dofile(reaper.GetResourcePath() ..
        "/Scripts/ACP Studio/Tests/TestBootstrap.lua")

Bootstrap.Initialize()

------------------------------------------------------------------------------
-- Dependencies
------------------------------------------------------------------------------

local RepositoryLocator =
    require("Core.Foundation.RepositoryLocator")

local Logger =
    require("Core.Foundation.Logger")

------------------------------------------------------------------------------
-- Test
------------------------------------------------------------------------------

local Test = {}

------------------------------------------------------------------------------
-- Logging
------------------------------------------------------------------------------

local function Log(message)

    reaper.ShowConsoleMsg(message .. "\n")

end

local function Pass(message)

    Log("[PASS] " .. message)

end

local function Fail(message)

    Log("[FAIL] " .. message)

end

------------------------------------------------------------------------------
-- Construction
------------------------------------------------------------------------------

function Test.Construction()

    reaper.ClearConsole()

    Log("======================================================")
    Log("FND-001 Logger Foundation Service Test")
    Log("======================================================")
    Log("")

end

------------------------------------------------------------------------------
-- Setup
------------------------------------------------------------------------------

function Test.Setup()

    local repository =
        RepositoryLocator.Locate()

    assert(repository, "Repository not found.")

    local configuration =
    {
        LogFile = repository .. "/Logs/ACP.log"
    }

    local initialized =
        Logger.Initialize(configuration)

    assert(initialized,
        "Logger initialization failed.")

    Pass("Logger initialized.")

end

------------------------------------------------------------------------------
-- Execution
------------------------------------------------------------------------------

function Test.Execution()

    Logger.Log("Log")

    Logger.Info("Information")

    Logger.Warning("Warning")

    Logger.Error("Error")

    Pass("Messages written.")

end

------------------------------------------------------------------------------
-- Verification
------------------------------------------------------------------------------

function Test.Verification()

    local repository =
        RepositoryLocator.Locate()

    local file =
        io.open(repository .. "/Logs/ACP.log", "r")

    assert(file,
        "Log file not found.")

    local content =
        file:read("*a")

    file:close()

    assert(content:find("Log"),
        "Missing Log message.")

    assert(content:find("%[INFO%] Information"),
        "Missing INFO message.")

    assert(content:find("%[WARNING%] Warning"),
        "Missing WARNING message.")

    assert(content:find("%[ERROR%] Error"),
        "Missing ERROR message.")

    Pass("File verification completed.")

end

------------------------------------------------------------------------------
-- Cleanup
------------------------------------------------------------------------------

function Test.Cleanup()

    local shutdown =
        Logger.Shutdown()

    assert(
        shutdown,
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

    Log("")
    Log("======================================================")
    Log("TEST PASSED")
    Log("======================================================")

end

------------------------------------------------------------------------------
-- Entry Point
------------------------------------------------------------------------------

Test.Run()