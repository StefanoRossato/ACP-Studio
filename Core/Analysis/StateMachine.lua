----------------------------------------------------------------------
-- ACP Studio
-- StateMachine.lua
--
-- Analysis Session State Machine
----------------------------------------------------------------------

local StateMachine = {}
StateMachine.__index = StateMachine

----------------------------------------------------------------------
-- Session States
----------------------------------------------------------------------

StateMachine.States = {

    IDLE         = "IDLE",
    INITIALIZING = "INITIALIZING",
    RESETTING    = "RESETTING",
    WAITING      = "WAITING",
    ANALYZING    = "ANALYZING",
    COMPLETED    = "COMPLETED",
    REPORTING    = "REPORTING",
    TERMINATED   = "TERMINATED"

}

----------------------------------------------------------------------
-- Constructor
----------------------------------------------------------------------

function StateMachine.New()

    local self = setmetatable({}, StateMachine)

    self.state = StateMachine.States.IDLE

    return self

end

----------------------------------------------------------------------
-- Set State
----------------------------------------------------------------------

function StateMachine:SetState(state)

    self.state = state

end

----------------------------------------------------------------------
-- Get State
----------------------------------------------------------------------

function StateMachine:GetState()

    return self.state

end

----------------------------------------------------------------------
-- State Comparison
----------------------------------------------------------------------

function StateMachine:IsState(state)

    return self.state == state

end

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

return StateMachine