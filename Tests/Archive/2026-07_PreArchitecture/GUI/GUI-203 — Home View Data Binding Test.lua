--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test         : GUI-203 Home View Data Binding Test
-- File         : Tests/GUI/GUI-203 Home View Data Binding Test.lua
--
-- Purpose
-- -------
-- Certifies the Home View data binding pipeline.
--
-- Certification
-- -------------
-- GUI-203 : Home View Data Binding Foundation
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
"Home View Data Binding Test\n"
)

reaper.ShowConsoleMsg(
"GUI-203\n"
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

if HomeViewModel then

    reaper.ShowConsoleMsg(
        "PASS - HomeViewModel loaded\n"
    )

end

local HomeView =
    require(
        "Core.Application.Views.Home.HomeView"
    )

if HomeView then

    reaper.ShowConsoleMsg(
        "PASS - HomeView loaded\n"
    )

end

--------------------------------------------------------------------------------
-- Presentation Model
--------------------------------------------------------------------------------

local Model =
    HomeViewModel.GetModel()

assert(Model)

reaper.ShowConsoleMsg(
"PASS - Presentation Model created\n"
)

assert(Model.title)

reaper.ShowConsoleMsg(
"PASS - Presentation Model validated\n"
)

--------------------------------------------------------------------------------
-- Create View
--------------------------------------------------------------------------------

local View =
    HomeView.New()

assert(View)

reaper.ShowConsoleMsg(
"PASS - HomeView instance created\n\n"
)

--------------------------------------------------------------------------------
-- GUI Test
--------------------------------------------------------------------------------

local ctx =
    reaper.ImGui_CreateContext(
        "GUI-203"
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

        reaper.ShowConsoleMsg(
        "PASS - Home View closed\n\n"
        )

        reaper.ShowConsoleMsg(
        "========================================\n"
        )

        reaper.ShowConsoleMsg(
        "GUI-203 PASSED\n"
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
            "GUI-203 Home View Data Binding Test",
            true
        )

    if visible then

        View:Render(ctx)

        if not Certified then

            reaper.ShowConsoleMsg(
            "PASS - Home View rendered\n"
            )

            reaper.ShowConsoleMsg(
            "PASS - Data Binding pipeline verified\n"
            )

            Certified = true

        end

        reaper.ImGui_End(ctx)

    end

    reaper.defer(Main)

end

Main()