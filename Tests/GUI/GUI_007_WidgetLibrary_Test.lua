--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test            : GUI-007 Widget Library Test
-- Category        : GUI Tests
-- Standard        : GUI Test Framework
-- Specification   : GUI-007
-- Purpose         : Certifies the Widget Library Foundation.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Bootstrap
--------------------------------------------------------------------------------

local Bootstrap =
    require("Bootstrap")

Bootstrap.Initialize()

--------------------------------------------------------------------------------
-- GUI Test Framework
--------------------------------------------------------------------------------

local GuiTestSkeleton =
    require("Tests.GUI.Framework.GuiTestSkeleton")

--------------------------------------------------------------------------------
-- Module Under Test
--------------------------------------------------------------------------------

local Label =
    require("Core.GUI.Widgets.Label")

local Button =
    require("Core.GUI.Widgets.Button")

local Separator =
    require("Core.GUI.Widgets.Separator")

local Spacer =
    require("Core.GUI.Widgets.Spacer")

--------------------------------------------------------------------------------
-- Test
--------------------------------------------------------------------------------

local Test =
    GuiTestSkeleton.Create(
        "GUI-007 Widget Library Test")

--------------------------------------------------------------------------------
-- Context
--------------------------------------------------------------------------------

local Context =
    reaper.ImGui_CreateContext(
        "GUI-007 Widget Library Test")

--------------------------------------------------------------------------------
-- Verification
--------------------------------------------------------------------------------

local function VerifyModules()

    assert(Label)
    assert(Button)
    assert(Separator)
    assert(Spacer)

    Test:Pass("Widget modules loaded.")

end

--------------------------------------------------------------------------------

local function VerifyAPI()

    assert(type(Label.Render) == "function")
    assert(type(Button.Render) == "function")
    assert(type(Separator.Render) == "function")
    assert(type(Spacer.Render) == "function")

    Test:Pass("Widget API verified.")

end

--------------------------------------------------------------------------------
-- Rendering
--------------------------------------------------------------------------------

local function RenderDemo()

    local visible
    local open

    visible, open =
        reaper.ImGui_Begin(
            Context,
            "GUI-007 Widget Library Test",
            true)

    if visible then

        Label.Render(
            Context,
            "ACP Studio Widget Library")

        Separator.Render(Context)

        Spacer.Render(
            Context,
            10)

        if Button.Render(
            Context,
            "Test Button") then

            Test:Log(
                "Button clicked.")

        end

        reaper.ImGui_End(Context)

    end

    if open then

        reaper.defer(RenderDemo)

    else

        Test:Pass(
            "Widget rendering verified.")

        Test:Finish()

    end

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function Test.Run()

    Test:Banner()

    VerifyModules()

    VerifyAPI()

    RenderDemo()

end

--------------------------------------------------------------------------------
-- Run Test
--------------------------------------------------------------------------------

Test.Run()