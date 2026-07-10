-----------------------------------------------------------------------
-- ACP Studio
-- RuntimeStates.lua
--
-- Component     : CMP-303
-- Layer         : Core / IPC
-- Purpose       : Runtime state definitions
-- Specification : BT-002
-----------------------------------------------------------------------

local RuntimeStates = {}

-----------------------------------------------------------------------
-- State Definitions
-----------------------------------------------------------------------

RuntimeStates.IDLE      = 0
RuntimeStates.RUNNING   = 1
RuntimeStates.COMPLETED = 2
RuntimeStates.ERROR     = 3

-----------------------------------------------------------------------

return RuntimeStates
