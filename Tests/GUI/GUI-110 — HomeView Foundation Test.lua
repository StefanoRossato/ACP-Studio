------------------------------------------------------------------------------
-- Project      : ACP Studio
-- Test         : GUI-110 HomeView Foundation
-- File         : Tests/GUI/GUI-110 HomeView Foundation Test.lua
--
-- Purpose
-- -------
-- Certifies the behaviour introduced by the GUI-110 certification milestone.
--
-- Certification
-- -------------
-- GUI-110 : HomeView Foundation
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

local HomeView =
    require("Core.GUI.Views.HomeView")

--------------------------------------------------------------------------------
-- Execute
--------------------------------------------------------------------------------

GuiTestSkeleton.Run({

    Id =
        "GUI-110",

    Name =
        "HomeView Foundation Test",

    ModuleName =
        "Core.GUI.Views.HomeView",

    ModuleDisplayName =
        "HomeView",

    OpenMessage =
        "Running HomeView tests...",

    CloseMessage =
        "HomeView tests completed.",

    OnCompleted = function(Test)

        ------------------------------------------------------------------------
        -- Verify Identity
        ------------------------------------------------------------------------

        assert(
            HomeView.Id == "HOME",
            "Invalid HomeView identifier."
        )

        Test.Pass("HomeView identifier initialized")

        ------------------------------------------------------------------------
        -- Verify Title
        ------------------------------------------------------------------------

        assert(
            HomeView.Title == "Home",
            "Invalid HomeView title."
        )

        Test.Pass("HomeView title initialized")

        ------------------------------------------------------------------------
        -- Verify Lifecycle
        ------------------------------------------------------------------------

        HomeView:OnEnter()

        Test.Pass("HomeView OnEnter executed")

        HomeView:Render()

        Test.Pass("HomeView Render executed")

        HomeView:OnExit()

        Test.Pass("HomeView OnExit executed")

    end

})