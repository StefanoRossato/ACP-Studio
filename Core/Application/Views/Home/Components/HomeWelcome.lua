--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : HomeWelcome
-- Layer         : Application
-- Purpose       : Renders the Home Dashboard welcome section.
-- Specification : GUI-201
--------------------------------------------------------------------------------

local HomeWelcome = {}


--------------------------------------------------------------------------------
-- Rendering
--------------------------------------------------------------------------------

function HomeWelcome.Render(ctx)

    reaper.ImGui_Text(
        ctx,
        "Welcome to ACP Studio"
    )

    reaper.ImGui_Spacing(
        ctx
    )

end


--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return HomeWelcome