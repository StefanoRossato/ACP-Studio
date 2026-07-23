------------------------------------------------------------------------------
-- ACP Studio
-- FND-002 LogFormatter Test
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

local LogFormatter =
    require("Core.Foundation.Logging.LogFormatter")


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
    Log("FND-002 LogFormatter Test")
    Log("============================================================")
    Log("")

end


------------------------------------------------------------------------------
-- Execution
------------------------------------------------------------------------------

function Test.Execution()

    local record =
    {
        Timestamp = "2026-07-23 18:30:00",
        Level = "INFO",
        Source = "Test",
        Message = "Formatter Test"
    }


    local formatted =
        LogFormatter.Format(record)


    assert(
        formatted ~= nil,
        "Formatter returned nil.")


    Pass("Formatter created output.")


    assert(
        formatted:find("%[2026%-07%-23 18:30:00%]"),
        "Missing timestamp.")


    Pass("Timestamp verified.")


    assert(
        formatted:find("%[INFO%]"),
        "Missing level.")


    Pass("Level verified.")


    assert(
        formatted:find("%[Test%]"),
        "Missing source.")


    Pass("Source verified.")


    assert(
        formatted:find("Formatter Test"),
        "Missing message.")


    Pass("Message verified.")


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
    Log("FND-002 LogFormatter PASSED")
    Log("============================================================")
    Log("")

end


Test.Run()