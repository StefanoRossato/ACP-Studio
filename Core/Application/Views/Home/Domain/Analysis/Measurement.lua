--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module      : Measurement
-- Description : Analysis measurement value object.
--------------------------------------------------------------------------------

local Measurement = {}
Measurement.__index = Measurement

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function Measurement.New(value, measurementType, unit)

    assert(type(value) == "number", "Measurement value must be a number.")
    assert(type(measurementType) == "string" and measurementType ~= "",
        "Measurement type must be a non-empty string.")
    assert(type(unit) == "string" and unit ~= "",
        "Measurement unit must be a non-empty string.")

    local self = setmetatable({}, Measurement)

    -- Initialization ----------------------------------------------------------

    self._value = value
    self._type = measurementType
    self._unit = unit

    return self

end

--------------------------------------------------------------------------------
-- Public Methods
--------------------------------------------------------------------------------

function Measurement:GetValue()

    return self._value

end

--------------------------------------------------------------------------------

function Measurement:GetType()

    return self._type

end

--------------------------------------------------------------------------------

function Measurement:GetUnit()

    return self._unit

end

--------------------------------------------------------------------------------

function Measurement:Equals(other)

    if getmetatable(other) ~= Measurement then
        return false
    end

    return
        self._value == other._value and
        self._type  == other._type and
        self._unit  == other._unit

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return Measurement