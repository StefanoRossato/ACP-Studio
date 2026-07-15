--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test          : AnalysisSession Capability Test
-- Component     : AnalysisSession
-- Layer         : Domain
-- Purpose       : Verify the AnalysisSession domain aggregate.
-- Specification : ADS-001
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Test Environment
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Load Bootstrap
--------------------------------------------------------------------------------

local function LoadBootstrap()

    local separator =
        package.config:sub(1, 1)

    local path =
        debug.getinfo(1, "S").source:match("@?(.*)")

    path =
        path:gsub("[/\\][^/\\]+$", "")

    while path ~= "" do

        local candidate =
            path
            .. separator
            .. "Bootstrap.lua"

        local file =
            io.open(candidate, "r")

        if file then

            file:close()

            local repositoryRoot =
                path:gsub(separator .. "Tests$", "")

            return
                dofile(candidate),
                repositoryRoot

        end

        local parent =
            path:gsub("[/\\][^/\\]+$", "")

        if parent == path then
            break
        end

        path = parent

    end

    error("Unable to locate Bootstrap.lua")

end

--------------------------------------------------------------------------------
-- Initialize Test Environment
--------------------------------------------------------------------------------

local function InitializeTestEnvironment()

    local Bootstrap
    local RepositoryRoot

    Bootstrap, RepositoryRoot =
        LoadBootstrap()

    assert(
        Bootstrap.Initialize(RepositoryRoot),
        "Unable to initialize test infrastructure.")

end

InitializeTestEnvironment()

--------------------------------------------------------------------------------
-- Modules
--------------------------------------------------------------------------------

local Measurement =
    require("Core.Domain.Analysis.Measurement")

local MeasurementResult =
    require("Core.Domain.Analysis.MeasurementResult")

local AnalysisState =
    require("Core.Domain.Analysis.AnalysisState")

local AnalysisSession =
    require("Core.Domain.Analysis.AnalysisSession")

--------------------------------------------------------------------------------
-- Helpers
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
-- Test Case
--------------------------------------------------------------------------------

local function TestCase()

    Log("Creating domain objects...")

    local rms =
        Measurement.New(-18.0, "RMS", "dB")

    local peak =
        Measurement.New(-6.0, "Peak", "dB")

    local result =
        MeasurementResult.New(
            rms,
            peak,
            100)

    local state =
        AnalysisState.New("Completed")

    Assert(state ~= nil, "AnalysisState created")
    Assert(result ~= nil, "MeasurementResult created")

    Log("Creating AnalysisSession...")

    local session =
        AnalysisSession.New(
            state,
            result)

    Assert(session ~= nil, "AnalysisSession created")

    Log("Checking getters...")

    Assert(
        session:GetState():Equals(state),
        "GetState")

    Assert(
        session:GetResult():Equals(result),
        "GetResult")

    Log("Checking equality...")

    local equal =
        AnalysisSession.New(
            AnalysisState.New("Completed"),
            MeasurementResult.New(
                Measurement.New(-18.0, "RMS", "dB"),
                Measurement.New(-6.0, "Peak", "dB"),
                100))

    Assert(
        session:Equals(equal),
        "Equal objects")

    local differentState =
        AnalysisSession.New(
            AnalysisState.New("Running"),
            MeasurementResult.New(
                Measurement.New(-18.0, "RMS", "dB"),
                Measurement.New(-6.0, "Peak", "dB"),
                100))

    Assert(
        not session:Equals(differentState),
        "Different state")

    local differentResult =
        AnalysisSession.New(
            AnalysisState.New("Completed"),
            MeasurementResult.New(
                Measurement.New(-20.0, "RMS", "dB"),
                Measurement.New(-6.0, "Peak", "dB"),
                100))

    Assert(
        not session:Equals(differentResult),
        "Different result")

    Assert(
        not session:Equals({}),
        "Invalid comparison")

    Log("Checking invalid construction...")

    Assert(
        not pcall(function()
            AnalysisSession.New(nil, result)
        end),
        "nil state rejected")

    Assert(
        not pcall(function()
            AnalysisSession.New(state, nil)
        end),
        "nil result rejected")

end

--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("AnalysisSession Capability Test")
    Log("ADS-001")
    Log("========================================")

    TestCase()

    Log("========================================")
    Log("AnalysisSession Capability Test PASSED")
    Log("========================================")

end

--------------------------------------------------------------------------------
-- Run Test
--------------------------------------------------------------------------------

Run()