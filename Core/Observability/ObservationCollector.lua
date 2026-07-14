--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module      : ObservationCollector
-- Description : Creates immutable observation snapshots.
--------------------------------------------------------------------------------

local ObservationSnapshot = require("Core.Observability.ObservationSnapshot")

local ObservationCollector = {}
ObservationCollector.__index = ObservationCollector

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function ObservationCollector.New(provider)

    local self = setmetatable({}, ObservationCollector)

    -- Initialization ----------------------------------------------------------

    self._provider = provider

    return self

end

--------------------------------------------------------------------------------
-- Public Methods
--------------------------------------------------------------------------------

function ObservationCollector:Collect()

    return ObservationSnapshot.New({

        state       = self._provider:GetState(),
        rms         = self._provider:GetRMS(),
        peak        = self._provider:GetPeak(),
        crestFactor = self._provider:GetCrestFactor(),
        sampleCount = self._provider:GetSampleCount(),
        timestamp   = self._provider:GetTimestamp()

    })

end

--------------------------------------------------------------------------------
-- Private Methods
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return ObservationCollector