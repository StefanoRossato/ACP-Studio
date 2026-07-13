----------------------------------------------------------------------
-- ACP Studio
-- AnalysisSession.lua
--
-- Component     : Analysis Session
-- Layer         : Core / Analysis
-- Purpose       : Analysis session lifecycle management
-- Specification : CMP-001
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

local AnalysisSession = {}
AnalysisSession.__index = AnalysisSession

----------------------------------------------------------------------
-- Construction
----------------------------------------------------------------------

function AnalysisSession.New()
    local self = setmetatable({}, AnalysisSession)

    self.state = "CREATED"

    return self
end

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------


function AnalysisSession:Initialize()
    self.state = "INITIALIZED"
end

function AnalysisSession:Start()
    self.state = "RUNNING"
end

function AnalysisSession:Stop()
    self.state = State.STOPPED
end

function AnalysisSession:Terminate()
    self.state = State.TERMINATED
end


function AnalysisSession:Terminate()
end

function AnalysisSession:GetState()
    return self.state
end

return AnalysisSession