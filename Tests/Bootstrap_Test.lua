----------------------------------------------------------------------
-- ACP Studio
-- Bootstrap_Test.lua
--
-- Component     : Test Bootstrap
-- Layer         : Tests
-- Purpose       : Bootstrap validation
-- Specification : TST-001
----------------------------------------------------------------------

----------------------------------------------------------------------
-- ACP Studio
-- Bootstrap_Test.lua
----------------------------------------------------------------------

local Bootstrap = require("Tests.Bootstrap")

assert(Bootstrap.Initialize())

local Logger = require("Core.Logger")


reaper.ClearConsole()
reaper.ShowConsoleMsg("Bootstrap_Test : PASS\n")


