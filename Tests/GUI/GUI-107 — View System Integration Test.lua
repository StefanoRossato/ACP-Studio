------------------------------------------------------------------------------
-- GUI-107
-- View System Integration Test
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
        "GUI-107",

    Name =
        "View System Integration Test",

    ModuleName =
        "Core.GUI.MainWindow",

    ModuleDisplayName =
        "MainWindow",

    OpenMessage =
        "Opening Main Window...",

    CloseMessage =
        "Close the window to complete the test.",

    OnCompleted = function(Test)

        ------------------------------------------------------------------------
        -- Dependencies
        ------------------------------------------------------------------------

        local MainWindow =
            require("Core.GUI.MainWindow")

        ------------------------------------------------------------------------
        -- Context
        ------------------------------------------------------------------------

        local Context =
            reaper.ImGui_CreateContext(
                "GUI-107")

        ------------------------------------------------------------------------
        -- Initialize
        ------------------------------------------------------------------------

        assert(
            MainWindow.Initialize,
            "Initialize() not implemented.")

        MainWindow.Initialize(
            Context)

        Test.Pass(
            "Main window initialized")

        ------------------------------------------------------------------------
        -- Execute
        ------------------------------------------------------------------------

        while MainWindow.Run() do

            reaper.defer(function() end)

        end

        Test.Pass(
            "Main window rendered")

        ------------------------------------------------------------------------
        -- Shutdown
        ------------------------------------------------------------------------

        MainWindow.Shutdown()

        Test.Pass(
            "Main window closed")

    end

})