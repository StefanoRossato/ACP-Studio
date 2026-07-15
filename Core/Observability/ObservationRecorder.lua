----------------------------------------------------------------------
-- ACP Studio
--
-- Module: ObservationRecorder
--
-- Responsibility:
--   Stores ObservationSnapshot instances.
--
-- Dependencies:
--   ObservationSnapshot
----------------------------------------------------------------------

local ObservationRecorder = {}
ObservationRecorder.__index = ObservationRecorder

----------------------------------------------------------------------
-- Constructor
----------------------------------------------------------------------

function ObservationRecorder.New()

    local self = setmetatable({}, ObservationRecorder)

    self._history = {}

    return self

end

----------------------------------------------------------------------
-- Record
----------------------------------------------------------------------

function ObservationRecorder:Record(snapshot)

    assert(snapshot ~= nil, "ObservationSnapshot expected")

    table.insert(self._history, snapshot)

end

----------------------------------------------------------------------
-- GetCount
----------------------------------------------------------------------

function ObservationRecorder:GetCount()

    return #self._history

end

----------------------------------------------------------------------
-- Get
----------------------------------------------------------------------

function ObservationRecorder:Get(index)

    return self._history[index]

end

----------------------------------------------------------------------
-- GetAll
----------------------------------------------------------------------

function ObservationRecorder:GetAll()

    return self._history

end

----------------------------------------------------------------------
-- Clear
----------------------------------------------------------------------

function ObservationRecorder:Clear()

    self._history = {}

end

return ObservationRecorder