--------------------------------------------------------------------------------
-- ACP Studio
-- Test Bootstrap
--------------------------------------------------------------------------------
-- Purpose : Initialize and shutdown the ACP Studio test environment.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Module Declaration
--------------------------------------------------------------------------------

local TestBootstrap = {}

--------------------------------------------------------------------------------
-- Module State
--------------------------------------------------------------------------------

local Bootstrap = nil
local Logger = nil
local Initialized = false

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function TestBootstrap.Initialize(scriptPath)

    assert(
        not Initialized,
        "Test bootstrap has already been initialized.")


    assert(
        type(scriptPath) == "string",
        "A valid script path is required.")


    ------------------------------------------------------------------------
    -- Initialize ACP Runtime Environment
    ------------------------------------------------------------------------

    local EntryPoint =
        dofile(
            reaper.GetResourcePath() ..
            "/Scripts/ACP Studio/Core/Bootstrap/EntryPoint.lua")


    EntryPoint.Initialize(scriptPath)


    Bootstrap =
        require("Core.Bootstrap")


    Bootstrap.Initialize()


    ------------------------------------------------------------------------
    -- Initialize Foundation Services
    ------------------------------------------------------------------------

    Logger =
        require("Core.Foundation.Logger")


    local RepositoryLocator =
        require("Core.Bootstrap.RepositoryLocator")


    local Repository =
        RepositoryLocator.GetRepositoryRoot()


    assert(
    Logger.Initialize(
    {
        LogFile = Repository .. "/Logs/Test_ACP.log",
        Mode = "w"
    }),
    "Logger initialization failed.")


    Initialized = true


    return true

end

--------------------------------------------------------------------------------

function TestBootstrap.Shutdown()

    assert(
        Initialized,
        "Test bootstrap has not been initialized.")


    ------------------------------------------------------------------------
    -- Shutdown Foundation Services
    ------------------------------------------------------------------------

    if Logger then

        Logger.Shutdown()

        Logger = nil

    end


    ------------------------------------------------------------------------
    -- Shutdown ACP Runtime Environment
    ------------------------------------------------------------------------

    Bootstrap.Shutdown()


    Bootstrap = nil
    Initialized = false


    return true

end

--------------------------------------------------------------------------------
-- Module Return
--------------------------------------------------------------------------------

return TestBootstrap