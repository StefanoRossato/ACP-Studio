--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : MenuBar
-- Layer         : GUI
-- Purpose       : Renders the application menu bar.
-- Specification : GUI-210
--------------------------------------------------------------------------------

local MenuBar = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local MENU_FILE =
    "File"

local MENU_VIEW =
    "View"

local MENU_HELP =
    "Help"

--------------------------------------------------------------------------------
-- Private Rendering
--------------------------------------------------------------------------------

local function RenderFileMenu(context)

    if reaper.ImGui_BeginMenu(context, MENU_FILE) then

        reaper.ImGui_MenuItem(
            context,
            "Exit"
        )

        reaper.ImGui_EndMenu(
            context
        )

    end

end

--------------------------------------------------------------------------------

local function RenderViewMenu(context)

    if reaper.ImGui_BeginMenu(context, MENU_VIEW) then

        reaper.ImGui_MenuItem(
            context,
            "Home"
        )

        reaper.ImGui_MenuItem(
            context,
            "Analysis"
        )

        reaper.ImGui_MenuItem(
            context,
            "Results"
        )

        reaper.ImGui_EndMenu(
            context
        )

    end

end

--------------------------------------------------------------------------------

local function RenderHelpMenu(context)

    if reaper.ImGui_BeginMenu(context, MENU_HELP) then

        reaper.ImGui_MenuItem(
            context,
            "About ACP Studio"
        )

        reaper.ImGui_EndMenu(
            context
        )

    end

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function MenuBar.Initialize()

end

--------------------------------------------------------------------------------

function MenuBar.Render(context)

    if not context then
        return
    end

    if reaper.ImGui_BeginMenuBar(context) then

        RenderFileMenu(context)

        RenderViewMenu(context)

        RenderHelpMenu(context)

        reaper.ImGui_EndMenuBar(
            context
        )

    end

end

--------------------------------------------------------------------------------

function MenuBar.Shutdown()

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return MenuBar