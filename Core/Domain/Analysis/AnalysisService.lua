--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : AnalysisService
-- Layer         : Domain
-- Purpose       : Coordinates Analysis domain operations.
-- Specification : ADS-005
--------------------------------------------------------------------------------

local AnalysisSession =
    require("Core.Domain.Analysis.AnalysisSession")

local AnalysisState =
    require("Core.Domain.Analysis.AnalysisState")

local MeasurementResult =
    require("Core.Domain.Analysis.MeasurementResult")

local AnalysisService = {}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

local function Transition(session, newState, result)

    assert(
        getmetatable(session) == AnalysisSession,
        "Session must be a valid AnalysisSession.")

    assert(
        type(newState) == "string" and newState ~= "",
        "State must be a non-empty string.")

    local currentState =
        session:GetState()

    assert(
        currentState:CanTransition(
            currentState:GetValue(),
            newState),
        "Invalid lifecycle transition.")

    return AnalysisSession.New(

        AnalysisState.New(newState),

        result or session:GetResult()

    )

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function AnalysisService.CreateSession()

    return AnalysisSession.New(

        AnalysisState.New("Created"),

        MeasurementResult.Empty()

    )

end

--------------------------------------------------------------------------------

function AnalysisService.Start(session)

    return Transition(

        session,

        "Running"

    )

end

--------------------------------------------------------------------------------

function AnalysisService.Complete(session, result)

    assert(
        getmetatable(result) == MeasurementResult,
        "Result must be a valid MeasurementResult.")

    return Transition(

        session,

        "Completed",

        result

    )

end

--------------------------------------------------------------------------------

function AnalysisService.Fail(session)

    return Transition(

        session,

        "Failed"

    )

end

--------------------------------------------------------------------------------

function AnalysisService.Cancel(session)

    return Transition(

        session,

        "Cancelled"

    )

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return AnalysisService