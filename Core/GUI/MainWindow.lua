--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : MainWindow
-- Layer         : GUI
-- Purpose       : Coordinates the main application window.
-- Specification : GUI-106
--------------------------------------------------------------------------------

local WindowLifecycle =
    require("Core.GUI.WindowLifecycle")

local WindowLayout =
    require("Core.GUI.WindowLayout")

local Toolbar =
    require("Core.GUI.Toolbar.Toolbar")

local ViewRegistry =
    require("Core.GUI.ViewRegistry")

local ViewManager =
    require("Core.GUI.ViewManager")

local HomeView =
    require("Core.Application.Views.Home.HomeView")

local AnalysisView =
    require("Core.GUI.Views.AnalysisView")

local ResultsView =
    require("Core.GUI.Views.ResultsView")

local MainWindow = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Private State
--------------------------------------------------------------------------------

local State = {

    Context = nil

}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

local function InitializeViews()

    ViewRegistry.Initialize()

    ViewRegistry.Register(
        "Home",
        HomeView.New(State.Context))

    ViewRegistry.Register(
        "Analysis",
        AnalysisView.New(State.Context))

    ViewRegistry.Register(
        "Results",
        ResultsView.New(State.Context))

    ViewManager.Initialize(ViewRegistry)

    ViewManager.SetActive("Home")

end

--------------------------------------------------------------------------------

local function ShutdownViews()

    ViewManager.Shutdown()

    ViewRegistry.Shutdown()

end

--------------------------------------------------------------------------------

local function RenderWorkspace()

    ViewManager.Render(
        State.Context
    )

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function MainWindow.Initialize(context)

    reaper.ShowConsoleMsg(
    "Initialize Context = "
    .. tostring(context)
    .. "\n")


    assert(
        context,
        "MainWindow.Initialize(): context is nil.")

    State.Context = context

    --------------------------------------------------------------------------
    -- Window
    --------------------------------------------------------------------------

    WindowLifecycle.Open()

    --------------------------------------------------------------------------
    -- Views
    --------------------------------------------------------------------------

    reaper.ShowConsoleMsg(
    "State.Context = "
    .. tostring(State.Context)
    .. "\n")
    InitializeViews()

end

--------------------------------------------------------------------------------

function MainWindow.Run()

    if not WindowLifecycle.IsOpen() then
        return false
    end

    --------------------------------------------------------------------------
    -- Layout
    --------------------------------------------------------------------------

    WindowLayout.Render(
        State.Context)

    return WindowLifecycle.IsOpen()

end

--------------------------------------------------------------------------------

function MainWindow.Shutdown()

    --------------------------------------------------------------------------
    -- Views
    --------------------------------------------------------------------------

    ShutdownViews()

    --------------------------------------------------------------------------
    -- Window
    --------------------------------------------------------------------------

    WindowLifecycle.Close()

    State.Context = nil

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return MainWindow