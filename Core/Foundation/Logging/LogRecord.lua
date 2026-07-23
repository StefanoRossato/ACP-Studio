------------------------------------------------------------------------------
-- ACP Studio
-- LogRecord
--
-- Foundation Logging Value Object
------------------------------------------------------------------------------

local LogRecord = {}

------------------------------------------------------------------------------
-- Construction
------------------------------------------------------------------------------

function LogRecord.new(level, source, message)

    return
    {
        Timestamp = os.date("%Y-%m-%d %H:%M:%S"),
        Level = level,
        Source = source,
        Message = message
    }

end

return LogRecord