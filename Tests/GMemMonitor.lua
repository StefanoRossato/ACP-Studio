----------------------------------------------------------------------
-- ACP Studio
-- GMemMonitor.lua
----------------------------------------------------------------------

dofile(debug.getinfo(1, "S").source:match("@?(.*[/\\])") .. "TestSetup.lua")

local Logger = require("Core.Logger")

----------------------------------------------------------------------
-- Configuration
----------------------------------------------------------------------

local GMEM_NAME = "ACP_STUDIO"

reaper.gmem_attach(GMEM_NAME)

----------------------------------------------------------------------
-- Initialize
----------------------------------------------------------------------

Logger.Clear()
Logger.ClearConsole()

Logger.Section("GMem Monitor")

----------------------------------------------------------------------
-- Monitor
----------------------------------------------------------------------

local function Monitor()

    reaper.ClearConsole()

    reaper.ShowConsoleMsg("==============================\n")
    reaper.ShowConsoleMsg("ACP Studio - GMem Monitor\n")
    reaper.ShowConsoleMsg("==============================\n\n")

    reaper.ShowConsoleMsg(string.format("COMMAND    : %.0f\n", reaper.gmem_read(0)))
    reaper.ShowConsoleMsg(string.format("STATE      : %.0f\n", reaper.gmem_read(1)))
    reaper.ShowConsoleMsg(string.format("RMS        : %.2f\n", reaper.gmem_read(2)))
    reaper.ShowConsoleMsg(string.format("PEAK       : %.2f\n", reaper.gmem_read(3)))
    reaper.ShowConsoleMsg(string.format("LINEARITY  : %.2f\n", reaper.gmem_read(4)))
    reaper.ShowConsoleMsg(string.format("SAMPLES    : %.0f\n", reaper.gmem_read(5)))

    reaper.ShowConsoleMsg("\n")

    reaper.ShowConsoleMsg(string.format("ECHO (10)  : %.0f\n", reaper.gmem_read(10)))

    reaper.defer(Monitor)

end

----------------------------------------------------------------------
-- Run
----------------------------------------------------------------------

Monitor()