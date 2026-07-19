--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ProjectInformationPanel
-- Layer         : GUI Panel
-- Purpose       : Renders the Project Information panel container.
--
-- Specification : GUI-201
--------------------------------------------------------------------------------

local ProjectInformationPanel = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local TITLE =
    "Project Information"


local MESSAGE =
    "Project information panel ready."


--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function ProjectInformationPanel.Render(ctx)


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

return ProjectInformationPanel