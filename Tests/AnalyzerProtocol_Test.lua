dofile(debug.getinfo(1, "S").source:match("@?(.*[/\\])") .. "TestSetup.lua")
local Protocol = require("Core.Analysis.AnalyzerProtocol")

reaper.ShowConsoleMsg("AnalyzerProtocol Test\n")
reaper.ShowConsoleMsg("---------------------\n")

reaper.ShowConsoleMsg("COMMAND   : "..Protocol.Register.COMMAND.."\n")
reaper.ShowConsoleMsg("STATE     : "..Protocol.Register.STATE.."\n")
reaper.ShowConsoleMsg("RMS       : "..Protocol.Register.RMS.."\n")
reaper.ShowConsoleMsg("PEAK      : "..Protocol.Register.PEAK.."\n")
reaper.ShowConsoleMsg("LINEARITY : "..Protocol.Register.LINEARITY.."\n")
reaper.ShowConsoleMsg("SAMPLES   : "..Protocol.Register.SAMPLES.."\n")

reaper.ShowConsoleMsg("\nOK\n")