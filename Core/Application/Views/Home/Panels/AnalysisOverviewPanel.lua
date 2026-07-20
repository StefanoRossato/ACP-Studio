--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : AnalysisOverviewPanel
-- Layer         : Application
-- Purpose       : Renders the Analysis Overview dashboard panel.
-- Specification : GUI-206
--------------------------------------------------------------------------------

local AnalysisOverviewPanel = {}

--------------------------------------------------------------------------------
-- Public Interface
--------------------------------------------------------------------------------

function AnalysisOverviewPanel.Render(context, model)

    local ImGui = context.ImGui

    ImGui.Text(context.Ctx, "Analysis")
    ImGui.Separator(context.Ctx)

    ImGui.Text(context.Ctx, "Last Analysis")
    ImGui.Text(context.Ctx, "Average RMS")
    ImGui.Text(context.Ctx, "Peak")
    ImGui.Text(context.Ctx, "Target Level")

end

--------------------------------------------------------------------------------

return AnalysisOverviewPanel