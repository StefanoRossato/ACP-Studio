--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module      : RuntimeMetrics
-- Description : Runtime metrics model.
--------------------------------------------------------------------------------

local RuntimeMetrics = {}
RuntimeMetrics.__index = RuntimeMetrics

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function RuntimeMetrics.New()

    local self = setmetatable({}, RuntimeMetrics)

    -- Initialization ----------------------------------------------------------

    self.Heartbeat = 0
    self.SampleCounter = 0
    self.FramesProcessed = 0
    self.UpdateTimestamp = 0

    return self

end

--------------------------------------------------------------------------------
-- Public Methods
--------------------------------------------------------------------------------

function RuntimeMetrics:Clone()

    -- Implementation ----------------------------------------------------------

    local copy = RuntimeMetrics.New()

    copy.Heartbeat = self.Heartbeat
    copy.SampleCounter = self.SampleCounter
    copy.FramesProcessed = self.FramesProcessed
    copy.UpdateTimestamp = self.UpdateTimestamp

    return copy

end

--------------------------------------------------------------------------------
-- Private Methods
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return RuntimeMetrics