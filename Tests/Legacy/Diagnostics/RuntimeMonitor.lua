--=====================================================================
-- ACP Studio
-- Runtime Monitor
--
-- DIAG-001 Runtime Monitor
-- Engineering Tool
--=====================================================================

--=====================================================================
-- Constants
--=====================================================================

--=====================================================================
-- Shared Memory Registers
--=====================================================================

local REG_COMMAND        = 0
local REG_STATE          = 1
local REG_HEARTBEAT      = 2
local REG_SAMPLE_COUNTER = 3



--=====================================================================
-- Functions
--=====================================================================

local function Render(runtime)

    reaper.ClearConsole()

    reaper.ShowConsoleMsg("=========================================\n")
    reaper.ShowConsoleMsg("ACP Studio Runtime Monitor\n")
    reaper.ShowConsoleMsg("=========================================\n\n")

    reaper.ShowConsoleMsg(string.format("COMMAND    : %.0f\n", runtime.command))
    reaper.ShowConsoleMsg(string.format("STATE      : %.0f\n", runtime.state))
    reaper.ShowConsoleMsg("\n")
    reaper.ShowConsoleMsg(string.format("HEARTBEAT  : %.0f\n", runtime.heartbeat))
    reaper.ShowConsoleMsg(string.format("SAMPLES    : %.0f\n", runtime.sampleCounter))

end

local function ReadRegisters()

    local registers = {}

    registers.command        = reaper.gmem_read(REG_COMMAND)
    registers.state          = reaper.gmem_read(REG_STATE)
    registers.heartbeat      = reaper.gmem_read(REG_HEARTBEAT)
    registers.sampleCounter  = reaper.gmem_read(REG_SAMPLE_COUNTER)

    return registers

end

local function Attach()

    reaper.gmem_attach("ACP_STUDIO")

end

--=====================================================================
-- Entry Point
--=====================================================================

Attach()

local runtime = ReadRegisters()

Render(runtime)