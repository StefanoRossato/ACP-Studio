--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ViewManager
-- Layer         : GUI
-- Purpose       : Renders registered application views.
-- Specification : GUI-211
--------------------------------------------------------------------------------

local NavigationService =
    require("Core.Application.Navigation.NavigationService")

local ViewManager = {}

--------------------------------------------------------------------------------
-- Private State
--------------------------------------------------------------------------------

local State =
{
    Views = {}
}

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function ViewManager.Register(view)

    State.Views[view.Id] = view

end

--------------------------------------------------------------------------------

function ViewManager.Get(id)

    return State.Views[id]

end

--------------------------------------------------------------------------------

function ViewManager.Render(context)

    local viewId =
        NavigationService.CurrentViewId()

    if not viewId then
        return
    end

    local view =
        State.Views[viewId]

    if not view then
        return
    end

    view:Render(context)

end

--------------------------------------------------------------------------------

function ViewManager.Reset()

    State.Views = {}

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return ViewManager