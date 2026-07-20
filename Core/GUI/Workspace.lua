--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : Workspace
-- Layer         : GUI
-- Purpose       : Renders the application workspace.
-- Specification : GUI-208
--------------------------------------------------------------------------------

local ViewManager =
    require("Core.GUI.ViewManager")

local Workspace = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local WORKSPACE_ID =
    "Workspace"

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function Workspace.Render(context)

    reaper.ImGui_BeginChild(
        context,
        WORKSPACE_ID,
        0,
        0
    )

    ViewManager.Render(
        context
    )

    reaper.ImGui_EndChild(
        context
    )

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return Workspace