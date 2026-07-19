--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ProjectInformationPanel
-- Layer         : Application
-- Purpose       : Renders the Project Information panel.
-- Specification : GUI-201
--------------------------------------------------------------------------------

local ProjectInformationPanel = {}


--------------------------------------------------------------------------------
-- Rendering
--------------------------------------------------------------------------------

function ProjectInformationPanel.Render(ctx)

    reaper.ImGui_BeginGroup(ctx)

    reaper.ImGui_Text(
        ctx,
        "Project Information"
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

return ProjectInformationPanel