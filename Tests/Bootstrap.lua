----------------------------------------------------------------------
-- ACP Studio
-- Bootstrap.lua
--
-- Component     : Test Bootstrap
-- Layer         : Tests
-- Purpose       : Test infrastructure bootstrap
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

local function ResolveRepositoryRoot()

    local source =
        debug.getinfo(1, "S").source

    if source:sub(1, 1) == "@" then
        source = source:sub(2)
    end

    local root =
        source:gsub("[/\\]Tests[/\\]Bootstrap%.lua$", "")

    if root == source then
        return false
    end

    State.repositoryRoot = root

    return true

end

----------------------------------------------------------------------
-- Configure Package Path
----------------------------------------------------------------------

local function ConfigurePackagePath()

    if not State.repositoryRoot then
        return false
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