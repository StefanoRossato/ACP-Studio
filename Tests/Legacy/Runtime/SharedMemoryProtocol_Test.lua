--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test          : SharedMemoryProtocol Capability Test
-- Component     : SharedMemoryProtocol
-- Layer         : Runtime
-- Purpose       : Verifies the Shared Memory Protocol capability.
-- Specification : RTP-001
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

local SharedMemoryProtocol =
    require("Core.Runtime.Protocol.SharedMemoryProtocol")

local SharedMemoryGateway =
    require("Core.Runtime.Gateway.SharedMemoryGateway")

local Registers =
    require("Core.IPC.Registers")

local RuntimeCommands =
    require("Core.IPC.RuntimeCommands")

local RuntimeStates =
    require("Core.IPC.RuntimeStates")

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
-- Test Case
--------------------------------------------------------------------------------

local function TestCase()

    ------------------------------------------------------------------------
    -- Module
    ------------------------------------------------------------------------

    Log("Loading SharedMemoryProtocol...")

    Assert(
        SharedMemoryProtocol ~= nil,
        "Module loaded")

    Assert(
        type(SharedMemoryProtocol) == "table",
        "Module is table")

    ------------------------------------------------------------------------
    -- Public API
    ------------------------------------------------------------------------

    Log("Checking Public API...")

    Assert(
        type(SharedMemoryProtocol.Start) == "function",
        "Start() available")

    Assert(
        type(SharedMemoryProtocol.Reset) == "function",
        "Reset() available")

    Assert(
        type(SharedMemoryProtocol.ReadState) == "function",
        "ReadState() available")

    Assert(
        type(SharedMemoryProtocol.ReadMeasurement) == "function",
        "ReadMeasurement() available")

    ------------------------------------------------------------------------
    -- Attach
    ------------------------------------------------------------------------

    Log("Attaching shared memory...")

    Assert(
        SharedMemoryGateway.Attach() == true,
        "Shared memory attached")

    ------------------------------------------------------------------------
    -- Start
    ------------------------------------------------------------------------

    Log("Starting runtime...")

    Assert(
        SharedMemoryProtocol.Start() == true,
        "Runtime start requested")

    Assert(
        SharedMemoryGateway.Read(
            Registers.COMMAND) == RuntimeCommands.START,
        "Start command written")

    ------------------------------------------------------------------------
    -- Reset
    ------------------------------------------------------------------------

    Log("Resetting runtime...")

    Assert(
        SharedMemoryProtocol.Reset() == true,
        "Runtime reset requested")

    Assert(
        SharedMemoryGateway.Read(
            Registers.COMMAND) == RuntimeCommands.RESET,
        "Reset command written")

    ------------------------------------------------------------------------
    -- ReadState
    ------------------------------------------------------------------------

    Log("Preparing runtime state...")

    Assert(
        SharedMemoryGateway.Write(
            Registers.STATE,
            RuntimeStates.RUNNING) == true,
        "Runtime state prepared")

    Log("Reading runtime state...")

    local state =
        SharedMemoryProtocol.ReadState()

    Assert(
        state == RuntimeStates.RUNNING,
        "Runtime state read")

    ------------------------------------------------------------------------
    -- ReadMeasurement
    ------------------------------------------------------------------------

    Log("Preparing measurement...")

    SharedMemoryGateway.Write(Registers.RMS,       -18.0)
    SharedMemoryGateway.Write(Registers.PEAK,      -6.0)
    SharedMemoryGateway.Write(Registers.LINEARITY, 12.0)
    SharedMemoryGateway.Write(Registers.SAMPLES,   1024)

    Log("Reading measurement...")

    local measurement =
        SharedMemoryProtocol.ReadMeasurement()

    Assert(
        measurement.RMS == -18.0,
        "RMS read")

    Assert(
        measurement.Peak == -6.0,
        "Peak read")

    Assert(
        measurement.Linearity == 12.0,
        "Linearity read")

    Assert(
        measurement.Samples == 1024,
        "Sample count read")

end

--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("SharedMemoryProtocol Capability Test")
    Log("RTP-001")
    Log("========================================")

    TestCase()

    Log("========================================")
    Log("RTP-001 Capability Test PASSED")
    Log("========================================")

end

--------------------------------------------------------------------------------
-- Run Test
--------------------------------------------------------------------------------

Run()