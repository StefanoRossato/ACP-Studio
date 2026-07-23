--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ViewManager
-- Layer         : GUI
-- Purpose       : Manages registered application views.
-- Specification : GUI-212
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
-- Public API
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Register
--------------------------------------------------------------------------------

function ViewManager.Register(view)

    assert(
        view,
        "ViewManager.Register(): view is nil."
    )

    assert(
        view.Id,
        "ViewManager.Register(): view id is missing."
    )


    view:Initialize()


    State.Views[view.Id] =
        view

end


--------------------------------------------------------------------------------
-- Activate
--------------------------------------------------------------------------------

function ViewManager.Activate(viewId)

    local view =
        State.Views[viewId]

    if not view then
        return false
    end


    if State.ActiveView then

        State.ActiveView:OnExit()

    end


    State.ActiveView =
        view


    State.ActiveView:OnEnter()


    return true

end


--------------------------------------------------------------------------------
-- Deactivate
--------------------------------------------------------------------------------

function ViewManager.Deactivate()

    if not State.ActiveView then
        return
    end


    State.ActiveView:OnExit()

    State.ActiveView = nil

end


--------------------------------------------------------------------------------
-- Get Active View
--------------------------------------------------------------------------------

function ViewManager.GetActive()

    return State.ActiveView

end


--------------------------------------------------------------------------------
-- Render
--------------------------------------------------------------------------------

function ViewManager.Render(context)

    if not State.ActiveView then
        return
    end


    State.ActiveView:Render(
        context
    )

end


--------------------------------------------------------------------------------
-- Get View
--------------------------------------------------------------------------------

function ViewManager.Get(viewId)

    return State.Views[viewId]

end


--------------------------------------------------------------------------------
-- Reset
--------------------------------------------------------------------------------

function ViewManager.Reset()

    for _, view in pairs(State.Views) do

        view:Shutdown()

    end


    State.Views =
        {}

    State.ActiveView =
        nil

end


--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return ViewManager