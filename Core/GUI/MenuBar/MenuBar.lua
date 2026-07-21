--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : MenuBar
-- Layer         : GUI
-- Purpose       : Renders the application menu bar.
-- Specification : GUI-211
--------------------------------------------------------------------------------

local NavigationService =
    require("Core.Application.Navigation.NavigationService")

local ViewId =
    require("Core.Application.Navigation.ViewId")

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

        local selected

        selected =
            reaper.ImGui_MenuItem(
                context,
                "Exit"
            )

        if selected then
            -- TODO
            -- Application shutdown request.
        end

        reaper.ImGui_EndMenu(context)

    end

end

--------------------------------------------------------------------------------

local function RenderViewMenu(context)

    if reaper.ImGui_BeginMenu(context, MENU_VIEW) then

        local selected

        selected =
            reaper.ImGui_MenuItem(
                context,
                "Home"
            )

        if selected then
            NavigationService.Navigate(ViewId.Home)
        end

        selected =
            reaper.ImGui_MenuItem(
                context,
                "Analysis"
            )

        if selected then
            NavigationService.Navigate(ViewId.Analysis)
        end

        selected =
            reaper.ImGui_MenuItem(
                context,
                "Results"
            )

        if selected then
            NavigationService.Navigate(ViewId.Results)
        end

        reaper.ImGui_EndMenu(context)

    end

end

--------------------------------------------------------------------------------

local function RenderHelpMenu(context)

    if reaper.ImGui_BeginMenu(context, MENU_HELP) then

        reaper.ImGui_MenuItem(
            context,
            "About ACP Studio"
        )

        reaper.ImGui_EndMenu(context)

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

        reaper.ImGui_EndMenuBar(context)

    end

end

--------------------------------------------------------------------------------

function MenuBar.Shutdown()

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return MenuBar