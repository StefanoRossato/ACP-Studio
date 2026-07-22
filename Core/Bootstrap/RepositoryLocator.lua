--------------------------------------------------------------------------------
-- ACP Studio
-- RepositoryLocator
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Dependencies
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local EMPTY_REPOSITORY_ROOT = nil

local REPOSITORY_MARKERS =
{
    "Core",
    "Documentation",
    "Tests"
}

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

local function GetCurrentDirectory()

    local info =
        debug.getinfo(1, "S")

    if info == nil then
        return nil
    end

    if info.source == nil then
        return nil
    end

    local source = info.source

    -- Lua prefixes file sources with '@'.
    if source:sub(1, 1) == "@" then
        source = source:sub(2)
    end

    local directory =
        source:match("^(.*)/")

    return directory

end

--------------------------------------------------------------------------------

local function GetParentDirectory(path)

    if type(path) ~= "string" then
        return nil
    end

    if path == "" then
        return nil
    end

    -- Filesystem root
    if path == "/" then
        return nil
    end

    -- Remove trailing separator
    if path:sub(-1) == "/" then
        path = path:sub(1, -2)
    end

    local parent =
        path:match("^(.*)/[^/]+$")

    if parent == nil then
        return nil
    end

    if parent == "" then
        return "/"
    end

    return parent

end

--------------------------------------------------------------------------------

local function DirectoryExists(path)

    if type(path) ~= "string" then
        return false
    end

    if path == "" then
        return false
    end

    local success =
        os.rename(path, path)

    return success ~= nil

end

--------------------------------------------------------------------------------

local function IsRepositoryRoot(path)

    if not DirectoryExists(path) then
        return false
    end

    for _, marker in ipairs(REPOSITORY_MARKERS) do

        local markerPath =
            path .. "/" .. marker

        if not DirectoryExists(markerPath) then
            return false
        end

    end

    return true

end

--------------------------------------------------------------------------------

local function LocateRepositoryRoot()

    local current =
        GetCurrentDirectory()

    if current == nil then
        return nil
    end

    while current ~= nil do

        if IsRepositoryRoot(current) then
            return current
        end

        current =
            GetParentDirectory(current)

    end

    return nil

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function Module.Initialize()

    if State.RepositoryRoot ~= nil then
        return true
    end

    State.RepositoryRoot =
        LocateRepositoryRoot()

    return State.RepositoryRoot ~= nil

end

--------------------------------------------------------------------------------

function Module.GetRepositoryRoot()

    return State.RepositoryRoot

end

--------------------------------------------------------------------------------

function Module.Shutdown()

    State.RepositoryRoot =
        EMPTY_REPOSITORY_ROOT

    return true

end

--------------------------------------------------------------------------------
-- Module Return
--------------------------------------------------------------------------------

return Module