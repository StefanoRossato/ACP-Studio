--------------------------------------------------------------------------------
-- ACP Studio
-- BaseTestSkeleton
--
-- Foundation of the ACP Studio Testing Framework.
--------------------------------------------------------------------------------

local BaseTestSkeleton = {}
BaseTestSkeleton.__index = BaseTestSkeleton

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function BaseTestSkeleton:new(name)

    local instance = setmetatable({}, self)

    instance.Name = name or "Unnamed Test"

    instance:Initialize()

    return instance

end

--------------------------------------------------------------------------------
-- Initialization
--------------------------------------------------------------------------------

function BaseTestSkeleton:Initialize()

    self.Passed = 0
    self.Failed = 0

    self.Messages = {}

    self.StartTime = nil
    self.EndTime = nil

end

--------------------------------------------------------------------------------
-- Lifecycle
--------------------------------------------------------------------------------

function BaseTestSkeleton:Setup()
end

--------------------------------------------------------------------------------

function BaseTestSkeleton:Execute()

    error("Execute() must be implemented by the derived test.")

end

--------------------------------------------------------------------------------

function BaseTestSkeleton:Teardown()
end

--------------------------------------------------------------------------------
-- Logging
--------------------------------------------------------------------------------

function BaseTestSkeleton:Log(message)

    table.insert(
        self.Messages,
        message
    )


    local Logger =
        require("Core.Foundation.Logger")


    Logger.Info(
        message
    )

end

--------------------------------------------------------------------------------

function BaseTestSkeleton:Pass(message)

    self.Passed = self.Passed + 1

    self:Log("[PASS] " .. message)

end

--------------------------------------------------------------------------------

function BaseTestSkeleton:Fail(message)

    self.Failed = self.Failed + 1

    self:Log("[FAIL] " .. message)

end

--------------------------------------------------------------------------------
-- Summary
--------------------------------------------------------------------------------

function BaseTestSkeleton:PrintSummary()

    self:Log("")
    self:Log("========================================")
    self:Log("Test Summary")
    self:Log("========================================")
    self:Log("Test    : " .. self.Name)
    self:Log("Passed  : " .. tostring(self.Passed))
    self:Log("Failed  : " .. tostring(self.Failed))
    self:Log("========================================")

end

--------------------------------------------------------------------------------
-- Template Method
--------------------------------------------------------------------------------

function BaseTestSkeleton:Run()

    self.StartTime = os.clock()

    self:Setup()

    self:Execute()

    self:Teardown()

    self.EndTime = os.clock()

    self:PrintSummary()

end

--------------------------------------------------------------------------------

return BaseTestSkeleton