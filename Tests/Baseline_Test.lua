local Protocol = require("Core.IPC.SharedMemoryProtocol")

Protocol.Initialize()

local previous = Protocol.Read(254)

local function Run()

    local current = Protocol.Read(254)

    reaper.ClearConsole()
    reaper.ShowConsoleMsg(
        string.format(
            "Counter : %.0f\n",
            current
        )
    )

    if current > previous then

        reaper.ShowConsoleMsg("PASS\n")

    else

        reaper.ShowConsoleMsg("WAIT...\n")

    end

    previous = current

    reaper.defer(Run)

end

Run()