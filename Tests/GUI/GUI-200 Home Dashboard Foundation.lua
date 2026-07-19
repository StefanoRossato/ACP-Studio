--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test         : GUI-200 Home Dashboard Foundation
-- File         : Tests/GUI/GUI-200 Home Dashboard Foundation.lua
--
-- Purpose
-- -------
-- Certifies the HomeView foundation implementation.
--
-- Certification
-- -------------
-- GUI-200 : Home Dashboard Foundation
--------------------------------------------------------------------------------


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
        "GUI-200",


    Name =
        "Home Dashboard Foundation Test",


    ModuleName =
        "Core.Application.Views.Home.HomeView",


    ModuleDisplayName =
        "Home View",


    OpenMessage =
        "Running Home View tests...",


    CloseMessage =
        "Home View tests completed.",


    OnCompleted = function(Test)


        ------------------------------------------------------------------------
        -- Certification Tests
        ------------------------------------------------------------------------

        local HomeView =
            require(
                "Core.Application.Views.Home.HomeView"
            )


        if HomeView.New == nil then

            Test.Log(
                "FAIL - Constructor missing"
            )

            return

        end


        Test.Pass(
            "Constructor available"
        )


        local View =
            HomeView.New()


        if View == nil then

            Test.Log(
                "FAIL - View creation failed"
            )

            return

        end


        Test.Pass(
            "Home View created"
        )


        if View.Id ~= "Home" then

            Test.Log(
                "FAIL - Invalid View Id"
            )

            return

        end


        Test.Pass(
            "View identity validated"
        )

        View:OnEnter()

        Test.Pass(
            "Lifecycle OnEnter executed"
        )


        if type(View.Render) ~= "function" then

            Test.Log(
                "FAIL - Render method missing"
            )

            return

        end


        Test.Pass(
            "Render method available"
        )


        View:OnExit()

        Test.Pass(
            "Lifecycle OnExit executed"
        )


        Test.Pass(
            "Home View Foundation certified"
        )

    end

})