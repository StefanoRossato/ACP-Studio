----------------------------------------------------------------------
-- ACP Studio
-- RuntimeSession.lua
--
-- Component     : Runtime Session
-- Layer         : Core/Runtime
-- Purpose       : Runtime lifecycle orchestration
-- Specification : BT-003 Runtime Analysis Engine
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

local RuntimeSession = {}
RuntimeSession.__index = RuntimeSession

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

local RuntimeController = require("Core.Runtime.RuntimeController")

----------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Construction
----------------------------------------------------------------------

function RuntimeSession.New()

    local self = setmetatable({}, RuntimeSession)

    self.Controller = RuntimeController.New()

    return self

end



----------------------------------------------------------------------
-- Private Methods
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

function RuntimeSession:Initialize()

    return self

end

function RuntimeSession:Update()

    self.Controller:Update()

end

function RuntimeSession:Terminate()

    return self

end

function RuntimeSession:GetController()

    return self.Controller

end
----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

return RuntimeSession