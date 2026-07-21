--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : NavigationModel
-- Layer         : Application
-- Purpose       : Stores the application navigation state.
-- Specification : GUI-211
--------------------------------------------------------------------------------

local NavigationModel = {}

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function NavigationModel.New()

    return
    {
        CurrentViewId = nil,
        History = {},
        ForwardHistory = {}
    }

end

--------------------------------------------------------------------------------

return NavigationModel