------------------------------------------------------------------------------
-- ACP Studio
-- GUI-100
-- Main Window Foundation Test
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
        "GUI-100",

    Name =
        "Main Window Foundation Test",

    --------------------------------------------------------------------------
    -- Module
    --------------------------------------------------------------------------

    ModuleName =
        "Core.GUI.MainWindow",

    ModuleDisplayName =
        "Main Window",

    --------------------------------------------------------------------------
    -- Messages
    --------------------------------------------------------------------------

    OpenMessage =
        "Running Main Window tests...",

    CloseMessage =
        "Main Window tests completed.",

    --------------------------------------------------------------------------
    -- Test
    --------------------------------------------------------------------------

    OnCompleted = function(Test)

        ----------------------------------------------------------------------
        -- Dependencies
        ----------------------------------------------------------------------

        local MainWindow =
            require("Core.GUI.MainWindow")

        ----------------------------------------------------------------------
        -- Initialize
        ----------------------------------------------------------------------

        assert(

            type(MainWindow.Initialize)
                == "function",

            "Initialize() not found."

        )

        MainWindow.Initialize()

        Test.Pass(
            "MainWindow initialized")

        ----------------------------------------------------------------------
        -- Shutdown
        ----------------------------------------------------------------------

        assert(

            type(MainWindow.Shutdown)
                == "function",

            "Shutdown() not found."

        )

        MainWindow.Shutdown()

        Test.Pass(
            "MainWindow shutdown")

    end

})