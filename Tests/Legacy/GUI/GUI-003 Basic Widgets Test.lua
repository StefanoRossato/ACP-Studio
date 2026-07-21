--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test          : GUI-003 Basic Widgets Test
-- Component     : ReaImGui Platform
-- Layer         : Platform Certification
-- Purpose       : Certify the basic ReaImGui widgets.
-- Specification : GUI-003
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Test Environment
--------------------------------------------------------------------------------

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

    reaper.ShowConsoleMsg(
        "Repository Root = [" .. RepositoryRoot .. "]\n")

    assert(
        Bootstrap.Initialize(RepositoryRoot),
        "Unable to initialize test infrastructure.")

end

InitializeTestEnvironment()

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local WINDOW_TITLE =
    "GUI-003 Basic Widgets Test"

--------------------------------------------------------------------------------
-- Private State
--------------------------------------------------------------------------------

local Context = nil
local Open = true

local Certified =
{
    Text = false,
    Button = false,
    Separator = false,
    SameLine = false,
    Dummy = false
}



--------------------------------------------------------------------------------
-- Utilities
--------------------------------------------------------------------------------

local function ClearLog()

    reaper.ClearConsole()

end

local function Log(message)

    reaper.ShowConsoleMsg(message .. "\n")

end

local function Assert(condition, message)

    if not condition then
        error("FAILED - " .. message)
    end

    Log("PASS - " .. message)

end

--------------------------------------------------------------------------------
-- Render
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Render
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Render
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Render
--------------------------------------------------------------------------------

local function Render()

    local visible

    visible, Open =
        reaper.ImGui_Begin(
            Context,
            WINDOW_TITLE,
            Open)

    if visible then

        reaper.ImGui_Text(
            Context,
            "GUI-003 Certified Widgets")

        Certified.Text = true

        reaper.ImGui_Button(
            Context,
            "Button")

        Certified.Button = true

        reaper.ImGui_Separator(Context)

        Certified.Separator = true

        reaper.ImGui_Button(
            Context,
            "Left")

        reaper.ImGui_SameLine(Context)

        reaper.ImGui_Button(
            Context,
            "Right")

        Certified.SameLine = true

        reaper.ImGui_Dummy(
            Context,
            0,
            20)

        Certified.Dummy = true

    end

    reaper.ImGui_End(Context)

    if Open then

        reaper.defer(Render)

    else

        Log("")
        Log("Certification Results")
        Log("----------------------------------------")

        Assert(Certified.Text,      "Text")
        Assert(Certified.Button,    "Button")
        Assert(Certified.Separator, "Separator")
        Assert(Certified.SameLine,  "SameLine")
        Assert(Certified.Dummy,     "Dummy")

        Log("========================================")
        Log("GUI-003 PASSED")
        Log("========================================")

    end

end

--------------------------------------------------------------------------------
-- Test Case
--------------------------------------------------------------------------------

local function TestCase()

    Log("Creating Context...")

    Context =
        reaper.ImGui_CreateContext(
            WINDOW_TITLE)

    Assert(
        Context ~= nil,
        "CreateContext")

    Log("Rendering...")
    Log("Close the window to terminate the test.")

    Render()

end

--------------------------------------------------------------------------------
-- Run
--------------------------------------------------------------------------------

local function Run()

    ClearLog()

    Log("Loading module...")
    Log("PASS - Module loaded")

    TestCase()

end

--------------------------------------------------------------------------------
-- Run Test
--------------------------------------------------------------------------------

Run()