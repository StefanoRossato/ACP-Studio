----------------------------------------------------------------------
-- ACP Studio
-- RuntimeController.lua
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

local RuntimeController = {}
RuntimeController.__index = RuntimeController

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

local RuntimeModel    = require("Core.Runtime.RuntimeModel")
local RuntimeObserver = require("Core.Runtime.RuntimeObserver")

----------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Construction
----------------------------------------------------------------------

function RuntimeController.New()

    local self = setmetatable({}, RuntimeController)

    self.Model = RuntimeModel.New()
    self.Observer = RuntimeObserver.New()

    return self

end

----------------------------------------------------------------------
-- Private Methods
----------------------------------------------------------------------


----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

function RuntimeController:Update()

    self.Observer:Update(self.Model)

end

function RuntimeController:GetModel()

    return self.Model

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

return RuntimeController