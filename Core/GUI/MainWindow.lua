------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : MainWindow
-- Layer         : GUI
-- Purpose       : Coordinates the main application window.
-- Specification : GUI-105
------------------------------------------------------------------------------

local WindowLifecycle =
    require("Core.GUI.WindowLifecycle")

local WindowLayout =
    require("Core.GUI.WindowLayout")

local ViewManager =
    require("Core.GUI.ViewManager")

local HomeView =
    require("Core.GUI.Views.HomeView")

local MainWindow = {}

------------------------------------------------------------------------------
-- Initialize
------------------------------------------------------------------------------

function MainWindow.Initialize(context)

    assert(
        context,
        "MainWindow.Initialize(): context is nil.")

    WindowLifecycle.Open()

    ViewManager:Initialize(context)

    local home =
        HomeView:New(context)

    ViewManager:SetView(home)

end

------------------------------------------------------------------------------
-- Render
------------------------------------------------------------------------------

function MainWindow.Render(context)

    assert(
        context,
        "MainWindow.Render(): context is nil.")

    WindowLayout.Render(context)

end

------------------------------------------------------------------------------
-- Shutdown
------------------------------------------------------------------------------

function MainWindow.Shutdown()

    ViewManager:Shutdown()

    WindowLifecycle.Close()

end

------------------------------------------------------------------------------
-- Run
------------------------------------------------------------------------------

function MainWindow.Run(onCompleted)

    local context =
        reaper.ImGui_CreateContext("ACP Studio")

    MainWindow.Initialize(context)

    local windowOpen = true

    local function RenderLoop()

        if not windowOpen then

            MainWindow.Shutdown()

            if onCompleted then
                onCompleted()
            end

            return

        end

        local visible

        visible, windowOpen =
            reaper.ImGui_Begin(
                context,
                "ACP Studio",
                windowOpen)

        if visible then

            MainWindow.Render(context)

            reaper.ImGui_End(context)

        end

        if windowOpen then

            reaper.defer(RenderLoop)

        else

            MainWindow.Shutdown()

            if onCompleted then
                onCompleted()
            end

        end

    end

    RenderLoop()

end

------------------------------------------------------------------------------
-- End of Module
------------------------------------------------------------------------------

return MainWindow