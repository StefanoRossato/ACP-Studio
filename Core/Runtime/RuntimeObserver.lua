----------------------------------------------------------------------
-- ACP Studio
-- RuntimeObserver.lua
--
-- Component     : Runtime Observer
-- Layer         : Core/Runtime
-- Purpose       : Synchronize runtime data into the RuntimeModel
-- Specification : BT-003
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

local RuntimeObserver = {}
RuntimeObserver.__index = RuntimeObserver

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

local SharedMemory = require("Core.IPC.SharedMemory")
local Registers    = require("Core.IPC.Registers")

----------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Construction
----------------------------------------------------------------------

function RuntimeObserver.New()

    local self = setmetatable({}, RuntimeObserver)

    return self

end

----------------------------------------------------------------------
-- Private Methods
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

function RuntimeObserver:Update(model)

    model:SetState(
        SharedMemory.Read(
            Registers.STATE
        )
    )

    model:SetRMS(
        SharedMemory.Read(
            Registers.RMS
        )
    )

    model:SetPeak(
        SharedMemory.Read(
            Registers.PEAK
        )
    )

    model:SetCrestFactor(
        SharedMemory.Read(
            Registers.LINEARITY
        )
    )

    model:SetSampleCount(
        SharedMemory.Read(
            Registers.SAMPLES
        )
    )

    return model

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

return RuntimeObserver