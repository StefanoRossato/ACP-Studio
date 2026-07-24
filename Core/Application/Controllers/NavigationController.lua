local NavigationController = {}
NavigationController.__index = NavigationController

function NavigationController.new(navigationService)

    assert(navigationService, "NavigationService is required")

    local self = setmetatable({}, NavigationController)

    self.NavigationService = navigationService

    return self

end

function NavigationController:Navigate(viewId)

    return self.NavigationService:Navigate(viewId)

end

return NavigationController