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

local ViewManager =
    require("Core.GUI.ViewManager")

local NavigationService =
    require("Core.Application.Navigation.NavigationService")

local ViewId =
    require("Core.Application.Navigation.ViewId")

local HomeView =
    require("Core.Application.Views.Home.HomeView")

local AnalysisView =
    require("Core.GUI.Views.AnalysisView")

local ResultsView =
    require("Core.GUI.Views.ResultsView")


local MainWindow = {}

--------------------------------------------------------------------------------
-- Private State
--------------------------------------------------------------------------------

local State =
{
    Context = nil,
    Initialized = false
}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

local function RegisterViews()

    ViewManager.Reset()

    ViewManager.Register(
        HomeView.New()
    )

    ViewManager.Register(
        AnalysisView.New()
    )

    ViewManager.Register(
        ResultsView.New()
    )

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Initialize
--------------------------------------------------------------------------------

function MainWindow.Initialize(context)

    if State.Initialized then
        return true
    end

    assert(
        context,
        "MainWindow.Initialize(): context is nil."
    )


    State.Context =
        context


    --------------------------------------------------------------------------
    -- Window Lifecycle
    --------------------------------------------------------------------------

    WindowLifecycle.Open()


    --------------------------------------------------------------------------
    -- Views
    --------------------------------------------------------------------------

    RegisterViews()


    --------------------------------------------------------------------------
    -- Navigation
    --------------------------------------------------------------------------

    NavigationService.Initialize(
        ViewManager
    )


    NavigationService.Navigate(
        ViewId.Home
    )


    State.Initialized = true


    return true

end

--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

function MainWindow.Run()

    if not State.Initialized then
        return false
    end


    if not WindowLifecycle.IsOpen() then
        return false
    end


    WindowLayout.Render(
        State.Context
    )


    return WindowLifecycle.IsOpen()

end

--------------------------------------------------------------------------------
-- Shutdown
--------------------------------------------------------------------------------

function MainWindow.Shutdown()

    if not State.Initialized then
        return
    end


    ViewManager.Deactivate()

    ViewManager.Reset()


    WindowLifecycle.Close()


    State.Context = nil
    State.Initialized = false

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return MainWindow