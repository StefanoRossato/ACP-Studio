------------------------------------------------------------------------------
-- GUI-103
-- Toolbar Actions Test
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
        "GUI-103",

    Name =
        "Toolbar Actions Test",

    ModuleName =
        "Core.GUI.Toolbar.Actions",

    ModuleDisplayName =
        "Toolbar Actions",

    OpenMessage =
        "Running Toolbar Actions tests...",

    CloseMessage =
        "Toolbar Actions tests completed.",

    OnCompleted = function(Test)

        ------------------------------------------------------------------------
        -- Dependencies
        ------------------------------------------------------------------------

        local Actions =
            require("Core.GUI.Toolbar.Actions")

        ------------------------------------------------------------------------
        -- Initialize
        ------------------------------------------------------------------------

        assert(
            Actions.Initialize,
            "Initialize() not implemented.")

        Actions.Initialize()

        assert(

            Actions.Get() ==
                Actions.Type.None,

            "Initialize failed."

        )

        Test.Pass("Actions initialized")

        ------------------------------------------------------------------------
        -- Set / Get
        ------------------------------------------------------------------------

        Actions.Set(
            Actions.Type.PrepareTrack)

        assert(

            Actions.Get() ==
                Actions.Type.PrepareTrack,

            "Set/Get failed."

        )

        Test.Pass("Action stored")

        ------------------------------------------------------------------------
        -- Clear
        ------------------------------------------------------------------------

        Actions.Clear()

        assert(

            Actions.Get() ==
                Actions.Type.None,

            "Clear failed."

        )

        Test.Pass("Action cleared")

        ------------------------------------------------------------------------
        -- Shutdown
        ------------------------------------------------------------------------

        assert(
            Actions.Shutdown,
            "Shutdown() not implemented.")

        Actions.Shutdown()

        assert(

            Actions.Get() ==
                Actions.Type.None,

            "Shutdown failed."

        )

        Test.Pass("Actions shutdown")

    end

})