--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : AnalysisOverviewPanel
-- Layer         : GUI Panel
-- Purpose       : Renders the Analysis Overview panel container.
--
-- Specification : GUI-201
--------------------------------------------------------------------------------

local AnalysisOverviewPanel = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local TITLE =
    "Analysis Overview"


local MESSAGE =
    "Analysis overview panel ready."


--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function AnalysisOverviewPanel.Render(ctx)


    reaper.ImGui_Text(
        ctx,
        TITLE
    )


    reaper.ImGui_Separator(
        ctx
    )


    reaper.ImGui_Text(
        ctx,
        MESSAGE
    )


end


--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return AnalysisOverviewPanel