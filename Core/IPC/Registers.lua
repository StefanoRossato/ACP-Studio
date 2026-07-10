-----------------------------------------------------------------------
-- ACP Studio
-- Registers.lua
--
-- Component     : CMP-301
-- Layer         : Core / IPC
-- Purpose       : Shared memory register definitions
-- Specification : SPT-120
-----------------------------------------------------------------------

local Registers = {}

-----------------------------------------------------------------------
-- Register Definitions
-----------------------------------------------------------------------

Registers.COMMAND   = 0
Registers.STATE     = 1

Registers.RMS       = 2
Registers.PEAK      = 3
Registers.LINEARITY = 4
Registers.SAMPLES   = 5

Registers.VERSION   = 255

-----------------------------------------------------------------------

return Registers