------------------------------------------------------------------------------
-- ACP Studio
-- WindowLayout
--
-- GUI-102 — Toolbar Controls
--
-- Responsibility:
--   Orchestrate the rendering of GUI components.
--
-- WindowLayout owns the graphical composition of the main window.
-- It delegates rendering to independent GUI components.
------------------------------------------------------------------------------

local Toolbar =
    require("Core.GUI.Toolbar")

local WindowLayout = {}

------------------------------------------------------------------------------
-- Rendering
------------------------------------------------------------------------------

function WindowLayout.Render(context)

    assert(
        context,
        "WindowLayout.Render(): context is nil.")

    Toolbar.Render(context)

end

------------------------------------------------------------------------------
-- Module
------------------------------------------------------------------------------

return WindowLayout