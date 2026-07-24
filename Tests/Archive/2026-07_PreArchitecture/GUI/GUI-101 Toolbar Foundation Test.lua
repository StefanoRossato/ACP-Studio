------------------------------------------------------------------------------
-- ACP Studio
-- GUI-101
-- Toolbar Foundation Test
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Load Bootstrap
------------------------------------------------------------------------------

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

------------------------------------------------------------------------------
-- Initialize Test Environment
------------------------------------------------------------------------------

do

    local Bootstrap
    local RepositoryRoot

    Bootstrap,
    RepositoryRoot =
        LoadBootstrap()

    assert(

        Bootstrap.Initialize(
            RepositoryRoot),

        "Unable to initialize test infrastructure."

    )

end

------------------------------------------------------------------------------
-- Dependencies
------------------------------------------------------------------------------

local GuiTestSkeleton =
    require("Tests.GUI.Framework.GuiTestSkeleton")

------------------------------------------------------------------------------
-- Execute
------------------------------------------------------------------------------

GuiTestSkeleton.Run({

    --------------------------------------------------------------------------
    -- Test Information
    --------------------------------------------------------------------------

    Id =
        "GUI-101",

    Name =
        "Toolbar Foundation Test",

    --------------------------------------------------------------------------
    -- Module
    --------------------------------------------------------------------------

    ModuleName =
        "Core.GUI.Toolbar.Toolbar",

    ModuleDisplayName =
        "Toolbar",

    --------------------------------------------------------------------------
    -- Messages
    --------------------------------------------------------------------------

    OpenMessage =
        "Running Toolbar Foundation tests...",

    CloseMessage =
        "Toolbar Foundation tests completed.",

    --------------------------------------------------------------------------
    -- Test
    --------------------------------------------------------------------------

    OnCompleted = function(Test)

        ----------------------------------------------------------------------
        -- Dependencies
        ----------------------------------------------------------------------

        local Toolbar =
            require("Core.GUI.Toolbar.Toolbar")

        ----------------------------------------------------------------------
        -- Initialize
        ----------------------------------------------------------------------

        assert(

            type(Toolbar.Initialize)
                == "function",

            "Initialize() not found."

        )

        Toolbar.Initialize()

        Test.Pass(
            "Toolbar initialized")

        ----------------------------------------------------------------------
        -- Shutdown
        ----------------------------------------------------------------------

        assert(

            type(Toolbar.Shutdown)
                == "function",

            "Shutdown() not found."

        )

        Toolbar.Shutdown()

        Test.Pass(
            "Toolbar shutdown")

    end

})