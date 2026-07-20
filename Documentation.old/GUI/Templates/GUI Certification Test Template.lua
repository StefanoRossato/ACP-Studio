------------------------------------------------------------------------------
-- Project      : ACP Studio
-- Test         : GUI-104 Menu Bar Foundation
-- File         : Tests/GUI/GUI-104 Menu Bar Foundation.lua
--
-- Purpose
-- -------
-- Certifies the behaviour introduced by the GUI-104 certification milestone.
--
-- Certification
-- -------------
-- GUI-104 : Menu Bar Foundation
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

local MenuBar =
    require("Core.GUI.MenuBar.MenuBar")

--------------------------------------------------------------------------------
-- Execute
--------------------------------------------------------------------------------

GuiTestSkeleton.Run({

    Id =
        "GUI-104",

    Name =
        "Menu Bar Foundation Test",

    ModuleName =
        "Core.GUI.MenuBar.MenuBar",

    ModuleDisplayName =
        "Menu Bar",

    OpenMessage =
        "Running Menu Bar tests...",

    CloseMessage =
        "Menu Bar tests completed.",

    OnCompleted = function(Test)

        ------------------------------------------------------------------------
        -- Certification Tests
        ------------------------------------------------------------------------

    end

})