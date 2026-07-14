----------------------------------------------------------------------
-- ACP Studio
-- AnalysisComponent.lua
--
-- Component     : Analysis Component
-- Layer         : Core/Analysis
-- Purpose       : Define the base lifecycle contract for analysis
--                 pipeline components.
-- Specification : BT-004
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

local AnalysisComponent = {}
AnalysisComponent.__index = AnalysisComponent

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Construction
----------------------------------------------------------------------

function AnalysisComponent.New(name)

    local self = setmetatable({}, AnalysisComponent)

    self.name  = name or "AnalysisComponent"
    self.state = "CREATED"

    return self

end

----------------------------------------------------------------------
-- Private Methods
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

function AnalysisComponent:Initialize(context)

end

function AnalysisComponent:Prepare(context)

end

function AnalysisComponent:Process(context)

end

function AnalysisComponent:Finalize(context)

end

function AnalysisComponent:Reset()

end

function AnalysisComponent:Shutdown()

end

function AnalysisComponent:GetName()

    return self.name

end

function AnalysisComponent:GetState()

    return self.state

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

return AnalysisComponent