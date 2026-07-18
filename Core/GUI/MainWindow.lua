------------------------------------------------------------------------------
-- ACP Studio
-- MainWindow
------------------------------------------------------------------------------

local WindowLifecycle =
    require("Core.GUI.WindowLifecycle")

local WindowLayout =
    require("Core.GUI.WindowLayout")

local MainWindow = {}

------------------------------------------------------------------------------
-- Initialize
------------------------------------------------------------------------------

function MainWindow.Initialize()

    WindowLifecycle.Open()

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

    WindowLifecycle.Close()

end

------------------------------------------------------------------------------
-- Run
------------------------------------------------------------------------------

function MainWindow.Run(onCompleted)

    MainWindow.Initialize()

    local context =
        reaper.ImGui_CreateContext("ACP Studio")

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
-- Module
------------------------------------------------------------------------------

return MainWindow