local Test = BaseTestSkeleton.new("GUI-214 NavigationController")

local NavigationController = require("Core.Application.Navigation.NavigationController")

local Service = {}

Service.Called = false
Service.ViewId = nil

function Service:Navigate(viewId)

    self.Called = true
    self.ViewId = viewId

    return true

end

function Test:Run()

    self:Banner()

    local Controller = NavigationController.new(Service)

    if Controller then
        self:Pass("Controller created.")
    else
        self:Fail("Controller creation failed.")
    end

    local Result = Controller:Navigate("Home")

    if Service.Called then
        self:Pass("NavigationService invoked.")
    else
        self:Fail("NavigationService not invoked.")
    end

    if Service.ViewId == "Home" then
        self:Pass("View identifier forwarded.")
    else
        self:Fail("Unexpected View identifier.")
    end

    if Result == true then
        self:Pass("Navigation result propagated.")
    else
        self:Fail("Navigation result not propagated.")
    end

    self:Pass("Test environment shutdown.")

    self:Complete()

end

return Test