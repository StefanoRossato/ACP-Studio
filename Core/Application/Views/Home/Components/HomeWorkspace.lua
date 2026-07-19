--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : HomeWorkspace
-- Layer         : Application
-- Purpose       : Renders the Home Dashboard workspace.
-- Specification : GUI-201
--------------------------------------------------------------------------------

local HomeWorkspace = {}


--------------------------------------------------------------------------------
-- Rendering
--------------------------------------------------------------------------------

function HomeWorkspace.Render(ctx)

    reaper.ImGui_Separator(ctx)

    reaper.ImGui_Text(
        ctx,
        "Workspace"
    )

    reaper.ImGui_Separator(ctx)

    reaper.ImGui_Text(
        ctx,
        "Workspace Placeholder"
    )

end


--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return HomeWorkspace