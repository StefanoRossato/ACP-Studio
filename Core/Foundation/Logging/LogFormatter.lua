local LogFormatter = {}


function LogFormatter.Format(record)

    return string.format(
        "[%s] [%s] [%s] %s",
        record.Timestamp,
        record.Level,
        record.Source,
        record.Message
    )

end


return LogFormatter