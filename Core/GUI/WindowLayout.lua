--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : WindowLayout
-- Layer         : GUI
-- Purpose       : Renders the main application window layout.
-- Specification : GUI-208
--------------------------------------------------------------------------------

local WindowLifecycle =
    require("Core.GUI.WindowLifecycle")

local MenuBar =
    require("Core.GUI.MenuBar.MenuBar")

local Toolbar =
    require("Core.GUI.Toolbar.Toolbar")

local Workspace =
    require("Core.GUI.Workspace")

local Navigation =
    require("Core.GUI.Navigation.Navigation")

local WindowLayout = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local WINDOW_TITLE =
    "ACP Monitor"

local WINDOW_FLAGS =
    reaper.ImGui_WindowFlags_MenuBar()

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function WindowLayout.Render(context)

    assert(
        context,
        "WindowLayout.Render(): context is nil.")

    local visible
    local open

    visible, open =
        reaper.ImGui_Begin(
            context,
            WINDOW_TITLE,
            true,
            WINDOW_FLAGS
        )

    --------------------------------------------------------------------------
    -- Window Closed
    --------------------------------------------------------------------------

    if not open then

        WindowLifecycle.Close()

        reaper.ImGui_End(
            context
        )

        return

    end

    --------------------------------------------------------------------------
    -- Render
    --------------------------------------------------------------------------

    if visible then

        ----------------------------------------------------------------------
        -- Menu Bar
        ----------------------------------------------------------------------

        Toolbar.Render(
            context
        )

        reaper.ImGui_Separator(
            context
        )

        Navigation.Render(
            context
        )

        reaper.ImGui_Separator(
            context
        )

        Workspace.Render(
            context
        )

    end

    --------------------------------------------------------------------------
    -- End Window
    --------------------------------------------------------------------------

    reaper.ImGui_End(
        context
    )

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return WindowLayout