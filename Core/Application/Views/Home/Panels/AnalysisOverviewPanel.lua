--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : AnalysisOverviewPanel
-- Layer         : Application
-- Purpose       : Renders the Analysis Overview panel.
-- Specification : GUI-201
--------------------------------------------------------------------------------

local AnalysisOverviewPanel = {}


--------------------------------------------------------------------------------
-- Rendering
--------------------------------------------------------------------------------

function AnalysisOverviewPanel.Render(ctx)

    reaper.ImGui_BeginGroup(ctx)

    reaper.ImGui_Text(
        ctx,
        "Analysis Overview"
    )

    reaper.ImGui_Separator(ctx)

    reaper.ImGui_Text(
        ctx,
        "Placeholder"
    )

    reaper.ImGui_EndGroup(ctx)

end


--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return AnalysisOverviewPanel