--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : HomeView
-- Layer         : GUI
-- Purpose       : Default application view.
-- Specification : GUI-105
--------------------------------------------------------------------------------

local View =
    require("Core.GUI.Views.View")

local HomeView = {}

HomeView.__index = HomeView

setmetatable(
    HomeView,
    {
        __index = View
    })

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local TITLE =
    "ACP Studio"

local SUBTITLE =
    "Welcome"

local VERSION =
    "GUI-105"

local DESCRIPTION =
    "View Management Foundation"

--------------------------------------------------------------------------------
-- Private State
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function HomeView.New(context)

    local instance =
        View.New(context)

    setmetatable(
        instance,
        HomeView)

    return instance

end

--------------------------------------------------------------------------------

function HomeView:Initialize()

end

--------------------------------------------------------------------------------

function HomeView:Render()

    assert(
    self.Context,
    "HomeView.Context is nil")

reaper.ShowConsoleMsg(
    tostring(self.Context) .. "\n")
    
    reaper.ImGui_Text(
        self.Context,
        TITLE)

    reaper.ImGui_Separator(
        self.Context)

    reaper.ImGui_Text(
        self.Context,
        SUBTITLE)

    reaper.ImGui_Dummy(
        self.Context,
        0,
        8)

    reaper.ImGui_Text(
        self.Context,
        VERSION)

    reaper.ImGui_Text(
        self.Context,
        DESCRIPTION)

end

--------------------------------------------------------------------------------

function HomeView:Shutdown()

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return HomeView