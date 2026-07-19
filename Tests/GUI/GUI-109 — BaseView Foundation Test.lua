------------------------------------------------------------------------------
-- Project      : ACP Studio
-- Test         : GUI-109 BaseView Foundation
-- File         : Tests/GUI/GUI-109 BaseView Foundation Test.lua
--
-- Purpose
-- -------
-- Certifies the behaviour introduced by the GUI-109 certification milestone.
--
-- Certification
-- -------------
-- GUI-109 : BaseView Foundation
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

local BaseView =
    require("Core.GUI.BaseView")

--------------------------------------------------------------------------------
-- Execute
--------------------------------------------------------------------------------

GuiTestSkeleton.Run({

    Id =
        "GUI-109",

    Name =
        "BaseView Foundation Test",

    ModuleName =
        "Core.GUI.BaseView",

    ModuleDisplayName =
        "BaseView",

    OpenMessage =
        "Running BaseView tests...",

    CloseMessage =
        "BaseView tests completed.",

    OnCompleted = function(Test)

        ------------------------------------------------------------------------
        -- Create View
        ------------------------------------------------------------------------

        local View =
            BaseView.New(
                "HOME",
                "Home")

        Test.Pass("View created")

        ------------------------------------------------------------------------
        -- Verify Identifier
        ------------------------------------------------------------------------

        assert(
            View.Id == "HOME",
            "Invalid view identifier."
        )

        Test.Pass("View identifier initialized")

        ------------------------------------------------------------------------
        -- Verify Title
        ------------------------------------------------------------------------

        assert(
            View.Title == "Home",
            "Invalid view title."
        )

        Test.Pass("View title initialized")

        ------------------------------------------------------------------------
        -- Verify Lifecycle
        ------------------------------------------------------------------------

        View:OnEnter()

        Test.Pass("OnEnter executed")

        View:Render()

        Test.Pass("Render executed")

        View:OnExit()

        Test.Pass("OnExit executed")

    end

})