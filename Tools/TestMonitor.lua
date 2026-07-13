----------------------------------------------------------------------
-- ACP Studio
-- TestMonitor.lua
--
-- Component     : Test Monitor
-- Layer         : Tools
-- Purpose       : Runtime test monitoring and diagnostics
-- Specification : TST-001
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

local TestMonitor = {}
TestMonitor.__index = TestMonitor

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------
local Logger = require("Core.Logger")

----------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------

local State = {
    CREATED = "CREATED",
    RUNNING = "RUNNING",
    STOPPED = "STOPPED"
}

----------------------------------------------------------------------
-- Construction
----------------------------------------------------------------------

function TestMonitor.New()

    local self = setmetatable({}, TestMonitor)

    self.state = State.CREATED

    self.runtime = nil

    return self

end


----------------------------------------------------------------------
-- Private Methods
----------------------------------------------------------------------

local function GetRuntimeState(self)

    if self.runtime == nil then
        return "N/A"
    end

    return self.runtime:GetState()

end

local function RenderSnapshot(self)

    Logger.Section("ACP Studio Test Monitor")
 
    Logger.ConsoleInfo(string.format(
        "%-20s %s",
        "Monitor State :",
        self.state
    ))

    Logger.ConsoleInfo(string.format(
        "%-20s %s",
        "Runtime State :",
        GetRuntimeState(self)
    ))

    Logger.Separator()

end

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

function TestMonitor:AttachRuntime(runtime)

    self.runtime = runtime

end

function TestMonitor:Start()

    self.state = State.RUNNING

    Logger.ConsoleInfo("Test Monitor started.")

end

function TestMonitor:Update()

    RenderSnapshot(self)

end

function TestMonitor:Stop()

    self.state = State.STOPPED

    Logger.ConsoleInfo("Test Monitor stopped.")

end

function TestMonitor:GetState()

    return self.state

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

return TestMonitor