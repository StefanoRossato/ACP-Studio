--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test          : ACP_Monitor_Test
-- Component     : ACP_Monitor
-- Layer         : Observation
-- Purpose       : Verify the Observation Monitor lifecycle.
-- Specification : OBS-001
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

    reaper.ShowConsoleMsg(
        "Repository Root = [" .. RepositoryRoot .. "]\n")

    assert(
        Bootstrap.Initialize(RepositoryRoot),
        "Unable to initialize test infrastructure.")

end

InitializeTestEnvironment()

--------------------------------------------------------------------------------
-- Module
--------------------------------------------------------------------------------

local ACP_Monitor =
    require("Core.Observation.Monitor.ACP_Monitor")

--------------------------------------------------------------------------------
-- Test Dependencies
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Clear Log
--------------------------------------------------------------------------------

local function ClearLog()

    reaper.ClearConsole()

end

--------------------------------------------------------------------------------
-- Log
--------------------------------------------------------------------------------

local function Log(message)

    reaper.ShowConsoleMsg(message .. "\n")

end

--------------------------------------------------------------------------------
-- Assert
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

    Log("Loading module...")
    Assert(ACP_Monitor ~= nil, "Module loaded")

    Log("Initializing...")
    Assert(
        ACP_Monitor.Initialize(),
        "Initialize")

    Log("Rendering...")
    Log("Close the ACP Monitor window to terminate the test.")

    local function RenderLoop()

        if ACP_Monitor.Render() then

            reaper.defer(RenderLoop)

        else

            Log("Shutdown...")
            ACP_Monitor.Shutdown()
            Assert(true, "Shutdown")

            Log("========================================")
            Log("ACP Monitor Test PASSED")
            Log("========================================")

        end

    end

    RenderLoop()

end

--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("ACP Monitor Test")
    Log("OBS-001")
    Log("========================================")

    TestCase()

end

--------------------------------------------------------------------------------
-- Run Test
--------------------------------------------------------------------------------

Run()