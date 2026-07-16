--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : SharedMemoryProtocol
-- Layer         : Runtime
-- Purpose       : Provides semantic access to the Runtime Shared Memory Protocol.
-- Specification : RTP-001
--------------------------------------------------------------------------------

local SharedMemoryProtocol = {}

--------------------------------------------------------------------------------
-- Dependencies
--------------------------------------------------------------------------------

local SharedMemoryGateway =
    require("Core.Runtime.Gateway.SharedMemoryGateway")

local Registers =
    require("Core.IPC.Registers")

local RuntimeCommands =
    require("Core.IPC.RuntimeCommands")

local RuntimeStates =
    require("Core.IPC.RuntimeStates")

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function SharedMemoryProtocol.Start()

    return
        SharedMemoryGateway.Write(
            Registers.COMMAND,
            RuntimeCommands.START)

end

--------------------------------------------------------------------------------

function SharedMemoryProtocol.Reset()

    return
        SharedMemoryGateway.Write(
            Registers.COMMAND,
            RuntimeCommands.RESET)

end

--------------------------------------------------------------------------------

function SharedMemoryProtocol.ReadState()

    return
        SharedMemoryGateway.Read(
            Registers.STATE)

end

--------------------------------------------------------------------------------

function SharedMemoryProtocol.ReadMeasurement()

    return {

        RMS =
            SharedMemoryGateway.Read(
                Registers.RMS),

        Peak =
            SharedMemoryGateway.Read(
                Registers.PEAK),

        Linearity =
            SharedMemoryGateway.Read(
                Registers.LINEARITY),

        Samples =
            SharedMemoryGateway.Read(
                Registers.SAMPLES)

    }

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return SharedMemoryProtocol