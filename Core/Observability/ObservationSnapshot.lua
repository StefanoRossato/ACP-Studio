------------------------------------------------------------------------------
-- ACP Studio
--
-- Module: ObservationSnapshot
-- Description:
--   Immutable snapshot of Runtime observation data.
------------------------------------------------------------------------------

local ObservationSnapshot = {}
ObservationSnapshot.__index = ObservationSnapshot

------------------------------------------------------------------------------
-- Constructor
------------------------------------------------------------------------------

function ObservationSnapshot.New(data)

    local self = setmetatable({}, ObservationSnapshot)

    self._state       = data.state
    self._rms         = data.rms
    self._peak        = data.peak
    self._crestFactor = data.crestFactor
    self._sampleCount = data.sampleCount
    self._timestamp   = data.timestamp

    return self

end

------------------------------------------------------------------------------
-- State
------------------------------------------------------------------------------

function ObservationSnapshot:GetState()

    return self._state

end

------------------------------------------------------------------------------
-- RMS
------------------------------------------------------------------------------

function ObservationSnapshot:GetRMS()

    return self._rms

end

------------------------------------------------------------------------------
-- Peak
------------------------------------------------------------------------------

function ObservationSnapshot:GetPeak()

    return self._peak

end

------------------------------------------------------------------------------
-- Crest Factor
------------------------------------------------------------------------------

function ObservationSnapshot:GetCrestFactor()

    return self._crestFactor

end

------------------------------------------------------------------------------
-- Sample Count
------------------------------------------------------------------------------

function ObservationSnapshot:GetSampleCount()

    return self._sampleCount

end

------------------------------------------------------------------------------
-- Timestamp
------------------------------------------------------------------------------

function ObservationSnapshot:GetTimestamp()

    return self._timestamp

end

------------------------------------------------------------------------------
return ObservationSnapshot