--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test          : AnalysisExecutor Capability Test
-- Component     : AnalysisExecutor
-- Layer         : Runtime
-- Purpose       : Verifies the Analysis Executor skeleton.
-- Specification : RTS-001
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

local AnalysisExecutor =
    require("Core.Runtime.Analysis.AnalysisExecutor")

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

local function ClearLog()

    reaper.ClearConsole()

end

local function Log(message)

    reaper.ShowConsoleMsg(message .. "\n")

end

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

    Log("Loading AnalysisExecutor...")

    Assert(
        AnalysisExecutor ~= nil,
        "Module loaded")

    Assert(
        type(AnalysisExecutor) == "table",
        "Module is table")

    ------------------------------------------------------------------------
    -- Public API
    ------------------------------------------------------------------------

    Log("Checking Public API...")

    Assert(
        type(AnalysisExecutor.Execute) == "function",
        "Execute() available")

    ------------------------------------------------------------------------
    -- Execute
    ------------------------------------------------------------------------

    Log("Executing analysis...")

    local session = {}

    local result =
        AnalysisExecutor.Execute(session)

    Assert(
        result ~= nil,
        "MeasurementResult created")

end

--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("AnalysisExecutor Capability Test")
    Log("RTS-001")
    Log("========================================")

    TestCase()

    Log("========================================")
    Log("RTS-001 Capability Test PASSED")
    Log("========================================")

end

--------------------------------------------------------------------------------
-- Run Test
--------------------------------------------------------------------------------

Run()