----------------------------------------------------------------------
-- ACP Studio
-- RuntimeController_Test.lua
--
-- Component     : Runtime Controller Test
-- Layer         : Tests/Runtime
-- Purpose       : Validate RuntimeController behavior
-- Specification : BT-003
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

local RuntimeController = require("Core.Runtime.RuntimeController")


----------------------------------------------------------------------
-- Local Helpers
----------------------------------------------------------------------

local function ClearLog()

    reaper.ClearConsole()

end

local function Log(message)

    reaper.ShowConsoleMsg(message .. "\n")

end

----------------------------------------------------------------------
-- Tests
----------------------------------------------------------------------

local function TestControllerCreation()

    Log("Creating RuntimeController...")

    local controller = RuntimeController.New()

    if not controller then
        error("RuntimeController creation failed.")
    end

    Log("PASS - RuntimeController created")

    return controller

end

local function TestModelCreation(controller)

    Log("Checking RuntimeModel...")

    if not controller.Model then
        error("RuntimeModel not created.")
    end

    Log("PASS - RuntimeModel created")

end

local function TestObserverCreation(controller)

    Log("Checking RuntimeObserver...")

    if not controller.Observer then
        error("RuntimeObserver not created.")
    end

    Log("PASS - RuntimeObserver created")

end

local function TestUpdate(controller)

    Log("Calling RuntimeController.Update()...")

    controller:Update()

    Log("PASS - RuntimeController.Update() completed")

end

local function TestGetModel(controller)

    Log("Calling RuntimeController.GetModel()...")

    local model = controller:GetModel()

    if not model then
        error("RuntimeController.GetModel() failed.")
    end

    Log("PASS - RuntimeController.GetModel()")

end

----------------------------------------------------------------------
-- Main
----------------------------------------------------------------------

ClearLog()

Log("========================================")
Log("RuntimeController Test")
Log("========================================")

local controller = TestControllerCreation()

TestModelCreation(controller)
TestObserverCreation(controller)
TestGetModel(controller)
TestUpdate(controller)

Log("========================================")
Log("RuntimeController Test PASSED")
Log("========================================")