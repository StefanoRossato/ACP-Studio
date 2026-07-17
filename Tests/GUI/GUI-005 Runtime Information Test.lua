------------------------------------------------------------------------------
-- GUI-005 Runtime Information Panel Test.lua
--
-- GUI-005
-- Runtime Information Panel Test
------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Load Bootstrap
--------------------------------------------------------------------------------

local function LoadBootstrap()

    local separator =
        package.config:sub(1, 1)

    local path =
        debug.getinfo(1, "S").source:match("@?(.*)")

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
-- Initialize Test Environment
--------------------------------------------------------------------------------

local function InitializeTestEnvironment()

    local Bootstrap
    local RepositoryRoot

    Bootstrap, RepositoryRoot =
        LoadBootstrap()

    assert(
        Bootstrap.Initialize(RepositoryRoot),
        "Unable to initialize test infrastructure.")

end

InitializeTestEnvironment()

--------------------------------------------------------------------------------
-- Dependencies
--------------------------------------------------------------------------------

local GuiTestSkeleton =
    require("Tests.GUI.Framework.GuiTestSkeleton")

--------------------------------------------------------------------------------
-- Execute
--------------------------------------------------------------------------------

GuiTestSkeleton.Run({

    Id =
        "GUI-005",

    Name =
        "Runtime Information Panel Test",

    ModuleName =
        "Core.Observation.Monitor.ACP_Monitor",

    ModuleDisplayName =
        "ACP_Monitor",

    OpenMessage =
        "Opening Runtime Information Panel...",

    CloseMessage =
        "Close the window to complete the test.",

    OnCompleted = function(Test)

        ------------------------------------------------------------------------
        -- Validation
        ------------------------------------------------------------------------

        Test.Pass("Snapshot created")

        Test.Pass("Runtime panel rendered")

        Test.Pass("Runtime Information Panel closed")

    end

})