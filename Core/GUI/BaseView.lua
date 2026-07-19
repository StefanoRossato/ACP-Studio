--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : BaseView
-- Layer         : GUI
-- Purpose       : Defines the common interface for all application views.
-- Specification : GUI-109
--------------------------------------------------------------------------------

local BaseView = {}

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function BaseView.New(id, title)

    local View =
    {
        Id = id,
        Title = title
    }

    setmetatable(
        View,
        {
            __index = BaseView
        })

    return View

end

--------------------------------------------------------------------------------
-- Lifecycle
--------------------------------------------------------------------------------

function BaseView:OnEnter()

end

function BaseView:OnExit()

end

function BaseView:Render()

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return BaseView