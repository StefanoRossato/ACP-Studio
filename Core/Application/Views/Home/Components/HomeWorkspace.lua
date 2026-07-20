--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : HomeWorkspace
-- Layer         : GUI Component
-- Purpose       : Renders the Home Dashboard workspace container.
-- Specification : GUI-205
--------------------------------------------------------------------------------

local HomeWorkspace = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local TITLE =
    "Workspace"

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function HomeWorkspace.Render(ctx, presentationModel)

    if not presentationModel then
        return
    end

    reaper.ImGui_Text(
        ctx,
        TITLE
    )

    reaper.ImGui_Separator(
        ctx
    )

    reaper.ImGui_Text(
        ctx,
        "Dashboard panels area."
    )

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return HomeWorkspace