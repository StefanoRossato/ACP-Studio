----------------------------------------------------------------------
-- ACP Studio
-- Analyzer.lua
--
-- Analysis Session Analyzer
----------------------------------------------------------------------

local Analyzer = {}
Analyzer.__index = Analyzer

----------------------------------------------------------------------
-- Constructor
----------------------------------------------------------------------

function Analyzer.New()

    local self = setmetatable({}, Analyzer)

    self.ready = false

    self.measurements = {
        peak = nil,
        peakHold = nil,
        rms = nil
    }

    return self

end

----------------------------------------------------------------------
-- Initialize
----------------------------------------------------------------------

function Analyzer:Initialize()

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

    -- JSFX communication will be implemented in a future revision.

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