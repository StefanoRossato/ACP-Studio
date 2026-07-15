--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : AnalysisSession
-- Layer         : Domain
-- Purpose       : Analysis domain aggregate root.
-- Specification : ADS-001
--------------------------------------------------------------------------------

local AnalysisState =
    require("Core.Domain.Analysis.AnalysisState")

local MeasurementResult =
    require("Core.Domain.Analysis.MeasurementResult")

local AnalysisSession = {}
AnalysisSession.__index = AnalysisSession

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function AnalysisSession.New(state, result)

    assert(
        getmetatable(state) == AnalysisState,
        "State must be a valid AnalysisState.")

    assert(
        getmetatable(result) == MeasurementResult,
        "Result must be a valid MeasurementResult.")

    local self =
        setmetatable({}, AnalysisSession)

    --------------------------------------------------------------------------
    -- Initialization
    --------------------------------------------------------------------------

    self._state = state
    self._result = result

    return self

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function AnalysisSession:GetState()

    return self._state

end

--------------------------------------------------------------------------------

function AnalysisSession:GetResult()

    return self._result

end

--------------------------------------------------------------------------------

function AnalysisSession:Equals(other)

    if getmetatable(other) ~= AnalysisSession then
        return false
    end

    return
        self._state:Equals(other._state) and
        self._result:Equals(other._result)

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return AnalysisSession