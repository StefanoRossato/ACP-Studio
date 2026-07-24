--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ReferenceModule
-- Layer         : Engineering
-- Purpose       : Reference implementation used to certify the Lua Module Template.
-- Specification : TPL-001
--------------------------------------------------------------------------------

local ReferenceModule = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local VERSION = "1.0"

--------------------------------------------------------------------------------
-- Private State
--------------------------------------------------------------------------------

local State =
{
    initialized = false
}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

local function Initialize()

    State.initialized = true

end

--------------------------------------------------------------------------------
-- Public Functions
--------------------------------------------------------------------------------

function ReferenceModule.Initialize()

    Initialize()

end

function ReferenceModule.IsInitialized()

    return State.initialized

end

function ReferenceModule.GetVersion()

    return VERSION

end

--------------------------------------------------------------------------------
-- Return Module
--------------------------------------------------------------------------------

return ReferenceModule