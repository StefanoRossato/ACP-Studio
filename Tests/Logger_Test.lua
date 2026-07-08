----------------------------------------------------------------------
-- ACP Studio
-- Logger_Test.lua
----------------------------------------------------------------------

dofile(debug.getinfo(1, "S").source:match("@?(.*[/\\])") .. "TestSetup.lua")

local Logger = require("Core.Logger")

Logger.Clear()

Logger.Section("Logger Test")

Logger.Info("Session started")
Logger.Debug("Analyzer initialized")
Logger.Warning("Dummy warning")
Logger.Error("Dummy error")

reaper.ClearConsole()

reaper.ShowConsoleMsg("=========================\n")
reaper.ShowConsoleMsg("Logger Test\n")
reaper.ShowConsoleMsg("=========================\n\n")

reaper.ShowConsoleMsg("Log file created:\n")
reaper.ShowConsoleMsg(Logger.GetLogFile() .. "\n\n")

reaper.ShowConsoleMsg("TEST PASSED\n")