-----------------------------------------------------------------------
-- ACP Studio
-- SharedMemoryProtocol.lua
--
-- Component : CMP-300
-- Layer     : Core / IPC
-- Purpose   : Shared Memory Protocol implementation
-- Specification : SPT-120 v1.1
-----------------------------------------------------------------------

local SharedMemoryProtocol = {}

-----------------------------------------------------------------------
-- Constants
-----------------------------------------------------------------------

SharedMemoryProtocol.VERSION = 1

SharedMemoryProtocol.MEMORY_NAME = "ACP_STUDIO"

-----------------------------------------------------------------------
-- Register Map
-----------------------------------------------------------------------

SharedMemoryProtocol.REGISTERS = {

    COMMAND    = 0,
    STATE      = 1,
    RMS        = 2,
    PEAK       = 3,
    LINEARITY  = 4,
    SAMPLES    = 5,

    VERSION    = 255

}

-----------------------------------------------------------------------
-- Commands
-----------------------------------------------------------------------

SharedMemoryProtocol.COMMAND = {

    IDLE  = 0,
    START = 1,
    RESET = 2

}

-----------------------------------------------------------------------
-- States
-----------------------------------------------------------------------

SharedMemoryProtocol.STATE = {

    IDLE       = 0,
    MEASURING  = 1,
    COMPLETED  = 2,
    ERROR      = 3

}

-----------------------------------------------------------------------
-- Initialize
--
-- Attach shared memory and publish protocol version.
-----------------------------------------------------------------------

local attached = false

function SharedMemoryProtocol.Initialize()

    if not attached then
        reaper.gmem_attach(SharedMemoryProtocol.MEMORY_NAME)
        attached = true
    end

    SharedMemoryProtocol.Write(
        SharedMemoryProtocol.REGISTERS.VERSION,
        SharedMemoryProtocol.VERSION
    )

end

-----------------------------------------------------------------------
-- Reset
--
-- Resets all protocol registers.
-----------------------------------------------------------------------

function SharedMemoryProtocol.Reset()

    local R = SharedMemoryProtocol.REGISTERS

    SharedMemoryProtocol.Write(R.COMMAND,    SharedMemoryProtocol.COMMAND.IDLE)
    SharedMemoryProtocol.Write(R.STATE,      SharedMemoryProtocol.STATE.IDLE)

    SharedMemoryProtocol.Write(R.RMS,        0)
    SharedMemoryProtocol.Write(R.PEAK,       0)
    SharedMemoryProtocol.Write(R.LINEARITY,  0)
    SharedMemoryProtocol.Write(R.SAMPLES,    0)

    SharedMemoryProtocol.Write(R.VERSION, SharedMemoryProtocol.VERSION)

end

-----------------------------------------------------------------------
-- Read Register
-----------------------------------------------------------------------

function SharedMemoryProtocol.Read(register)

    return reaper.gmem_read(register)

end

-----------------------------------------------------------------------
-- Write Register
-----------------------------------------------------------------------

function SharedMemoryProtocol.Write(register, value)

    reaper.gmem_write(register, value)

end

-----------------------------------------------------------------------
-- Protocol Compatibility
-----------------------------------------------------------------------

function SharedMemoryProtocol.IsCompatible()

    local version =
        SharedMemoryProtocol.Read(
        SharedMemoryProtocol.REGISTERS.VERSION
    )

    return version == SharedMemoryProtocol.VERSION

end

-----------------------------------------------------------------------

return SharedMemoryProtocol
