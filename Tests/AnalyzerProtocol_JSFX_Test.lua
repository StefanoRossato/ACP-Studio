-----------------------------------------------------------------------
-- ACP Studio
-- AnalyzerProtocol_JSFX_Test.lua
--
-- Verifies communication between Lua and ACP_Analyzer.jsfx
-----------------------------------------------------------------------
dofile(debug.getinfo(1, "S").source:match("@?(.*[/\\])") .. "TestSetup.lua")

local Protocol = require("Core.Analysis.AnalyzerProtocol")

------------------------------------------------------------
-- Console
------------------------------------------------------------

reaper.ClearConsole()

local function Log(text)
    reaper.ShowConsoleMsg(tostring(text) .. "\n")
end

------------------------------------------------------------
-- Test
------------------------------------------------------------

Log("==============================")
Log("ACP Analyzer Protocol Test")
Log("==============================")
Log("")

------------------------------------------------------------
-- Start Analysis
------------------------------------------------------------

reaper.gmem_attach("ACP_STUDIO")

reaper.gmem_write(
    Protocol.Register.COMMAND,
    Protocol.Command.START
)

Log("COMMAND -> START")
Log("")

------------------------------------------------------------
-- Read Registers
------------------------------------------------------------

local state       = reaper.gmem_read(Protocol.Register.STATE)
local rms         = reaper.gmem_read(Protocol.Register.RMS)
local peak        = reaper.gmem_read(Protocol.Register.PEAK)
local linearity   = reaper.gmem_read(Protocol.Register.LINEARITY)
local samples     = reaper.gmem_read(Protocol.Register.SAMPLES)

------------------------------------------------------------
-- Output
------------------------------------------------------------

Log("STATE      : " .. state)
Log("RMS        : " .. rms)
Log("PEAK       : " .. peak)
Log("LINEARITY  : " .. linearity)
Log("SAMPLES    : " .. samples)

Log("")
Log("==============================")
Log("End Test")
Log("==============================")