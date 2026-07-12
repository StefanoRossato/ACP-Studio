----------------------------------------------------------------------
-- ACP Studio
-- RunTest_Test.lua
--
-- Component     : Test Launcher
-- Layer         : Tests
-- Purpose       : Test Launcher validation
-- Specification : TST-001
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Execute Test Launcher
----------------------------------------------------------------------

dofile(
    debug.getinfo(1, "S").source:match("@?(.*[/\\])") ..
    "RunTest.lua"
)

----------------------------------------------------------------------
-- Test completed successfully
----------------------------------------------------------------------

reaper.ClearConsole()
reaper.ShowConsoleMsg("RunTest_Test : PASS\n")