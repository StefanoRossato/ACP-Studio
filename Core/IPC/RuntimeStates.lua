-----------------------------------------------------------------------
-- ACP Studio
-- RuntimeStates.lua
--
-- Component     : CMP-303
-- Layer         : Core / IPC
-- Purpose       : Runtime state definitions
-- Status        : Certified
-- Version       : 1.0
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
