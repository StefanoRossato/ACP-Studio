--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test          : Measurement_Test
-- Component     : Measurement
-- Layer         : Domain
-- Purpose       : Certify the Measurement Value Object.
-- Specification : ADS-002
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
                path:match("^(.*)[/\\]Tests$")

            assert(
                repositoryRoot,
                "Unable to resolve repository root.")

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

local Measurement =
     require("Core.Domain.Analysis.Measurement")


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

--------------------------------------------------------------------------------
-- Test Construction
--------------------------------------------------------------------------------

local function TestConstruction()

    Log("Checking construction...")

    local measurement =
        Measurement.New(-18.0, "RMS", "dBFS")

    Assert(
        measurement ~= nil,
        "Measurement created")

end

--------------------------------------------------------------------------------
-- Test Value
--------------------------------------------------------------------------------

local function TestValue()

    local measurement =
        Measurement.New(-18.0, "RMS", "dBFS")

    Assert(
        measurement:GetValue() == -18.0,
        "Value stored")

end

--------------------------------------------------------------------------------
-- Test Type
--------------------------------------------------------------------------------

local function TestType()

    local measurement =
        Measurement.New(-18.0, "RMS", "dBFS")

    Assert(
        measurement:GetType() == "RMS",
        "Type stored")

end

--------------------------------------------------------------------------------
-- Test Unit
--------------------------------------------------------------------------------

local function TestUnit()

    local measurement =
        Measurement.New(-18.0, "RMS", "dBFS")

    Assert(
        measurement:GetUnit() == "dBFS",
        "Unit stored")

end

--------------------------------------------------------------------------------
-- Test Equality
--------------------------------------------------------------------------------

local function TestEquality()

    local left =
        Measurement.New(-18.0, "RMS", "dBFS")

    local right =
        Measurement.New(-18.0, "RMS", "dBFS")

    Assert(
        left:Equals(right),
        "Equal measurements")

end

--------------------------------------------------------------------------------
-- Test Case
--------------------------------------------------------------------------------

local function TestCase()

    TestConstruction()
    TestValue()
    TestType()
    TestUnit()
    TestEquality()

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("Measurement Capability Test")
    Log("ADS-002")
    Log("========================================")

    TestCase()

    Log("========================================")
    Log("Measurement Capability Test PASSED")
    Log("========================================")

end

--------------------------------------------------------------------------------
-- Run Test
--------------------------------------------------------------------------------

Run()