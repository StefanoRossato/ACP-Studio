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

    local EntryPoint =
        dofile(
            reaper.GetResourcePath() ..
            "/Scripts/ACP Studio/Core/Bootstrap/EntryPoint.lua")

    EntryPoint.Initialize(scriptPath)

    Bootstrap =
        require("Core.Bootstrap")

    Bootstrap.Initialize()

    Initialized = true

    return true

end

--------------------------------------------------------------------------------

function TestBootstrap.Shutdown()

    assert(
        Initialized,
        "Test bootstrap has not been initialized.")

    Bootstrap.Shutdown()

    Bootstrap = nil
    Initialized = false

    return true

end

--------------------------------------------------------------------------------
-- Module Return
--------------------------------------------------------------------------------

return TestBootstrap