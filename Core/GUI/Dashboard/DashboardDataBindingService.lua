--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : DashboardDataBindingService
-- Layer         : GUI
-- Purpose       : Coordinates Dashboard data binding.
-- Specification : GUI-207
--------------------------------------------------------------------------------

local DashboardDataBindingService = {}

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function DashboardDataBindingService.Create(presentationModel)

    local self = {}

    ------------------------------------------------------------------------
    -- State
    ------------------------------------------------------------------------

    self.PresentationModel =
        presentationModel

    ------------------------------------------------------------------------
    -- Public Methods
    ------------------------------------------------------------------------

    function self:GetPresentationModel()

        return self.PresentationModel

    end

    return self

end

return DashboardDataBindingService