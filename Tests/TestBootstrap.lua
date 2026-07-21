--------------------------------------------------------------------------------
-- ACP Studio
-- Test Bootstrap Loader
--------------------------------------------------------------------------------
-- Layer         : Test Infrastructure
-- Category      : Bootstrap
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Module Declaration
--------------------------------------------------------------------------------

local TestBootstrap = {}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

local function LoadBootstrap()

    local separator =
        package.config:sub(1, 1)

    local path =
        debug.getinfo(2, "S").source:match("@?(.*)")

    path =
        path:gsub("[/\\][^/\\]+$", "")

    while path ~= "" do

        local candidate =
            path
            .. separator
            .. "Bootstrap.lua"

        local file =
            io.open(candidate, "r")

        if file then

            file:close()

            local repositoryRoot =
                path:gsub(separator .. "Tests$", "")

            return
                dofile(candidate),
                repositoryRoot

        end

        local parent =
            path:gsub("[/\\][^/\\]+$", "")

        if parent == path then
            break
        end

        path = parent

    end

    error("Unable to locate Bootstrap.lua")

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function TestBootstrap.Initialize()

    local Bootstrap
    local RepositoryRoot

    Bootstrap,
    RepositoryRoot =
        LoadBootstrap()

    assert(
        Bootstrap.Initialize(RepositoryRoot),
        "Unable to initialize test infrastructure.")

end

--------------------------------------------------------------------------------
-- Module Return
--------------------------------------------------------------------------------

return TestBootstrap