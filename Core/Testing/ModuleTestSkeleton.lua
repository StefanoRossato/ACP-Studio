local BaseTestSkeleton = require("Core.Testing.BaseTestSkeleton")

local ModuleTestSkeleton = {}
ModuleTestSkeleton.__index = ModuleTestSkeleton
setmetatable(ModuleTestSkeleton, { __index = BaseTestSkeleton })

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function ModuleTestSkeleton:new(name)

    local instance = BaseTestSkeleton.new(self, name)

    return instance

end

--------------------------------------------------------------------------------
-- Setup
--------------------------------------------------------------------------------

function ModuleTestSkeleton:Setup()

    self:Log("Initializing module test environment...")

end

--------------------------------------------------------------------------------
-- Teardown
--------------------------------------------------------------------------------

function ModuleTestSkeleton:Teardown()

    self:Log("Cleaning module test environment...")

end

return ModuleTestSkeleton