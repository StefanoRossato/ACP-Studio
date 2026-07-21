------------------------------------------------------------------------------
-- ACP Studio
-- Logger Foundation Service
------------------------------------------------------------------------------
-- Specification : FND-001
-- Category      : Foundation
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Dependencies
------------------------------------------------------------------------------

local Lifecycle =
    require("Core.Foundation.Lifecycle")

------------------------------------------------------------------------------
-- Module Declaration
------------------------------------------------------------------------------

local Logger = {}

------------------------------------------------------------------------------
-- Constants
------------------------------------------------------------------------------

local Constants =
{
    Name    = "Logger",
    Version = "1.0.0"
}

------------------------------------------------------------------------------
-- State
------------------------------------------------------------------------------

local State =
{
    Lifecycle = Lifecycle.Loaded
}

------------------------------------------------------------------------------
-- Private Functions
------------------------------------------------------------------------------

local function ValidateOperational()

    assert(
        State.Lifecycle == Lifecycle.Operational,
        Constants.Name .. " service is not operational."
    )

end

--------------------------------------------------------------------------------

local function Write(prefix, message)

    ValidateOperational()

    assert(
        type(message) == "string",
        "A valid log message is required.")

    reaper.ShowConsoleMsg(
        prefix .. message .. "\n")

end

------------------------------------------------------------------------------
-- Lifecycle
------------------------------------------------------------------------------

function Logger.Initialize()

    if State.Lifecycle ~= Lifecycle.Loaded then
        return false
    end

    State.Lifecycle = Lifecycle.Operational

    return true

end

--------------------------------------------------------------------------------

function Logger.Shutdown()

    if State.Lifecycle ~= Lifecycle.Operational then
        return false
    end

    State.Lifecycle = Lifecycle.Terminated

    return true

end

------------------------------------------------------------------------------
-- Public API
------------------------------------------------------------------------------

function Logger.Log(message)

    Write("", message)

end

--------------------------------------------------------------------------------

function Logger.Info(message)

    Write("[INFO] ", message)

end

--------------------------------------------------------------------------------

function Logger.Warning(message)

    Write("[WARNING] ", message)

end

--------------------------------------------------------------------------------

function Logger.Error(message)

    Write("[ERROR] ", message)

end

------------------------------------------------------------------------------
-- Module Return
------------------------------------------------------------------------------

return Logger