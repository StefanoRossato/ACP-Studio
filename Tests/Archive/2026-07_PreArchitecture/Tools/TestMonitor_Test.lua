----------------------------------------------------------------------
-- ACP Studio
-- TestMonitor_Test.lua
--
-- Component     : Test Monitor Test
-- Layer         : Tests / Tools
-- Purpose       : Experimental validation of TST-001
-- Specification : TST-001
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Test Setup
----------------------------------------------------------------------

dofile(
    debug.getinfo(1, "S").source:match("@?(.*[/\\])")
    .. "../TestSetup.lua"
)

local path = reaper.GetResourcePath()
    .. "/Scripts/ACP Studio/Tools/TestMonitor.lua"

reaper.ShowConsoleMsg(path .. "\n")
reaper.ShowConsoleMsg(tostring(io.open(path, "r")) .. "\n")

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

local Logger = require("Core.Logger")
local TestMonitor = require("Tools.TestMonitor")

----------------------------------------------------------------------
-- Experimental Validation
----------------------------------------------------------------------

Logger.ClearConsole()
Logger.Clear()

Logger.Section("TST-001 Experimental Validation")

----------------------------------------------------------------------
-- Construction
----------------------------------------------------------------------

Logger.Separator()
Logger.ConsoleInfo("Construction")
Logger.Separator()

Logger.ConsoleInfo("Creating Test Monitor...")

local monitor = TestMonitor.New()

if monitor:GetState() == "CREATED" then
    Logger.ConsoleInfo("PASS - State = CREATED")
else
    Logger.ConsoleError("FAIL - Expected state CREATED")
    return
end

----------------------------------------------------------------------
-- Start
----------------------------------------------------------------------

Logger.Separator()
Logger.ConsoleInfo("Start")
Logger.Separator()

Logger.ConsoleInfo("Starting Test Monitor...")

monitor:Start()

if monitor:GetState() == "RUNNING" then
    Logger.ConsoleInfo("PASS - State = RUNNING")
else
    Logger.ConsoleError("FAIL - Expected state RUNNING")
    return
end

----------------------------------------------------------------------
-- Attach Runtime
----------------------------------------------------------------------

Logger.Separator()
Logger.ConsoleInfo("Attach Runtime")
Logger.Separator()

local runtime = {}

function runtime:GetState()

    return "IDLE"

end

Logger.ConsoleInfo("Attaching Runtime...")

monitor:AttachRuntime(runtime)

Logger.ConsoleInfo("PASS - Runtime attached.")

----------------------------------------------------------------------
-- Update
----------------------------------------------------------------------

Logger.Separator()
Logger.ConsoleInfo("Update")
Logger.Separator()

Logger.ConsoleInfo("Rendering snapshot...")

monitor:Update()

if monitor:GetState() == "RUNNING" then
    Logger.ConsoleInfo("PASS - State = RUNNING")
else
    Logger.ConsoleError("FAIL - Expected state RUNNING")
    return
end

----------------------------------------------------------------------
-- Stop
----------------------------------------------------------------------

Logger.Separator()
Logger.ConsoleInfo("Stop")
Logger.Separator()

Logger.ConsoleInfo("Stopping Test Monitor...")

monitor:Stop()

if monitor:GetState() == "STOPPED" then
    Logger.ConsoleInfo("PASS - State = STOPPED")
else
    Logger.ConsoleError("FAIL - Expected state STOPPED")
    return
end

----------------------------------------------------------------------
-- Result
----------------------------------------------------------------------

Logger.Separator()
Logger.ConsoleInfo("All validations completed successfully.")
Logger.ConsoleInfo("TST-001 Experimental Validation PASSED")
Logger.Separator()