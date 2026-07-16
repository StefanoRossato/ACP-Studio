--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ACP_Monitor
-- Layer         : Observation
-- Purpose       : Main entry point of the Observation Layer UI.
-- Specification : OBS-001
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
    Context = nil,   -- Risorsa posseduta dal Monitor
    Open    = true   -- Stato della finestra
}
--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Render Loop
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
-- Initialize the Observation Monitor.
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
-- Render the Observation Monitor.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Render the Observation Monitor.
--------------------------------------------------------------------------------

function ACP_Monitor.Render()

    if not State.Context then
        return
    end

    local visible, open =
        reaper.ImGui_Begin(
            State.Context,
            WINDOW_TITLE,
            true)

    if visible then

        -- Intentionally empty.

        reaper.ImGui_End(State.Context)

    end

end

--------------------------------------------------------------------------------
-- Shutdown the Observation Monitor.
--------------------------------------------------------------------------------
function ACP_Monitor.Shutdown()

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return ACP_Monitor