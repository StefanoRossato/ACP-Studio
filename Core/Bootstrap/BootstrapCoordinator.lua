--------------------------------------------------------------------------------
-- ACP Studio
-- BootstrapCoordinator
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Dependencies
--------------------------------------------------------------------------------

local RepositoryLocator =
    require("Core.Bootstrap.RepositoryLocator")

local ModuleLoader =
    require("Core.Bootstrap.ModuleLoader")

local ApplicationBootstrapper =
    require("Core.Application.ApplicationBootstrapper")

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local EMPTY_REPOSITORY_ROOT = nil

--------------------------------------------------------------------------------
-- State
--------------------------------------------------------------------------------

local Module = {}

local State =
{
    RepositoryRoot = EMPTY_REPOSITORY_ROOT
}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function Module.Initialize()

    RepositoryLocator.Initialize()

    State.RepositoryRoot =
        RepositoryLocator.GetRepositoryRoot()

    ModuleLoader.Initialize(
        State.RepositoryRoot)

    ApplicationBootstrapper.Initialize()

    return true

end

--------------------------------------------------------------------------------

function Module.Shutdown()

    if ApplicationBootstrapper.Shutdown then

        if not ApplicationBootstrapper.Shutdown() then
            return false
        end

    end

    if not ModuleLoader.Shutdown() then
        return false
    end

    if not RepositoryLocator.Shutdown() then
        return false
    end

    State.RepositoryRoot = EMPTY_REPOSITORY_ROOT

    return true

end

--------------------------------------------------------------------------------
-- Module Return
--------------------------------------------------------------------------------

return Module