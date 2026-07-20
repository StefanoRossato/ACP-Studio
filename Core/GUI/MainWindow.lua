--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : MainWindow
-- Layer         : GUI
-- Purpose       : Coordinates the main application window.
-- Specification : GUI-208
--------------------------------------------------------------------------------

local WindowLifecycle =
    require("Core.GUI.WindowLifecycle")

local WindowLayout =
    require("Core.GUI.WindowLayout")

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
-- Private State
--------------------------------------------------------------------------------

local State =
{
    Context = nil
}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

local function RegisterViews()

    local home = HomeView.New()
reaper.ShowConsoleMsg("Home.Id = " .. tostring(home.Id) .. "\n")
ViewManager.Register(home)

local analysis = AnalysisView.New()
reaper.ShowConsoleMsg("Analysis.Id = " .. tostring(analysis.Id) .. "\n")
ViewManager.Register(analysis)

local results = ResultsView.New()
reaper.ShowConsoleMsg("Results.Id = " .. tostring(results.Id) .. "\n")
ViewManager.Register(results)

    ViewManager.Reset()

    ViewManager.Register(
        HomeView.New())

    ViewManager.Register(
        AnalysisView.New())

    ViewManager.Register(
        ResultsView.New())

    

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function MainWindow.Initialize(context)

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

    RegisterViews()

    ViewManager.Activate("Home")

end

--------------------------------------------------------------------------------

function MainWindow.Run()

    if not WindowLifecycle.IsOpen() then
        return false
    end

    WindowLayout.Render(
        State.Context
    )

    return WindowLifecycle.IsOpen()

end

--------------------------------------------------------------------------------

function MainWindow.Shutdown()

    ViewManager.Deactivate()

    ViewManager.Reset()

    WindowLifecycle.Close()

    State.Context = nil

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return MainWindow