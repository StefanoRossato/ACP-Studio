--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test          : RuntimeGateway Capability Test
-- Component     : RuntimeGateway
-- Layer         : Runtime
-- Purpose       : Verifies the Runtime Gateway skeleton.
-- Specification : RTG-001
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

local RuntimeGateway =
    require("Core.Runtime.Gateway.RuntimeGateway")

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

    Log("Loading RuntimeGateway...")

    Assert(
        RuntimeGateway ~= nil,
        "Module loaded")

    Assert(
        type(RuntimeGateway) == "table",
        "Module is table")

    ------------------------------------------------------------------------
    -- Public API
    ------------------------------------------------------------------------

    Log("Checking Public API...")

    Assert(
        type(RuntimeGateway.Execute) == "function",
        "Execute() available")

    ------------------------------------------------------------------------
    -- Execute
    ------------------------------------------------------------------------

    Log("Executing communication...")

    local result =
        RuntimeGateway.Execute({})

    Assert(
        result == true,
        "Communication executed")

end
--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("RuntimeGateway Capability Test")
    Log("RTG-001")
    Log("========================================")

    TestCase()

    Log("========================================")
    Log("RTG-001 Capability Test PASSED")
    Log("========================================")

end

--------------------------------------------------------------------------------
-- Run Test
--------------------------------------------------------------------------------

Run()