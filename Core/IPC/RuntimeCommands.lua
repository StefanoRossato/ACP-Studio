-----------------------------------------------------------------------
-- ACP Studio
-- RuntimeCommands.lua
--
-- Component     : CMP-302
-- Layer         : Core / IPC
-- Purpose       : Runtime command definitions
-- Specification : BT-002
-----------------------------------------------------------------------

local RuntimeCommands = {}

-----------------------------------------------------------------------
-- Command Definitions
-----------------------------------------------------------------------

RuntimeCommands.NONE  = 0

RuntimeCommands.RESET = 1
RuntimeCommands.START = 2
RuntimeCommands.STOP  = 3

-----------------------------------------------------------------------

return RuntimeCommands