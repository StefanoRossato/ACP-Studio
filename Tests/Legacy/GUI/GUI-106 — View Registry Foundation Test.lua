------------------------------------------------------------------------------
-- GUI-106
-- View Registry Foundation Test
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
        "GUI-106",

    Name =
        "View Registry Foundation Test",

    ModuleName =
        "Core.GUI.ViewRegistry",

    ModuleDisplayName =
        "View Registry",

    OpenMessage =
        "Running View Registry tests...",

    CloseMessage =
        "View Registry tests completed.",

    OnCompleted = function(Test)

        ------------------------------------------------------------------------
        -- Dependencies
        ------------------------------------------------------------------------

        local ViewRegistry =
            require("Core.GUI.ViewRegistry")

        ------------------------------------------------------------------------
        -- Initialize
        ------------------------------------------------------------------------

        assert(
            ViewRegistry.Initialize,
            "Initialize() not implemented.")

        ViewRegistry.Initialize()

        assert(
            ViewRegistry.IsInitialized(),
            "Initialize failed.")

        Test.Pass(
            "Registry initialized")

        ------------------------------------------------------------------------
        -- Register Views
        ------------------------------------------------------------------------

        local home = {}
        local analysis = {}
        local results = {}

        ViewRegistry.Register(
            "Home",
            home)

        ViewRegistry.Register(
            "Analysis",
            analysis)

        ViewRegistry.Register(
            "Results",
            results)

        Test.Pass(
            "Views registered")

        ------------------------------------------------------------------------
        -- Exists
        ------------------------------------------------------------------------

        assert(
            ViewRegistry.Exists("Home"),
            "Home not registered.")

        assert(
            ViewRegistry.Exists("Analysis"),
            "Analysis not registered.")

        assert(
            ViewRegistry.Exists("Results"),
            "Results not registered.")

        Test.Pass(
            "Registry lookup")

        ------------------------------------------------------------------------
        -- Get
        ------------------------------------------------------------------------

        assert(
            ViewRegistry.Get("Home") == home,
            "Unable to retrieve Home.")

        assert(
            ViewRegistry.Get("Analysis") == analysis,
            "Unable to retrieve Analysis.")

        assert(
            ViewRegistry.Get("Results") == results,
            "Unable to retrieve Results.")

        Test.Pass(
            "Views retrieved")

        ------------------------------------------------------------------------
        -- Count
        ------------------------------------------------------------------------

        assert(
            ViewRegistry.Count() == 3,
            "Unexpected registry count.")

        Test.Pass(
            "Registry count")

        ------------------------------------------------------------------------
        -- Clear
        ------------------------------------------------------------------------

        ViewRegistry.Clear()

        assert(
            ViewRegistry.Count() == 0,
            "Registry not cleared.")

        Test.Pass(
            "Registry cleared")

        ------------------------------------------------------------------------
        -- Shutdown
        ------------------------------------------------------------------------

        ViewRegistry.Shutdown()

        assert(
            not ViewRegistry.IsInitialized(),
            "Shutdown failed.")

        Test.Pass(
            "Registry shutdown")

    end

})