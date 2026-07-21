--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test         : GUI-201 AnalysisOverviewPanel Test
-- File         : Tests/GUI/GUI-201 AnalysisOverviewPanel Test.lua
--
-- Purpose
-- -------
-- Certifies the AnalysisOverviewPanel graphical component.
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
        "AnalysisOverviewPanel Test",


    ModuleName =
        "Core.Application.Views.Home.Panels.AnalysisOverviewPanel",


    ModuleDisplayName =
        "Analysis Overview Panel",


    OpenMessage =
        "Opening AnalysisOverviewPanel test window...",


    CloseMessage =
        "Close the window to complete the test.",


    OnCompleted = function(Test)


        ------------------------------------------------------------------------
        -- Module
        ------------------------------------------------------------------------

        local AnalysisOverviewPanel =
            require(
                "Core.Application.Views.Home.Panels.AnalysisOverviewPanel"
            )


        if not AnalysisOverviewPanel then

            Test.Fail(
                "AnalysisOverviewPanel module unavailable"
            )

            Test.Complete()

            return

        end


        Test.Pass(
            "AnalysisOverviewPanel module loaded"
        )


        ------------------------------------------------------------------------
        -- API
        ------------------------------------------------------------------------

        if type(AnalysisOverviewPanel.Render) ~= "function" then

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
                "GUI-201 AnalysisOverviewPanel Test"
            )


        local open =
            true


        local function RenderLoop()


            local visible


            visible,
            open =
                reaper.ImGui_Begin(
                    ctx,
                    "GUI-201 AnalysisOverviewPanel Test",
                    true
                )


            if visible then


                AnalysisOverviewPanel.Render(
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
                    "AnalysisOverviewPanel rendered"
                )


                Test.Pass(
                    "AnalysisOverviewPanel component certified"
                )


                Test.Complete()

            end


        end


        RenderLoop()


    end

})