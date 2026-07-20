--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ResultsView
-- Layer         : GUI
-- Purpose       : Defines the application results view.
-- Specification : GUI-209
--------------------------------------------------------------------------------

local BaseView =
    require("Core.GUI.BaseView")

local ResultsView = {}

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function ResultsView.New()

    local View =
        BaseView.New(
            "Results",
            "Results"
        )

    setmetatable(
        View,
        {
            __index = ResultsView
        }
    )

    return View

end

--------------------------------------------------------------------------------
-- Lifecycle
--------------------------------------------------------------------------------

function ResultsView:OnEnter()

end

--------------------------------------------------------------------------------

function ResultsView:OnExit()

end

--------------------------------------------------------------------------------
-- Rendering
--------------------------------------------------------------------------------

function ResultsView:Render(context)

    reaper.ImGui_Text(
        context,
        "Results"
    )

    reaper.ImGui_Separator(
        context
    )

    reaper.ImGui_Text(
        context,
        "Results View"
    )

    reaper.ImGui_Text(
        context,
        "GUI-209"
    )

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return ResultsView