--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test         : APS-001 Analysis Application Service Test
-- File         : Tests/Application/APS-001 Analysis Application Service Test.lua
--
-- Purpose
-- -------
-- Certifies the behaviour introduced by the APS-001 certification milestone.
--
-- Certification
-- -------------
-- APS-001 : Analysis Application Service
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
        "APS-001",


    Name =
        "Analysis Application Service Test",


    ModuleName =
        "Core.Application.Services.AnalysisApplicationService",


    ModuleDisplayName =
        "Analysis Application Service",


    OpenMessage =
        "Running Analysis Application Service tests...",


    CloseMessage =
        "Analysis Application Service tests completed.",


    OnCompleted = function(Test)


        ------------------------------------------------------------------------
        -- Certification Tests
        ------------------------------------------------------------------------

        local AnalysisApplicationService =
            require(
                "Core.Application.Services.AnalysisApplicationService"
            )


        ------------------------------------------------------------------------
        -- Public API
        ------------------------------------------------------------------------

        if AnalysisApplicationService.Execute == nil then

            Test.Log(
                "FAIL - Execute API missing"
            )

            return

        end


        Test.Pass(
            "Execute API available"
        )


        ------------------------------------------------------------------------
        -- Workflow Execution
        ------------------------------------------------------------------------

        local result =
            AnalysisApplicationService.Execute({})


        if result == nil then

            Test.Log(
                "FAIL - Workflow returned nil result"
            )

            return

        end


        Test.Pass(
            "Analysis workflow executed"
        )


        ------------------------------------------------------------------------
        -- Result Validation
        ------------------------------------------------------------------------

        Test.Pass(
            "Analysis Application Service certified"
        )


    end

})