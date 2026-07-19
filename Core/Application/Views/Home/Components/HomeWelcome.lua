--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : HomeWelcome
-- Layer         : GUI Component
-- Purpose       : Renders the Home Dashboard welcome section.
--
-- Specification : GUI-203
--------------------------------------------------------------------------------

local HomeWelcome = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local MESSAGE =
    "Welcome to ACP Studio"

local DESCRIPTION =
    "Prepare your tracks for analog mixing."

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function HomeWelcome.Render(ctx, model)

    reaper.ImGui_Text(
        ctx,
        MESSAGE
    )

    reaper.ImGui_Separator(
        ctx
    )

    reaper.ImGui_Text(
        ctx,
        DESCRIPTION
    )

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return HomeWelcome