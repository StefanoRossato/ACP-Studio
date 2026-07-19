------------------------------------------------------------------------------
-- Project      : ACP Studio
-- Test         : GUI-108 ViewManager Foundation
-- File         : Tests/GUI/GUI-108 ViewManager Foundation Test.lua
--
-- Purpose
-- -------
-- Certifies the behaviour introduced by the GUI-108 certification milestone.
--
-- Certification
-- -------------
-- GUI-108 : ViewManager Foundation
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

--------------------------------------------------------------------------------
-- Execute
--------------------------------------------------------------------------------

GuiTestSkeleton.Run({

    Id =
        "GUI-108",

    Name =
        "ViewManager Foundation Test",

    ModuleName =
        "Core.GUI.ViewManager",

    ModuleDisplayName =
        "ViewManager",

    OpenMessage =
        "Running ViewManager tests...",

    CloseMessage =
        "ViewManager tests completed.",

    OnCompleted = function(Test)

        ------------------------------------------------------------------------
        -- Initial State
        ------------------------------------------------------------------------

        ViewManager.Reset()

        ------------------------------------------------------------------------
        -- Dummy Views
        ------------------------------------------------------------------------

        local FirstView =
        {
            Id = "FIRST",

            EnterCount = 0,
            ExitCount = 0,
            RenderCount = 0,

            OnEnter = function(self)
                self.EnterCount = self.EnterCount + 1
            end,

            OnExit = function(self)
                self.ExitCount = self.ExitCount + 1
            end,

            Render = function(self)
                self.RenderCount = self.RenderCount + 1
            end
        }

        local SecondView =
        {
            Id = "SECOND",

            EnterCount = 0,
            ExitCount = 0,
            RenderCount = 0,

            OnEnter = function(self)
                self.EnterCount = self.EnterCount + 1
            end,

            OnExit = function(self)
                self.ExitCount = self.ExitCount + 1
            end,

            Render = function(self)
                self.RenderCount = self.RenderCount + 1
            end
        }

        ------------------------------------------------------------------------
        -- Register Views
        ------------------------------------------------------------------------

        ViewManager.Register(FirstView)
        ViewManager.Register(SecondView)

        Test.Pass("Views registered")

        ------------------------------------------------------------------------
        -- Activate First View
        ------------------------------------------------------------------------

        ViewManager.Activate("FIRST")

        assert(
            ViewManager.GetActive() == FirstView,
            "First view was not activated."
        )

        assert(
            FirstView.EnterCount == 1,
            "First view OnEnter() not executed."
        )

        assert(
            FirstView.ExitCount == 0,
            "First view exited unexpectedly."
        )

        Test.Pass("First view activated")

        ------------------------------------------------------------------------
        -- Switch View
        ------------------------------------------------------------------------

        ViewManager.Activate("SECOND")

        assert(
            ViewManager.GetActive() == SecondView,
            "Second view was not activated."
        )

        assert(
            FirstView.ExitCount == 1,
            "First view OnExit() not executed."
        )

        assert(
            SecondView.EnterCount == 1,
            "Second view OnEnter() not executed."
        )

        Test.Pass("View lifecycle verified")

        ------------------------------------------------------------------------
        -- Render Active View
        ------------------------------------------------------------------------

        ViewManager.Render()

        assert(
            FirstView.RenderCount == 0,
            "Inactive view should not be rendered."
        )

        assert(
            SecondView.RenderCount == 1,
            "Active view was not rendered."
        )

        Test.Pass("Active view rendered")

        ------------------------------------------------------------------------
        -- Deactivate View
        ------------------------------------------------------------------------

        ViewManager.Deactivate()

        assert(
            ViewManager.GetActive() == nil,
            "ViewManager should not have an active view."
        )

        assert(
            SecondView.ExitCount == 1,
            "Second view OnExit() not executed."
        )

        Test.Pass("View deactivated")

        ------------------------------------------------------------------------
        -- Reset Manager
        ------------------------------------------------------------------------

        ViewManager.Reset()

        assert(
            ViewManager.GetActive() == nil,
            "ViewManager reset failed."
        )

        Test.Pass("ViewManager reset")

    end

})