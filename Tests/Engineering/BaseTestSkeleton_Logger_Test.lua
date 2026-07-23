--------------------------------------------------------------------------------
-- ACP Studio
-- BST-002 BaseTestSkeleton Logger Integration Test
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Bootstrap
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

local BaseTestSkeleton =
    require("Core.Testing.BaseTestSkeleton")


local RepositoryLocator =
    require("Core.Bootstrap.RepositoryLocator")


local Repository =
    RepositoryLocator.GetRepositoryRoot()


--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------

local function Log(message)

    reaper.ShowConsoleMsg(
        message .. "\n"
    )

end


local function Pass(message)

    Log("[PASS] " .. message)

end


--------------------------------------------------------------------------------
-- Test
--------------------------------------------------------------------------------

local Test =
    BaseTestSkeleton:new(
        "BST-002 BaseTestSkeleton Logger Integration Test"
    )


--------------------------------------------------------------------------------
-- Setup
--------------------------------------------------------------------------------

Test:Setup()


--------------------------------------------------------------------------------
-- Execution
--------------------------------------------------------------------------------

Log("")
Log("============================================================")
Log("ACP Studio")
Log("BST-002 BaseTestSkeleton Logger Integration Test")
Log("============================================================")
Log("")


local Message =
    "BaseTestSkeleton Logger Integration Test Message"


Test:Log(
    Message
)


--------------------------------------------------------------------------------
-- Verification
--------------------------------------------------------------------------------

local FoundMessage = false


for _, value in ipairs(Test.Messages) do

    if value == Message then

        FoundMessage = true

        break

    end

end


assert(
    FoundMessage,
    "Message not stored in BaseTestSkeleton."
)


Pass(
    "Message stored in skeleton."
)


local LogFile =
    Repository .. "/Logs/ACP.log"


local File =
    io.open(
        LogFile,
        "r"
    )


assert(
    File ~= nil,
    "Logger file not found."
)


local Content =
    File:read("*a")


File:close()


assert(
    Content:find(Message),
    "Logger message not found in file."
)


Pass(
    "Logger persistence verified."
)


--------------------------------------------------------------------------------
-- Teardown
--------------------------------------------------------------------------------

Test:Teardown()


TestBootstrap.Shutdown()


Pass(
    "Test environment shutdown."
)


--------------------------------------------------------------------------------
-- Result
--------------------------------------------------------------------------------

Log("")
Log("============================================================")
Log("BST-002 BaseTestSkeleton Logger Integration PASSED")
Log("============================================================")
Log("")