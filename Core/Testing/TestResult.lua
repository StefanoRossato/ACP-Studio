--[[
------------------------------------------------------------------------------
ACP Studio

Module      : TestResult
Namespace   : Core.Testing
Purpose     : Immutable representation of an engineering test result.

Implements  : TST-101
Dependencies: None

------------------------------------------------------------------------------
]]

local TestResult = {}

--------------------------------------------------------------------------------
-- Private Constructor
--------------------------------------------------------------------------------

local function New(success, message)

    local state = {
        success = success,
        message = message
    }

    local instance = {}

    local methods = {}

    ----------------------------------------------------------------------------
    -- Public Queries
    ----------------------------------------------------------------------------

    function methods:IsSuccess()

        return state.success

    end

    function methods:IsFailure()

        return not state.success

    end

    function methods:GetMessage()

        return state.message

    end

    ----------------------------------------------------------------------------
    -- Immutable Proxy
    ----------------------------------------------------------------------------

    return setmetatable(instance, {

        __index = methods,

        __newindex = function()

            error("TestResult is immutable.", 2)

        end,

        __metatable = false

    })

end

--------------------------------------------------------------------------------
-- Factory Methods
--------------------------------------------------------------------------------

function TestResult.Success()

    return New(true, nil)

end

function TestResult.Failure(message)

    assert(type(message) == "string",
        "TestResult.Failure() expects a diagnostic message.")

    return New(false, message)

end

--------------------------------------------------------------------------------
-- Return Module
--------------------------------------------------------------------------------

return TestResult