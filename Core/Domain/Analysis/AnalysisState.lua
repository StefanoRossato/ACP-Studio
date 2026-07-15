--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module      : AnalysisState
-- Description : Defines the valid states and transition rules for an
--               Analysis Session.
--------------------------------------------------------------------------------

local AnalysisState = {}
AnalysisState.__index = AnalysisState

--------------------------------------------------------------------------------
-- Private Constants
--------------------------------------------------------------------------------

local VALID_STATES = {

    Created    = true,
    Running    = true,
    Completed  = true,
    Failed     = true,
    Cancelled  = true

}

local VALID_TRANSITIONS = {

    Created = {

        Running = true

    },

    Running = {

        Completed = true,
        Failed    = true,
        Cancelled = true

    },

    Completed = {},

    Failed = {},

    Cancelled = {}

}

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function AnalysisState.New()

    local self = setmetatable({}, AnalysisState)

    -- Initialization ----------------------------------------------------------

    return self

end

--------------------------------------------------------------------------------
-- Public Methods
--------------------------------------------------------------------------------

function AnalysisState:IsValid(state)

    return VALID_STATES[state] == true

end

--------------------------------------------------------------------------------

function AnalysisState:CanTransition(fromState, toState)

    if not self:IsValid(fromState) then
        return false
    end

    if not self:IsValid(toState) then
        return false
    end

    local transitions = VALID_TRANSITIONS[fromState]

    if transitions == nil then
        return false
    end

    return transitions[toState] == true

end

--------------------------------------------------------------------------------
-- Private Methods
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return AnalysisState