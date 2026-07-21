-----------------------------------------------------------------------
-- ACP Studio
-- RuntimeSharedMemoryMonitor.lua
--
-- BT-002 Diagnostic Tool
-----------------------------------------------------------------------

local VERSION  = "1.0"
local APP_NAME = "ACP_STUDIO"

-----------------------------------------------------------------------
-- Shared Memory Registers
-----------------------------------------------------------------------

local REG_COMMAND    = 0
local REG_STATE      = 1
local REG_RMS        = 2
local REG_PEAK       = 3
local REG_LINEARITY  = 4
local REG_SAMPLES    = 5

-----------------------------------------------------------------------
-- Diagnostic Registers
-----------------------------------------------------------------------

local REG_DEBUG_A    = 254
local REG_DEBUG_B    = 255

-----------------------------------------------------------------------
-- Runtime Commands
-----------------------------------------------------------------------

local COMMAND_NAMES = {
    [0] = "IDLE",
    [1] = "RESET",
    [2] = "START",
    [3] = "STOP"
}

-----------------------------------------------------------------------
-- Runtime States
-----------------------------------------------------------------------

local STATE_NAMES = {
    [0] = "IDLE",
    [1] = "MEASURING",
    [2] = "COMPLETED",
    [3] = "ERROR"
}

-----------------------------------------------------------------------
-- Attach Shared Memory
-----------------------------------------------------------------------

if not reaper.gmem_attach(APP_NAME) then

    reaper.ShowMessageBox(
        "Unable to attach Shared Memory:\n\n" ..
        APP_NAME,
        "ACP Studio",
        0
    )

    return

end

-----------------------------------------------------------------------
-- Helpers
-----------------------------------------------------------------------

local function CommandName(value)

    return COMMAND_NAMES[value] or "UNKNOWN"

end

-----------------------------------------------------------------------

local function StateName(value)

    return STATE_NAMES[value] or "UNKNOWN"

end

-----------------------------------------------------------------------
-- Update
-----------------------------------------------------------------------

local function Update()

    reaper.ClearConsole()
    reaper.ShowConsoleMsg("Monitor started\n")

  
    -- il resto della funzione rimane invariato
    local command = reaper.gmem_read(REG_COMMAND)
    local state   = reaper.gmem_read(REG_STATE)

    --reaper.ClearConsole()

    reaper.ShowConsoleMsg(string.format([[
============================================================
 ACP Studio - Runtime Shared Memory Monitor
============================================================

Version : %s
Memory  : %s

------------------------------------------------------------
Runtime Registers
------------------------------------------------------------

COMMAND      : %.0f
STATE        : %.0f
RMS          : %.0f
PEAK         : %.0f
LINEARITY    : %.0f
SAMPLES      : %.0f

------------------------------------------------------------
Diagnostic Registers
------------------------------------------------------------

DEBUG_A (254): %.0f
DEBUG_B (255): %.0f

------------------------------------------------------------
Decoded Status
------------------------------------------------------------

Command      : %s
State        : %s

]],

        VERSION,
        APP_NAME,

        command,
        state,
        reaper.gmem_read(REG_RMS),
        reaper.gmem_read(REG_PEAK),
        reaper.gmem_read(REG_LINEARITY),
        reaper.gmem_read(REG_SAMPLES),

        reaper.gmem_read(REG_DEBUG_A),
        reaper.gmem_read(REG_DEBUG_B),

        CommandName(command),
        StateName(state)
    ))

    reaper.defer(Update)

end

-----------------------------------------------------------------------
-- Entry Point
-----------------------------------------------------------------------

Update()