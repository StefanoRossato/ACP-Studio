------------------------------------------------------------------------------
-- ACP Studio
-- FND-002 FileSink Test
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


local FileSink =
    require("Core.Foundation.Logging.FileSink")


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
    Log("FND-002 FileSink Test")
    Log("============================================================")
    Log("")

end


------------------------------------------------------------------------------
-- Setup
------------------------------------------------------------------------------

function Test.Setup()

    Test.LogPath =
        Repository .. "/Logs/FND-002_FileSink_Test.log"


    os.remove(
        Test.LogPath
    )


    assert(
        FileSink.Initialize(
            Test.LogPath),
        "FileSink initialization failed.")


    Pass("FileSink initialized.")

end


------------------------------------------------------------------------------
-- Execution
------------------------------------------------------------------------------

function Test.Execution()

    assert(
        FileSink.Write(
            "FileSink Test Message"),
        "File write failed.")


    Pass("Message written.")

end


------------------------------------------------------------------------------
-- Verification
------------------------------------------------------------------------------

function Test.Verification()

    local file =
        io.open(
            Test.LogPath,
            "r")


    assert(
        file ~= nil,
        "Log file not found.")


    local content =
        file:read("*a")


    file:close()


    assert(
        content:find(
            "FileSink Test Message"),
        "Missing log message.")


    Pass("File content verified.")

end


------------------------------------------------------------------------------
-- Cleanup
------------------------------------------------------------------------------

function Test.Cleanup()

    assert(
        FileSink.Close(),
        "FileSink close failed.")


    os.remove(
        Test.LogPath)


    assert(
        TestBootstrap.Shutdown(),
        "Failed to shutdown test environment.")


    Pass("Test shutdown.")

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
    Log("============================================================")
    Log("FND-002 FileSink PASSED")
    Log("============================================================")
    Log("")

end


Test.Run()