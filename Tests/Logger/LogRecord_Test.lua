------------------------------------------------------------------------------
-- ACP Studio
-- FND-002 LogRecord Test
------------------------------------------------------------------------------

-- Test Bootstrap

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

local LogRecord =
    require("Core.Foundation.Logging.LogRecord")


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
    Log("FND-002 LogRecord Test")
    Log("============================================================")
    Log("")

end


------------------------------------------------------------------------------
-- Execution
------------------------------------------------------------------------------

function Test.Execution()

    local record =
        LogRecord.new(
            "INFO",
            "Test",
            "Logger Persistence Test")


    assert(
        record ~= nil,
        "LogRecord creation failed.")


    Pass("LogRecord created.")


    assert(
        record.Level == "INFO",
        "Invalid level.")


    Pass("Level verified.")


    assert(
        record.Source == "Test",
        "Invalid source.")


    Pass("Source verified.")


    assert(
        record.Message == "Logger Persistence Test",
        "Invalid message.")


    Pass("Message verified.")


    assert(
        record.Timestamp ~= nil,
        "Missing timestamp.")


    Pass("Timestamp verified.")

end


------------------------------------------------------------------------------
-- Cleanup
------------------------------------------------------------------------------

function Test.Cleanup()

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

    Test.Execution()

    Test.Cleanup()


    Log("")
    Log("============================================================")
    Log("FND-002 LogRecord PASSED")
    Log("============================================================")
    Log("")

end


Test.Run()