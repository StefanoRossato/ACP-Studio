-----------------------------------------------------------------------
-- ACP Studio
-- RuntimeEnvironment.lua
--
-- ENV-001 Runtime Environment
--
-- Responsible for preparing and validating the Runtime environment
-- required by ACP Studio engineering components.
-----------------------------------------------------------------------

local RuntimeEnvironment = {}

-----------------------------------------------------------------------
-- Constants
-----------------------------------------------------------------------
local RUNTIME_TRACK_NAME = "ACP Runtime"
local RUNTIME_PLUGIN_NAME = "ACP Baseline"

-----------------------------------------------------------------------
-- Private State
-----------------------------------------------------------------------

local State = {

    initialized = false,
    ready       = false,

    track       = nil,
    runtimeFX   = nil

}

-----------------------------------------------------------------------
-- Private Functions
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- Ensure Runtime Track
-----------------------------------------------------------------------

local function EnsureRuntimeTrack()

    State.track = nil

    local trackCount = reaper.CountTracks(0)

    for index = 0, trackCount - 1 do

        local track = reaper.GetTrack(0, index)

        local _, name = reaper.GetTrackName(track)

        if name == RUNTIME_TRACK_NAME then

            State.track = track

            return true

        end

    end

    return false

end

-----------------------------------------------------------------------
-- Ensure Runtime Plugin
-----------------------------------------------------------------------

local function EnsureRuntimePlugin()

    if not State.track then
        return false
    end

    local fxCount =
        reaper.TrackFX_GetCount(State.track)

    for fxIndex = 0, fxCount - 1 do

        local _, fxName =
            reaper.TrackFX_GetFXName(
                State.track,
                fxIndex,
                ""
            )

        if fxName:find(RUNTIME_PLUGIN_NAME, 1, true) then

            State.runtimeFX = fxIndex

            return true

        end

    end

    return false

end

-----------------------------------------------------------------------
-- Public API
-----------------------------------------------------------------------

function RuntimeEnvironment.Initialize()

    State.initialized = true
    State.ready       = false

    State.track       = nil
    State.runtimeFX   = nil

    return true

end

-----------------------------------------------------------------------

function RuntimeEnvironment.Validate()

    if not State.initialized then

        State.ready = false

        return false

    end

    if not EnsureRuntimeTrack() then

        State.ready = false

        return false

    end

    if not EnsureRuntimePlugin() then

        State.ready = false

        return false

    end

    State.ready = true

    return true

end

-----------------------------------------------------------------------

function RuntimeEnvironment.IsReady()

    return State.ready

end

-----------------------------------------------------------------------

function RuntimeEnvironment.GetRuntimeTrack()

     return State.track

end

-----------------------------------------------------------------------

function RuntimeEnvironment.GetRuntimePlugin()

    return State.runtimeFX

end

-----------------------------------------------------------------------

return RuntimeEnvironment