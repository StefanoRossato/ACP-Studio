--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : AnalysisView
-- Layer         : GUI
-- Purpose       : Defines the analysis application view.
-- Specification : GUI-211
--------------------------------------------------------------------------------

local BaseView =
    require("Core.GUI.BaseView")


local ViewId =
    require("Core.Application.Navigation.ViewId")


local AnalysisView = {}


--------------------------------------------------------------------------------
-- Inheritance
--------------------------------------------------------------------------------

setmetatable(
    AnalysisView,
    {
        __index = BaseView
    }
)


--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function AnalysisView.New()

    local View =
        BaseView.New(
            ViewId.Analysis,
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

end


--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return AnalysisView