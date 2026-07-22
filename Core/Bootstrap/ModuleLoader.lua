--------------------------------------------------------------------------------
-- ACP Studio
-- ModuleLoader
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Dependencies
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local EMPTY_REPOSITORY_ROOT = nil
local EMPTY_PACKAGE_PATH    = nil

local LUA_MODULE_PATTERN = "/?.lua"

--------------------------------------------------------------------------------
-- State
--------------------------------------------------------------------------------

local Module = {}

local State =
{
    RepositoryRoot = EMPTY_REPOSITORY_ROOT,
    OriginalPackagePath = EMPTY_PACKAGE_PATH
}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

local function ValidateRepositoryRoot(repositoryRoot)

    assert(repositoryRoot ~= nil,
        "Repository root cannot be nil.")

    assert(type(repositoryRoot) == "string",
        "Repository root must be a string.")

    assert(repositoryRoot ~= "",
        "Repository root cannot be empty.")

end

--------------------------------------------------------------------------------

local function BuildPackagePath(repositoryRoot)

    return repositoryRoot .. LUA_MODULE_PATTERN

end

--------------------------------------------------------------------------------

local function ConfigurePackagePath(repositoryRoot)

    if State.OriginalPackagePath == nil then
        State.OriginalPackagePath = package.path
    end

    local acpPackagePath = BuildPackagePath(repositoryRoot)

    if string.find(package.path, acpPackagePath, 1, true) then
        return
    end

    package.path = acpPackagePath .. ";" .. package.path

end

--------------------------------------------------------------------------------

local function RestorePackagePath()

    if State.OriginalPackagePath ~= nil then

        package.path = State.OriginalPackagePath
        State.OriginalPackagePath = EMPTY_PACKAGE_PATH

    end

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function Module.Initialize(repositoryRoot)

    ValidateRepositoryRoot(repositoryRoot)

    ConfigurePackagePath(repositoryRoot)

    State.RepositoryRoot = repositoryRoot

    return true

end

--------------------------------------------------------------------------------

function Module.Shutdown()

    RestorePackagePath()

    State.RepositoryRoot = EMPTY_REPOSITORY_ROOT

    return true

end

--------------------------------------------------------------------------------
-- Module Return
--------------------------------------------------------------------------------

return Module