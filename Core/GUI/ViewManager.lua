--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ViewManager
-- Layer         : GUI
-- Purpose       : Manages the active GUI view.
-- Specification : GUI-105
--------------------------------------------------------------------------------

local ViewManager = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Private State
--------------------------------------------------------------------------------

local State = {

    Context = nil,

    ActiveView = nil

}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function ViewManager:Initialize(context)

    assert(
        context,
        "ViewManager.Initialize(): context is nil.")

    State.Context = context
    State.ActiveView = nil

end

--------------------------------------------------------------------------------

function ViewManager:IsInitialized()

    return State.Context ~= nil

end

--------------------------------------------------------------------------------

function ViewManager:SetView(view)

    assert(
        self:IsInitialized(),
        "ViewManager.SetView(): manager not initialized.")

    assert(
        view,
        "ViewManager.SetView(): view is nil.")

    if State.ActiveView then
        State.ActiveView:Shutdown()
    end

    State.ActiveView = view

    State.ActiveView:Initialize()

end

--------------------------------------------------------------------------------

function ViewManager:GetView()

    return State.ActiveView

end

--------------------------------------------------------------------------------

function ViewManager:HasView()

    return State.ActiveView ~= nil

end

--------------------------------------------------------------------------------

function ViewManager:Render()

    if not self:HasView() then
        return
    end

    State.ActiveView:Render()

end

--------------------------------------------------------------------------------

function ViewManager:Shutdown()

    if State.ActiveView then

        State.ActiveView:Shutdown()

    end

    State.ActiveView = nil
    State.Context = nil

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return ViewManager