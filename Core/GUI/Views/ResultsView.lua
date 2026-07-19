--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ResultsView
-- Layer         : GUI
-- Purpose       : Results workspace view.
-- Specification : GUI-106
--------------------------------------------------------------------------------

local View =
    require("Core.GUI.Views.View")

local ResultsView = {}

ResultsView.__index = ResultsView

setmetatable(
    ResultsView,
    { __index = View })

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function ResultsView.New(context)

    local self =
        View.New(context)

    setmetatable(
        self,
        ResultsView)

    return self

end

--------------------------------------------------------------------------------
-- Lifecycle
--------------------------------------------------------------------------------

function ResultsView:Initialize()

end

--------------------------------------------------------------------------------

function ResultsView:Render()

    reaper.ImGui_Text(
        self.Context,
        "Results")

    reaper.ImGui_Separator(
        self.Context)

    reaper.ImGui_Text(
        self.Context,
        "Results View")

    reaper.ImGui_Text(
        self.Context,
        "GUI-106")

end

--------------------------------------------------------------------------------

function ResultsView:Shutdown()

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return ResultsView