--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : BaseTestSkeleton
-- Layer         : Engineering
-- Category      : Test Framework
--
-- Purpose       : Provides the common behavioral foundation for all test
--                 skeletons.
--
-- Specification : TPL-006
--------------------------------------------------------------------------------

local BaseTestSkeleton = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local State =
{
    Ready     = "Ready",
    Running   = "Running",
    Completed = "Completed"
}

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function BaseTestSkeleton.New(name)

    local self = {}

    --------------------------------------------------------------------------------
    -- Private Data
    --------------------------------------------------------------------------------

    local Data =
    {
        Name   = name or "Unnamed Test",
        State  = State.Ready,
        Result = nil
    }

    --------------------------------------------------------------------------------
    -- Public API
    --------------------------------------------------------------------------------

    function self.GetName()

        return Data.Name

    end

    --------------------------------------------------------------------------------

    function self.GetState()

        return Data.State

    end

    --------------------------------------------------------------------------------

    function self.GetResult()

        return Data.Result

    end

    --------------------------------------------------------------------------------
    -- Extension Hooks
    --------------------------------------------------------------------------------

    function self.OnSetup()

        -- Default implementation.

    end

    --------------------------------------------------------------------------------

    function self.OnExecute()

        -- Default implementation.

    end

    --------------------------------------------------------------------------------

    function self.OnVerify()

        -- Default implementation.
        return true

    end

    --------------------------------------------------------------------------------

    function self.OnCleanup()

        -- Default implementation.

    end

    --------------------------------------------------------------------------------

    function self.OnShutdown()

        -- Default implementation.

    end

    --------------------------------------------------------------------------------
    -- Framework Methods
    --------------------------------------------------------------------------------

    function self.Setup()

        self.OnSetup()

    end

    --------------------------------------------------------------------------------

    function self.Execute()

        self.OnExecute()

    end

    --------------------------------------------------------------------------------

    function self.Verify()

        return self.OnVerify()

    end

    --------------------------------------------------------------------------------

    function self.Cleanup()

        self.OnCleanup()

    end

    --------------------------------------------------------------------------------

    function self.Shutdown()

        self.OnShutdown()

    end

    --------------------------------------------------------------------------------

    function self.Run()

        Data.State =
            State.Running

        self.Setup()

        self.Execute()

        Data.Result =
            self.Verify()

        self.Cleanup()

        self.Shutdown()

        Data.State =
            State.Completed

    end

    --------------------------------------------------------------------------------

    return self

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return BaseTestSkeleton