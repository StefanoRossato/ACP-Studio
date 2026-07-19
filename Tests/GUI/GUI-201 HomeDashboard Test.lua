--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test         : GUI-201 HomeDashboard Test
-- File         : Tests/GUI/GUI-201 HomeDashboard Test.lua
--
-- Purpose
-- -------
-- Certifies the HomeDashboard graphical component.
--
-- Certification
-- -------------
-- GUI-201 : Home Dashboard Layout
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


    Bootstrap,
    RepositoryRoot =
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
    require(
        "Tests.GUI.Framework.GuiTestSkeleton"
    )


--------------------------------------------------------------------------------
-- Execute
--------------------------------------------------------------------------------

GuiTestSkeleton.Run({

    Id =
        "GUI-201",


    Name =
        "HomeDashboard Component Test",


    ModuleName =
        "Core.Application.Views.Home.Components.HomeDashboard",


    ModuleDisplayName =
        "Home Dashboard",


    OpenMessage =
        "Opening HomeDashboard test window...",


    CloseMessage =
        "Close the window to complete the test.",


    OnCompleted = function(Test)


        ------------------------------------------------------------------------
        -- Module
        ------------------------------------------------------------------------

        local HomeDashboard =
            require(
                "Core.Application.Views.Home.Components.HomeDashboard"
            )


        if not HomeDashboard then

            Test.Fail(
                "HomeDashboard module unavailable"
            )

            Test.Complete()

            return

        end


        Test.Pass(
            "HomeDashboard module loaded"
        )


        ------------------------------------------------------------------------
        -- API
        ------------------------------------------------------------------------

        if type(HomeDashboard.Render) ~= "function" then

            Test.Fail(
                "Render method missing"
            )

            Test.Complete()

            return

        end


        Test.Pass(
            "Render method available"
        )


        ------------------------------------------------------------------------
        -- Async GUI Test
        ------------------------------------------------------------------------

        Test.BeginAsync()


        local ctx =
            reaper.ImGui_CreateContext(
                "GUI-201 HomeDashboard Test"
            )


        local open =
            true


        local function RenderLoop()


            local visible


            visible,
            open =
                reaper.ImGui_Begin(
                    ctx,
                    "GUI-201 HomeDashboard Test",
                    true
                )


            if visible then


                HomeDashboard.Render(
                    ctx
                )


                reaper.ImGui_End(
                    ctx
                )

            end


            if open then

                reaper.defer(
                    RenderLoop
                )

            else


                Test.Pass(
                    "HomeDashboard rendered"
                )


                Test.Pass(
                    "HomeDashboard component certified"
                )


                Test.Complete()

            end


        end


        RenderLoop()


    end

})