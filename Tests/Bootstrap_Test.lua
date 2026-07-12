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
-- Technical Bootstrap
----------------------------------------------------------------------

dofile(
    debug.getinfo(1, "S").source:match("@?(.*[/\\])") ..
    "TestSetup.lua"
)
----------------------------------------------------------------------
-- Bootstrap
----------------------------------------------------------------------

local Bootstrap = require("Tests.Bootstrap")

assert(Bootstrap.Initialize())
assert(Bootstrap.IsInitialized())
assert(Bootstrap.GetRepositoryRoot() ~= nil)

----------------------------------------------------------------------
-- Repository Access
----------------------------------------------------------------------

local Logger = require("Core.Logger")

assert(Logger ~= nil)

----------------------------------------------------------------------
-- Result
----------------------------------------------------------------------

reaper.ClearConsole()
reaper.ShowConsoleMsg("Bootstrap_Test : PASS\n")