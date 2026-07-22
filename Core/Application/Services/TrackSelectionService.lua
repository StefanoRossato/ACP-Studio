--------------------------------------------------------------------------------
-- ACP Studio
-- TrackSelectionService Capability Test
--------------------------------------------------------------------------------
-- Component     : TrackSelectionService
-- Layer         : Application
-- Purpose       : Verifies the TrackSelectionService capability.
-- Specification : APP-002
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Test Environment
--------------------------------------------------------------------------------

local TestBootstrap =
    require("Tests.Bootstrap")

TestBootstrap.Initialize()

--------------------------------------------------------------------------------
-- Module
--------------------------------------------------------------------------------

local TrackSelectionService =
    require("Core.Application.Services.TrackSelectionService")

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

local function ClearLog()

    reaper.ClearConsole()

end

--------------------------------------------------------------------------------

local function Log(message)

    reaper.ShowConsoleMsg(message .. "\n")

end

--------------------------------------------------------------------------------

local function Assert(condition, message)

    if not condition then
        error("FAILED - " .. message)
    end

    Log("PASS - " .. message)

end

--------------------------------------------------------------------------------
-- Test Cases
--------------------------------------------------------------------------------

local function TestCase()

    ------------------------------------------------------------------------
    -- Module
    ------------------------------------------------------------------------

    Log("Loading TrackSelectionService...")

    Assert(
        TrackSelectionService ~= nil,
        "Module loaded")

    Assert(
        type(TrackSelectionService) == "table",
        "Module is table")

    ------------------------------------------------------------------------
    -- Public API
    ------------------------------------------------------------------------

    Log("Checking Public API...")

    Assert(
        type(TrackSelectionService.GetSelectedTrack) == "function",
        "GetSelectedTrack() available")

    ------------------------------------------------------------------------
    -- Execute
    ------------------------------------------------------------------------

    Log("Reading selected track...")

    local track =
        TrackSelectionService.GetSelectedTrack()

    if track then

        Assert(
            type(track.Name) == "string",
            "Track name available")

        Assert(
            type(track.Index) == "number",
            "Track index available")

        Log("Selected Track : " .. track.Name)
        Log("Track Index    : " .. tostring(track.Index))

    else

        Log("No track selected.")

    end

end

--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("TrackSelectionService Capability Test")
    Log("APP-002")
    Log("========================================")

    TestCase()

    Log("========================================")
    Log("APP-002 Capability Test PASSED")
    Log("========================================")

end

--------------------------------------------------------------------------------
-- Run Test
--------------------------------------------------------------------------------

Run()