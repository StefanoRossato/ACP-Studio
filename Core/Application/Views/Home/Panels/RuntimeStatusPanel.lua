--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : RuntimeStatusPanel
-- Layer         : Application
-- Purpose       : Renders the Runtime Status panel.
-- Specification : GUI-201
--------------------------------------------------------------------------------

local RuntimeStatusPanel = {}


--------------------------------------------------------------------------------
-- Rendering
--------------------------------------------------------------------------------

function RuntimeStatusPanel.Render(ctx)

    reaper.ImGui_BeginGroup(ctx)

    reaper.ImGui_Text(
        ctx,
        "Runtime Status"
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

return RuntimeStatusPanel