------------------------------------------------------------------------------
-- ACP Studio
-- Toolbar Actions
--
-- GUI-103
------------------------------------------------------------------------------

local Actions = {}

------------------------------------------------------------------------------
-- Types
------------------------------------------------------------------------------

Actions.Type = {

    None = 0,

    PrepareTrack = 1,

}

------------------------------------------------------------------------------
-- State
------------------------------------------------------------------------------

local CurrentAction = Actions.Type.None

------------------------------------------------------------------------------
-- Lifecycle
------------------------------------------------------------------------------

function Actions.Initialize()

    CurrentAction = Actions.Type.None

end

function Actions.Shutdown()

    CurrentAction = Actions.Type.None

end

------------------------------------------------------------------------------
-- Public API
------------------------------------------------------------------------------

function Actions.Set(action)

    CurrentAction = action or Actions.Type.None

end

function Actions.Get()

    return CurrentAction

end

function Actions.Clear()

    CurrentAction = Actions.Type.None

end

------------------------------------------------------------------------------
return Actions