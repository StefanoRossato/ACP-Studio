----------------------------------------------------------------------
-- ACP Studio
-- RuntimeObserver_Test.lua
--
-- Component     : Runtime Observer Test
-- Layer         : Tests/Runtime
-- Purpose       : Validate RuntimeObserver behavior
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

local RuntimeObserver = require("Core.Runtime.RuntimeObserver")
local RuntimeModel = require("Core.Runtime.RuntimeModel")

----------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Construction
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Private Methods
----------------------------------------------------------------------

local function Log(message)

    reaper.ShowConsoleMsg(message .. "\n")

end

local function TestObserverCreation()

    Log("Creating RuntimeObserver...")

    local observer = RuntimeObserver.New()

    if not observer then
        error("RuntimeObserver creation failed.")
    end

    Log("PASS - RuntimeObserver created")

    return observer

end

local function TestModelCreation()

    Log("Creating RuntimeModel...")

    local model = RuntimeModel.New()

    if not model then
        error("RuntimeModel creation failed.")
    end

    Log("PASS - RuntimeModel created")

    return model

end

local function TestUpdate(observer, model)

    Log("Calling RuntimeObserver.Update()...")

    local updatedModel = observer:Update(model)

    assert(updatedModel ~= nil, "Update returned nil.")
    assert(updatedModel == model, "Unexpected model returned.")

    Log("PASS - RuntimeObserver.Update() completed")

end

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

local function Run()

    Log("")
    Log("========================================")
    Log("RuntimeObserver Test")
    Log("========================================")

    local observer = TestObserverCreation()
    local model = TestModelCreation()

    TestUpdate(observer, model)

    Log("========================================")
    Log("RuntimeObserver Test PASSED")
    Log("========================================")

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

Run()