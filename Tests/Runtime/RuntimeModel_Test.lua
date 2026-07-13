----------------------------------------------------------------------
-- ACP Studio
-- RuntimeModel_Test.lua
--
-- Component     : Runtime Model Test
-- Layer         : Tests/Runtime
-- Purpose       : Validate RuntimeModel behavior
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
local function ClearLog()

    reaper.ClearConsole()

end

local function Log(message)

    reaper.ShowConsoleMsg(message .. "\n")

end

local function TestCreation()

    Log("Creating RuntimeModel...")

    local model = RuntimeModel.New()

    if not model then
        error("RuntimeModel creation failed.")
    end

    Log("PASS - RuntimeModel created")

    return model

end

local function TestInitialState(model)

    Log("Verifying initial state...")

    assert(model:GetState() == 0)
    assert(model:GetRMS() == 0.0)
    assert(model:GetPeak() == 0.0)
    assert(model:GetCrestFactor() == 0.0)
    assert(model:GetSampleCount() == 0)
    assert(model:GetTimestamp() == 0)

    Log("PASS - Initial state verified")

end

local function TestUpdate(model)

    Log("Updating RuntimeModel...")

    model:SetState(1)
    model:SetRMS(-18.0)
    model:SetPeak(-6.0)
    model:SetCrestFactor(12.0)
    model:SetSampleCount(1024)
    model:SetTimestamp(100)

    assert(model:GetState() == 1, "Updated state mismatch.")
    assert(model:GetRMS() == -18.0, "Updated RMS mismatch.")
    assert(model:GetPeak() == -6.0, "Updated Peak mismatch.")
    assert(model:GetCrestFactor() == 12.0, "Updated Crest Factor mismatch.")
    assert(model:GetSampleCount() == 1024, "Updated Sample Count mismatch.")
    assert(model:GetTimestamp() == 100, "Updated Timestamp mismatch.")

    Log("PASS - RuntimeModel updated")

end

local function TestReset(model)

    ClearLog()

    Log("Resetting RuntimeModel...")

    model:Reset()

    assert(model:GetState() == 0)
    assert(model:GetRMS() == 0.0)
    assert(model:GetPeak() == 0.0)
    assert(model:GetCrestFactor() == 0.0)
    assert(model:GetSampleCount() == 0)
    assert(model:GetTimestamp() == 0)

    Log("PASS - RuntimeModel reset")

end

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("")
    Log("========================================")
    Log("RuntimeModel Test")
    Log("========================================")

    local model = TestCreation()

    TestInitialState(model)
    TestUpdate(model)
    TestReset(model)

    Log("========================================")
    Log("RuntimeModel Test PASSED")
    Log("========================================")

end

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------

Run()