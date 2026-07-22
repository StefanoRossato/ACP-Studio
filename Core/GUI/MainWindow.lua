--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : MainWindow
-- Layer         : GUI
-- Purpose       : Coordinates the main application window.
-- Specification : GUI-211
--------------------------------------------------------------------------------

local WindowLifecycle =
    require("Core.GUI.WindowLifecycle")

local WindowLayout =
    require("Core.GUI.WindowLayout")

local MainWindow = {}

--------------------------------------------------------------------------------
-- Private State
--------------------------------------------------------------------------------

local State =
{
    Context = nil
}

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function MainWindow.Initialize(context)

    assert(
        context,
        "MainWindow.Initialize(): context is nil.")

    State.Context = context

    WindowLifecycle.Open()

end

--------------------------------------------------------------------------------

function MainWindow.Run()

    if not WindowLifecycle.IsOpen() then
        return false
    end

    WindowLayout.Render(
        State.Context)

    return WindowLifecycle.IsOpen()

end

--------------------------------------------------------------------------------

function MainWindow.Shutdown()

    WindowLifecycle.Close()

    State.Context = nil

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return MainWindow