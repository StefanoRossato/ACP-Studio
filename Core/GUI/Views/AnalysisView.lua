--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : AnalysisView
-- Layer         : GUI
-- Purpose       : Defines the analysis application view.
-- Specification : GUI-209
--------------------------------------------------------------------------------

local BaseView =
    require("Core.GUI.BaseView")

local AnalysisView = {}

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function AnalysisView.New()

    local View =
        BaseView.New(
            "Analysis",
            "Analysis"
        )

    setmetatable(
        View,
        {
            __index = AnalysisView
        }
    )

    return View

end

--------------------------------------------------------------------------------
-- Lifecycle
--------------------------------------------------------------------------------

function AnalysisView:OnEnter()

end

--------------------------------------------------------------------------------

function AnalysisView:OnExit()

end

--------------------------------------------------------------------------------
-- Rendering
--------------------------------------------------------------------------------

function AnalysisView:Render(context)

    reaper.ImGui_Text(
        context,
        "Analysis"
    )

    reaper.ImGui_Separator(
        context
    )

    reaper.ImGui_Text(
        context,
        "Analysis View"
    )

    reaper.ImGui_Text(
        context,
        "GUI-209"
    )

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return AnalysisView