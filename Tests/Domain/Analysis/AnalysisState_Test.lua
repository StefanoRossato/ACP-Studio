----------------------------------------------------------------------
-- ACP Studio
-- AnalysisState_Test.lua
--
-- Component     : AnalysisState
-- Layer         : Domain
-- Purpose       : Verify AnalysisState capability
-- Specification : ADS-004 Analysis State
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Test Setup
----------------------------------------------------------------------

local function LoadTestSetup()

    local separator = package.config:sub(1, 1)

    local path =
        debug.getinfo(1, "S").source:match("@?(.*)")

    path = path:gsub("[/\\][^/\\]+$", "")

    while path ~= "" do

        local candidate = path .. separator .. "TestSetup.lua"

        local file = io.open(candidate, "r")

        if file then

            file:close()

            dofile(candidate)

            return

        end

        local parent = path:gsub("[/\\][^/\\]+$", "")

        if parent == path then
            break
        end

        path = parent

    end

    error("Unable to locate TestSetup.lua")

end

LoadTestSetup()

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

local AnalysisState =
    require("Core.Domain.Analysis.AnalysisState")

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

local State = AnalysisState.New()

----------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Construction
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Private Methods
----------------------------------------------------------------------

local function ClearLog()

    reaper.ClearConsole()

end

----------------------------------------------------------------------

local function Log(message)

    reaper.ShowConsoleMsg(message .. "\n")

end

----------------------------------------------------------------------

local function Assert(condition, message)

    if not condition then
        error("FAILED - " .. message)
    end

    Log("PASS - " .. message)

end

----------------------------------------------------------------------
-- Test Cases
----------------------------------------------------------------------

local function TestStates()

    Log("Checking valid states...")

    Assert(State:IsValid("Created"),    "Created")
    Assert(State:IsValid("Running"),    "Running")
    Assert(State:IsValid("Completed"),  "Completed")
    Assert(State:IsValid("Failed"),     "Failed")
    Assert(State:IsValid("Cancelled"),  "Cancelled")

end

----------------------------------------------------------------------

local function TestInvalidStates()

    Log("Checking invalid states...")

    Assert(not State:IsValid(nil),         "nil rejected")
    Assert(not State:IsValid(""),          "empty string rejected")
    Assert(not State:IsValid("Invalid"),   "invalid state rejected")

end

----------------------------------------------------------------------

local function TestValidTransitions()

    Log("Checking valid transitions...")

    Assert(
        State:CanTransition("Created", "Running"),
        "Created -> Running"
    )

    Assert(
        State:CanTransition("Running", "Completed"),
        "Running -> Completed"
    )

    Assert(
        State:CanTransition("Running", "Failed"),
        "Running -> Failed"
    )

    Assert(
        State:CanTransition("Running", "Cancelled"),
        "Running -> Cancelled"
    )

end

----------------------------------------------------------------------

local function TestInvalidTransitions()

    Log("Checking invalid transitions...")

    Assert(
        not State:CanTransition("Created", "Completed"),
        "Created -> Completed rejected"
    )

    Assert(
        not State:CanTransition("Created", "Failed"),
        "Created -> Failed rejected"
    )

    Assert(
        not State:CanTransition("Created", "Cancelled"),
        "Created -> Cancelled rejected"
    )

    Assert(
        not State:CanTransition("Completed", "Running"),
        "Completed -> Running rejected"
    )

    Assert(
        not State:CanTransition("Failed", "Running"),
        "Failed -> Running rejected"
    )

    Assert(
        not State:CanTransition("Cancelled", "Running"),
        "Cancelled -> Running rejected"
    )

end

----------------------------------------------------------------------

local function TestTerminalStates()

    Log("Checking terminal states...")

    Assert(
        not State:CanTransition("Completed", "Completed"),
        "Completed terminal"
    )

    Assert(
        not State:CanTransition("Failed", "Failed"),
        "Failed terminal"
    )

    Assert(
        not State:CanTransition("Cancelled", "Cancelled"),
        "Cancelled terminal"
    )

end

----------------------------------------------------------------------

local function TestInvalidArguments()

    Log("Checking invalid arguments...")

    Assert(
        not State:CanTransition(nil, "Running"),
        "nil source state rejected"
    )

    Assert(
        not State:CanTransition("Running", nil),
        "nil target state rejected"
    )

    Assert(
        not State:CanTransition("Invalid", "Running"),
        "invalid source state rejected"
    )

    Assert(
        not State:CanTransition("Running", "Invalid"),
        "invalid target state rejected"
    )

end

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("AnalysisState Capability Test")
    Log("ADS-004")
    Log("========================================")

    TestStates()
    TestInvalidStates()
    TestValidTransitions()
    TestInvalidTransitions()
    TestTerminalStates()
    TestInvalidArguments()

    Log("========================================")
    Log("ADS-004 CERTIFIED")
    Log("========================================")

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

Run()