------------------------------------------------------------------------------
-- ACP Studio
-- FND-002 ConsoleSink Test
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

local ConsoleSink =
    require("Core.Foundation.Logging.ConsoleSink")


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
    Log("FND-002 ConsoleSink Test")
    Log("============================================================")
    Log("")

end


------------------------------------------------------------------------------
-- Execution
------------------------------------------------------------------------------

function Test.Execution()

    local result =
        ConsoleSink.Write(
            "[INFO] ConsoleSink Test Message"
        )


    assert(
        result == true,
        "ConsoleSink write failed.")


    Pass("Console output verified.")

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
    Log("FND-002 ConsoleSink PASSED")
    Log("============================================================")
    Log("")

end


Test.Run()