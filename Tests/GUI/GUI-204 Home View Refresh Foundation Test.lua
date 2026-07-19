--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test         : GUI-204 Home View Refresh Foundation Test
-- File         : Tests/GUI/GUI-204 Home View Refresh Foundation Test.lua
--
-- Purpose
-- -------
-- Certifies the Home View refresh lifecycle.
--
-- Certification
-- -------------
-- GUI-204 : Home View Refresh Foundation
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
"Home View Refresh Foundation Test\n"
)

reaper.ShowConsoleMsg(
"GUI-204\n"
)

reaper.ShowConsoleMsg(
"========================================\n\n"
)

--------------------------------------------------------------------------------
-- Load Modules
--------------------------------------------------------------------------------

local HomeViewModel =
    require(
        "Core.Application.Views.Home.HomeViewModel"
    )

assert(HomeViewModel)

reaper.ShowConsoleMsg(
"PASS - HomeViewModel loaded\n"
)

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
-- Refresh Lifecycle
--------------------------------------------------------------------------------

View:OnEnter()

assert(View.PresentationModel)

reaper.ShowConsoleMsg(
"PASS - Presentation Model cached\n"
)

assert(View.PresentationModel.title)

reaper.ShowConsoleMsg(
"PASS - Refresh lifecycle executed\n\n"
)

--------------------------------------------------------------------------------
-- GUI Test
--------------------------------------------------------------------------------

local ctx =
    reaper.ImGui_CreateContext(
        "GUI-204"
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
        "GUI-204 PASSED\n"
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
            "GUI-204 Home View Refresh Foundation Test",
            true
        )

    if visible then

        View:Render(ctx)

        if not Certified then

            reaper.ShowConsoleMsg(
            "PASS - Home View rendered\n"
            )

            reaper.ShowConsoleMsg(
            "PASS - Presentation Model cache verified\n"
            )

            reaper.ShowConsoleMsg(
            "PASS - Refresh lifecycle verified\n"
            )

            Certified = true

        end

        reaper.ImGui_End(ctx)

    end

    reaper.defer(Main)

end

Main()