dofile(debug.getinfo(1, "S").source:match("@?(.*[/\\])") .. "TestSetup.lua")

local Result = require("Core.Analysis.Result")

local result = Result.New()

assert(result:IsValid() == false)

result:Set("peak", -12.3)
result:Set("peakHold", -11.8)
result:Set("rms", -18.2)

assert(result:Get("peak") == -12.3)
assert(result:Get("peakHold") == -11.8)
assert(result:Get("rms") == -18.2)

assert(result:IsValid() == true)

--------------------
-- Test
--------------------

reaper.ClearConsole()

reaper.ShowConsoleMsg("=========================\n")
reaper.ShowConsoleMsg("Result.lua Test\n")
reaper.ShowConsoleMsg("=========================\n")
reaper.ShowConsoleMsg("PASS\n")