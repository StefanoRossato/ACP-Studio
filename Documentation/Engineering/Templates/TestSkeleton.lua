--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test            :
-- Category        :
-- Standard        : TPL-002
-- Purpose         :
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Load Bootstrap
--------------------------------------------------------------------------------

local function LoadBootstrap()

    local separator = package.config:sub(1, 1)

    local source = debug.getinfo(1, "S").source
    local currentFile = source:sub(2)

    local path = currentFile:match("^(.*" .. separator .. ")")

    while path do

        local candidate = path .. "Bootstrap.lua"

        local file = io.open(candidate, "r")

        if file then

            file:close()

            local repositoryRoot =
                path:gsub(separator .. "$", "")

            if repositoryRoot:match(separator .. "Tests$") then

                repositoryRoot =
                    repositoryRoot:gsub(
                        separator .. "Tests$",
                        "")

            end

            local bootstrap = dofile(candidate)

            assert(
                bootstrap,
                "Bootstrap module not returned.")

            assert(
                type(bootstrap.Initialize) == "function",
                "Bootstrap.Initialize() not available.")

            bootstrap.Initialize(repositoryRoot)

            return repositoryRoot

        end

        local parent =
            path:match(
                "^(.*"
                .. separator
                .. ")[^"
                .. separator
                .. "]+"
                .. separator
                .. "$")

        if parent == path then
            break
        end

        path = parent

    end

    error("Unable to locate Bootstrap.lua")

end

--------------------------------------------------------------------------------
-- Test Environment
--------------------------------------------------------------------------------

local Test = {}

local RepositoryRoot

local function InitializeTestEnvironment()

    RepositoryRoot = LoadBootstrap()

    assert(
        RepositoryRoot,
        "Repository root not determined.")

end

InitializeTestEnvironment()

--------------------------------------------------------------------------------
-- Module Under Test
--------------------------------------------------------------------------------

-- None

--------------------------------------------------------------------------------
-- Test Dependencies
--------------------------------------------------------------------------------

-- None

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

-- None

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

local function ClearLog()

    reaper.ClearConsole()

end

local function Log(message)

    reaper.ShowConsoleMsg(message .. "\n")

end

local function Pass(message)

    Log("PASS - " .. message)

end

local function Fail(message)

    error("FAIL - " .. message, 2)

end

--------------------------------------------------------------------------------
-- Test Cases
--------------------------------------------------------------------------------

-- None

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function Test.Run()

    ClearLog()

    Log("========================================")
    Log("<Test Name>")
    Log("========================================")

    -- Execute test cases

    Log("========================================")
    Log("<Test Name> PASSED")
    Log("========================================")

end

--------------------------------------------------------------------------------
-- Run Test
--------------------------------------------------------------------------------

Test.Run()