------------------------------------------------------------------------------
-- GuiTestSkeleton.lua
--
-- Certified GUI Test Skeleton
------------------------------------------------------------------------------

local GuiTestSkeleton = {}

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

local function PrintBanner(configuration)

    ClearLog()

    Log("========================================")
    Log(configuration.Name)
    Log(configuration.Id)
    Log("========================================")

end

--------------------------------------------------------------------------------
-- Summary
--------------------------------------------------------------------------------

local function PrintSummary(configuration)

    Log("")
    Log("========================================")
    Log(configuration.Id .. " PASSED")
    Log("========================================")

end

--------------------------------------------------------------------------------
-- Test API
--------------------------------------------------------------------------------

local function CreateTestApi()

    return {

        Log = Log,

        Pass = Pass

    }

end

--------------------------------------------------------------------------------
-- Public
--------------------------------------------------------------------------------

function GuiTestSkeleton.Run(configuration)

    PrintBanner(configuration)

    Log(
        "Loading "
        .. configuration.ModuleDisplayName
        .. "...")

    local Module =
        require(configuration.ModuleName)

    assert(
        Module,
        "Unable to load module.")

    Pass("Module loaded")

    Log("")

    Log(configuration.OpenMessage)

    Log(configuration.CloseMessage)

    Log("")

    local Test =
        CreateTestApi()

    Module.Run(function()

        if configuration.OnCompleted then

            configuration.OnCompleted(Test)

        end

        PrintSummary(configuration)

    end)

end

--------------------------------------------------------------------------------
-- Return
--------------------------------------------------------------------------------

return GuiTestSkeleton