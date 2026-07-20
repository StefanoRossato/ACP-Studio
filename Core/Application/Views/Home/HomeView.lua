--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : HomeView
-- Layer         : Application
-- Purpose       : Defines the application home view.
-- Specification : GUI-204
--------------------------------------------------------------------------------

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

local HomeViewModel =
    require("Core.Application.Views.Home.HomeViewModel")

local DashboardDataBindingService =
    require("Core.GUI.Dashboard.DashboardDataBindingService")

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function HomeView.New()

    local View =
        BaseView.New(
            "Home",
            "Home"
        )

    ------------------------------------------------------------------------
    -- State
    ------------------------------------------------------------------------

    View.PresentationModel= nil

    setmetatable(
        View,
        {
            __index = HomeView
        }
    )

    return View

end

--------------------------------------------------------------------------------
-- Refresh
--------------------------------------------------------------------------------

function HomeView:RefreshModel()

    HomeViewModel.Refresh()

    self.PresentationModel =
        HomeViewModel.GetModel()

end

--------------------------------------------------------------------------------
-- Lifecycle
--------------------------------------------------------------------------------

function HomeView:OnEnter()

    self:RefreshModel()

    self.DataBindingService =
        DashboardDataBindingService.Create(
            self.PresentationModel
        )

end

function HomeView:OnExit()

    self.PresentationModel = nil

end

--------------------------------------------------------------------------------
-- Rendering
--------------------------------------------------------------------------------

function HomeView:Render(ctx)

    if not self.PresentationModel then
        return
    end

    HomeHeader.Render(ctx, self.PresentationModel)
    HomeWelcome.Render(ctx, self.PresentationModel)
    HomeDashboard.Render(ctx, self.PresentationModel)
    HomeWorkspace.Render(ctx, self.PresentationModel)

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return HomeView