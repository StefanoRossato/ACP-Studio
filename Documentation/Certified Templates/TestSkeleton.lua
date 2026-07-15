----------------------------------------------------------------------
-- ACP Studio
-- TestSkeleton.lua
--
-- Template      : Test Module Skeleton
-- Category      : Certified Template
-- Purpose       : Certified template for ACP Studio *_Test.lua modules
-- Standard      : TST-001 Test Template Standard
----------------------------------------------------------------------

----------------------------------------------------------------------
-- ACP Studio
-- <FileName>
--
-- Component     : <Component>
-- Layer         : <Layer>
-- Purpose       : <Purpose>
-- Specification : <Specification>
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

-- Example:
--
-- local <Module> =
--     require("Core.<Layer>.<Module>")
--
-- Examples:
--
-- local RuntimeModel =
--     require("Core.Runtime.RuntimeModel")
--
-- local ObservationCollector =
--     require("Core.Observability.ObservationCollector")

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

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

local function TestCase()

    -- Implementation ----------------------------------------------------------

end

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("<Test Name>")
    Log("========================================")

    TestCase()

    Log("========================================")
    Log("<Test Name> PASSED")
    Log("========================================")

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

Run()