----------------------------------------------------------------------
-- ACP Studio
-- Analyzer.lua
--
-- Component     : CMP-302
-- Layer         : Core
-- Purpose       : Analyzer Controller
-- Specification : SPT-120 v2.0
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------
local Logger   = require("Core.Logger")
local Protocol = require("Core.IPC.SharedMemoryProtocol")

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

local Analyzer = {}
Analyzer.__index = Analyzer

----------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------

-- local JSFX_NAME = "JS: ACP_Analyzer"
local JSFX_NAME = "JS: ACP Studio - Analyzer TEST"
----------------------------------------------------------------------
-- Private
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

    for i = 0, fxCount - 1 do

        local ok, fxName =
            reaper.TrackFX_GetFXName(track, i, "")

        if ok and fxName:find("ACP_Analyzer", 1, true) then
            return true
        end

    end

    local index =
        reaper.TrackFX_AddByName(
            track,
            JSFX_NAME,
            false,
            1
        )

    return index >= 0

end

----------------------------------------------------------------------
-- Constructor
----------------------------------------------------------------------

function Analyzer.New()

    local self = setmetatable({}, Analyzer)

    self.ready = false
    self.track = nil
    self.state = Protocol.STATE.IDLE

    self.measurements =
    {
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

function Analyzer:Initialize()

    self.track = GetSelectedTrack()

    if not self.track then
        return false
    end

    if not EnsureAnalyzerFX(self.track) then
        return false
    end

    Protocol.Initialize()
    
    -- debug
    Logger.ConsoleInfo("DEBUG = " .. tostring(Protocol.Read(254)))

    self.ready = true
    self.state = Protocol.STATE.IDLE

    return true

end

----------------------------------------------------------------------
-- Reset
----------------------------------------------------------------------

function Analyzer:Reset()

    if not self.ready then
        return false
    end

    Protocol.Write(
        Protocol.REGISTERS.COMMAND,
        Protocol.COMMAND.RESET
    )

    self.state = Protocol.STATE.IDLE

    ResetMeasurements(self)

    return true

end

----------------------------------------------------------------------
-- Start Analysis
----------------------------------------------------------------------

function Analyzer:Start()

    if not self.ready then
        return false
    end

    Protocol.Write(
        Protocol.REGISTERS.COMMAND,
        Protocol.COMMAND.START
    )

    return true

end

----------------------------------------------------------------------
-- Update
----------------------------------------------------------------------

function Analyzer:Update()

    if not self.ready then
        return false
    end

    Logger.ConsoleInfo("BEFORE READ")

    self.state =
        Protocol.Read(
            Protocol.REGISTERS.STATE
        )

    Logger.ConsoleInfo(
    "CMD = " ..
    tostring(
        Protocol.Read(
            Protocol.REGISTERS.COMMAND
        )
        )
    )

    Logger.ConsoleInfo(
    "STATE = " ..
    tostring(
        Protocol.Read(
            Protocol.REGISTERS.STATE
        )
        )
    )

    Logger.ConsoleInfo(
    "SAMPLES LOOP = " ..
    tostring(Protocol.Read(253))
    )

    Logger.ConsoleInfo(
    "LOOP = " ..
    tostring(Protocol.Read(253))
    )

    Logger.ConsoleInfo(
    "DEBUG_CMD = " ..
    tostring(Protocol.Read(252))
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
        Protocol.Read(
            Protocol.REGISTERS.RMS
        )

    self.measurements.peak =
        Protocol.Read(
            Protocol.REGISTERS.PEAK
        )

    self.measurements.linearity =
        Protocol.Read(
            Protocol.REGISTERS.LINEARITY
        )

    self.measurements.samples =
        Protocol.Read(
            Protocol.REGISTERS.SAMPLES
        )

    return self.measurements

end

----------------------------------------------------------------------
-- State Queries
----------------------------------------------------------------------

function Analyzer:IsIdle()

    return self.state == Protocol.STATE.IDLE

end

function Analyzer:IsMeasuring()

    return self.state == Protocol.STATE.MEASURING

end

function Analyzer:IsCompleted()

    return self.state == Protocol.STATE.COMPLETED

end

----------------------------------------------------------------------
-- Controller State
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
    self.state = Protocol.STATE.IDLE

    ResetMeasurements(self)

end

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

return Analyzer