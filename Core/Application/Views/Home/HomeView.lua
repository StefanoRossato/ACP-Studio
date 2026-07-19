--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : HomeView
-- Layer         : Application
-- Purpose       : Defines the application home view.
-- Specification : GUI-200
--------------------------------------------------------------------------------


local BaseView =
    require("Core.GUI.BaseView")


local HomeView = {}

local BaseView =
    require("Core.GUI.BaseView")

local HomeHeader =
    require("Core.Application.Views.Home.Components.HomeHeader")

local HomeWelcome =
    require("Core.Application.Views.Home.Components.HomeWelcome")

local HomeDashboard =
    require("Core.Application.Views.Home.Components.HomeDashboard")

local HomeWorkspace =
    require("Core.Application.Views.Home.Components.HomeWorkspace")

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function HomeView.New()

    local View =
        BaseView.New(
            "Home",
            "Home"
        )


    setmetatable(
        View,
        {
            __index = HomeView
        }
    )


    return View

end


--------------------------------------------------------------------------------
-- Lifecycle
--------------------------------------------------------------------------------

function HomeView:OnEnter()

    ------------------------------------------------------------------------
    -- View activation
    ------------------------------------------------------------------------

end


function HomeView:OnExit()

    ------------------------------------------------------------------------
    -- View deactivation
    ------------------------------------------------------------------------

end


--------------------------------------------------------------------------------
-- Rendering
--------------------------------------------------------------------------------

function HomeView:Render(ctx)

    HomeHeader.Render(ctx)

    HomeWelcome.Render(ctx)

    HomeDashboard.Render(ctx)

    HomeWorkspace.Render(ctx)

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return HomeView