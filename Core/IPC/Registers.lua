----------------------------------------------------------------------
-- ACP Studio
-- Registers.lua
--
-- Component     : CMP-301
-- Layer         : Core / IPC
-- Purpose       : Shared memory register definitions
-- Status        : Certified
-- Version       : 1.0
-- Specification : SPT-120
----------------------------------------------------------------------

local Registers = {}

-----------------------------------------------------------------------
-- Register Definitions
-----------------------------------------------------------------------
-- Runtime Control
Registers.COMMAND   = 0
Registers.STATE     = 1

-- Measurements
Registers.RMS       = 2
Registers.PEAK      = 3
Registers.LINEARITY = 4
Registers.SAMPLES   = 5

-- Protocol
Registers.VERSION   = 255

-----------------------------------------------------------------------

return Registers