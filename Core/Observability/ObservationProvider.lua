--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module      : ObservationProvider
-- Description : Provides read-only access to RuntimeModel observation data.
--------------------------------------------------------------------------------

local ObservationProvider = {}
ObservationProvider.__index = ObservationProvider

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function ObservationProvider.New(runtimeModel)

    local self = setmetatable({}, ObservationProvider)

    -- Initialization ----------------------------------------------------------

    self._runtimeModel = runtimeModel

    return self

end

--------------------------------------------------------------------------------
-- Public Methods
--------------------------------------------------------------------------------

function ObservationProvider:GetState()

    return self._runtimeModel:GetState()

end

function ObservationProvider:GetTimestamp()

    return self._runtimeModel:GetTimestamp()

end

function ObservationProvider:GetSequence()

    return self._runtimeModel:GetSequence()

end

function ObservationProvider:GetData()

    return self._runtimeModel:GetData()

end

--------------------------------------------------------------------------------
-- Private Methods
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return ObservationProvider