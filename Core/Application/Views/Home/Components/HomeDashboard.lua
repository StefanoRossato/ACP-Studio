--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : HomeDashboard
-- Layer         : Application
-- Purpose       : Renders the Home Dashboard panels.
-- Specification : GUI-201
--------------------------------------------------------------------------------

local RuntimeStatusPanel =
    require("Core.Application.Views.Home.Panels.RuntimeStatusPanel")

local ProjectInformationPanel =
    require("Core.Application.Views.Home.Panels.ProjectInformationPanel")

local AnalysisOverviewPanel =
    require("Core.Application.Views.Home.Panels.AnalysisOverviewPanel")


local HomeDashboard = {}


--------------------------------------------------------------------------------
-- Rendering
--------------------------------------------------------------------------------

function HomeDashboard.Render(ctx)

    RuntimeStatusPanel.Render(ctx)

    reaper.ImGui_SameLine(ctx)

    ProjectInformationPanel.Render(ctx)

    reaper.ImGui_SameLine(ctx)

    AnalysisOverviewPanel.Render(ctx)

    reaper.ImGui_Spacing(ctx)

end


--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return HomeDashboard