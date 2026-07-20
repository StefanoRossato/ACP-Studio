--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : RuntimeStatusPanel
-- Layer         : Application
-- Purpose       : Renders the Runtime Status dashboard panel.
-- Specification : GUI-206
--------------------------------------------------------------------------------

local RuntimeStatusPanel = {}

--------------------------------------------------------------------------------
-- Public Interface
--------------------------------------------------------------------------------

function RuntimeStatusPanel.Render(context, model)

    local ImGui = context.ImGui

    ImGui.Text(context.Ctx, "Runtime")
    ImGui.Separator(context.Ctx)

    ImGui.Text(context.Ctx, "Status")
    ImGui.Text(context.Ctx, "Frame Time")
    ImGui.Text(context.Ctx, "Refresh Rate")

end

--------------------------------------------------------------------------------

return RuntimeStatusPanel