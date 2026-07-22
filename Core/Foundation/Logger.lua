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
    Lifecycle = Lifecycle.Loaded,
    Configuration = nil,
    FileHandle = nil
}

------------------------------------------------------------------------------
-- Private Functions
------------------------------------------------------------------------------

local function ConsoleTarget(message)

    reaper.ShowConsoleMsg(message)

end

local function FileTarget(message)

    State.FileHandle:write(message)
    State.FileHandle:flush()

end

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
    
    local output = prefix .. message .. "\n"

    ConsoleTarget(output)
    FileTarget(output)

end

------------------------------------------------------------------------------
-- Lifecycle
------------------------------------------------------------------------------

function Logger.Initialize(configuration)

    assert(
        type(configuration) == "table",
        "Logger configuration is required.")

    if State.Lifecycle ~= Lifecycle.Loaded then
        return false
    end

    local handle, errorMessage =
        io.open(configuration.LogFile, "a")

    assert(
        handle,
        errorMessage)

    State.Configuration = configuration
    State.FileHandle = handle

    State.Lifecycle = Lifecycle.Operational

    return true

end

--------------------------------------------------------------------------------

function Logger.Shutdown()

    if State.Lifecycle ~= Lifecycle.Operational then
        return false
    end

    State.Lifecycle = Lifecycle.Terminated

    if State.FileHandle then
        State.FileHandle:close()
        State.FileHandle = nil
    end

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