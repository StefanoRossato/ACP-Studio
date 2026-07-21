------------------------------------------------------------------------------
-- GUI-105
-- View Management Foundation Test
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
        "GUI-105",

    Name =
        "View Management Foundation Test",

    ModuleName =
        "Core.GUI.ViewManager",

    ModuleDisplayName =
        "ViewManager",

    OpenMessage =
        "Running View Management tests...",

    CloseMessage =
        "View Management tests completed.",

    OnCompleted = function(Test)

        ------------------------------------------------------------------------
        -- Dependencies
        ------------------------------------------------------------------------

        local ViewManager =
            require("Core.GUI.ViewManager")

        local HomeView =
            require("Core.GUI.Views.HomeView")

        ------------------------------------------------------------------------
        -- Context
        ------------------------------------------------------------------------

        local context =
            reaper.ImGui_CreateContext(
                "GUI-105 Test")

        ------------------------------------------------------------------------
        -- Initialize
        ------------------------------------------------------------------------

        assert(
            ViewManager.Initialize,
            "Initialize() not implemented.")

        ViewManager:Initialize(context)

        assert(
            ViewManager:IsInitialized(),
            "Initialize failed.")

        Test.Pass(
            "ViewManager initialized")

        ------------------------------------------------------------------------
        -- HomeView
        ------------------------------------------------------------------------

        assert(
            HomeView.New,
            "New() not implemented.")

        local home =
            HomeView:New(context)

        assert(
            home ~= nil,
            "Unable to create HomeView.")

        Test.Pass(
            "HomeView created")

        ------------------------------------------------------------------------
        -- SetView
        ------------------------------------------------------------------------

        assert(
            ViewManager.SetView,
            "SetView() not implemented.")

        ViewManager:SetView(home)

        assert(
            ViewManager:HasView(),
            "SetView failed.")

        Test.Pass(
            "Active view set")

        ------------------------------------------------------------------------
        -- GetView
        ------------------------------------------------------------------------

        local activeView =
            ViewManager:GetView()

        assert(
            activeView == home,
            "GetView failed.")

        Test.Pass(
            "Active view retrieved")

        ------------------------------------------------------------------------
        -- Shutdown
        ------------------------------------------------------------------------

        assert(
            ViewManager.Shutdown,
            "Shutdown() not implemented.")

        ViewManager:Shutdown()

        assert(
            not ViewManager:IsInitialized(),
            "Shutdown failed.")

        assert(
            not ViewManager:HasView(),
            "Active view not released.")

        Test.Pass(
            "ViewManager shutdown")

    end

})