--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : HomeHeader
-- Layer         : GUI Component
-- Purpose       : Renders the Home Dashboard header.
--
-- Specification : GUI-201
--------------------------------------------------------------------------------

local HomeHeader = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local TITLE =
    "ACP Studio"

local SUBTITLE =
    "Home Dashboard"


--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function HomeHeader.Render(ctx)

    reaper.ImGui_Text(
        ctx,
        TITLE
    )


    reaper.ImGui_Separator(
        ctx
    )


    reaper.ImGui_Text(
        ctx,
        SUBTITLE
    )


    reaper.ImGui_Separator(
        ctx
    )

end


--------------------------------------------------------------------------------
-- Return
--------------------------------------------------------------------------------

return HomeHeader