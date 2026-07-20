--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ProjectInformationPanel
-- Layer         : Application
-- Purpose       : Renders the Project Information dashboard panel.
-- Specification : GUI-206
--------------------------------------------------------------------------------

local ProjectInformationPanel = {}

--------------------------------------------------------------------------------
-- Public Interface
--------------------------------------------------------------------------------

function ProjectInformationPanel.Render(context, model)

    local ImGui = context.ImGui

    ImGui.Text(context.Ctx, "Project")
    ImGui.Separator(context.Ctx)

    ImGui.Text(context.Ctx, "Project Name")
    ImGui.Text(context.Ctx, "Sample Rate")
    ImGui.Text(context.Ctx, "Track Count")

end

--------------------------------------------------------------------------------

return ProjectInformationPanel