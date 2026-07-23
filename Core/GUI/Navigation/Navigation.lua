--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : Navigation
-- Layer         : GUI
-- Purpose       : Renders application navigation controls.
-- Specification : GUI-211
--------------------------------------------------------------------------------

local NavigationService =
    require("Core.Application.Navigation.NavigationService")

local ViewId =
    require("Core.Application.Navigation.ViewId")


local Navigation = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local NAVIGATION_ID =
    "Navigation"


--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Returns true if the requested view is active.
--------------------------------------------------------------------------------

local function IsActive(viewId)

    return NavigationService.CurrentViewId()
        == viewId

end

--------------------------------------------------------------------------------
-- Applies active button style.
--------------------------------------------------------------------------------

local function BeginActiveStyle(context, viewId)

    if IsActive(viewId) then

        reaper.ImGui_PushStyleColor(
            context,
            reaper.ImGui_Col_Button(),
            0x4A6FA5FF
        )

        return true

    end

    return false

end


local function EndActiveStyle(context, pushed)

    if pushed then

        reaper.ImGui_PopStyleColor(
            context
        )

    end

end


--------------------------------------------------------------------------------
-- Renders a navigation button.
--------------------------------------------------------------------------------

local function RenderButton(context, label, viewId)

    local pushed =
        BeginActiveStyle(
            context,
            viewId
        )


    if reaper.ImGui_Button(
        context,
        label
    ) then

        NavigationService.Navigate(
            viewId
        )

    end


    EndActiveStyle(
        context,
        pushed
    )

end


--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Render
--------------------------------------------------------------------------------

function Navigation.Render(context)

    reaper.ImGui_BeginChild(
        context,
        NAVIGATION_ID,
        0,
        40,
        0
    )


    --------------------------------------------------------------------------
    -- Navigation Buttons
    --------------------------------------------------------------------------

    RenderButton(
        context,
        "Home",
        ViewId.Home
    )


    reaper.ImGui_SameLine(
        context
    )


    RenderButton(
        context,
        "Analysis",
        ViewId.Analysis
    )


    reaper.ImGui_SameLine(
        context
    )


    RenderButton(
        context,
        "Results",
        ViewId.Results
    )


    reaper.ImGui_EndChild(
        context
    )

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return Navigation