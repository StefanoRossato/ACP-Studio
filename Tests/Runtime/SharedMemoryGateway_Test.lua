--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test          : SharedMemoryGateway Capability Test
-- Component     : SharedMemoryGateway
-- Layer         : Runtime
-- Purpose       : Verifies the Shared Memory Gateway skeleton.
-- Specification : RTG-002
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

local SharedMemoryGateway =
    require("Core.Runtime.Gateway.SharedMemoryGateway")

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

    Log("Loading SharedMemoryGateway...")

    Assert(
        SharedMemoryGateway ~= nil,
        "Module loaded")

    Assert(
        type(SharedMemoryGateway) == "table",
        "Module is table")

    ------------------------------------------------------------------------
    -- Public API
    ------------------------------------------------------------------------

    Log("Checking Public API...")

    Assert(
        type(SharedMemoryGateway.Attach) == "function",
        "Attach() available")

    Assert(
        type(SharedMemoryGateway.Read) == "function",
        "Read() available")

    Assert(
        type(SharedMemoryGateway.Write) == "function",
        "Write() available")

    Assert(
        type(SharedMemoryGateway.Reset) == "function",
        "Reset() available")

    ------------------------------------------------------------------------
    -- Attach
    ------------------------------------------------------------------------

    Log("Attaching shared memory...")

    Assert(
        SharedMemoryGateway.Attach() == true,
        "Shared memory attached")

    ------------------------------------------------------------------------
    -- Write
    ------------------------------------------------------------------------

    Log("Writing test data...")

    Assert(
        SharedMemoryGateway.Write(0, 123) == true,
        "Register value written")

    ------------------------------------------------------------------------
    -- Read
    ------------------------------------------------------------------------

    Log("Reading shared memory...")

    local value =
        SharedMemoryGateway.Read(0)

    Assert(
        value == 123,
        "Register value read")
    
    ------------------------------------------------------------------------
    -- Reset
    ------------------------------------------------------------------------

    Log("Resetting shared memory...")

    Assert(
        SharedMemoryGateway.Reset() == true,
        "Shared memory reset")

    local value =
        SharedMemoryGateway.Read(0)

    Assert(
        value == 0,
        "Register reset")


end


--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("SharedMemoryGateway Capability Test")
    Log("RTG-002")
    Log("========================================")

    TestCase()

    Log("========================================")
    Log("RTG-002 Capability Test PASSED")
    Log("========================================")

end

--------------------------------------------------------------------------------
-- Run Test
--------------------------------------------------------------------------------

Run()