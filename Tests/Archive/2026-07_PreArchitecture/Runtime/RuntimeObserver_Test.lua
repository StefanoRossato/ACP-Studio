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
local RuntimeModel    = require("Core.Runtime.RuntimeModel")

local SharedMemory    = require("Core.IPC.SharedMemory")
local Registers       = require("Core.IPC.Registers")
local RuntimeStates   = require("Core.IPC.RuntimeStates")

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

    SharedMemory.Initialize()

    SharedMemory.Write(
        Registers.STATE,
        RuntimeStates.RUNNING
    )

    SharedMemory.Write(
        Registers.RMS,
        -18.0
    )

    SharedMemory.Write(
        Registers.PEAK,
        -6.0
    )

    SharedMemory.Write(
        Registers.LINEARITY,
        12.0
    )

    SharedMemory.Write(
        Registers.SAMPLES,
        1024
    )

    Log("Calling RuntimeObserver.Update()...")

    local updatedModel = observer:Update(model)
    
    assert(model:GetState() == RuntimeStates.RUNNING,"State synchronization failed.")
    assert(model:GetRMS() == -18.0,"RMS synchronization failed.")
    assert(model:GetPeak() == -6.0,"Peak synchronization failed.")
    assert(model:GetCrestFactor() == 12.0,"Crest Factor synchronization failed.")
    assert(model:GetSampleCount() == 1024,"Sample Count synchronization failed.")

    assert(updatedModel == model, "Unexpected model returned.")

    Log("PASS - RuntimeObserver.Update() completed")

end

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

local function Run()

    ClearLog()

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