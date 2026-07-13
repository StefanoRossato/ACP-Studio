----------------------------------------------------------------------
-- ACP Studio
-- AnalysisSession_Test.lua
--
-- Component     : Analysis Session Test
-- Layer         : Tests / Analysis
-- Purpose       : Experimental validation of CMP-001
-- Specification : CMP-001
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

local AnalysisSession = require("Core.Analysis.AnalysisSession")

----------------------------------------------------------------------
-- Test
----------------------------------------------------------------------

local function Assert(condition, message)
    if not condition then
        error(message, 2)
    end
end

----------------------------------------------------------------------
-- Experimental Validation
----------------------------------------------------------------------

local session = AnalysisSession.New()

Assert(session.state == "CREATED",
    "Expected state CREATED after construction.")

session:Initialize()

Assert(session.state == "INITIALIZED",
    "Expected state INITIALIZED after Initialize().")

session:Start()

Assert(session.state == "RUNNING",
    "Expected state RUNNING after Start().")

print("PASS - CMP-001 Experimental Validation")