--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ViewRegistry
-- Layer         : GUI
-- Purpose       : Stores and retrieves application views.
-- Specification : GUI-106
--------------------------------------------------------------------------------

local ViewRegistry = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Private State
--------------------------------------------------------------------------------

local State = {

    Initialized = false,

    Views = {}

}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

local function Reset()

    State.Views = {}

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function ViewRegistry.Initialize()

    Reset()

    State.Initialized = true

end

--------------------------------------------------------------------------------

function ViewRegistry.IsInitialized()

    return State.Initialized

end

--------------------------------------------------------------------------------

function ViewRegistry.Register(name, view)

    assert(
        State.Initialized,
        "ViewRegistry.Register(): registry not initialized.")

    assert(
        type(name) == "string" and name ~= "",
        "ViewRegistry.Register(): invalid view name.")

    assert(
        view,
        "ViewRegistry.Register(): view is nil.")

    assert(
        State.Views[name] == nil,
        "ViewRegistry.Register(): view already registered.")

    State.Views[name] = view

end

--------------------------------------------------------------------------------

function ViewRegistry.Get(name)

    assert(
        State.Initialized,
        "ViewRegistry.Get(): registry not initialized.")

    return State.Views[name]

end

--------------------------------------------------------------------------------

function ViewRegistry.Exists(name)

    assert(
        State.Initialized,
        "ViewRegistry.Exists(): registry not initialized.")

    return State.Views[name] ~= nil

end

--------------------------------------------------------------------------------

function ViewRegistry.Count()

    assert(
        State.Initialized,
        "ViewRegistry.Count(): registry not initialized.")

    local count = 0

    for _ in pairs(State.Views) do
        count = count + 1
    end

    return count

end

--------------------------------------------------------------------------------

function ViewRegistry.Clear()

    assert(
        State.Initialized,
        "ViewRegistry.Clear(): registry not initialized.")

    Reset()

end

--------------------------------------------------------------------------------

function ViewRegistry.Shutdown()

    Reset()

    State.Initialized = false

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return ViewRegistry