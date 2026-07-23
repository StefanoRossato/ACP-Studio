--------------------------------------------------------------------------------
-- ACP Studio
--
-- NavigationService Test
--
-- Specification : GUI-213
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Test Bootstrap
--------------------------------------------------------------------------------

local TestBootstrap =
    dofile(
        reaper.GetResourcePath() ..
        "/Scripts/ACP Studio/Tests/TestBootstrap.lua"
    )


TestBootstrap.Initialize(
    debug.getinfo(1, "S").source
)


--------------------------------------------------------------------------------
-- Dependencies
--------------------------------------------------------------------------------

local NavigationService =
    require("Core.Application.Navigation.NavigationService")


local ViewId =
    require("Core.Application.Navigation.ViewId")


--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------

local Passed = 0
local Failed = 0


local function Log(message)

    reaper.ShowConsoleMsg(
        message .. "\n"
    )

end


local function Pass(message)

    Passed = Passed + 1

    Log(
        "[PASS] " .. message
    )

end


local function Fail(message)

    Failed = Failed + 1

    Log(
        "[FAIL] " .. message
    )

end


--------------------------------------------------------------------------------
-- Test Banner
--------------------------------------------------------------------------------

Log("")
Log("============================================================")
Log("ACP Studio")
Log("GUI-213 NavigationService Test")
Log("============================================================")
Log("")


--------------------------------------------------------------------------------
-- Fake ViewManager
--------------------------------------------------------------------------------

local ActivatedView = nil


local FakeViewManager =
{
    Activate = function(viewId)

        ActivatedView = viewId

        return true

    end
}


--------------------------------------------------------------------------------
-- Initialization Test
--------------------------------------------------------------------------------

NavigationService.Initialize(
    FakeViewManager
)


if NavigationService.CurrentViewId()
    == ViewId.Home then

    Pass(
        "Initial view state verified."
    )

else

    Fail(
        "Initial view state invalid."
    )

end


--------------------------------------------------------------------------------
-- Successful Navigation Test
--------------------------------------------------------------------------------

ActivatedView = nil


local Result =
    NavigationService.Navigate(
        ViewId.Analysis
    )


if Result == true then

    Pass(
        "Navigation request accepted."
    )

else

    Fail(
        "Navigation request failed."
    )

end


if ActivatedView == ViewId.Analysis then

    Pass(
        "ViewManager activation verified."
    )

else

    Fail(
        "ViewManager activation failed."
    )

end


if NavigationService.CurrentViewId()
    == ViewId.Analysis then

    Pass(
        "Navigation state updated."
    )

else

    Fail(
        "Navigation state not updated."
    )

end


--------------------------------------------------------------------------------
-- Failed Navigation Test
--------------------------------------------------------------------------------

local FailingViewManager =
{
    Activate = function(viewId)

        return false

    end
}


NavigationService.Initialize(
    FailingViewManager
)


local PreviousView =
    NavigationService.CurrentViewId()


local FailedNavigation =
    NavigationService.Navigate(
        ViewId.Results
    )


if FailedNavigation == false then

    Pass(
        "Failed navigation detected."
    )

else

    Fail(
        "Failed navigation not detected."
    )

end


if NavigationService.CurrentViewId()
    == PreviousView then

    Pass(
        "Navigation state preserved after failure."
    )

else

    Fail(
        "Navigation state changed after failure."
    )

end


--------------------------------------------------------------------------------
-- Shutdown
--------------------------------------------------------------------------------

TestBootstrap.Shutdown()


Pass(
    "Test environment shutdown."
)


--------------------------------------------------------------------------------
-- Summary
--------------------------------------------------------------------------------

Log("")
Log("============================================================")


if Failed == 0 then

    Log(
        "GUI-213 NavigationService PASSED"
    )

else

    Log(
        "GUI-213 NavigationService FAILED"
    )

end


Log("============================================================")
Log("")