------------------------------------------------------------------------------
-- GUI-004 ACP Monitor Test.lua
--
-- GUI-004
-- ACP Monitor Window Test
------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Load Bootstrap
--------------------------------------------------------------------------------

local function LoadBootstrap()

    local separator =
        package.config:sub(1, 1)

    local path =
        debug.getinfo(1, "S").source:match("@?(.*)")

    path =
        path:gsub("[/\\][^/\\]+$", "")

    while path ~= "" do

        local candidate =
            path
            .. separator
            .. "Bootstrap.lua"

        local file =
            io.open(candidate, "r")

        if file then

            file:close()

            local repositoryRoot =
                path:gsub(separator .. "Tests$", "")

            return
                dofile(candidate),
                repositoryRoot

        end

        local parent =
            path:gsub("[/\\][^/\\]+$", "")

        if parent == path then
            break
        end

        path = parent

    end

    error("Unable to locate Bootstrap.lua")

end

--------------------------------------------------------------------------------
-- Initialize Test Environment
--------------------------------------------------------------------------------

local function InitializeTestEnvironment()

    local Bootstrap
    local RepositoryRoot

    Bootstrap, RepositoryRoot =
        LoadBootstrap()

    assert(
        Bootstrap.Initialize(RepositoryRoot),
        "Unable to initialize test infrastructure.")

end

InitializeTestEnvironment()

--------------------------------------------------------------------------------
-- Dependencies
--------------------------------------------------------------------------------

local ACP_Monitor =
    require("Core.Observation.Monitor.ACP_Monitor")

--------------------------------------------------------------------------------
-- Logging
--------------------------------------------------------------------------------

local function ClearLog()

    reaper.ClearConsole()

end

local function Log(message)

    reaper.ShowConsoleMsg(message .. "\n")

end

local function Pass(message)

    Log("PASS - " .. message)

end

--------------------------------------------------------------------------------
-- Banner
--------------------------------------------------------------------------------

local function PrintBanner()

    ClearLog()

    Log("========================================")
    Log("ACP Monitor Test")
    Log("GUI-004")
    Log("========================================")

end

--------------------------------------------------------------------------------
-- Summary
--------------------------------------------------------------------------------

local function PrintSummary()

    Log("")
    Log("========================================")
    Log("GUI-004 PASSED")
    Log("========================================")

end

--------------------------------------------------------------------------------
-- Execute
--------------------------------------------------------------------------------

PrintBanner()

Log("Loading ACP_Monitor...")

assert(
    ACP_Monitor,
    "Unable to load ACP_Monitor.")

Pass("Module loaded")

Log("")
Log("Opening ACP Monitor...")
Log("Close the window to complete the test.")
Log("")

ACP_Monitor.Run(function()

    Pass("Monitor shutdown")

    PrintSummary()


end)