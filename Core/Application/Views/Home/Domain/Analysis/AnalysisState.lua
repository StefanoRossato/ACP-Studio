--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : AnalysisState
-- Layer         : Domain
-- Purpose       : Analysis lifecycle state value object.
-- Specification : ADS-004
--------------------------------------------------------------------------------

local AnalysisState = {}
AnalysisState.__index = AnalysisState

--------------------------------------------------------------------------------
-- Private Constants
--------------------------------------------------------------------------------

local VALID_STATES = {

    Created   = true,
    Running   = true,
    Completed = true,
    Failed    = true,
    Cancelled = true

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

function AnalysisState.New(state)

    assert(
        type(state) == "string" and state ~= "",
        "State must be a non-empty string.")

    assert(
        VALID_STATES[state],
        "Invalid analysis state.")

    local self =
        setmetatable({}, AnalysisState)

    --------------------------------------------------------------------------
    -- Initialization
    --------------------------------------------------------------------------

    self._value = state

    return self

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function AnalysisState:GetValue()

    return self._value

end

--------------------------------------------------------------------------------

function AnalysisState:Equals(other)

    if getmetatable(other) ~= AnalysisState then
        return false
    end

    return self._value == other._value

end

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

    local transitions =
        VALID_TRANSITIONS[fromState]

    if transitions == nil then
        return false
    end

    return transitions[toState] == true

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return AnalysisState