--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : MonitorApplication
-- Layer         : Application
-- Purpose       : Coordinates the ACP Monitor application lifecycle.
-- Specification : MON-001
--------------------------------------------------------------------------------

local MainWindow =
    require("Core.GUI.MainWindow")

local ViewManager =
    require("Core.GUI.ViewManager")

local NavigationService =
    require("Core.Application.Navigation.NavigationService")

local HomeView =
    require("Core.Application.Views.Home.HomeView")

local AnalysisView =
    require("Core.GUI.Views.AnalysisView")

local ResultsView =
    require("Core.GUI.Views.ResultsView")

local MonitorApplication = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local APPLICATION_TITLE =
    "ACP Monitor"

--------------------------------------------------------------------------------
-- Private State
--------------------------------------------------------------------------------

local State =
{
    Context = nil,
    Running = false
}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

local function ExecuteApplicationLoop()

    if not State.Running then
        return
    end

    if MainWindow.Run() then

        reaper.defer(ExecuteApplicationLoop)

    else

        MonitorApplication.Shutdown()

    end

end

--------------------------------------------------------------------------------

local function RegisterApplicationViews()

    ViewManager.Reset()

    ViewManager.Register(
        HomeView.New())

    ViewManager.Register(
        AnalysisView.New())

    ViewManager.Register(
        ResultsView.New())

end

--------------------------------------------------------------------------------
-- Application Composition
--------------------------------------------------------------------------------

local function ComposeApplication()

    --------------------------------------------------------------------------
    -- Navigation
    --------------------------------------------------------------------------

    NavigationService.Initialize()

    --------------------------------------------------------------------------
    -- Views
    --------------------------------------------------------------------------

    RegisterApplicationViews()

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function MonitorApplication.Initialize()

    assert(
        not State.Context,
        "MonitorApplication.Initialize(): application already initialized.")

    State.Context =
        reaper.ImGui_CreateContext(
            APPLICATION_TITLE
        )

    --------------------------------------------------------------------------
    -- Application Composition
    --------------------------------------------------------------------------

    ComposeApplication()

    --------------------------------------------------------------------------
    -- Main Window
    --------------------------------------------------------------------------

    MainWindow.Initialize(
        State.Context)

end

--------------------------------------------------------------------------------

function MonitorApplication.Run()

    assert(
        State.Context,
        "MonitorApplication.Run(): application is not initialized.")

    State.Running = true

    ExecuteApplicationLoop()

end

--------------------------------------------------------------------------------

function MonitorApplication.Shutdown()

    if not State.Running then
        return
    end

    State.Running = false

    --------------------------------------------------------------------------
    -- Views
    --------------------------------------------------------------------------

    ViewManager.Reset()

    --------------------------------------------------------------------------
    -- Main Window
    --------------------------------------------------------------------------

    MainWindow.Shutdown()

    -- ReaImGui releases the context automatically when the script ends.

    State.Context = nil

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return MonitorApplication