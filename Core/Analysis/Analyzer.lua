----------------------------------------------------------------------
-- ACP Studio
-- Analyzer.lua
--
-- Analysis Session Analyzer
----------------------------------------------------------------------

local Analyzer = {}
Analyzer.__index = Analyzer

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

local Protocol = require("Core.Analysis.AnalyzerProtocol")

----------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------

local GMEM_NAME = "ACP_STUDIO"
local JSFX_NAME = "JS: ACP_Analyzer"

----------------------------------------------------------------------
-- Constructor
----------------------------------------------------------------------

function Analyzer.New()

    local self = setmetatable({}, Analyzer)

    self.ready = false
    self.track = nil
    self.state = Protocol.State.IDLE

    self.measurements = {
        rms = 0,
        peak = 0,
        linearity = 0,
        samples = 0
    }

    return self

end

----------------------------------------------------------------------
-- Private
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

    ------------------------------------------------------------
    -- Already loaded ?
    ------------------------------------------------------------

    local fxCount = reaper.TrackFX_GetCount(track)

    for i = 0, fxCount - 1 do

        local retval, fxName = reaper.TrackFX_GetFXName(track, i, "")

        if retval and fxName:find("ACP_Analyzer", 1, true) then
            return true
        end

    end

    ------------------------------------------------------------
    -- Add JSFX
    ------------------------------------------------------------

    local index = reaper.TrackFX_AddByName(
        track,
        JSFX_NAME,
        false,
        1
    )

    return index >= 0

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

    reaper.gmem_attach("ACP_STUDIO")

    self.ready = true

    return true

end

----------------------------------------------------------------------
-- Reset
----------------------------------------------------------------------

function Analyzer:Reset()

    reaper.gmem_write(
        Protocol.Register.COMMAND,
        Protocol.Command.RESET
    )

    self.state = Protocol.State.IDLE

    self.measurements.rms = 0
    self.measurements.peak = 0
    self.measurements.linearity = 0
    self.measurements.samples = 0

    return true

end

----------------------------------------------------------------------
-- Start Analysis
----------------------------------------------------------------------

function Analyzer:Start()

    reaper.gmem_write(
        Protocol.Register.COMMAND,
        Protocol.Command.START
    )

    return true

end

----------------------------------------------------------------------
-- Update
----------------------------------------------------------------------

function Analyzer:Update()

    self.state =
        reaper.gmem_read(
            Protocol.Register.STATE
        )

    return true

end

----------------------------------------------------------------------
-- Completed
----------------------------------------------------------------------

function Analyzer:IsCompleted()

    return self.state == Protocol.State.COMPLETED

end

----------------------------------------------------------------------
-- Read Measurements
----------------------------------------------------------------------

function Analyzer:Read()

    self.measurements.rms =
        reaper.gmem_read(Protocol.Register.RMS)

    self.measurements.peak =
        reaper.gmem_read(Protocol.Register.PEAK)

    self.measurements.linearity =
        reaper.gmem_read(Protocol.Register.LINEARITY)

    self.measurements.samples =
        reaper.gmem_read(Protocol.Register.SAMPLES)

    return self.measurements

end

----------------------------------------------------------------------
-- Ready
----------------------------------------------------------------------

function Analyzer:IsReady()

    return self.ready

end

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

return Analyzer