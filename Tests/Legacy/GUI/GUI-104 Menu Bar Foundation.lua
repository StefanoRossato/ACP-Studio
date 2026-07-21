------------------------------------------------------------------------------
-- GUI-104
-- Menu Bar Foundation Test
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

        Bootstrap.Initialize(
            RepositoryRoot),

        "Unable to initialize test infrastructure."

    )

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
        "GUI-104",

    Name =
        "Menu Bar Foundation Test",

    ModuleName =
        "Core.GUI.MenuBar.MenuBar",

    ModuleDisplayName =
        "Menu Bar",

    OpenMessage =
        "Running Menu Bar tests...",

    CloseMessage =
        "Menu Bar tests completed.",

    OnCompleted = function(Test)

        ------------------------------------------------------------------------
        -- Dependencies
        ------------------------------------------------------------------------

        local MenuBar =
            require("Core.GUI.MenuBar.MenuBar")

        local window = {}

        ------------------------------------------------------------------------
        -- Initialize
        ------------------------------------------------------------------------

        assert(
            MenuBar.Initialize,
            "Initialize() not implemented.")

        MenuBar.Initialize(window)

        assert(
            MenuBar.IsInitialized(),
            "Initialize failed.")

        Test.Pass("MenuBar initialized")

        ------------------------------------------------------------------------
        -- IsInitialized
        ------------------------------------------------------------------------

        assert(
            MenuBar.IsInitialized(),
            "IsInitialized failed.")

        Test.Pass("MenuBar reports initialized")

        ------------------------------------------------------------------------
        -- AddMenu
        ------------------------------------------------------------------------

        assert(
            MenuBar.AddMenu,
            "AddMenu() not implemented.")

        MenuBar.AddMenu("File")

        Test.Pass("Menu registered")

        ------------------------------------------------------------------------
        -- GetMenu
        ------------------------------------------------------------------------

        local menu =
            MenuBar.GetMenu("File")

        assert(
            menu ~= nil,
            "GetMenu failed.")

        Test.Pass("Menu retrieved")

        ------------------------------------------------------------------------
        -- Shutdown
        ------------------------------------------------------------------------

        assert(
            MenuBar.Shutdown,
            "Shutdown() not implemented.")

        MenuBar.Shutdown()

        assert(
            not MenuBar.IsInitialized(),
            "Shutdown failed.")

        Test.Pass("MenuBar shutdown")

    end

})