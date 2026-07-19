--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : AnalysisApplicationService
-- Layer         : Application
-- Purpose       : Coordinates analysis application workflows.
-- Specification : APS-001
--------------------------------------------------------------------------------

local AnalysisService =
    require("Core.Domain.Analysis.AnalysisService")


local AnalysisApplicationService = {}


--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

local function ValidateRequest(request)

    ------------------------------------------------------------------------
    -- Application Validation
    ------------------------------------------------------------------------

    -- Reserved for future application request validation.

    return true

end


local function ExecuteWorkflow(request)

    ------------------------------------------------------------------------
    -- Domain Coordination
    ------------------------------------------------------------------------

    local session

    session =
        AnalysisService.CreateSession()


    return session

end


local function CreateResult(session)

    ------------------------------------------------------------------------
    -- Application Result
    ------------------------------------------------------------------------

    return session

end


--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function AnalysisApplicationService.Execute(request)

    ------------------------------------------------------------------------
    -- Validate Request
    ------------------------------------------------------------------------

    if not ValidateRequest(request) then
        return nil
    end


    ------------------------------------------------------------------------
    -- Execute Application Workflow
    ------------------------------------------------------------------------

    local session =
        ExecuteWorkflow(request)


    ------------------------------------------------------------------------
    -- Return Application Result
    ------------------------------------------------------------------------

    return CreateResult(session)

end


--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return AnalysisApplicationService