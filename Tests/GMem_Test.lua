dofile(debug.getinfo(1, "S").source:match("@?(.*[/\\])") .. "TestSetup.lua")

local Logger = require("Core.Logger")

Logger.Clear()
Logger.ClearConsole()
Logger.Section("JSFX GMem Test")

reaper.gmem_attach("ACP_STUDIO")

local function Poll()

    local value = reaper.gmem_read(10)

    Logger.ConsoleInfo("gmem[10] = " .. value)

    if value == 999 then
        Logger.ConsoleInfo("JSFX -> LUA OK")
        return
    end

    reaper.defer(Poll)

end

Poll()