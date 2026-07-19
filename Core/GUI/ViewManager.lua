--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ViewManager
-- Layer         : GUI
-- Purpose       : Manages the lifecycle of application views.
-- Specification : GUI-108
--------------------------------------------------------------------------------

local ViewManager = {}

--------------------------------------------------------------------------------
-- Private State
--------------------------------------------------------------------------------

local State =
{
    Views = {},
    ActiveView = nil
}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function ViewManager.Register(view)
    State.Views[view.Id] = view
end

function ViewManager.Activate(id)

    local view = State.Views[id]

    if not view then
        return
    end

    if State.ActiveView then
        State.ActiveView:OnExit()
    end

    State.ActiveView = view

    State.ActiveView:OnEnter()

end

function ViewManager.Deactivate()

    if not State.ActiveView then
        return
    end

    State.ActiveView:OnExit()

    State.ActiveView = nil

end

function ViewManager.GetActive()
    return State.ActiveView
end

function ViewManager.Render(context)

    if not State.ActiveView then
        return
    end

    State.ActiveView:Render(context)

end

function ViewManager.Reset()

    State.Views = {}
    State.ActiveView = nil

end
--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return ViewManager