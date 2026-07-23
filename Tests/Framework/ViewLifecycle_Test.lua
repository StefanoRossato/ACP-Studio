--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test            : View Lifecycle Test
-- Category        : GUI Framework
-- Standard        : TPL-002
-- Purpose         : Verify GUI-212 View Lifecycle Contract implementation.
-- Specification   : GUI-212
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- Test Bootstrap
--------------------------------------------------------------------------------

local TestBootstrap =
    dofile(
        reaper.GetResourcePath()
        .. "/Scripts/ACP Studio/Tests/TestBootstrap.lua"
    )


assert(
    TestBootstrap.Initialize(
        debug.getinfo(1, "S").source
    ),
    "Failed to initialize test environment."
)


--------------------------------------------------------------------------------
-- Dependencies
--------------------------------------------------------------------------------

local RepositoryLocator =
    require(
        "Core.Bootstrap.RepositoryLocator"
    )


local Logger =
    require(
        "Core.Foundation.Logger"
    )


local ViewManager =
    require(
        "Core.GUI.ViewManager"
    )


local BaseView =
    require(
        "Core.GUI.BaseView"
    )


--------------------------------------------------------------------------------
-- Repository
--------------------------------------------------------------------------------

local Repository =
    RepositoryLocator.GetRepositoryRoot()


assert(
    Repository,
    "Repository root not available."
)


--------------------------------------------------------------------------------
-- Test View
--------------------------------------------------------------------------------

local TestView = {}


function TestView.New()

    local View =
        BaseView.New(
            "TestView",
            "Test View"
        )


    View.Events =
        {}


    setmetatable(
        View,
        {
            __index = TestView
        }
    )


    return View

end


function TestView:Initialize()

    table.insert(
        self.Events,
        "Initialize"
    )

end


function TestView:OnEnter()

    table.insert(
        self.Events,
        "OnEnter"
    )

end


function TestView:Render()

    table.insert(
        self.Events,
        "Render"
    )

end


function TestView:OnExit()

    table.insert(
        self.Events,
        "OnExit"
    )

end


function TestView:Shutdown()

    table.insert(
        self.Events,
        "Shutdown"
    )

end


--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------

local function Log(message)

    Logger.Log(
        message
    )

end


local function Pass(message)

    Logger.Info(
        "[PASS] " .. message
    )

end


--------------------------------------------------------------------------------
-- Test State
--------------------------------------------------------------------------------

local Test = {}

local View = nil


--------------------------------------------------------------------------------
-- Construction
--------------------------------------------------------------------------------

function Test.Construction()

    reaper.ClearConsole()


    reaper.ShowConsoleMsg(
        "============================================================\n"
    )

    reaper.ShowConsoleMsg(
        "ACP Studio\n"
    )

    reaper.ShowConsoleMsg(
        "GUI-212 View Lifecycle Test\n"
    )

    reaper.ShowConsoleMsg(
        "============================================================\n\n"
    )

end


--------------------------------------------------------------------------------
-- Setup
--------------------------------------------------------------------------------

function Test.Setup()

    assert(
        Logger.Initialize(
        {
            LogFile =
                Repository .. "/Logs/ACP.log"
        }),
        "Logger initialization failed."
    )


    Pass(
        "Logger initialized."
    )


    ViewManager.Reset()


    View =
        TestView.New()


    Pass(
        "Test View created."
    )

end


--------------------------------------------------------------------------------
-- Execution
--------------------------------------------------------------------------------

function Test.Execution()

    ViewManager.Register(
        View
    )


    ViewManager.Activate(
        "TestView"
    )


    ViewManager.Render(
        nil
    )


    ViewManager.Deactivate()


    ViewManager.Reset()

end


--------------------------------------------------------------------------------
-- Verification
--------------------------------------------------------------------------------

function Test.Verification()

    assert(
        View.Events[1] == "Initialize",
        "Initialize lifecycle event missing."
    )

    Pass(
        "Initialize verified."
    )


    assert(
        View.Events[2] == "OnEnter",
        "OnEnter lifecycle event missing."
    )

    Pass(
        "OnEnter verified."
    )


    assert(
        View.Events[3] == "Render",
        "Render lifecycle event missing."
    )

    Pass(
        "Render verified."
    )


    assert(
        View.Events[4] == "OnExit",
        "OnExit lifecycle event missing."
    )

    Pass(
        "OnExit verified."
    )


    assert(
        View.Events[5] == "Shutdown",
        "Shutdown lifecycle event missing."
    )

    Pass(
        "Shutdown verified."
    )

end


--------------------------------------------------------------------------------
-- Cleanup
--------------------------------------------------------------------------------

function Test.Cleanup()

    Log(
        ""
    )

    Log(
        "============================================================"
    )

    Log(
        "GUI-212 View Lifecycle Test PASSED"
    )

    Log(
        "============================================================"
    )


    Logger.Shutdown()


    TestBootstrap.Shutdown()

end


--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

function Test.Run()

    Test.Construction()

    Test.Setup()

    Test.Execution()

    Test.Verification()

    Test.Cleanup()

end


--------------------------------------------------------------------------------
-- Execute Test
--------------------------------------------------------------------------------

Test.Run()