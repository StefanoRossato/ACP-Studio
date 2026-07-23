local LogRecord = {}

function LogRecord.new(level, source, message)

    return {
        Timestamp = os.date("%Y-%m-%d %H:%M:%S"),
        Level = level,
        Source = source,
        Message = message
    }

end

return LogRecord