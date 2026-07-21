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

local Model = nil

--------------------------------------------------------------------------------
-- Public Interface
--------------------------------------------------------------------------------

function NavigationService.Initialize()

    Model = NavigationModel.New()

    Model.CurrentViewId = ViewId.Home

end

--------------------------------------------------------------------------------

function NavigationService.Navigate(viewId)

    Model.CurrentViewId = viewId

end

--------------------------------------------------------------------------------

function NavigationService.CurrentViewId()

    return Model.CurrentViewId

end

--------------------------------------------------------------------------------

return NavigationService