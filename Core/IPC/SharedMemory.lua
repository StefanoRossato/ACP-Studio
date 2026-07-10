-----------------------------------------------------------------------
-- ACP Studio
-- SharedMemory.lua
--
-- Component     : CMP-300
-- Layer         : Core / IPC
-- Purpose       : Shared memory access service
-- Specification : SPT-120
-----------------------------------------------------------------------

local Registers       = require("Core.IPC.Registers")
local RuntimeCommands = require("Core.IPC.RuntimeCommands")
local RuntimeStates   = require("Core.IPC.RuntimeStates")

local SharedMemory = {}

-----------------------------------------------------------------------
-- Constants
-----------------------------------------------------------------------

SharedMemory.VERSION = 1

SharedMemory.MEMORY_NAME = "ACP_STUDIO"

-----------------------------------------------------------------------
-- Internal State
-----------------------------------------------------------------------

local attached = false

-----------------------------------------------------------------------
-- Initialize
-----------------------------------------------------------------------

function SharedMemory.Initialize()

    if not attached then
        reaper.gmem_attach(SharedMemory.MEMORY_NAME)
        attached = true
    end

    SharedMemory.Write(
        Registers.VERSION,
        SharedMemory.VERSION
    )

end

-----------------------------------------------------------------------
-- Reset
-----------------------------------------------------------------------

function SharedMemory.Reset()

    SharedMemory.Write(
        Registers.COMMAND,
        RuntimeCommands.NONE
    )

    SharedMemory.Write(
        Registers.STATE,
        RuntimeStates.IDLE
    )

    SharedMemory.Write(Registers.RMS,        0)
    SharedMemory.Write(Registers.PEAK,       0)
    SharedMemory.Write(Registers.LINEARITY,  0)
    SharedMemory.Write(Registers.SAMPLES,    0)

    SharedMemory.Write(
        Registers.VERSION,
        SharedMemory.VERSION
    )

end

-----------------------------------------------------------------------
-- Read
-----------------------------------------------------------------------

function SharedMemory.Read(register)

    return reaper.gmem_read(register)

end

-----------------------------------------------------------------------
-- Write
-----------------------------------------------------------------------

function SharedMemory.Write(register, value)

    reaper.gmem_write(register, value)

end

-----------------------------------------------------------------------
-- Is Compatible
-----------------------------------------------------------------------

function SharedMemory.IsCompatible()

    return SharedMemory.Read(
        Registers.VERSION
    ) == SharedMemory.VERSION

end

-----------------------------------------------------------------------

return SharedMemory