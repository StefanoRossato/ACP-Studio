--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : NavigationService
-- Layer         : Application
-- Purpose       : Coordinates application navigation.
-- Specification : GUI-211
--------------------------------------------------------------------------------

local NavigationModel =
    require("Core.Application.Navigation.NavigationModel")

local ViewId =
    require("Core.Application.Navigation.ViewId")

local NavigationService = {}

--------------------------------------------------------------------------------
-- Private State
--------------------------------------------------------------------------------

local State =
{
    Model = nil,
    ViewManager = nil
}

--------------------------------------------------------------------------------
-- Public Interface
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Initialize
--------------------------------------------------------------------------------

function NavigationService.Initialize(viewManager)

    assert(
        viewManager,
        "NavigationService.Initialize(): ViewManager is required."
    )

    State.Model =
        NavigationModel.New()

    State.ViewManager =
        viewManager

    State.Model.CurrentViewId =
        ViewId.Home

end

--------------------------------------------------------------------------------
-- Navigate
--------------------------------------------------------------------------------

function NavigationService.Navigate(viewId)

    assert(
        State.Model,
        "NavigationService is not initialized."
    )

    assert(
        State.ViewManager,
        "ViewManager is not available."
    )

    State.Model.CurrentViewId =
        viewId

    State.ViewManager.Activate(
        viewId
    )

end

--------------------------------------------------------------------------------
-- Current View
--------------------------------------------------------------------------------

function NavigationService.CurrentViewId()

    assert(
        State.Model,
        "NavigationService is not initialized."
    )

    return State.Model.CurrentViewId

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return NavigationService