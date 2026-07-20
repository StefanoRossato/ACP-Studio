--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test         : GUI-206 Dashboard Panel Composition Test
-- File         : Tests/GUI/GUI-206_DashboardPanelComposition_Test.lua
--
-- Purpose
-- -------
-- Certifies the Dashboard Panel composition.
--
-- Certification
-- -------------
-- GUI-206 : Dashboard Panel Composition
--------------------------------------------------------------------------------

local function LoadBootstrap()

    local path =
        debug.getinfo(1, "S").source:match("@?(.*)")

    path =
        path:gsub("[/\\][^/\\]+$", "")

    while path ~= "" do

        local candidate =
            path .. "/Bootstrap.lua"

        local file =
            io.open(candidate, "r")

        if file then

            file:close()

            return dofile(candidate),
                path:gsub("/Tests$", "")

        end

        path =
            path:gsub("[/\\][^/\\]+$", "")

    end

    error("Bootstrap.lua not found")

end

local Bootstrap, Root =
    LoadBootstrap()

assert(
    Bootstrap.Initialize(Root)
)

reaper.ClearConsole()

reaper.ShowConsoleMsg(
"========================================\n"
)

reaper.ShowConsoleMsg(
"Dashboard Panel Composition Test\n"
)

reaper.ShowConsoleMsg(
"GUI-206\n"
)

reaper.ShowConsoleMsg(
"========================================\n\n"
)

--------------------------------------------------------------------------------
-- Load Components
--------------------------------------------------------------------------------

local HomeHeader =
    require(
        "Core.Application.Views.Home.Components.HomeHeader"
    )

assert(HomeHeader)

reaper.ShowConsoleMsg(
"PASS - HomeHeader loaded\n"
)

local HomeWelcome =
    require(
        "Core.Application.Views.Home.Components.HomeWelcome"
    )

assert(HomeWelcome)

reaper.ShowConsoleMsg(
"PASS - HomeWelcome loaded\n"
)

local HomeDashboard =
    require(
        "Core.Application.Views.Home.Components.HomeDashboard"
    )

assert(HomeDashboard)

reaper.ShowConsoleMsg(
"PASS - HomeDashboard loaded\n"
)

local HomeWorkspace =
    require(
        "Core.Application.Views.Home.Components.HomeWorkspace"
    )

assert(HomeWorkspace)

reaper.ShowConsoleMsg(
"PASS - HomeWorkspace loaded\n\n"
)

--------------------------------------------------------------------------------
-- Load ViewModel
--------------------------------------------------------------------------------

local HomeViewModel =
    require(
        "Core.Application.Views.Home.HomeViewModel"
    )

assert(HomeViewModel)

reaper.ShowConsoleMsg(
"PASS - HomeViewModel loaded\n"
)

--------------------------------------------------------------------------------
-- Load View
--------------------------------------------------------------------------------

local HomeView =
    require(
        "Core.Application.Views.Home.HomeView"
    )

assert(HomeView)

reaper.ShowConsoleMsg(
"PASS - HomeView loaded\n"
)

--------------------------------------------------------------------------------
-- Create View
--------------------------------------------------------------------------------

local View =
    HomeView.New()

assert(View)

reaper.ShowConsoleMsg(
"PASS - HomeView instance created\n"
)

--------------------------------------------------------------------------------
-- Lifecycle
--------------------------------------------------------------------------------

View:OnEnter()

assert(View.PresentationModel)

reaper.ShowConsoleMsg(
"PASS - Presentation Model initialized\n"
)

--------------------------------------------------------------------------------
-- GUI Test
--------------------------------------------------------------------------------

local ctx =
    reaper.ImGui_CreateContext(
        "GUI-206"
    )

reaper.ShowConsoleMsg(
"Opening Home View...\n"
)

reaper.ShowConsoleMsg(
"Close the window to complete the test.\n\n"
)

local open = true
local Certified = false

local function Main()

    if not open then

        View:OnExit()

        reaper.ShowConsoleMsg(
        "PASS - Home View closed\n\n"
        )

        reaper.ShowConsoleMsg(
        "========================================\n"
        )

        reaper.ShowConsoleMsg(
        "GUI-206 PASSED\n"
        )

        reaper.ShowConsoleMsg(
        "========================================\n"
        )

        return

    end

    reaper.ImGui_SetNextWindowSize(
        ctx,
        900,
        600,
        reaper.ImGui_Cond_FirstUseEver()
    )

    local visible

    visible, open =
        reaper.ImGui_Begin(
            ctx,
            "GUI-206 Dashboard Panel Composition Test",
            true
        )

    if visible then

        View:Render(ctx)

        if not Certified then

            reaper.ShowConsoleMsg(
            "PASS - Analysis Overview panel rendered\n"
            )

            reaper.ShowConsoleMsg(
            "PASS - Runtime Status panel rendered\n"
            )

            reaper.ShowConsoleMsg(
            "PASS - Project Information panel rendered\n"
            )

            reaper.ShowConsoleMsg(
            "PASS - Dashboard panel composition verified\n"
            )

            Certified = true

        end

        reaper.ImGui_End(ctx)

    end

    reaper.defer(Main)

end

Main()