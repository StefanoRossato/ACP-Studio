----------------------------------------------------------------------
-- ACP Studio
-- Bootstrap.lua
--
-- Component     : Bootstrap
-- Layer         : Test Infrastructure
-- Purpose       : Initialize the ACP Studio test infrastructure.
-- Specification : TST-001
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

local Bootstrap = {}

----------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Private State
----------------------------------------------------------------------
local State = {

    initialized   = false,
    repositoryRoot = nil

}
----------------------------------------------------------------------
-- Private Functions
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Resolve Repository Root
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Resolve Repository Root
----------------------------------------------------------------------

local function ResolveRepositoryRoot()

    State.repositoryRoot =
        reaper.GetResourcePath() .. "/Scripts/ACP Studio"

    return true

end

----------------------------------------------------------------------
-- Configure Package Path
----------------------------------------------------------------------

local function ConfigurePackagePath()

    if not State.repositoryRoot then
        return false
    end

    local repositoryPath =
        State.repositoryRoot .. "/?.lua"

    local repositoryInitPath =
        State.repositoryRoot .. "/?/init.lua"

    if not package.path:find(repositoryPath, 1, true) then

        package.path =
            package.path
            .. ";" .. repositoryPath
            .. ";" .. repositoryInitPath

    end

    return true

end

----------------------------------------------------------------------
-- Load Test Setup
----------------------------------------------------------------------

local function LoadTestSetup()

end

----------------------------------------------------------------------
-- Prepare Environment
----------------------------------------------------------------------

local function PrepareEnvironment()

end
----------------------------------------------------------------------
-- Public API
----------------------------------------------------------------------

function Bootstrap.Initialize()

    if not ResolveRepositoryRoot() then
        return false
    end

    if not ConfigurePackagePath() then
        return false
    end

    State.initialized = true

    return true

end

function Bootstrap.IsInitialized()

    return State.initialized

end



-----------------------------------------------------------------------

function Bootstrap.GetRepositoryRoot()

    return State.repositoryRoot

end
-----------------------------------------------------------------------

return Bootstrap