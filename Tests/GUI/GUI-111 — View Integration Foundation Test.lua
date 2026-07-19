------------------------------------------------------------------------------
-- Project      : ACP Studio
-- Test         : GUI-111 View Integration Foundation
-- File         : Tests/GUI/GUI-111 — View Integration Foundation Test.lua
--
-- Purpose
-- -------
-- Certifies the integration of the View Framework.
--
-- Certification
-- -------------
-- GUI-111 : View Integration Foundation
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

local ViewManager =
    require("Core.GUI.ViewManager")

local HomeView =
    require("Core.GUI.Views.HomeView")

--------------------------------------------------------------------------------
-- Execute
--------------------------------------------------------------------------------

GuiTestSkeleton.Run({

    Id =
        "GUI-111",

    Name =
        "View Integration Foundation Test",

    ModuleName =
        "Core.GUI.ViewManager",


    ModuleDisplayName =
        "View Framework",

    OpenMessage =
        "Running integration test...",

    CloseMessage =
        "Integration test completed.",

    OnCompleted = function(Test)

        ------------------------------------------------------------------------
        -- Reset
        ------------------------------------------------------------------------

        ViewManager.Reset()

        Test.Pass("ViewManager reset")

        ------------------------------------------------------------------------
        -- Register
        ------------------------------------------------------------------------

        ViewManager.Register(HomeView)

        Test.Pass("HomeView registered")

        ------------------------------------------------------------------------
        -- Activate
        ------------------------------------------------------------------------

        ViewManager.Activate("HOME")

        Test.Pass("HomeView activated")

        ------------------------------------------------------------------------
        -- Verify Active View
        ------------------------------------------------------------------------

        assert(
            ViewManager.GetActive() == HomeView,
            "Unexpected active view."
        )

        Test.Pass("Active view verified")

        ------------------------------------------------------------------------
        -- Render
        ------------------------------------------------------------------------

        ViewManager.Render()

        Test.Pass("HomeView rendered")

        ------------------------------------------------------------------------
        -- Deactivate
        ------------------------------------------------------------------------

        ViewManager.Deactivate()

        Test.Pass("HomeView deactivated")

        ------------------------------------------------------------------------
        -- Verify Final State
        ------------------------------------------------------------------------

        assert(
            ViewManager.GetActive() == nil,
            "Expected no active view."
        )

        Test.Pass("No active view")

    end

})