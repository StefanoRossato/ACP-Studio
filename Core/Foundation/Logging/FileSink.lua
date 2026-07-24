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

function FileSink.Initialize(path, mode)

    mode = mode or "a"

    assert(
        path ~= nil,
        "File path required."
    )

    local file =
        io.open(
            path,
            mode)


    assert(
        file ~= nil,
        "Unable to open log file."
    )


    file:close()


    FileSink.Path = path


    return true

end

------------------------------------------------------------------------------
-- Writing
------------------------------------------------------------------------------

function FileSink.Write(message)

    FileSink.Mode = mode

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