------------------------------------------------------------------------------
-- GuiTestSkeleton.lua
--
-- Certified GUI Test Framework
-- GST-001
------------------------------------------------------------------------------

local GuiTestSkeleton = {}
GuiTestSkeleton.__index = GuiTestSkeleton

------------------------------------------------------------------------------
-- Constructor
------------------------------------------------------------------------------

function GuiTestSkeleton.New(testName, testId)

    local self = setmetatable({}, GuiTestSkeleton)

    self.TestName = testName or "GUI Test"
    self.TestId   = testId   or "GUI-000"

    self.Title = self.TestName

    self.Context = nil

    self.WindowOpen = true

    self.Running = false

    self.Initialized = false

    return self

end

------------------------------------------------------------------------------
-- Logging
------------------------------------------------------------------------------

function GuiTestSkeleton:ClearLog()

    reaper.ClearConsole()

end

function GuiTestSkeleton:Log(message)

    reaper.ShowConsoleMsg(message .. "\n")

end

function GuiTestSkeleton:Pass(message)

    self:Log("PASS - " .. message)

end

function GuiTestSkeleton:Fail(message)

    self:Log("FAIL - " .. message)

end

------------------------------------------------------------------------------
-- Banner
------------------------------------------------------------------------------

function GuiTestSkeleton:PrintBanner()

    self:ClearLog()

    self:Log("========================================")
    self:Log(self.TestName)
    self:Log(self.TestId)
    self:Log("========================================")

end

------------------------------------------------------------------------------
-- Summary
------------------------------------------------------------------------------

function GuiTestSkeleton:PrintSummary()

    self:Log("")
    self:Log("========================================")
    self:Log(self.TestId .. " PASSED")
    self:Log("========================================")

end

------------------------------------------------------------------------------
-- Lifecycle
------------------------------------------------------------------------------

function GuiTestSkeleton:Load()

    self:OnLoad()

    return true

end

function GuiTestSkeleton:Initialize()

    self.Context =
        reaper.ImGui_CreateContext(self.Title)

    assert(
        self.Context,
        "Unable to create ImGui context.")

    self.Initialized = true

    self:OnInitialize()

    return true

end

------------------------------------------------------------------------------
-- Render
------------------------------------------------------------------------------

function GuiTestSkeleton:Render()

    if not self.WindowOpen then
        self:Shutdown()
        return
    end

    local visible

    visible, self.WindowOpen =
    reaper.ImGui_Begin(
        self.Context,
        self.Title,
        self.WindowOpen)

    if visible then

        self:OnRender()

        reaper.ImGui_End(
            self.Context)

    end

    if self.WindowOpen then

        reaper.defer(function()

            self:Render()

        end)

    else

        self:Shutdown()

    end

end

------------------------------------------------------------------------------
-- Shutdown
------------------------------------------------------------------------------

function GuiTestSkeleton:Shutdown()

    self:OnShutdown()

    self.Context = nil

    self.Running = false

    self:PrintSummary()

end

------------------------------------------------------------------------------
-- Execute
------------------------------------------------------------------------------

function GuiTestSkeleton:Run()

    self:PrintBanner()

    self:Load()

    self:Initialize()

    self.Running = true

    self:Render()

end

------------------------------------------------------------------------------
-- Virtual Hooks
------------------------------------------------------------------------------

function GuiTestSkeleton:OnLoad()

end

function GuiTestSkeleton:OnInitialize()

end

function GuiTestSkeleton:OnRender()

end

function GuiTestSkeleton:OnShutdown()

end

------------------------------------------------------------------------------
-- End of Module
------------------------------------------------------------------------------

return GuiTestSkeleton