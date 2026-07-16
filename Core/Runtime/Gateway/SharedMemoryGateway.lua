--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : SharedMemoryGateway
-- Layer         : Runtime
-- Purpose       : Provides controlled access to the shared memory infrastructure.
-- Specification : RTG-002
--------------------------------------------------------------------------------

local SharedMemoryGateway = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function SharedMemoryGateway.Attach()

    reaper.gmem_attach("ACP_STUDIO")

    return true

end

--------------------------------------------------------------------------------

function SharedMemoryGateway.Read(register)

    return reaper.gmem_read(register)

end

--------------------------------------------------------------------------------

function SharedMemoryGateway.Write(register, value)

    reaper.gmem_write(register, value)

    return true

end

--------------------------------------------------------------------------------

function SharedMemoryGateway.Reset()

    for register = 0, 255 do
        reaper.gmem_write(register, 0)
    end

    return true

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return SharedMemoryGateway