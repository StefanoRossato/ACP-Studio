----------------------------------------------------------------------
-- ACP Studio
-- Result.lua
--
-- Analysis Result Model
----------------------------------------------------------------------

local Result = {}
Result.__index = Result

----------------------------------------------------------------------
-- Constructor
----------------------------------------------------------------------

function Result.New()

    local self = setmetatable({}, Result)

    self.data = {
        -- Measurements
        peak = nil,
        peakHold = nil,
        rms = nil,
        -- Session
        completed = false
    }

    return self

end

----------------------------------------------------------------------
-- Set Value
----------------------------------------------------------------------

function Result:Set(name, value)

    self.data[name] = value

end

----------------------------------------------------------------------
-- Get Value
----------------------------------------------------------------------

function Result:Get(name)

    return self.data[name]

end

----------------------------------------------------------------------
-- Validation
----------------------------------------------------------------------

function Result:IsValid()

    return
        self.data.peak ~= nil and
        self.data.peakHold ~= nil and
        self.data.rms ~= nil

end

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

return Result