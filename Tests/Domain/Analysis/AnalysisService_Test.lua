--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test          : AnalysisService Capability Test
-- Component     : AnalysisService
-- Layer         : Domain
-- Purpose       : Verify the AnalysisService domain capability.
-- Specification : ADS-005
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

local AnalysisService =
    require("Core.Domain.Analysis.AnalysisService")

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

    Log("Creating Analysis Session...")

    local session =
        AnalysisService.CreateSession()

    Assert(
        session:GetState():GetValue() == "Created",
        "CreateSession")

    Assert(
        session:GetResult():Equals(
            MeasurementResult.Empty()),
        "Empty MeasurementResult")

    Log("Starting Analysis Session...")

    local running =
        AnalysisService.Start(session)

    Assert(
        running:GetState():GetValue() == "Running",
        "Start")

    Log("Completing Analysis Session...")

    local result =
        MeasurementResult.New(

            Measurement.New(
                -18.0,
                "RMS",
                "dB"),

            Measurement.New(
                -6.0,
                "Peak",
                "dB"),

            100

        )

    local completed =
        AnalysisService.Complete(
            running,
            result)

    Assert(
        completed:GetState():GetValue() == "Completed",
        "Complete")

    Assert(
        completed:GetResult():Equals(result),
        "Completed Result")

    Log("Checking invalid transition...")

    Assert(

        not pcall(function()

            AnalysisService.Start(completed)

        end),

        "Invalid transition rejected"

    )

    Log("Checking Fail...")

    local failed =
        AnalysisService.Fail(running)

    Assert(
        failed:GetState():GetValue() == "Failed",
        "Fail")

    Log("Checking Cancel...")

    local cancelled =
        AnalysisService.Cancel(running)

    Assert(
        cancelled:GetState():GetValue() == "Cancelled",
        "Cancel")

end

--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("AnalysisService Capability Test")
    Log("ADS-005")
    Log("========================================")

    TestCase()

    Log("========================================")
    Log("AnalysisService Capability Test PASSED")
    Log("========================================")

end

--------------------------------------------------------------------------------
-- Run Test
--------------------------------------------------------------------------------

Run()