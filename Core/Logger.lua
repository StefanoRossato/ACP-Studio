----------------------------------------------------------------------
-- ACP Studio
-- Logger.lua
--
-- Simple Logger
----------------------------------------------------------------------

local Logger = {}

----------------------------------------------------------------------
-- Paths
----------------------------------------------------------------------

local scriptPath = debug.getinfo(1, "S").source:match("@?(.*[/\\])")
local projectRoot = scriptPath:gsub("Core[/\\]$", "")

local logDirectory = projectRoot .. "Logs/"
local logFile = logDirectory .. "ACP.log"

----------------------------------------------------------------------
-- Private
----------------------------------------------------------------------

local function EnsureDirectory()

    os.execute('mkdir -p "' .. logDirectory .. '"')

end

local function Timestamp()

    return os.date("%Y-%m-%d %H:%M:%S")

end

----------------------------------------------------------------------
-- Console
----------------------------------------------------------------------

function Logger.ClearConsole()

    reaper.ClearConsole()

end

----------------------------------------------------------------------
-- File
----------------------------------------------------------------------

function Logger.Clear()

    EnsureDirectory()

    local file = io.open(logFile, "w")

    if file then
        file:close()
    end

end

----------------------------------------------------------------------
-- Sections
----------------------------------------------------------------------

function Logger.Section(title)

    EnsureDirectory()

    local file = io.open(logFile, "a")

    if not file then
        return false
    end

    file:write("\n")
    file:write(string.rep("=", 64) .. "\n")
    file:write(title .. "\n")
    file:write(string.rep("=", 64) .. "\n")

    file:close()

    return true

end

----------------------------------------------------------------------
-- Core Logging
----------------------------------------------------------------------

function Logger.Log(level, message, console)

    EnsureDirectory()

    local text = string.format(
        "[%s] %-7s %s",
        Timestamp(),
        level,
        tostring(message)
    )

    local file = io.open(logFile, "a")

    if file then
        file:write(text .. "\n")
        file:close()
    end

    if console then
        reaper.ShowConsoleMsg(text .. "\n")
    end

    return true

end

----------------------------------------------------------------------
-- File Only
----------------------------------------------------------------------

function Logger.Info(message)

    return Logger.Log("INFO", message, false)

end

function Logger.Debug(message)

    return Logger.Log("DEBUG", message, false)

end

function Logger.Warning(message)

    return Logger.Log("WARNING", message, false)

end

function Logger.Error(message)

    return Logger.Log("ERROR", message, false)

end

----------------------------------------------------------------------
-- Console + File
----------------------------------------------------------------------

function Logger.ConsoleInfo(message)

    return Logger.Log("INFO", message, true)

end

function Logger.ConsoleDebug(message)

    return Logger.Log("DEBUG", message, true)

end

function Logger.ConsoleWarning(message)

    return Logger.Log("WARNING", message, true)

end

function Logger.ConsoleError(message)

    return Logger.Log("ERROR", message, true)

end

----------------------------------------------------------------------
-- Generic Console
----------------------------------------------------------------------

function Logger.Console(message)

    return Logger.Log("INFO", message, true)

end

----------------------------------------------------------------------
-- Access
----------------------------------------------------------------------

function Logger.GetLogFile()

    return logFile

end

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

return Logger