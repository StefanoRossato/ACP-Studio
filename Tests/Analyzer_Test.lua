dofile(debug.getinfo(1, "S").source:match("@?(.*[/\\])") .. "TestSetup.lua")

local Analyzer = require("Core.Analysis.Analyzer")

reaper.ClearConsole()

reaper.ShowConsoleMsg("=========================\n")
reaper.ShowConsoleMsg("Analyzer.lua Test\n")
reaper.ShowConsoleMsg("=========================\n")

local analyzer = Analyzer.New()

assert(analyzer:IsReady() == false)

assert(analyzer:Initialize() == true)
assert(analyzer:IsReady() == true)

assert(analyzer:Reset() == true)

assert(analyzer:Update() == true)

local values = analyzer:Read()

assert(values ~= nil)
assert(values.peak == nil)
assert(values.peakHold == nil)
assert(values.rms == nil)

reaper.ShowConsoleMsg("PASS\n")