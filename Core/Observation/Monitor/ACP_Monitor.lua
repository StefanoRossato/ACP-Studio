--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ACP_Monitor
-- Layer         : Observation
-- Purpose       : Main entry point of the Observation Layer UI.
-- Specification : OBS-002
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
    Context = nil,
    Open    = true
}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

local function RenderLoop()

    if ACP_Monitor.Render() then
        reaper.defer(RenderLoop)
    else
        ACP_Monitor.Shutdown()
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
        reaper.ImGui_CreateContext(WINDOW_TITLE)

    assert(
        State.Context,
        "Unable to create ImGui context.")

    State.Open = true

    return true

end

--------------------------------------------------------------------------------
-- Render
--------------------------------------------------------------------------------

function ACP_Monitor.Render()

    if not State.Open then
        return false
    end

    reaper.ImGui_SetNextWindowSize(
        State.Context,
        900,
        600,
        reaper.ImGui_Cond_FirstUseEver())

    local visible

    visible, State.Open =
        reaper.ImGui_Begin(
            State.Context,
            WINDOW_TITLE,
            State.Open)

    if visible then
        ACP_Monitor.RenderLayout()
    end

    reaper.ImGui_End(State.Context)

    return State.Open

end

--------------------------------------------------------------------------------
-- Layout
--------------------------------------------------------------------------------

function ACP_Monitor.RenderLayout()

    ACP_Monitor.RenderToolbar()

    reaper.ImGui_Separator(State.Context)

    ACP_Monitor.RenderNavigation()

    reaper.ImGui_SameLine(State.Context)

    ACP_Monitor.RenderWorkspace()

    reaper.ImGui_Separator(State.Context)

    ACP_Monitor.RenderStatusBar()

end

--------------------------------------------------------------------------------
-- Toolbar
--------------------------------------------------------------------------------

function ACP_Monitor.RenderToolbar()

    reaper.ImGui_Button(State.Context, "Start")

    reaper.ImGui_SameLine(State.Context)

    reaper.ImGui_Button(State.Context, "Stop")

    reaper.ImGui_SameLine(State.Context)

    reaper.ImGui_Button(State.Context, "Clear")

end

--------------------------------------------------------------------------------
-- Navigation
--------------------------------------------------------------------------------

function ACP_Monitor.RenderNavigation()

    reaper.ImGui_BeginGroup(State.Context)

    reaper.ImGui_Text(State.Context, "Observation")
    reaper.ImGui_Separator(State.Context)

    reaper.ImGui_Text(State.Context, "Runtime")
    reaper.ImGui_Text(State.Context, "Measurements")
    reaper.ImGui_Text(State.Context, "Components")
    reaper.ImGui_Text(State.Context, "Logs")

    reaper.ImGui_EndGroup(State.Context)

end

--------------------------------------------------------------------------------
-- Workspace
--------------------------------------------------------------------------------

function ACP_Monitor.RenderWorkspace()

    reaper.ImGui_BeginGroup(State.Context)

    reaper.ImGui_Text(State.Context, "Workspace")
    reaper.ImGui_Separator(State.Context)

    reaper.ImGui_Dummy(State.Context, 500, 400)

    reaper.ImGui_Text(State.Context, "Observation Workspace")

    reaper.ImGui_EndGroup(State.Context)

end

--------------------------------------------------------------------------------
-- Status Bar
--------------------------------------------------------------------------------

function ACP_Monitor.RenderStatusBar()

    reaper.ImGui_Text(
        State.Context,
        "ACP Studio Observation Layer")

end

--------------------------------------------------------------------------------
-- Shutdown
--------------------------------------------------------------------------------

function ACP_Monitor.Shutdown()

    State.Context = nil

end

--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

function ACP_Monitor.Run()

    if ACP_Monitor.Initialize() then
        RenderLoop()
    end

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return ACP_Monitor