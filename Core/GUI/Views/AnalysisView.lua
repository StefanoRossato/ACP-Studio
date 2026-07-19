--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : AnalysisView
-- Layer         : GUI
-- Purpose       : Analysis workspace view.
-- Specification : GUI-106
--------------------------------------------------------------------------------

local View =
    require("Core.GUI.Views.View")

local AnalysisView = {}

AnalysisView.__index = AnalysisView

setmetatable(
    AnalysisView,
    { __index = View })

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function AnalysisView.New(context)

    local self =
        View.New(context)

    setmetatable(
        self,
        AnalysisView)

    return self

end

--------------------------------------------------------------------------------
-- Lifecycle
--------------------------------------------------------------------------------

function AnalysisView:Initialize()

end

--------------------------------------------------------------------------------

function AnalysisView:Render()

    reaper.ImGui_Text(
        self.Context,
        "Analysis")

    reaper.ImGui_Separator(
        self.Context)

    reaper.ImGui_Text(
        self.Context,
        "Analysis View")

    reaper.ImGui_Text(
        self.Context,
        "GUI-106")

end

--------------------------------------------------------------------------------

function AnalysisView:Shutdown()

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return AnalysisView