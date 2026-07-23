------------------------------------------------------------------------------
-- ACP Studio
-- ConsoleSink
--
-- Foundation Logging Value Object
------------------------------------------------------------------------------

local ConsoleSink = {}

------------------------------------------------------------------------------
-- Construction
------------------------------------------------------------------------------

function ConsoleSink.Write(message)

    reaper.ShowConsoleMsg(
        message .. "\n"
    )

    return true

end

return ConsoleSink