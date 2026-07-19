--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : WindowLayout
-- Layer         : GUI
-- Purpose       : Orchestrates the rendering of the main window layout.
-- Specification : GUI-106
--------------------------------------------------------------------------------

local Toolbar =
    require("Core.GUI.Toolbar.Toolbar")

local ViewManager =
    require("Core.GUI.ViewManager")

local WindowLayout = {}

--------------------------------------------------------------------------------
-- Private Rendering
--------------------------------------------------------------------------------

local function RenderToolbar(context)

    Toolbar.Render(context)

end

--------------------------------------------------------------------------------

local function RenderWorkspace(context)

    ViewManager.Render(context)

end

function WindowLayout.Render(context)

    assert(
        context,
        "WindowLayout.Render(): context is nil.")

    RenderToolbar(context)

    RenderWorkspace(context)

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function WindowLayout.Render(context)

    assert(
        context,
        "WindowLayout.Render(): context is nil.")

    --------------------------------------------------------------------------
    -- Toolbar
    --------------------------------------------------------------------------

    RenderToolbar(context)

    --------------------------------------------------------------------------
    -- Workspace
    --------------------------------------------------------------------------

    RenderWorkspace()

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return WindowLayout