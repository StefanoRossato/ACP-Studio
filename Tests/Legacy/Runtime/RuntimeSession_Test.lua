----------------------------------------------------------------------
-- ACP Studio
-- RuntimeSession_Test.lua
--
-- Component     : Runtime Session Test
-- Layer         : Tests/Runtime
-- Purpose       : Validate RuntimeSession behavior
-- Specification : BT-003 Runtime Analysis Engine
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Test Setup
----------------------------------------------------------------------

dofile(
    debug.getinfo(1, "S").source:match("@?(.*[/\\])")
    .. "../TestSetup.lua"
)

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

local RuntimeSession = require("Core.Runtime.RuntimeSession")

----------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Construction
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Private Methods
----------------------------------------------------------------------

local function ClearLog()

    reaper.ClearConsole()

end

local function Log(message)

    reaper.ShowConsoleMsg(message .. "\n")

end

local function TestSessionCreation()

    Log("Creating RuntimeSession...")

    local session = RuntimeSession.New()

    if not session then
        error("RuntimeSession creation failed.")
    end

    Log("PASS - RuntimeSession created")

    return session

end

local function TestControllerCreation(session)

    Log("Checking RuntimeController...")

    if not session.Controller then
        error("RuntimeController not created.")
    end

    Log("PASS - RuntimeController created")

end

local function TestGetController(session)

    Log("Calling RuntimeSession.GetController()...")

    local controller = session:GetController()

    if not controller then
        error("RuntimeSession.GetController() failed.")
    end

    Log("PASS - RuntimeSession.GetController()")

end

local function TestInitialize(session)

    Log("Calling RuntimeSession.Initialize()...")

    local initializedSession = session:Initialize()

    if initializedSession ~= session then
        error("RuntimeSession.Initialize() failed.")
    end

    Log("PASS - RuntimeSession.Initialize()")

end

local function TestUpdate(session)

    Log("Calling RuntimeSession.Update()...")

    session:Update()

    Log("PASS - RuntimeSession.Update() completed")

end

local function TestTerminate(session)

    Log("Calling RuntimeSession.Terminate()...")

    local terminatedSession = session:Terminate()

    if terminatedSession ~= session then
        error("RuntimeSession.Terminate() failed.")
    end

    Log("PASS - RuntimeSession.Terminate()")

end

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

-- Test entry point.
local function Run()

    ClearLog()

    Log("========================================")
    Log("RuntimeSession Test")
    Log("========================================")

    local session = TestSessionCreation()

    TestControllerCreation(session)
    TestGetController(session)
    TestInitialize(session)
    TestUpdate(session)
    TestTerminate(session)

    Log("========================================")
    Log("RuntimeSession Test PASSED")
    Log("========================================")

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

Run()