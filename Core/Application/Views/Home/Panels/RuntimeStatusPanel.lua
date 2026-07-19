--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : RuntimeStatusPanel
-- Layer         : GUI Panel
-- Purpose       : Renders the Runtime Status panel container.
--
-- Specification : GUI-201
--------------------------------------------------------------------------------

local RuntimeStatusPanel = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local TITLE =
    "Runtime Status"


local MESSAGE =
    "Runtime information panel ready."


--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function RuntimeStatusPanel.Render(ctx)


    reaper.ImGui_Text(
        ctx,
        TITLE
    )


    reaper.ImGui_Separator(
        ctx
    )


    reaper.ImGui_Text(
        ctx,
        MESSAGE
    )


end


--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return RuntimeStatusPanel