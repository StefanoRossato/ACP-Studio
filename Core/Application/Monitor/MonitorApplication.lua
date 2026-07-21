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

local function Execute()

    if not State.Running then
        return
    end

    if MainWindow.Run() then

        reaper.defer(Execute)

    else

        MonitorApplication.Shutdown()

    end

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

    MainWindow.Initialize(
        State.Context
    )

end

--------------------------------------------------------------------------------

function MonitorApplication.Run()

    assert(
        State.Context,
        "MonitorApplication.Run(): application is not initialized.")

    State.Running = true

    Execute()

end

--------------------------------------------------------------------------------

function MonitorApplication.Shutdown()

    if not State.Running then
        return
    end

    State.Running = false

    MainWindow.Shutdown()

    -- ReaImGui releases the context automatically when the script ends.
    State.Context = nil

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return MonitorApplication