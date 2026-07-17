--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ACP_Monitor
-- Layer         : Observation
-- Purpose       : Main window of ACP Monitor.
-- Specification : GUI-004
--------------------------------------------------------------------------------

local ACP_Monitor = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local WINDOW_TITLE = "ACP Monitor"

--------------------------------------------------------------------------------
-- Private State
--------------------------------------------------------------------------------

local State =
{
    Context     = nil,
    WindowOpen  = true,
    OnFinished  = nil
}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

local function RenderLoop()

    if ACP_Monitor.Render() then

        reaper.defer(RenderLoop)

    else

        local onFinished =
            State.OnFinished

        ACP_Monitor.Shutdown()

        if onFinished then
            onFinished()
        end

    end

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Initialize
--------------------------------------------------------------------------------

function ACP_Monitor.Initialize()

    State.Context =
        reaper.ImGui_CreateContext(
            WINDOW_TITLE)

    assert(
        State.Context,
        "Unable to create ImGui context.")

    State.WindowOpen = true

    return true

end

--------------------------------------------------------------------------------
-- Draw
--------------------------------------------------------------------------------

function ACP_Monitor.Draw()

    reaper.ImGui_Text(
        State.Context,
        "ACP Studio Monitor")

    reaper.ImGui_Separator(
        State.Context)

    reaper.ImGui_Text(
        State.Context,
        "GUI-004")

end

--------------------------------------------------------------------------------
-- Render
--------------------------------------------------------------------------------

function ACP_Monitor.Render()

    if not State.WindowOpen then
        return false
    end

    reaper.ImGui_SetNextWindowSize(
        State.Context,
        900,
        600,
        reaper.ImGui_Cond_FirstUseEver())

    local visible

    visible, State.WindowOpen =
        reaper.ImGui_Begin(
            State.Context,
            WINDOW_TITLE,
            State.WindowOpen)

    if visible then
        ACP_Monitor.Draw()
    end

    reaper.ImGui_End(
        State.Context)

    return State.WindowOpen

end

--------------------------------------------------------------------------------
-- Shutdown
--------------------------------------------------------------------------------

function ACP_Monitor.Shutdown()

    State.Context = nil
    State.WindowOpen = false
    State.OnFinished = nil

end

--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

function ACP_Monitor.Run(onFinished)

    State.OnFinished = onFinished

    if ACP_Monitor.Initialize() then
        RenderLoop()
    end

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return ACP_Monitor