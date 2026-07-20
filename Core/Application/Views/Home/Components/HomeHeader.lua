--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : HomeHeader
-- Layer         : GUI Component
-- Purpose       : Renders the Home Dashboard header.
-- Specification : GUI-205
--------------------------------------------------------------------------------

local HomeHeader = {}

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function HomeHeader.Render(ctx, presentationModel)

    if not presentationModel then
        return
    end

    reaper.ImGui_Text(
        ctx,
        presentationModel.title
    )

end

--------------------------------------------------------------------------------
-- Return
--------------------------------------------------------------------------------

return HomeHeader