----------------------------------------------------------------------
-- ACP Studio
-- RuntimeModel.lua
--
-- Component     : Runtime Model
-- Layer         : Core/Runtime
-- Purpose       : Runtime analysis data model
-- Specification : BT-003
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

local RuntimeModel = {}
RuntimeModel.__index = RuntimeModel

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Construction
----------------------------------------------------------------------

function RuntimeModel.New()

    local self = setmetatable({}, RuntimeModel)

    self:Reset()

    return self

end
----------------------------------------------------------------------
-- Private Methods
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

function RuntimeModel:Reset()

    self.state = 0

    self.rms = 0.0
    self.peak = 0.0
    self.crestFactor = 0.0

    self.sampleCount = 0
    self.timestamp = 0

end

----------------------------------------------------------------------
-- State
----------------------------------------------------------------------

function RuntimeModel:SetState(state)

    self.state = state

end

function RuntimeModel:GetState()

    return self.state

end

----------------------------------------------------------------------
-- RMS
----------------------------------------------------------------------

function RuntimeModel:SetRMS(value)

    self.rms = value

end

function RuntimeModel:GetRMS()

    return self.rms

end

----------------------------------------------------------------------
-- Peak
----------------------------------------------------------------------

function RuntimeModel:SetPeak(value)

    self.peak = value

end

function RuntimeModel:GetPeak()

    return self.peak

end

----------------------------------------------------------------------
-- Crest Factor
----------------------------------------------------------------------

function RuntimeModel:SetCrestFactor(value)

    self.crestFactor = value

end

function RuntimeModel:GetCrestFactor()

    return self.crestFactor

end

----------------------------------------------------------------------
-- Sample Count
----------------------------------------------------------------------

function RuntimeModel:SetSampleCount(value)

    self.sampleCount = value

end

function RuntimeModel:GetSampleCount()

    return self.sampleCount

end

----------------------------------------------------------------------
-- Timestamp
----------------------------------------------------------------------

function RuntimeModel:SetTimestamp(value)

    self.timestamp = value

end

function RuntimeModel:GetTimestamp()

    return self.timestamp

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

return RuntimeModel
