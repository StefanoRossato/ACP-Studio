----------------------------------------------------------------------
-- ACP Studio
-- Analyzer.lua
--
-- Analysis Session Analyzer
----------------------------------------------------------------------

local Analyzer = {}
Analyzer.__index = Analyzer

----------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------

local JSFX_NAME = "JS: ACP_Analyzer"

----------------------------------------------------------------------
-- Constructor
----------------------------------------------------------------------

function Analyzer.New()

    local self = setmetatable({}, Analyzer)

    self.ready = false
    self.track = nil

    self.measurements = {
        peak = nil,
        peakHold = nil,
        rms = nil
    }

    return self

end

----------------------------------------------------------------------
-- Private
----------------------------------------------------------------------

local function GetSelectedTrack()

    return reaper.GetSelectedTrack(0, 0)

end

local function EnsureAnalyzerFX(track)

    if not track then
        return false
    end

    local fxIndex = reaper.TrackFX_AddByName(
        track,
        JSFX_NAME,
        false,
        1
    )

    return fxIndex >= 0

end

----------------------------------------------------------------------
-- Initialize
----------------------------------------------------------------------

function Analyzer:Initialize()

    self.track = GetSelectedTrack()

    if not self.track then
        reaper.ShowConsoleMsg("ERROR: No track selected.\n")
        return false
    end

    if not EnsureAnalyzerFX(self.track) then
        reaper.ShowConsoleMsg("ERROR: Unable to load ACP_Analyzer.jsfx\n")
        return false
    end

    self.ready = true

    return true

end

----------------------------------------------------------------------
-- Reset
----------------------------------------------------------------------

function Analyzer:Reset()

    self.measurements.peak = nil
    self.measurements.peakHold = nil
    self.measurements.rms = nil

    return true

end

----------------------------------------------------------------------
-- Update
----------------------------------------------------------------------

function Analyzer:Update()

    -- JSFX communication will be implemented
    -- in CF-001.3

    return true

end

----------------------------------------------------------------------
-- Ready State
----------------------------------------------------------------------

function Analyzer:IsReady()

    return self.ready

end

----------------------------------------------------------------------
-- Read Measurements
----------------------------------------------------------------------

function Analyzer:Read()

    return self.measurements

end

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

return Analyzer