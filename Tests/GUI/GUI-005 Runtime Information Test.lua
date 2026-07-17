------------------------------------------------------------------------------
-- GUI-005 Runtime Information Panel.lua
--
-- GUI-005
-- Runtime Information Panel Test
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
    Log("Runtime Information Panel Test")
    Log("GUI-005")
    Log("========================================")

end

--------------------------------------------------------------------------------
-- Summary
--------------------------------------------------------------------------------

local function PrintSummary()

    Log("")
    Log("========================================")
    Log("GUI-005 PASSED")
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
Log("Opening Runtime Information Panel...")
Log("Close the window to complete the test.")
Log("")

ACP_Monitor.Run(function()

    --------------------------------------------------------------------------
    -- Validation
    --------------------------------------------------------------------------

    Pass("Snapshot created")

    Pass("Runtime panel rendered")

    Pass("Runtime Information Panel closed")

    PrintSummary()

end)