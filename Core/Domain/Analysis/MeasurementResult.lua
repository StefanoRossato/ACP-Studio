--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : MeasurementResult
-- Layer         : Domain
-- Purpose       : Immutable aggregation of analysis measurements.
-- Specification : ADS-003
--------------------------------------------------------------------------------

local Measurement = require("Core.Domain.Analysis.Measurement")

local MeasurementResult = {}
MeasurementResult.__index = MeasurementResult

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function MeasurementResult.New(rms, peak, timestamp)

    assert(getmetatable(rms) == Measurement,
        "RMS must be a valid Measurement.")

    assert(getmetatable(peak) == Measurement,
        "Peak must be a valid Measurement.")

    assert(
        type(timestamp) == "number" and
        timestamp >= 0 and
        math.floor(timestamp) == timestamp,
        "Timestamp must be a non-negative integer."
    )

    local self = setmetatable({}, MeasurementResult)

    --------------------------------------------------------------------------
    -- Initialization
    --------------------------------------------------------------------------

    self._rms = rms
    self._peak = peak
    self._timestamp = timestamp

    return self

end

--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Factory Methods
--------------------------------------------------------------------------------

function MeasurementResult.Empty()

    return MeasurementResult.New(

        Measurement.New(
            0.0,
            "RMS",
            "dB"),

        Measurement.New(
            0.0,
            "Peak",
            "dB"),

        0

    )

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function MeasurementResult:GetRMS()

    return self._rms

end

--------------------------------------------------------------------------------

function MeasurementResult:GetPeak()

    return self._peak

end

--------------------------------------------------------------------------------

function MeasurementResult:GetTimestamp()

    return self._timestamp

end

--------------------------------------------------------------------------------

function MeasurementResult:Equals(other)

    if getmetatable(other) ~= MeasurementResult then
        return false
    end

    return
        self._rms:Equals(other._rms) and
        self._peak:Equals(other._peak) and
        self._timestamp == other._timestamp

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return MeasurementResult