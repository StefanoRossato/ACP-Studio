--------------------------------------------------------------------------------
-- ACP Studio
-- Execution Entry Point
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local PATH_SEPARATOR = package.config:sub(1, 1)

local LUA_SEARCH_PATTERN = "?.lua;"

local REPOSITORY_MARKERS =
{
    "Core",
    "Documentation",
    "Tests"
}

--------------------------------------------------------------------------------
-- Module
--------------------------------------------------------------------------------

local Module = {}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

local function NormalizePath(path)

    if path == nil then
        return nil
    end

    -- Remove Lua source prefix.
    path = path:gsub("^@", "")

    -- Normalize directory separators.
    path = path:gsub("[/\\]", PATH_SEPARATOR)

    -- Remove trailing separators.
    while path:sub(-1) == PATH_SEPARATOR do
        path = path:sub(1, -2)
    end

    return path

end

--------------------------------------------------------------------------------

local function GetParentDirectory(path)

    path = NormalizePath(path)

    if path == nil then
        return nil
    end

    local parentDirectory =
        path:match("^(.*)[/\\]")

    return parentDirectory

end

--------------------------------------------------------------------------------

local function DirectoryExists(path)

    if path == nil then
        return false
    end

    --------------------------------------------------------------------------
    -- Lua does not provide a portable directory API.
    -- os.rename(path, path) is intentionally used as the Engineering Foundation
    -- filesystem existence check.
    --------------------------------------------------------------------------

    local success =
        os.rename(path, path)

    return success ~= nil

end

--------------------------------------------------------------------------------

local function IsRepositoryRoot(path)

    for _, marker in ipairs(REPOSITORY_MARKERS) do

        local directory =
            path ..
            PATH_SEPARATOR ..
            marker

        if not DirectoryExists(directory) then
            return false
        end

    end

    return true

end

--------------------------------------------------------------------------------

local function LocateRepositoryRoot(scriptPath)

    local directory =
        GetParentDirectory(scriptPath)

    while directory ~= nil do

        if IsRepositoryRoot(directory) then
            return directory
        end

        directory =
            GetParentDirectory(directory)

    end

    return nil

end

--------------------------------------------------------------------------------

local function ConfigurePackagePath(repositoryRoot)

    if repositoryRoot == nil then
        return false
    end

    local searchPath =
        repositoryRoot ..
        PATH_SEPARATOR ..
        LUA_SEARCH_PATTERN

    if package.path:find(searchPath, 1, true) then
        return true
    end

    package.path =
        searchPath ..
        package.path

    return true

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function Module.Initialize(scriptPath)

    scriptPath =
        NormalizePath(scriptPath)

    if scriptPath == nil then
        return false
    end

    local repositoryRoot =
        LocateRepositoryRoot(scriptPath)

    if repositoryRoot == nil then
        return false
    end

    return ConfigurePackagePath(repositoryRoot)

end

--------------------------------------------------------------------------------
-- Module Return
--------------------------------------------------------------------------------

return Module