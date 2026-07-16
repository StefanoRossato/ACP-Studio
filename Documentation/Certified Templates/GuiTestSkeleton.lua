----------------------------------------------------------------------
-- GUI-003 Basic Widgets Test.lua
--
-- GUI-003
-- Basic Widgets Test
----------------------------------------------------------------------

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
        Bootstrap.Initialize(RepositoryRoot),
        "Unable to initialize test infrastructure.")

end

InitializeTestEnvironment()

--------------------------------------------------------------------------------
-- Dependencies
--------------------------------------------------------------------------------

local GuiTestSkeleton =
    require("Tests.GUI.GuiTestSkeleton")

--------------------------------------------------------------------------------
-- Test
--------------------------------------------------------------------------------

local Test =
    GuiTestSkeleton.New(
        "ACP Monitor Test",
        "GUI-003"
    )

----------------------------------------------------------------------
-- Initialize
----------------------------------------------------------------------

function Test:OnInitialize()

end

----------------------------------------------------------------------
-- Render
----------------------------------------------------------------------

function Test:OnRender()

    reaper.ImGui_Text(
        self.Context,
        "GUI-003 - Basic Widgets Test")

    reaper.ImGui_Separator(
        self.Context)

    reaper.ImGui_Text(
        self.Context,
        "Text Widget")

    if reaper.ImGui_Button(
        self.Context,
        "Button Widget") then

    end

    reaper.ImGui_SameLine(
        self.Context)

    reaper.ImGui_Text(
        self.Context,
        "Button OK")

end

----------------------------------------------------------------------
-- Shutdown
----------------------------------------------------------------------

function Test:OnShutdown()

end

----------------------------------------------------------------------
-- Execute
----------------------------------------------------------------------

Test:Run()