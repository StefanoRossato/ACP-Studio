--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test         : GUI-207 Dashboard Data Binding Service Test
-- File         : Tests/GUI/GUI-207_DashboardDataBindingService_Test.lua
--
-- Purpose
-- -------
-- Certifies the Dashboard Data Binding Service foundation.
--
-- Certification
-- -------------
-- GUI-207 : Dashboard Data Binding Service Foundation
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
"Dashboard Data Binding Service Test\n"
)

reaper.ShowConsoleMsg(
"GUI-207\n"
)

reaper.ShowConsoleMsg(
"========================================\n\n"
)

--------------------------------------------------------------------------------
-- Load Service
--------------------------------------------------------------------------------

local DashboardDataBindingService =
    require(
        "Core.GUI.Dashboard.DashboardDataBindingService"
    )

assert(DashboardDataBindingService)

reaper.ShowConsoleMsg(
"PASS - DashboardDataBindingService loaded\n"
)

--------------------------------------------------------------------------------
-- Create Service
--------------------------------------------------------------------------------

local PresentationModel = {}

local Service =
    DashboardDataBindingService.Create(
        PresentationModel
    )

assert(Service)

reaper.ShowConsoleMsg(
"PASS - DashboardDataBindingService created\n"
)

--------------------------------------------------------------------------------
-- Verify Presentation Model
--------------------------------------------------------------------------------

assert(
    Service:GetPresentationModel() ==
    PresentationModel
)

reaper.ShowConsoleMsg(
"PASS - Presentation Model assigned\n"
)

--------------------------------------------------------------------------------
-- Verify Public API
--------------------------------------------------------------------------------

assert(
    type(Service.GetPresentationModel) == "function"
)

reaper.ShowConsoleMsg(
"PASS - Public API available\n\n"
)

--------------------------------------------------------------------------------
-- GUI Test
--------------------------------------------------------------------------------

local ctx =
    reaper.ImGui_CreateContext(
        "GUI-207"
    )

reaper.ShowConsoleMsg(
"Opening Dashboard Data Binding Integration Test...\n"
)

reaper.ShowConsoleMsg(
"Close the window to complete the test.\n\n"
)

local open = true
local Certified = false

local function Main()

    if not open then

        reaper.ShowConsoleMsg(
        "PASS - Dashboard Data Binding Service closed\n\n"
        )

        reaper.ShowConsoleMsg(
        "========================================\n"
        )

        reaper.ShowConsoleMsg(
        "GUI-207 PASSED\n"
        )

        reaper.ShowConsoleMsg(
        "========================================\n"
        )

        return

    end

    reaper.ImGui_SetNextWindowSize(
        ctx,
        700,
        250,
        reaper.ImGui_Cond_FirstUseEver()
    )

    local visible

    visible, open =
        reaper.ImGui_Begin(
            ctx,
            "GUI-207 Dashboard Data Binding Service Test",
            true
        )

    if visible then

        reaper.ImGui_Text(
            ctx,
            "Dashboard Data Binding Service Foundation"
        )

        reaper.ImGui_Separator(ctx)

        reaper.ImGui_Text(
            ctx,
            "Presentation Model successfully assigned."
        )

        if not Certified then

            reaper.ShowConsoleMsg(
            "PASS - Service instantiated\n"
            )

            reaper.ShowConsoleMsg(
            "PASS - Presentation Model binding verified\n"
            )

            reaper.ShowConsoleMsg(
            "PASS - Public API verified\n"
            )

            reaper.ShowConsoleMsg(
            "PASS - Dashboard Data Binding Service foundation verified\n"
            )

            Certified = true

        end

        reaper.ImGui_End(ctx)

    end

    reaper.defer(Main)

end

Main()