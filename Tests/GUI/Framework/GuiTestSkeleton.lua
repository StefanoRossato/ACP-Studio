--------------------------------------------------------------------------------
-- ACP Studio
--
-- Gui Test Skeleton
--
-- Version      : GUI-006 v2
-- Purpose      : Provides the common infrastructure for GUI certification tests.
--------------------------------------------------------------------------------


local GuiTestSkeleton = {}


--------------------------------------------------------------------------------
-- Logging
--------------------------------------------------------------------------------

local function ClearLog()

    reaper.ClearConsole()

end


local function Log(message)

    reaper.ShowConsoleMsg(
        message .. "\n"
    )

end


local function Pass(message)

    Log(
        "PASS - " .. message
    )

end


local function Fail(message)

    Log(
        "FAIL - " .. message
    )

end


--------------------------------------------------------------------------------
-- Banner
--------------------------------------------------------------------------------

local function PrintBanner(configuration)

    ClearLog()

    Log(
        "========================================"
    )

    Log(
        configuration.Name
    )

    Log(
        configuration.Id
    )

    Log(
        "========================================"
    )

end


--------------------------------------------------------------------------------
-- Summary
--------------------------------------------------------------------------------

local function PrintSummary(
    configuration,
    Test
)

    Log("")


    Log(
        "========================================"
    )


    if Test.Failed then

        Log(
            configuration.Id .. " FAILED"
        )

    else

        Log(
            configuration.Id .. " PASSED"
        )

    end


    Log(
        "========================================"
    )

end


--------------------------------------------------------------------------------
-- Test API
--------------------------------------------------------------------------------

local function CreateTestApi()

    local Test =
    {
        Completed = true,
        Failed = false
    }


    function Test.Log(message)

        Log(message)

    end


    function Test.Pass(message)

        Pass(message)

    end


    function Test.Fail(message)

        Test.Failed = true

        Fail(message)

    end


    --------------------------------------------------------------------------
    -- Async Support
    --------------------------------------------------------------------------

    function Test.BeginAsync()

        Test.Completed = false

    end


    function Test.Complete()

        Test.Completed = true

    end


    return Test

end


--------------------------------------------------------------------------------
-- Completion Wait
--------------------------------------------------------------------------------

local function WaitCompletion(
    configuration,
    Test
)


    if Test.Completed then

        PrintSummary(
            configuration,
            Test
        )

        return

    end


    reaper.defer(
        function()

            WaitCompletion(
                configuration,
                Test
            )

        end
    )

end


--------------------------------------------------------------------------------
-- Public
--------------------------------------------------------------------------------

function GuiTestSkeleton.Run(configuration)


    --------------------------------------------------------------------------
    -- Banner
    --------------------------------------------------------------------------

    PrintBanner(
        configuration
    )


    --------------------------------------------------------------------------
    -- Load Module
    --------------------------------------------------------------------------

    Log(
        "Loading "
        ..
        configuration.ModuleDisplayName
        ..
        "..."
    )


    local Module =
        require(
            configuration.ModuleName
        )


    assert(
        Module,
        "Unable to load module."
    )


    Pass(
        "Module loaded"
    )


    --------------------------------------------------------------------------
    -- Messages
    --------------------------------------------------------------------------

    Log("")


    Log(
        configuration.OpenMessage
    )


    Log(
        configuration.CloseMessage
    )


    Log("")


    --------------------------------------------------------------------------
    -- Test API
    --------------------------------------------------------------------------

    local Test =
        CreateTestApi()


    --------------------------------------------------------------------------
    -- Execute Test
    --------------------------------------------------------------------------

    if configuration.OnCompleted then

        configuration.OnCompleted(
            Test
        )

    end


    --------------------------------------------------------------------------
    -- Wait Completion
    --------------------------------------------------------------------------

    WaitCompletion(
        configuration,
        Test
    )


end


--------------------------------------------------------------------------------
-- Return
--------------------------------------------------------------------------------

return GuiTestSkeleton