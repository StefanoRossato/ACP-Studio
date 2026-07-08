-----------------------------------------------------------------------
-- ACP Studio
-- AnalyzerProtocol.lua
--
-- Defines the communication protocol between Analyzer.lua and
-- ACP_Analyzer.jsfx.
-----------------------------------------------------------------------

local AnalyzerProtocol = {}

-----------------------------------------------------------------------
-- Shared Registers
-----------------------------------------------------------------------

AnalyzerProtocol.Register = {
    COMMAND    = 0,
    STATE      = 1,

    RMS        = 2,
    PEAK       = 3,
    LINEARITY  = 4,
    SAMPLES    = 5
}

-----------------------------------------------------------------------
-- Commands (Lua -> JSFX)
-----------------------------------------------------------------------

AnalyzerProtocol.Command = {
    IDLE        = 0,
    START       = 1,
    RESET       = 2
}

-----------------------------------------------------------------------
-- States (JSFX -> Lua)
-----------------------------------------------------------------------

AnalyzerProtocol.State = {
    IDLE        = 0,
    MEASURING   = 1,
    COMPLETED   = 2,
    ERROR       = 3
}

return AnalyzerProtocol