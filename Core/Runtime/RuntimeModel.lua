--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module      : RuntimeModel
-- Description : Runtime analysis data model.
--------------------------------------------------------------------------------

local RuntimeModel = {}
RuntimeModel.__index = RuntimeModel

--------------------------------------------------------------------------------
-- Dependencies
--------------------------------------------------------------------------------

local RuntimeMetrics = require("Core.Runtime.RuntimeMetrics")

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Construction
--------------------------------------------------------------------------------

function RuntimeModel.New()

    local self = setmetatable({}, RuntimeModel)

    -- Initialization ----------------------------------------------------------

    self:Reset()

    return self

end

--------------------------------------------------------------------------------
-- Public Methods
--------------------------------------------------------------------------------

function RuntimeModel:Reset()

    -- Runtime State -----------------------------------------------------------

    self.State = 0

    -- Analysis ----------------------------------------------------------------

    self.RMS = 0.0
    self.Peak = 0.0
    self.CrestFactor = 0.0

    -- Runtime Information -----------------------------------------------------

    self.SampleCount = 0
    self.Timestamp = 0

    -- Observability -----------------------------------------------------------

    self.Metrics = RuntimeMetrics.New()

end

function RuntimeModel:Clone()

    -- Implementation ----------------------------------------------------------

    local copy = RuntimeModel.New()

    -- Runtime State -----------------------------------------------------------

    copy.State = self.State

    -- Analysis ----------------------------------------------------------------

    copy.RMS = self.RMS
    copy.Peak = self.Peak
    copy.CrestFactor = self.CrestFactor

    -- Runtime Information -----------------------------------------------------

    copy.SampleCount = self.SampleCount
    copy.Timestamp = self.Timestamp

    -- Observability -----------------------------------------------------------

    copy.Metrics = self.Metrics:Clone()

    return copy

end

--------------------------------------------------------------------------------
-- Private Methods
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return RuntimeModel