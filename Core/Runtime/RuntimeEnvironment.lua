-----------------------------------------------------------------------
-- ACP Studio
-- RuntimeEnvironment.lua
--
-- ENV-002 Runtime Environment Preparation
-----------------------------------------------------------------------

local RuntimeEnvironment = {}

-----------------------------------------------------------------------
-- Constants
-----------------------------------------------------------------------

local RUNTIME_TRACK_NAME  = "ACP Runtime"
local RUNTIME_PLUGIN_NAME = "ACP Studio - Baseline DSP Runtime"

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

        local _, name =
            reaper.GetTrackName(track)

        if name == RUNTIME_TRACK_NAME then

            State.track = track

            return true

        end

    end

    return false

end

-----------------------------------------------------------------------
-- Create Runtime Track
-----------------------------------------------------------------------

local function CreateRuntimeTrack()

    local trackIndex =
        reaper.CountTracks(0)

    reaper.InsertTrackAtIndex(
        trackIndex,
        true
    )

    local track =
        reaper.GetTrack(
            0,
            trackIndex
        )

    reaper.GetSetMediaTrackInfo_String(
        track,
        "P_NAME",
        RUNTIME_TRACK_NAME,
        true
    )

    return true

end

-----------------------------------------------------------------------
-- Ensure Runtime Plugin
-----------------------------------------------------------------------

local function EnsureRuntimePlugin()

    if not State.track then
        return false
    end

    State.runtimeFX = nil

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
-- Create Runtime Plugin
-----------------------------------------------------------------------

local function CreateRuntimePlugin()

    if not State.track then
        return false
    end

    local fxIndex =
        reaper.TrackFX_AddByName(
            State.track,
            RUNTIME_PLUGIN_NAME,
            false,
            -1
        )

    return fxIndex >= 0

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

function RuntimeEnvironment.Prepare()

    ---------------------------------------------------------------
    -- Runtime Track
    ---------------------------------------------------------------

    if not EnsureRuntimeTrack() then

        if not CreateRuntimeTrack() then
            return false
        end

        if not EnsureRuntimeTrack() then
            return false
        end

    end

    ---------------------------------------------------------------
    -- Runtime Plugin
    ---------------------------------------------------------------

    if not EnsureRuntimePlugin() then

        if not CreateRuntimePlugin() then
            return false
        end

        if not EnsureRuntimePlugin() then
            return false
        end

    end

    return true

end

-----------------------------------------------------------------------

function RuntimeEnvironment.Validate()

    if not State.initialized then
        return false
    end

    if not EnsureRuntimeTrack() then
        return false
    end

    if not EnsureRuntimePlugin() then
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