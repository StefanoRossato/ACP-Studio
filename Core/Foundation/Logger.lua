------------------------------------------------------------------------------
-- ACP Studio
-- Logger Foundation Service
------------------------------------------------------------------------------
-- Specification : FND-001 / FND-002
-- Category      : Foundation
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Dependencies
------------------------------------------------------------------------------

local Lifecycle =
    require("Core.Foundation.Lifecycle")

local LogRecord =
    require("Core.Foundation.Logging.LogRecord")

local LogFormatter =
    require("Core.Foundation.Logging.LogFormatter")

local ConsoleSink =
    require("Core.Foundation.Logging.ConsoleSink")

local FileSink =
    require("Core.Foundation.Logging.FileSink")


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
    Configuration = nil
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

local function Write(level, message)

    ValidateOperational()


    assert(
        type(message) == "string",
        "A valid log message is required."
    )


    local record =
        LogRecord.new(
            level,
            "Logger",
            message
        )


    local output =
        LogFormatter.Format(record)


    ConsoleSink.Write(output)

    FileSink.Write(output)

end


------------------------------------------------------------------------------
-- Lifecycle
------------------------------------------------------------------------------

function Logger.Initialize(configuration)

    assert(
        type(configuration) == "table",
        "Logger configuration is required."
    )

    if State.Lifecycle ~= Lifecycle.Loaded then
        return false
    end

    assert(
        FileSink.Initialize(
            configuration.LogFile,
            configuration.Mode
        ),
        "FileSink initialization failed."
    )

    State.Configuration = configuration

    State.Lifecycle = Lifecycle.Operational

    return true

end


--------------------------------------------------------------------------------

function Logger.Shutdown()

    if State.Lifecycle ~= Lifecycle.Operational then
        return false
    end


    FileSink.Close()


    State.Configuration = nil

    State.Lifecycle = Lifecycle.Terminated


    return true

end


------------------------------------------------------------------------------
-- Public API
------------------------------------------------------------------------------

function Logger.Log(message)

    Write(
        "LOG",
        message
    )

end


--------------------------------------------------------------------------------

function Logger.Info(message)

    Write(
        "INFO",
        message
    )

end


--------------------------------------------------------------------------------

function Logger.Warning(message)

    Write(
        "WARNING",
        message
    )

end


--------------------------------------------------------------------------------

function Logger.Error(message)

    Write(
        "ERROR",
        message
    )

end


------------------------------------------------------------------------------
-- Module Return
------------------------------------------------------------------------------

return Logger