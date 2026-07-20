--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : HomeDashboard
-- Layer         : GUI Component
-- Purpose       : Renders the Home Dashboard main area.
-- Specification : GUI-205
--------------------------------------------------------------------------------

local HomeDashboard = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local TITLE =
    "Dashboard"

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function HomeDashboard.Render(ctx, presentationModel)

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
        "Dashboard workspace ready."
    )

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return HomeDashboard