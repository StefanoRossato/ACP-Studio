--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test          : AnalysisState Capability Test
-- Component     : AnalysisState
-- Layer         : Domain
-- Purpose       : Verify the AnalysisState domain capability.
-- Specification : ADS-004
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
-- Module
--------------------------------------------------------------------------------

local AnalysisState =
    require("Core.Domain.Analysis.AnalysisState")

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

    Log("Checking valid states...")

    local created =
        AnalysisState.New("Created")

    local running =
        AnalysisState.New("Running")

    local completed =
        AnalysisState.New("Completed")

    local failed =
        AnalysisState.New("Failed")

    local cancelled =
        AnalysisState.New("Cancelled")

    Assert(created:GetValue() == "Created", "Created")
    Assert(running:GetValue() == "Running", "Running")
    Assert(completed:GetValue() == "Completed", "Completed")
    Assert(failed:GetValue() == "Failed", "Failed")
    Assert(cancelled:GetValue() == "Cancelled", "Cancelled")

    Log("Checking invalid states...")

    Assert(
        not pcall(function()
            AnalysisState.New(nil)
        end),
        "nil rejected")

    Assert(
        not pcall(function()
            AnalysisState.New("")
        end),
        "empty string rejected")

    Assert(
        not pcall(function()
            AnalysisState.New("Invalid")
        end),
        "invalid state rejected")

    Log("Checking equality...")

    Assert(
        created:Equals(
            AnalysisState.New("Created")),
        "Equal states")

    Assert(
        not created:Equals(running),
        "Different states")

    Assert(
        not created:Equals({}),
        "Invalid comparison")

    Log("Checking lifecycle validation...")

    Assert(
        created:IsValid("Created"),
        "Valid state")

    Assert(
        not created:IsValid("Unknown"),
        "Invalid state")

    Log("Checking valid transitions...")

    Assert(
        created:CanTransition(
            "Created",
            "Running"),
        "Created -> Running")

    Assert(
        running:CanTransition(
            "Running",
            "Completed"),
        "Running -> Completed")

    Assert(
        running:CanTransition(
            "Running",
            "Failed"),
        "Running -> Failed")

    Assert(
        running:CanTransition(
            "Running",
            "Cancelled"),
        "Running -> Cancelled")

    Log("Checking invalid transitions...")

    Assert(
        not completed:CanTransition(
            "Completed",
            "Running"),
        "Completed -> Running")

    Assert(
        not failed:CanTransition(
            "Failed",
            "Completed"),
        "Failed -> Completed")

    Assert(
        not cancelled:CanTransition(
            "Cancelled",
            "Running"),
        "Cancelled -> Running")

end

--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("AnalysisState Capability Test")
    Log("ADS-004")
    Log("========================================")

    TestCase()

    Log("========================================")
    Log("AnalysisState Capability Test PASSED")
    Log("========================================")

end

--------------------------------------------------------------------------------
-- Run Test
--------------------------------------------------------------------------------

Run()