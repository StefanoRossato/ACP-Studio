--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : Bootstrap
-- Layer         : Test Infrastructure
-- Purpose       : Initialize the ACP Studio test environment.
-- Specification : TST-001
--------------------------------------------------------------------------------

local Bootstrap = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Private State
--------------------------------------------------------------------------------

local State = {

    initialized = false,
    repositoryRoot = nil

}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Configure Package Path
--------------------------------------------------------------------------------

local function ConfigurePackagePath()

    local paths = {

        State.repositoryRoot .. "/?.lua",
        State.repositoryRoot .. "/?/init.lua"

    }

    for _, modulePath in ipairs(paths) do

        if not package.path:find(modulePath, 1, true) then

            package.path =
                package.path
                .. ";"
                .. modulePath

        end

    end

    return true

end

--------------------------------------------------------------------------------
-- Prepare Environment
--------------------------------------------------------------------------------

local function PrepareEnvironment()

    return true

end

--------------------------------------------------------------------------------
-- Initialize Infrastructure
--------------------------------------------------------------------------------

local function InitializeInfrastructure()

    assert(
        ConfigurePackagePath(),
        "Unable to configure package path.")

    assert(
        PrepareEnvironment(),
        "Unable to prepare test environment.")

    return true

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Initialize
--------------------------------------------------------------------------------

function Bootstrap.Initialize(repositoryRoot)

    assert(
        type(repositoryRoot) == "string"
        and repositoryRoot ~= "",
        "A valid repository root is required.")

    if State.initialized then
        return true
    end

    State.repositoryRoot = repositoryRoot

    InitializeInfrastructure()

    State.initialized = true

    return true

end

--------------------------------------------------------------------------------
-- Is Initialized
--------------------------------------------------------------------------------

function Bootstrap.IsInitialized()

    return State.initialized

end

--------------------------------------------------------------------------------
-- Get Repository Root
--------------------------------------------------------------------------------

function Bootstrap.GetRepositoryRoot()

    return State.repositoryRoot

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return Bootstrap