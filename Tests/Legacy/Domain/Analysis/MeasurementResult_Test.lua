--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test          : MeasurementResult Capability Test
-- Component     : MeasurementResult
-- Layer         : Domain
-- Purpose       : Verify the MeasurementResult domain capability.
-- Specification : ADS-003
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

    Log("Creating valid measurements...")

    local rms =
        Measurement.New(-18.0, "RMS", "dB")

    local peak =
        Measurement.New(-6.0, "Peak", "dB")

    Assert(rms ~= nil, "RMS measurement created")
    Assert(peak ~= nil, "Peak measurement created")

    Log("Creating MeasurementResult...")

    local result =
        MeasurementResult.New(rms, peak, 100)

    Assert(result ~= nil, "MeasurementResult created")

    Log("Checking getters...")

    Assert(result:GetRMS():Equals(rms), "GetRMS")
    Assert(result:GetPeak():Equals(peak), "GetPeak")
    Assert(result:GetTimestamp() == 100, "GetTimestamp")

    Log("Checking equality...")

    local equal =
        MeasurementResult.New(
            Measurement.New(-18.0, "RMS", "dB"),
            Measurement.New(-6.0, "Peak", "dB"),
            100)

    Assert(result:Equals(equal), "Equal objects")

    local differentRMS =
        MeasurementResult.New(
            Measurement.New(-20.0, "RMS", "dB"),
            Measurement.New(-6.0, "Peak", "dB"),
            100)

    Assert(
        not result:Equals(differentRMS),
        "Different RMS")

    local differentPeak =
        MeasurementResult.New(
            Measurement.New(-18.0, "RMS", "dB"),
            Measurement.New(-3.0, "Peak", "dB"),
            100)

    Assert(
        not result:Equals(differentPeak),
        "Different Peak")

    local differentTimestamp =
        MeasurementResult.New(
            Measurement.New(-18.0, "RMS", "dB"),
            Measurement.New(-6.0, "Peak", "dB"),
            200)

    Assert(
        not result:Equals(differentTimestamp),
        "Different Timestamp")

    Assert(
        not result:Equals({}),
        "Invalid comparison")

    Log("Checking invalid construction...")

    Assert(
        not pcall(function()
            MeasurementResult.New(nil, peak, 100)
        end),
        "nil RMS rejected")

    Assert(
        not pcall(function()
            MeasurementResult.New(rms, nil, 100)
        end),
        "nil Peak rejected")

    Assert(
        not pcall(function()
            MeasurementResult.New(rms, peak, -1)
        end),
        "negative timestamp rejected")

    Assert(
        not pcall(function()
            MeasurementResult.New(rms, peak, 1.5)
        end),
        "non-integer timestamp rejected")

    Assert(
        not pcall(function()
            MeasurementResult.New(rms, peak, "100")
        end),
        "non-numeric timestamp rejected")

end

--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("MeasurementResult Capability Test")
    Log("ADS-003")
    Log("========================================")

    TestCase()

    Log("========================================")
    Log("MeasurementResult Capability Test PASSED")
    Log("========================================")

end

--------------------------------------------------------------------------------
-- Run Test
--------------------------------------------------------------------------------

Run()