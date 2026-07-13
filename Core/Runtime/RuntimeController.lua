----------------------------------------------------------------------
-- ACP Studio
-- RuntimeController.lua
--
-- Component     : Runtime Controller
-- Layer         : Core/Runtime
-- Purpose       : Runtime orchestration
-- Specification : BT-003 Runtime Analysis Engine
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

local RuntimeModel    = require("Core.Runtime.RuntimeModel")
local RuntimeObserver = require("Core.Runtime.RuntimeObserver")

----------------------------------------------------------------------
-- RuntimeController
----------------------------------------------------------------------

local RuntimeController = {}
RuntimeController.__index = RuntimeController

----------------------------------------------------------------------
-- Constructor
----------------------------------------------------------------------

function RuntimeController.New()

    local self = setmetatable({}, RuntimeController)

    return self

end

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

return RuntimeController