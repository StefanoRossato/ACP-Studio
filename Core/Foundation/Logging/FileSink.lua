------------------------------------------------------------------------------
-- ACP Studio
-- FileSink
--
-- Foundation Logging File Persistence Sink
------------------------------------------------------------------------------

local FileSink =
{
    Path = nil
}


------------------------------------------------------------------------------
-- Initialization
------------------------------------------------------------------------------

function FileSink.Initialize(path)

    assert(
        path ~= nil,
        "File path required."
    )


    FileSink.Path = path

    return true

end


------------------------------------------------------------------------------
-- Writing
------------------------------------------------------------------------------

function FileSink.Write(message)

    assert(
        FileSink.Path ~= nil,
        "FileSink not initialized."
    )


    local file =
        io.open(
            FileSink.Path,
            "a"
        )


    assert(
        file ~= nil,
        "Unable to open log file."
    )


    file:write(
        message .. "\n"
    )


    file:close()


    return true

end


------------------------------------------------------------------------------
-- Shutdown
------------------------------------------------------------------------------

function FileSink.Close()

    FileSink.Path = nil

    return true

end


return FileSink