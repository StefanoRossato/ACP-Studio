----------------------------------------------------------------------
-- ACP Studio
-- Analyzer.lua
--
-- Component     : CMP-400
-- Layer         : Core / Analysis
-- Purpose       : Analyzer controller
-- Specification : BT-002
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

local SharedMemory     = require("Core.IPC.SharedMemory")
local Registers        = require("Core.IPC.Registers")
local RuntimeCommands  = require("Core.IPC.RuntimeCommands")
local RuntimeStates    = require("Core.IPC.RuntimeStates")

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

local Analyzer = {}
Analyzer.__index = Analyzer

----------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------

local JSFX_NAME = "JS: ACP Studio - Runtime TEST"
----------------------------------------------------------------------
-- Private Functions
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Reset Measurements
----------------------------------------------------------------------

local function ResetMeasurements(self)

    self.measurements.rms = 0
    self.measurements.peak = 0
    self.measurements.linearity = 0
    self.measurements.samples = 0

end

----------------------------------------------------------------------
-- Get Selected Track
----------------------------------------------------------------------

local function GetSelectedTrack()

    return reaper.GetSelectedTrack(0, 0)

end

----------------------------------------------------------------------
-- Ensure Analyzer FX
----------------------------------------------------------------------

local function EnsureAnalyzerFX(track)

    if not track then
        return false
    end

    local fxCount = reaper.TrackFX_GetCount(track)

    for index = 0, fxCount - 1 do

        local ok, name =
            reaper.TrackFX_GetFXName(track, index, "")

        if ok and name:find("ACP Studio - Analyzer", 1, true) then
            return true
        end

    end

    local fxIndex =
        reaper.TrackFX_AddByName(
            track,
            JSFX_NAME,
            false,
            1
        )

    return fxIndex >= 0

end

----------------------------------------------------------------------
-- Constructor
----------------------------------------------------------------------

function Analyzer.New()

    local self = setmetatable({}, Analyzer)

    self.ready = false
    self.track = nil

    self.state = RuntimeStates.IDLE

    self.measurements = {
        rms        = 0,
        peak       = 0,
        linearity  = 0,
        samples    = 0
    }

    return self

end

----------------------------------------------------------------------
-- Initialize
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Initialize
----------------------------------------------------------------------

function Analyzer:Initialize()

    self.track = GetSelectedTrack()

    if not self.track then
        return false
    end

    if not EnsureAnalyzerFX(self.track) then
        return false
    end

    SharedMemory.Initialize()

    self.ready = true

    self:Update()

    return true

end

----------------------------------------------------------------------
-- Reset
----------------------------------------------------------------------

function Analyzer:Reset()

    if not self.ready then
        return false
    end

    SharedMemory.Write(
        Registers.COMMAND,
        RuntimeCommands.RESET
    )

    ResetMeasurements(self)

    return true

end

----------------------------------------------------------------------
-- Start
----------------------------------------------------------------------

function Analyzer:Start()

    if not self.ready then
        return false
    end

    SharedMemory.Write(
        Registers.COMMAND,
        RuntimeCommands.START
    )

    return true

end

----------------------------------------------------------------------
-- Stop
----------------------------------------------------------------------

function Analyzer:Stop()

    if not self.ready then
        return false
    end

    SharedMemory.Write(
        Registers.COMMAND,
        RuntimeCommands.STOP
    )

    return true

end

----------------------------------------------------------------------
-- Update
----------------------------------------------------------------------

function Analyzer:Update()

    if not self.ready or not self.track then
        return false
    end

    self.state = SharedMemory.Read(
        Registers.STATE
    )

    return true

end

----------------------------------------------------------------------
-- Read Measurements
----------------------------------------------------------------------

function Analyzer:Read()

    if not self.ready then
        return nil
    end

    self.measurements.rms =
        SharedMemory.Read(
            Registers.RMS
        )

    self.measurements.peak =
        SharedMemory.Read(
            Registers.PEAK
        )

    self.measurements.linearity =
        SharedMemory.Read(
            Registers.LINEARITY
        )

    self.measurements.samples =
        SharedMemory.Read(
            Registers.SAMPLES
        )

    return self.measurements

end

----------------------------------------------------------------------
-- State Queries
----------------------------------------------------------------------

function Analyzer:IsIdle()

    return self.state == RuntimeStates.IDLE

end

function Analyzer:IsRunning()

    return self.state == RuntimeStates.RUNNING

end

function Analyzer:IsCompleted()

    return self.state == RuntimeStates.COMPLETED

end

----------------------------------------------------------------------
-- Controller Queries
----------------------------------------------------------------------

function Analyzer:IsReady()

    return self.ready

end

----------------------------------------------------------------------
-- Destroy
----------------------------------------------------------------------

function Analyzer:Destroy()

    self.ready = false
    self.track = nil
    self.state = nil

    ResetMeasurements(self)

end

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

return Analyzer